//Author: Kunal Banerjee
//Date: 28-Feb-2014

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#include "bdd.h"

extern int Glob_Count_Nodes;
extern bool nodeAlreadyCovered ( BDD_Node* );


//The following structure stores the addresses of 
//a BDD node and its left and right child
//An array of this structure is also defined
struct ParentChildInformation {
	BDD_Node *parent;
	BDD_Node *leftChild;
	BDD_Node *rightChild;
}Glob_PC_Info[MAXVAR];


//A global variable for counting the number of dummy and repeater nodes
int Glob_Count_DR_Nodes;



//Check whether a BDD node is a Dummy node or a Repeater node
//Returns true if it is, otherwise returns false
bool isDummyOrRepeater ( BDD_Node *node )
{
	if( node == (BDD_Node*)NULL )
		return false;
		
	if( node->isDummy )
		return true;
		
	if( (strcmp(node->item,REPEATER_L) == 0) || 
	    (strcmp(node->item,REPEATER_R) == 0) ||
	    (strcmp(node->item,REPEATER_LR) == 0) )
		return true;
		
	return false;
}



//Populate PC_Info
void populatePC_Info ( BDD_Node *node )
{
	if( node == (BDD_Node*)NULL )
		return;
	
	if( nodeAlreadyCovered( node ) )
		return;

	if( isDummyOrRepeater( node ) )
	{
		Glob_PC_Info[ Glob_Count_DR_Nodes ].parent = node;
		Glob_PC_Info[ Glob_Count_DR_Nodes ].leftChild = node->lchild;
		Glob_PC_Info[ Glob_Count_DR_Nodes ].rightChild = node->rchild;
		Glob_Count_DR_Nodes++;
	}
	
	populatePC_Info( node->lchild );
	populatePC_Info( node->rchild );
}



//Reduce BDD node
void reduceBDD_Node ( BDD_Node *node, BDD_Node *replaceNode[][2] )
{
	int i;
	
	if( node == (BDD_Node*)NULL )
		return;
	
	if( nodeAlreadyCovered( node ) )
		return;
		
	if( isDummyOrRepeater( node->lchild ) )
	{
		//Find which node to replace it by
		for( i = 0; i < Glob_Count_DR_Nodes; i++ )
		{
			if( node->lchild == replaceNode[i][0] )
				node->lchild = replaceNode[i][1];
		}
	}
	
	if( isDummyOrRepeater( node->rchild ) )
	{
		//Find which node to replace it by
		for( i = 0; i < Glob_Count_DR_Nodes; i++ )
		{
			if( node->rchild == replaceNode[i][0] )
				node->rchild = replaceNode[i][1];
		}
	}
	
	reduceBDD_Node( node->lchild, replaceNode );
	reduceBDD_Node( node->rchild, replaceNode );
}



//Merge Dummy and Repeater BDD nodes having identical 
//left child and right child
void reduceBDD_Tree ( BDD_Tree *tree )
{
	int i, j;
	bool flagReplace;
	BDD_Node *replaceNode[MAXVAR][2];
	
	//First populate ParentChildInformation for Dummy and Repeater BDD nodes
	Glob_Count_Nodes = 0;
	Glob_Count_DR_Nodes = 0;
	populatePC_Info( tree->root );
	
	//Determine which nodes needs to be replaced and by whom
	for( i = 0; i < Glob_Count_DR_Nodes; i++ )
	{
		flagReplace = false;
		replaceNode[i][0] = Glob_PC_Info[i].parent;
		
		for( j = 0; j < i; j++ )
		{
			if( (Glob_PC_Info[j].leftChild == Glob_PC_Info[i].leftChild) &&
			    (Glob_PC_Info[j].rightChild == Glob_PC_Info[i].rightChild) )
			{
				replaceNode[i][1] = Glob_PC_Info[j].parent;
				flagReplace = true;
				break;
			}
		}
		
		if( !(flagReplace) )
		{
			replaceNode[i][1] = Glob_PC_Info[i].parent;
		}
	}
	
	//Reduce the BDD tree
	Glob_Count_Nodes = 0;
	reduceBDD_Node( tree->root, replaceNode );
}
