//Author: Kunal Banerjee
//Date: 09-Jan-2014

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#include "bdd.h"

extern int Glob_Count_Nodes;
extern int Glob_TypeOfLogic;

//Data structure for tracking BDD nodes whose corresponding MUX has 
//already been created
struct trackNodes {
	int uid;                     //stores the (unique) uid of a BDD node
	char outputPort[VARNAME+20]; //stores the name of the output line 
	                             //for the BDD node
}Glob_MUX_Created[MAXVAR];

//Counter for the nodes covered (MUX-es created)
int Glob_Count_MUX;


/**** Functions related to generating the Verilog file corresponding to the BDD ****/


//Returns true if a MUX has already been created
//corresponding to a BDD node (identified by uid)
//Otherwise returns false
bool muxAlreadyCreated ( int uid, char storeOutputPort[] )
{
	int i;
	
	for( i = 0; i < Glob_Count_MUX; i++ )
	{
		if( Glob_MUX_Created[i].uid == uid )
		{
			strcpy( storeOutputPort, Glob_MUX_Created[i].outputPort );
			return true;
		} 
	}
	
	return false;
}



//Update Glob_MUX_Created
void updateMUX_Created ( int uid, char storeOutputPort[] )
{
	Glob_MUX_Created[ Glob_Count_MUX ].uid = uid;
	strcpy( Glob_MUX_Created[ Glob_Count_MUX ].outputPort, storeOutputPort );
	
	Glob_Count_MUX++;
}



//This function reverses the Inputs of a MUX in accordance with the edge types
//If left-edge type = 0 (dashed) -- false (Do not reverse)
//Else if right-edge type = 1 (solid ) -- false
//Else -- true (reverse)
bool reverseInputs ( BDD_Node *node )
{
	if( node == (BDD_Node*)NULL )
		return false;
	
	//Nothing to do for 0 and 1 (leaf nodes)
	if( strcmp(node->item,"0") == 0 )
		return false;
	if( strcmp(node->item,"1") == 0 )
		return false;
	

	if( node->edgeTypeLchild == 0 )
		return false; //<dashed, solid> <dashed, dotted>

	if( node->edgeTypeRchild == 1 )
		return false; //<dotted, solid>
		
	return true;      //<solid, dashed> <solid, dotted>
}



//This function adjusts the Inputs of a MUX to take care of the "dotted" lines
//If flipInputs == false, then return "decision" as it is
int adjustInputs ( int decision, bool flipInputs )
{
	if( flipInputs )
	{
		switch( decision )
		{
			case  10 : return  11;
			case  11 : return  10;
			case  12 : return  12;
			case 201 : return 210;
			case 202 : return 212;
			case 210 : return 201;
			case 212 : return 202;
			case 220 : return 221;
			case 221 : return 220;
			case 222 : return 222;
		}
	}

	return decision;
}



//This function decides the inputs of the bdd_MUX
//The returned integer has the following values:
//10  -- lchild = rchild, and both are set to INPUT0
//11  -- lchild = rchild, and both are set to INPUT1
//12  -- lchild = rchild, and set to some other Input
//2XY -- lchild != rchild, {X,Y} = {0,1,2} as given above
//NB: 200 and 211 -- these two combinations cannot occur
int decideInputsToMUX ( BDD_Node *node, bool flipInputs )
{
	bool reverse;
	
	if( node->lchild == node->rchild )
	{
		if( strcmp((node->lchild)->item,"0") == 0 )
			return adjustInputs( 10, flipInputs );
		else if( strcmp((node->lchild)->item,"1") == 0 )
			return adjustInputs( 11, flipInputs );
		else
			return adjustInputs( 12, flipInputs );
	}
	else
	{
		reverse = reverseInputs( node );
		
		if( strcmp((node->lchild)->item,"0") == 0 )
		{
			if( strcmp((node->rchild)->item,"1") == 0 )
				return !(reverse) ? adjustInputs( 201, flipInputs ) : adjustInputs( 210, flipInputs );
			else
				return !(reverse) ? adjustInputs( 202, flipInputs ) : adjustInputs( 220, flipInputs );
		}
		else if( strcmp((node->lchild)->item,"1") == 0 )
		{
			if( strcmp((node->rchild)->item,"0") == 0 )
				return !(reverse) ? adjustInputs( 210, flipInputs ) : adjustInputs( 201, flipInputs );
			else
				return !(reverse) ? adjustInputs( 212, flipInputs ) : adjustInputs( 221, flipInputs );
		}
		else
		{
			if( strcmp((node->rchild)->item,"0") == 0 )
				return !(reverse) ? adjustInputs( 220, flipInputs ) : adjustInputs( 202, flipInputs );
			else if( strcmp((node->rchild)->item,"1") == 0 )
				return !(reverse) ? adjustInputs( 221, flipInputs ) : adjustInputs( 212, flipInputs );
			else
				return adjustInputs( 222, flipInputs );
		}
	}
}



