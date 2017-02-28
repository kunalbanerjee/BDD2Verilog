//Author: Kunal Banerjee
//Date: 09-Jan-2014

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#include "bdd.h"


/**** Functions related to generating the dot file corresponding to the BDD ****/


//Global variable for generating Uid
int Glob_Uid;

//Generate unique identification number for each BDD node
void generateUidBDD_Node ( BDD_Node *node )
{
	if( node == (BDD_Node*)NULL )
		return;
		
	++Glob_Uid;
	node->uid = Glob_Uid;
	generateUidBDD_Node( node->lchild );
	generateUidBDD_Node( node->rchild );	
}



//NB: A BDD node may be visited more than once in printBDD_Node_Dotty
//The following Global array and the succeeding function prevents this
BDD_Node *Glob_Nodes_Covered[MAXVAR];
int Glob_Count_Nodes;

//Check if a node has already been covered or not
//Returns true if it is covered, false otherwise
bool nodeAlreadyCovered ( BDD_Node *node )
{
	int i;
	
	for( i = 0; i < Glob_Count_Nodes; i++ )
	{
		if( Glob_Nodes_Covered[i] == node )
			return true;
	}
	
	Glob_Nodes_Covered[ Glob_Count_Nodes ] = node;
	Glob_Count_Nodes++;
	return false;
}

//The following global variables are required for coloring the dot output
char Glob_ColorNames[10][8] = { "FF0000", "00FF00", "0000FF", "FFFF00", "FF00FF", 
                                "00FFFF", "808000", "800000", "008000", "000080" };
int Glob_ColorId;



//Print a BDD node in dot format
void printBDD_Node_Dot ( BDD_Node *node, FILE *fp )
{
	bool flagSameSibling;
	
	if( node == (BDD_Node*)NULL )
		return;
	
	if( nodeAlreadyCovered(node) )
		return;
	
	if(node->lchild != (BDD_Node*)NULL)
	{
		if( strcmp( (node->lchild)->item,"0" ) == 0 )
		{
			fprintf(fp,"\t node%d [label=\"0\",shape=box];\n", (node->lchild)->uid);
		}
		else if( strcmp( (node->lchild)->item,"1" ) == 0 )
		{
			fprintf(fp,"\t node%d [label=\"1\",shape=box];\n", (node->lchild)->uid);
		}
		else if( !((node->lchild)->isDummy) && !((node->lchild)->sameSibling) )
		{
			fprintf(fp,"\t node%d [label=\"%s\"];\n", (node->lchild)->uid, (node->lchild)->item);
		}
		else if( (node->lchild)->isDummy && !((node->lchild)->sameSibling) )
		{
			fprintf(fp,"\t node%d [label=\"%s-d\",peripheries=2];\n", (node->lchild)->uid, (node->lchild)->item);
		}
		else if( !((node->lchild)->isDummy) && (node->lchild)->sameSibling )
		{
			fprintf(fp,"\t node%d [label=\"%s\",color=\"#%s\"];\n", (node->lchild)->uid, (node->lchild)->item, Glob_ColorNames[Glob_ColorId]);
			flagSameSibling = true;
		}
		else
		{
			fprintf(fp,"\t node%d [label=\"%s-d\",color=\"#%s\",peripheries=2];\n", (node->lchild)->uid, (node->lchild)->item, Glob_ColorNames[Glob_ColorId]);
			flagSameSibling = true;
		}
			
		
		fprintf(fp,"\t node%d -- node%d ", node->uid, (node->lchild)->uid);
		switch( node->edgeTypeLchild )
		{
			case 0 : fprintf(fp,"[style=dashed];\n"); break;
			case 1 : fprintf(fp,"[style=solid];\n");  break;
			case 2 : fprintf(fp,"[style=dotted];\n"); break;
			default: fprintf(fp,";\n");
		}
	}
	
	if( node->rchild != (BDD_Node*)NULL )
	{
		if( node->lchild != node->rchild )
		{
			if( strcmp( (node->rchild)->item,"0" ) == 0 )
			{
				fprintf(fp,"\t node%d [label=\"0\",shape=box];\n", (node->rchild)->uid);
			}
			else if( strcmp( (node->rchild)->item,"1" ) == 0 )
			{
				fprintf(fp,"\t node%d [label=\"1\",shape=box];\n", (node->rchild)->uid);
			}
			else if( !((node->rchild)->isDummy) && !((node->rchild)->sameSibling) )
			{
				fprintf(fp,"\t node%d [label=\"%s\"];\n", (node->rchild)->uid, (node->rchild)->item);
			}
			else if( (node->rchild)->isDummy && !((node->rchild)->sameSibling) )
			{
				fprintf(fp,"\t node%d [label=\"%s-d\",peripheries=2];\n", (node->rchild)->uid, (node->rchild)->item);
			}
			else if( !((node->rchild)->isDummy) && (node->rchild)->sameSibling )
			{
				fprintf(fp,"\t node%d [label=\"%s\",color=\"#%s\"];\n", (node->rchild)->uid, (node->rchild)->item, Glob_ColorNames[Glob_ColorId]);
				flagSameSibling = true;
			}
			else
			{
				fprintf(fp,"\t node%d [label=\"%s-d\",color=\"#%s\",peripheries=2];\n", (node->rchild)->uid, (node->rchild)->item, Glob_ColorNames[Glob_ColorId]);
				flagSameSibling = true;
			}
		}
			
		fprintf(fp,"\t node%d -- node%d ", node->uid, (node->rchild)->uid);
		switch( node->edgeTypeRchild )
		{
			case 0 : fprintf(fp,"[style=dashed];\n"); break;
			case 1 : fprintf(fp,"[style=solid];\n");  break;
			case 2 : fprintf(fp,"[style=dotted];\n"); break;
			default: fprintf(fp,";\n");
		}
	}
	
	if( flagSameSibling )
	{
		Glob_ColorId = (Glob_ColorId + 1) % 10;
	}
	
	printBDD_Node_Dot( node->lchild, fp );
	printBDD_Node_Dot( node->rchild, fp );
}



//Print the BDD tree in dot format
void printBDD_Tree_Dot ( BDD_Tree *tree, char fileName[] )
{
	FILE *fp;
	
	//Generate uid's for each node in the BDD tree
	//The uid is required to uniquely label each node
	Glob_Uid = 0;
	generateUidBDD_Node( tree->root );
	Glob_ColorId = 0;
	Glob_Count_Nodes = 0;
	
	fp = fopen(fileName,"w");
	fprintf(fp,"graph BDD_Tree {\n");
	fprintf(fp,"\t node%d [label=\"%s\"];\n", (tree->root)->uid, (tree->root)->item);
	printBDD_Node_Dot( tree->root, fp );
	fprintf(fp,"}\n");
	fclose(fp);
}