//Generate the Verilog code corresponding to a BDD node
void generateVerilog_BDD_Node ( BDD_Node *node, BDD_Tree* tree, FILE *fp, bool flipInputs, char bddType )
{
	char newNodeName[VARNAME], muxName[VARNAME];
	char OutputPort[VARNAME+10], Input0Port[VARNAME+10], Input1Port[VARNAME+10], tempPort[VARNAME+10];
	int decision, limit, i;
	BDD_Node *tempNode;
	bool isRepeater, tempFlag;
	char bufferSwing[300];
	
	if( node == (BDD_Node*)NULL )
		return;
		
	//NB: No code needs to be generated for the BDD nodes corresponding to
	//0 (INPUT0) and 1 (INPUT1)
	if( strcmp(node->item, "0") == 0 )
		return;
	if( strcmp(node->item, "1") == 0 )
		return;
	
	if( nodeAlreadyCovered(node) )
		return;
		
			
	if( node == tree->root )
	{
		getGenericVariableName( newNodeName, node->item );
		fprintf(fp,"bdd_MUX %cnode_%s_%d ( %cOUTPUT, ",bddType,node->item,node->uid,bddType);
		
		decision = decideInputsToMUX( node, flipInputs );
		
		switch( decision )
		{
			case  10 : if(bddType=='u') fprintf(fp,"INPUT0, INPUT0, "); 
			           else             fprintf(fp,"INPUT1, INPUT1, "); break;
			case  11 : if(bddType=='u') fprintf(fp,"INPUT1, INPUT1, "); 
			           else             fprintf(fp,"INPUT0, INPUT0, "); break;
			case  12 : fprintf(fp,"%cinp_%s_%d, %cinp_%s_%d, ",bddType,node->item,node->uid,bddType,node->item,node->uid); break;
			case 201 : if(bddType=='u') fprintf(fp,"INPUT0, INPUT1, "); 
			           else             fprintf(fp,"INPUT1, INPUT0, "); break;
			case 202 : if(bddType=='u') fprintf(fp,"INPUT0, %cinp1_%s_%d, ",bddType,node->item,node->uid); 
			           else             fprintf(fp,"INPUT1, %cinp1_%s_%d, ",bddType,node->item,node->uid); break;
			case 210 : if(bddType=='u') fprintf(fp,"INPUT1, INPUT0, "); 
			           else             fprintf(fp,"INPUT0, INPUT1, "); break;
			case 212 : if(bddType=='u') fprintf(fp,"INPUT1, %cinp1_%s_%d, ",bddType,node->item,node->uid); 
			           else             fprintf(fp,"INPUT0, %cinp1_%s_%d, ",bddType,node->item,node->uid); break;
			case 220 : if(bddType=='u') fprintf(fp,"%cinp0_%s_%d, INPUT0, ",bddType,node->item,node->uid); 
			           else             fprintf(fp,"%cinp0_%s_%d, INPUT1, ",bddType,node->item,node->uid); break;
			case 221 : if(bddType=='u') fprintf(fp,"%cinp0_%s_%d, INPUT1, ",bddType,node->item,node->uid); 
			           else             fprintf(fp,"%cinp0_%s_%d, INPUT0, ",bddType,node->item,node->uid); break;
			case 222 : fprintf(fp,"%cinp0_%s_%d, %cinp1_%s_%d, ",bddType,node->item,node->uid,bddType,node->item,node->uid);
		}
		
		fprintf(fp,"selectBar_%s, select_%s );\n",newNodeName,newNodeName);
	}//end if ( tree->root )

	
	if( node->lchild == node->rchild )
	{
		//Case 1: Both the children are the same
		limit = 1;
	}
	else
	{
		//Case2: Children are different
		limit = 2;
	}
	
	
	for( i = 0; i < limit; i++ )
	{
		if( i == 0 )
		{
			tempNode = node->lchild;
			if( node->edgeTypeLchild == 2 )
				tempFlag = !(flipInputs);
			else
				tempFlag = flipInputs;
		}
		else
		{
			tempNode = node->rchild;
			if( node->edgeTypeRchild == 2 )
				tempFlag = !(flipInputs);
			else
				tempFlag = flipInputs;
		}
		
		if( strcmp(tempNode->item, "0") == 0 )
			continue;
		if( strcmp(tempNode->item, "1") == 0 )
			continue;
		
		//Check if the MUX corresponding to a BDD node is already created or not
		if( muxAlreadyCreated( tempNode->uid, OutputPort ) )
			continue;

			
		//Check if the node is a repeater
		isRepeater = ( (strcmp((node->lchild)->item,REPEATER_L) == 0) || (strcmp((node->lchild)->item,REPEATER_R) == 0) || 
		               (strcmp((node->lchild)->item,REPEATER_LR) == 0) );
		if( isRepeater )
		{
			switch( Glob_TypeOfLogic )
			{
			case 1:
				fprintf(fp,"bdd_pre_top %cnode_%s_%d ( ",bddType,tempNode->item,tempNode->uid);
				break;
				
			case 4:
				fprintf(fp,"bdd_pre %cnodePR_%s_%d ( ",bddType,tempNode->item,tempNode->uid);
				sprintf(bufferSwing,"bdd_swing_scaling %cnodeSR_%s_%d ( ",bddType,tempNode->item,tempNode->uid);
				break;
			}
		}
		else
		{
			//Not repeater	
			strcpy(muxName,tempNode->item);
			if( tempNode->isDummy )
			{
				strcat(muxName,"_d");
			}

			getGenericVariableName( newNodeName, tempNode->item );
			fprintf(fp,"bdd_MUX %cnode_%s_%d ( ",bddType,muxName,tempNode->uid);
		}
		
		//Output of the child MUX = Input of the parent MUX
		if( limit == 1 )
		{
			fprintf(fp,"%cinp_%s_%d, ",bddType,node->item,node->uid);
			
			sprintf(OutputPort,"%cinp_%s_%d",bddType,node->item,node->uid);
			updateMUX_Created( tempNode->uid, OutputPort );
		}
		else
		{
			if( reverseInputs( node ) )
			{
				fprintf(fp,"%cinp%d_%s_%d, ",bddType,(i+1)%2,node->item,node->uid);
				
				sprintf(OutputPort,"%cinp%d_%s_%d",bddType,(i+1)%2,node->item,node->uid);
				updateMUX_Created( tempNode->uid, OutputPort );
			}
			else
			{
				fprintf(fp,"%cinp%d_%s_%d, ",bddType,i,node->item,node->uid);
				
				sprintf(OutputPort,"%cinp%d_%s_%d",bddType,i,node->item,node->uid);
				updateMUX_Created( tempNode->uid, OutputPort );
			}
		}
		
		if( isRepeater )
		{
			if( muxAlreadyCreated( (tempNode->lchild)->uid, Input0Port ) )
			{
				switch( Glob_TypeOfLogic )
				{
				case 1: 
					fprintf(fp,"%s, pre );\n",Input0Port);
					break;
					
				case 4:
					fprintf(fp,"%cout_SR_%d, pre, preBar );\n",bddType,tempNode->uid);
					fprintf(fp,"%s",bufferSwing);
					fprintf(fp,"%cout_SR_%d, %s, powerLow );\n",bddType,tempNode->uid,Input0Port);
					break;
				}//end switch
			}
			else
			{
				switch( Glob_TypeOfLogic )
				{
				case 1:
					fprintf(fp,"%cinp_%s_%d, pre );\n",bddType,tempNode->item,tempNode->uid);
					break;
					
					
				case 4:
					fprintf(fp,"%cout_SR_%d, pre, preBar );\n",bddType,tempNode->uid);
					fprintf(fp,"%s",bufferSwing);
					fprintf(fp,"%cout_SR_%d, %cinp_%s_%d, powerLow );\n",bddType,tempNode->uid,bddType,tempNode->item,tempNode->uid);
					break;
				}//end switch
			}
		}
		else
		{
			//Not repeater
			decision = decideInputsToMUX( tempNode, tempFlag );
			
			switch( decision )
			{
				case  10 : if(bddType=='u') { strcpy(Input0Port,"INPUT0"); strcpy(Input1Port,"INPUT0"); } 
				           else             { strcpy(Input0Port,"INPUT1"); strcpy(Input1Port,"INPUT1"); } break;
				case  11 : if(bddType=='u') { strcpy(Input0Port,"INPUT1"); strcpy(Input1Port,"INPUT1"); }
				           else             { strcpy(Input0Port,"INPUT0"); strcpy(Input1Port,"INPUT0"); } break;
				case  12 : sprintf(Input0Port,"%cinp_%s_%d",bddType,tempNode->item,tempNode->uid);
				           sprintf(Input1Port,"%cinp_%s_%d",bddType,tempNode->item,tempNode->uid); break;
				case 201 : if(bddType=='u') { strcpy(Input0Port,"INPUT0"); strcpy(Input1Port,"INPUT1"); }
				           else             { strcpy(Input0Port,"INPUT1"); strcpy(Input1Port,"INPUT0"); } break;
				case 202 : if(bddType=='u') { strcpy(Input0Port,"INPUT0"); sprintf(Input1Port,"%cinp1_%s_%d",bddType,tempNode->item,tempNode->uid); }
				           else             { strcpy(Input0Port,"INPUT1"); sprintf(Input1Port,"%cinp1_%s_%d",bddType,tempNode->item,tempNode->uid); } break;
				case 210 : if(bddType=='u') { strcpy(Input0Port,"INPUT1"); strcpy(Input1Port,"INPUT0"); } 
				           else             { strcpy(Input0Port,"INPUT0"); strcpy(Input1Port,"INPUT1"); } break;
				case 212 : if(bddType=='u') { strcpy(Input0Port,"INPUT1"); sprintf(Input1Port,"%cinp1_%s_%d",bddType,tempNode->item,tempNode->uid); }
				           else             { strcpy(Input0Port,"INPUT0"); sprintf(Input1Port,"%cinp1_%s_%d",bddType,tempNode->item,tempNode->uid); } break;
				case 220 : if(bddType=='u') { sprintf(Input0Port,"%cinp0_%s_%d",bddType,tempNode->item,tempNode->uid); strcpy(Input1Port,"INPUT0"); } 
				           else             { sprintf(Input0Port,"%cinp0_%s_%d",bddType,tempNode->item,tempNode->uid); strcpy(Input1Port,"INPUT1"); } break;
				case 221 : if(bddType=='u') { sprintf(Input0Port,"%cinp0_%s_%d",bddType,tempNode->item,tempNode->uid); strcpy(Input1Port,"INPUT1"); } 
				           else             { sprintf(Input0Port,"%cinp0_%s_%d",bddType,tempNode->item,tempNode->uid); strcpy(Input1Port,"INPUT0"); } break;
				case 222 : sprintf(Input0Port,"%cinp0_%s_%d",bddType,tempNode->item,tempNode->uid);
				           sprintf(Input1Port,"%cinp1_%s_%d",bddType,tempNode->item,tempNode->uid);
			}
			
			//Check if the left child has multiple outputs 
			if( muxAlreadyCreated( (tempNode->lchild)->uid, tempPort ) )
			{
				if( reverseInputs( tempNode->lchild ) )
					strcpy(Input1Port,tempPort);
				else
					strcpy(Input0Port,tempPort);
			}
			//Check if the right child has multiple outputs
			if( muxAlreadyCreated( (tempNode->rchild)->uid, tempPort ) )
			{
				if( reverseInputs( tempNode->rchild ) )
					strcpy(Input0Port,tempPort);
				else
					strcpy(Input1Port,tempPort);
			}
			
			fprintf(fp,"%s, %s, ",Input0Port,Input1Port);
		
			fprintf(fp,"selectBar_%s, select_%s );\n",newNodeName,newNodeName);
		}//end if ( isRepeater )
	}//end for
	

	if( node->edgeTypeLchild == 2 )
		generateVerilog_BDD_Node( node->lchild, tree, fp, !(flipInputs), bddType );
	else
		generateVerilog_BDD_Node( node->lchild, tree, fp, flipInputs, bddType );
		
	if( node->edgeTypeRchild == 2 )
		generateVerilog_BDD_Node( node->rchild, tree, fp, !(flipInputs), bddType );
	else
		generateVerilog_BDD_Node( node->rchild, tree, fp, flipInputs, bddType );
}



//Generate the Verilog code corresponding to the BDD tree
void generateVerilog_BDD_Tree ( BDD_Tree *tree, char fileName[] )
{
	FILE *fp;
	
	//This function could have been applied after the creation of the BDD
	//but it has been postponed since it was not actually required until now
	
	fp = fopen(fileName,"w");
	
	switch( Glob_TypeOfLogic )
	{
		
	case 1:
		fprintf(fp,"module bdd_MUX ( out, inp0, inp1, selectBar, select );\n\n");
		fprintf(fp,"output out;\n");
		fprintf(fp,"input  inp0, inp1, selectBar, select;\n\n");
		fprintf(fp,"nmos ( out, inp0, selectBar );\n");
		fprintf(fp,"nmos ( out, inp1, select );\n\n");
		fprintf(fp,"endmodule\n\n\n\n");
	
		fprintf(fp,"module bdd_inv ( out, in );\n\n");
		fprintf(fp,"output out;\n");
		fprintf(fp,"input  in;\n\n");
		fprintf(fp,"supply1 power;\n");
		fprintf(fp,"supply0 ground;\n\n");
		fprintf(fp,"pmos ( out, power,  in );\n");
		fprintf(fp,"nmos ( out, ground, in );\n\n");
		fprintf(fp,"endmodule\n\n\n");

		fprintf(fp,"module bdd_pre_top ( outpre, insbox, pre );\n\n");
		fprintf(fp,"output outpre;\n");
		fprintf(fp,"input  insbox, pre;\n\n");
		fprintf(fp,"wire out;\n\n");
		fprintf(fp,"bdd_inv inv1 ( outpre, out );\n\n");
		fprintf(fp,"pmos ( out, power,  pre );\n");
		fprintf(fp,"nmos ( out, insbox, pre );\n\n");
		fprintf(fp,"endmodule\n\n\n");
	
		fprintf(fp,"module bdd_Sbox ( uOUTPUT, cOUTPUT, INPUT0, INPUT1, pre );\n\n");
		fprintf(fp,"output uOUTPUT, cOUTPUT;\n");
		fprintf(fp,"input  INPUT0, INPUT1, pre;\n\n");
	
		Glob_Count_Nodes = 0;
		Glob_Count_MUX   = 0;
	
		fprintf(fp,"//Uncomplemented BDD\n");
		generateVerilog_BDD_Node( tree->root, tree, fp, false, 'u' );
	
		Glob_Count_Nodes = 0;
		Glob_Count_MUX   = 0;
	
		fprintf(fp,"\n\n//Complemented BDD\n");
		generateVerilog_BDD_Node( tree->root, tree, fp, false, 'c' );
	
		fprintf(fp,"\nendmodule\n");
		fclose(fp);
		break;
		
		
	case 4:
		fprintf(fp,"module bdd_MUX ( out, inp0, inp1, selectBar, select );\n\n");
		fprintf(fp,"output out;\n");
		fprintf(fp,"input  inp0, inp1, selectBar, select;\n\n");
		fprintf(fp,"nmos ( out, inp0, selectBar );\n");
		fprintf(fp,"nmos ( out, inp1, select );\n\n");
		fprintf(fp,"endmodule\n\n\n\n");
	
		fprintf(fp,"module bdd_inv ( out, in );\n\n");
		fprintf(fp,"output out;\n");
		fprintf(fp,"input  in;\n\n");
		fprintf(fp,"supply1 powerHigh;\n");
		fprintf(fp,"supply0 ground;\n\n");
		fprintf(fp,"pmos ( out, powerHigh, in );\n");
		fprintf(fp,"nmos ( out, ground, in );\n\n");
		fprintf(fp,"endmodule\n\n\n");

		fprintf(fp,"module bdd_pre ( outBDD, inpBDD, pre, preBar );\n\n");
		fprintf(fp,"output outBDD;\n");
		fprintf(fp,"input  inpBDD, pre, preBar;\n\n");
		fprintf(fp,"nmos ( outBDD, inpBDD, pre );\n");     
		fprintf(fp,"nmos ( outBDD, power, preBar );\n\n");
		fprintf(fp,"endmodule\n\n\n");

		fprintf(fp,"module bdd_swing_scaling ( outswing, inpBDDnet, powerLow );\n\n");
		fprintf(fp,"output outswing;\n");
		fprintf(fp,"input  inpBDDnet;\n"); 
		fprintf(fp,"inout  powerLow;\n\n");
		fprintf(fp,"bdd_inv inv1 ( outswing, inpBDDnet );\n\n");
		fprintf(fp,"pmos ( outswing, powerLow, inpBDDnet );\n\n");
		fprintf(fp,"endmodule\n\n\n");

		fprintf(fp,"module bdd_Sbox ( uOUTPUT_SR, cOUTPUT_SR, INPUT0_PR, INPUT1_PR, pre, preBar, powerLow );\n\n");
		fprintf(fp,"output uOUTPUT_SR, cOUTPUT_SR;\n");
		fprintf(fp,"input  INPUT0_PR, INPUT1_PR, pre, preBar;\n");
		fprintf(fp,"inout  powerLow;\n\n");
		fprintf(fp,"bdd_pre input0PR ( INPUT0, INPUT0_PR, pre, preBar );\n");
		fprintf(fp,"bdd_pre input1PR ( INPUT1, INPUT1_PR, pre, preBar );\n\n");
	
		Glob_Count_Nodes = 0;
		Glob_Count_MUX   = 0;
	
		fprintf(fp,"//Uncomplemented BDD\n");
		fprintf(fp,"bdd_swing_scaling uSR ( uOUTPUT_SR, uOUTPUT, powerLow );\n");
		generateVerilog_BDD_Node( tree->root, tree, fp, false, 'u' );
	
		Glob_Count_Nodes = 0;
		Glob_Count_MUX   = 0;
	
		fprintf(fp,"\n\n//Complemented BDD\n");
		fprintf(fp,"bdd_swing_scaling cSR ( cOUTPUT_SR, cOUTPUT, powerLow );\n");
		generateVerilog_BDD_Node( tree->root, tree, fp, false, 'c' );
	
		fprintf(fp,"\nendmodule\n");
		fclose(fp);
		break;
		
	default:
		printf("\nSorry! The type of logic that you have input is presenly not supported.\n");
	}
}
