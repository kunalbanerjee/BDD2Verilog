//Author: Kunal Banerjee
//Date: 28-Feb-2014

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

#include "bdd.h"

extern int Glob_Count_Nodes;
extern bool nodeAlreadyCovered ( BDD_Node* );


//The following global variable is used to denote what type of logic
//is to be used for synthesising the circuit (Taken as input from user)
//1 -- Top pre-charge (default)
//2 -- Bottom pre-charge + Swing restoration
//3 -- Top-Bottom pre-charge
//4 -- BDD based pre-charge + Swing restoration
int Glob_TypeOfLogic;


/**********************************************************************/
/**** Functions related to creation of BDD ****/


//Calculate depth of a BDD Node
void calculateDepth ( BDD_Node *node )
{
	int temp;
	
	temp = node->depth + 1;
	
	if( node->lchild != (BDD_Node*)NULL )
	{
		if( temp > (node->lchild)->depth )
		{
			(node->lchild)->depth = temp;
		}
		calculateDepth( node->lchild );
	}
	if( node->rchild != (BDD_Node*)NULL )
	{
		if( temp > (node->rchild)->depth )
		{
			(node->rchild)->depth = temp;
		}
		calculateDepth( node->rchild );
	}
}



//Calculate height of a BDD Node
int calculateHeight ( BDD_Node *node )
{
	int lh, rh;
	
	if( node == (BDD_Node*)NULL )
		return 0;
	else
	{	
		lh = calculateHeight( node->lchild ) + 1;
		rh = calculateHeight( node->rchild ) + 1;
		if( lh > rh )
			return lh;
		else
			return rh;
	}
}



//Checks if a BDD node for nodeName already exists or not
//If it exists then returns corresponding pointer to BDD_Node
//Otherwise creates a new BDD_Node and returns its address
BDD_Node* createBDD_Node ( char nodeName[], BDD_Node *bddArray[], int countUid, bool *newNodeCreated )
{
	int j;
	BDD_Node *newNode;

	for( j = 0; j < countUid; j++ )
	{
		if( strcmp(nodeName, bddArray[j]->item) == 0 )
		{
			*newNodeCreated = false;
			return bddArray[j]; 
		}
	}
		
	//A new node has to be created
	newNode = (BDD_Node*) malloc (sizeof(BDD_Node*));
	strcpy( newNode->item, nodeName );
	newNode->lchild = (BDD_Node*)NULL;
	newNode->rchild = (BDD_Node*)NULL;
	newNode->isDummy = false;
	newNode->depth = -1;
	newNode->type = 'X';
	newNode->sameSibling = false;
	newNode->edgeTypeLchild = 0;
	newNode->edgeTypeRchild = 1;
	newNode->uid = countUid;

	*newNodeCreated = true;
	return newNode;
}



//Compute the "generic" variable name
//Returns the variable name before the character 'p' or 's' occurs
void getGenericVariableName ( char newName[], char name[] )
{
	int i;
	
	for( i = 0; ; i++ ) //condition intentionally left blank
	{
		if( (name[i] == 'p') || (name[i] == 's') || (name[i] == 0) )
		{
			//The last disjunct checks match for '\0' -- thus the for loop
			//always terminates
			break;
		}
		newName[i] = name[i];
	}
	newName[i] = '\0';
}



//Check whether two siblings are same or not
bool checkSameSibling ( char lname[], char rname[] )
{
	char newLname[VARNAME], newRname[VARNAME];
	
	//Two siblings are considered to be same if their names are identical
	//before the character 'p' (for "prime") or 's' is encountered
	
	getGenericVariableName( newLname, lname );
	getGenericVariableName( newRname, rname );
	
	if( strcmp(newLname,newRname) == 0 )
		return 1;
	else
		return 0;
}



//This function creates the BDD tree
BDD_Tree* createBDD_Tree ()
{
	int n, countUid, lEdgeType, rEdgeType;
	int i;
	BDD_Node *currentNode, *lNode, *rNode, *bddArray[MAXVAR + 2];
	BDD_Tree *bddTree;
	char nodeName[VARNAME], lChildName[VARNAME], rChildName[VARNAME];
	bool newNodeCreated;
	
	
	bddTree = (BDD_Tree*) malloc (sizeof(BDD_Tree));
	
	printf("\nEnter the number of variables:");
	if( (scanf("%d",&(bddTree->numVariables)) != 1) || (bddTree->numVariables <= 0) )
	{
		printf("\nERROR: Please input a valid positive number of variables.\n");
		printf("Exiting system.\n");
		exit(0);
	}
	
	printf("\nEnter the variables in order (from root to leaf):");
	for( i= 0; i < bddTree->numVariables; i++ )
	{
		if( scanf("%s", bddTree->variableOrder[i]) != 1 )
		{
			printf("\nERROR: Please input a proper variable name.\n");
			printf("Exiting system.\n");
			exit(0);
		}
	}
	
	printf("\nEnter the distance (in hops) between repeaters (0 means no repeater is required):");
	if( (scanf("%d",&(bddTree->distRepeater)) != 1) || (bddTree->distRepeater < 0) )
	{
		printf("\nERROR: Please input a valid non-negative distance between repeaters.\n");
		printf("Exiting system.\n");
		exit(0);
	}
	
	printf("\nEnter the type of logic to be used\n");
	printf("1 -- Top pre-charge\n");
    printf("2 -- Bottom pre-charge + Swing restoration (Not supported yet)\n");
    printf("3 -- Top-Bottom pre-charge\n");
    printf("4 -- BDD based pre-charge + Swing restoration\n:");
    if( (scanf("%d",&Glob_TypeOfLogic) != 1) || (Glob_TypeOfLogic <= 0) || (Glob_TypeOfLogic >= 5) )
    {
		printf("\nERROR: Please input a valid type of logic -- 1, 2, 3, or 4.\n");
		printf("Exiting system.\n");
		exit(0);
	}
	
	printf("\nEnter the number of nodes in the BDD tree (excluding the leaf nodes 0 and 1):\n");
	if( (scanf("%d",&n) != 1) || (n <= 0) )
	{
		printf("\nERROR: Please input a valid positive number of nodes.\n");
		printf("Exiting system.\n");
		exit(0);
	}
	
	countUid = 0;
	for( i = 0; i < n; i++ )
	{
		if( scanf("%s",nodeName) != 1 )
		{
			printf("\nERROR: Please input a proper node name.\n");
			printf("Exiting system.\n");
			exit(0);
		}
		
		currentNode = createBDD_Node( nodeName, bddArray, countUid, &newNodeCreated );
		if( newNodeCreated )
		{
			bddArray[ countUid ] = currentNode;
			countUid++;
		}
		
		
		if( scanf("%s",lChildName) != 1 )
		{
			printf("\nERROR: Please input a proper node name.\n");
			printf("Exiting system.\n");
			exit(0);
		}
		if( (scanf("%d",&lEdgeType) != 1) || (lEdgeType < 0) || (lEdgeType > 2) )
		{
			printf("\nERROR: Please input a proper edge type -- 0, 1, or 2.\n");
			printf("Exiting system.\n");
			exit(0);
		}
		if( scanf("%s",rChildName) != 1 )
		{
			printf("\nERROR: Please input a proper node name.\n");
			printf("Exiting system.\n");
			exit(0);
		}
		if( (scanf("%d",&rEdgeType) != 1) || (rEdgeType < 0) || (rEdgeType > 2) )
		{
			printf("\nERROR: Please input a proper edge type -- 0, 1, or 2.\n");
			printf("Exiting system.\n");
			exit(0);
		}
		
		
		lNode = createBDD_Node( lChildName, bddArray, countUid, &newNodeCreated );
		if( newNodeCreated )
		{
			bddArray[ countUid ] = lNode;
			countUid++;
		}
		
		rNode = createBDD_Node( rChildName, bddArray, countUid, &newNodeCreated );
		if( newNodeCreated )
		{
			bddArray[ countUid ] = rNode;
			countUid++;
		}
		
		currentNode->lchild = lNode;
		currentNode->rchild = rNode;
		currentNode->edgeTypeLchild = lEdgeType;
		currentNode->edgeTypeRchild = rEdgeType;
		
		if( lNode == rNode )
		{
			lNode->type = 'B';
			lNode->sameSibling = true;
		}
		else
		{
			lNode->type = 'L';
			rNode->type = 'R';
			
			if( checkSameSibling(lChildName,rChildName) )
			{
				lNode->sameSibling = true;
				rNode->sameSibling = true;
			}
			else
			{
				lNode->sameSibling = false;
				rNode->sameSibling = false;
			}
		}
	}//end for
	
	//Find which node is the root node of the BDD tree
	//This is done by searching which node still has its 
	//type marked as 'X' -- there shold be only one such node
	for( i = 0; i < countUid; i++ )
	{
		if( bddArray[i]->type == 'X' )
		{
			bddTree->root = bddArray[i];
			break;
		}
	}
	
	(bddTree->root)->depth = 0;
	calculateDepth( bddTree->root );
	
	//The depth of the last node is equal to the height of the BDD tree
	bddTree->height = calculateHeight( bddTree->root );
	
	return bddTree;
}



/**********************************************************************/
/**** Functions related to displaying the BDD ****/

//This function a BDD node (in preorder fashion)
void printBDD_Node ( BDD_Node *node )
{
	if( node == (BDD_Node*)NULL )
		return;
		
	//No need to display the leaf nodes separately
	if( strcmp(node->item,"0") == 0 )
		return;
	if( strcmp(node->item,"1") == 0 )
		return;
		
	if( nodeAlreadyCovered( node ) )
		return;
		
	if( node->isDummy )
		printf("%s-d :\t", node->item);
	else
		printf("%s :\t", node->item);
		
	switch( node->type )
	{
		case 'X' : printf("Root  node   "); break;
		case 'L' : printf("Left  child  "); break;
		case 'R' : printf("Right child  "); break;
		default  : printf("Both  child  ");
	}

	if( node->sameSibling )
		printf("Same sibling  ");
	else
		printf("Diff sibling  ");

	printf("Depth: %2d  ", node->depth);
	
	if( (node->lchild)->isDummy )
		printf("Left  Child:%s-d\t",(node->lchild)->item);
	else
		printf("Left  Child:%s\t",(node->lchild)->item);
		
	printf("Edge Type: %d  ",node->edgeTypeLchild);
	
	if( (node->rchild)->isDummy )
		printf("Right Child:%s-d\t",(node->rchild)->item);
	else
		printf("Right Child:%s\t",(node->rchild)->item);
		
	printf("Edge Type: %d\n",node->edgeTypeRchild);
	
	printBDD_Node( node->lchild );
	printBDD_Node( node->rchild );
}



//This function prints the BDD tree
void printBDD_Tree ( BDD_Tree* tree )
{
	int i;
	
	if( tree != (BDD_Tree*)NULL )
	{
		printf("\n\n-------- BDD Tree --------\n");
		printf("Number of variables: %d\n", tree->numVariables);
		for( i = 0; i < tree->numVariables; i++ )
		{
			printf("%s  ", tree->variableOrder[i]);
		}
		printf("\nHeight of the BDD tree: %d\n", tree->height);
		printf("Distance (in hops) between the repeaters: %d\n", tree->distRepeater);
		printf("\nThe BDD tree in preorder fashion\n");
		Glob_Count_Nodes = 0;
		printBDD_Node( tree->root );
		printf("\n--------------------------\n");
	}
}



/**********************************************************************/
/**** Functions related to balancing the BDD ****/


//Balance a BDD node
void balanceBDD_Node ( BDD_Node *node, BDD_Tree *tree )
{
	int lh, rh, diff;
	int i;
	BDD_Node *currentNode, *newNode;
	
	if( node == (BDD_Node*)NULL )
		return;
	
	lh = calculateHeight( node->lchild );
	rh = calculateHeight( node->rchild );
	
	if( lh == rh)
	{	
		; //do nothing
	}
	else
	{
		if( lh > rh )
			diff = lh - rh;
		else
			diff = rh - lh;
		
		if( (tree->numVariables - node->depth - 1) < diff )
		{
			printf("\nCannot balance the BDD since the input does not follow the variable ordering imposed by CUDD.\n");
			printf("Exiting system.\n");
			exit(0);
		}
		
		currentNode = node;
		
		//Insert dummy nodes according to the order present in the BDD tree
		//NB: The variables from 0,1,...,node->depth may have already occurred in the BDD tree
		for( i = node->depth + 1; diff > 0; diff--, i++ )
		{
			//Note that one node needs to be create a right child if currentNode == node
			//otherwise a 'B' type child needs to be created
			if(currentNode == node)
			{
				newNode = (BDD_Node*) malloc (sizeof(BDD_Node));
				
				if( lh > rh )
				{
					//Create a dummy node corresponding to the variable in the left child 
					strcpy( newNode->item, (node->lchild)->item );
					newNode->lchild = node->rchild;
					newNode->rchild = node->rchild;
					newNode->type = 'R';
					
					(node->lchild)->sameSibling = true;
					
					(node->rchild)->type = 'B';
					(node->rchild)->sameSibling = true;
					node->rchild = newNode;
				}
				else
				{
					//Create a dummy node corresponding to the variable in the right child 
					strcpy( newNode->item, (node->rchild)->item );
					newNode->lchild = node->lchild;
					newNode->rchild = node->lchild;
					newNode->type = 'L';
					
					(node->rchild)->sameSibling = true;
					
					(node->lchild)->type = 'B';
					(node->lchild)->sameSibling = true;
					node->lchild = newNode;
				}
					
				newNode->isDummy = true;
				newNode->depth = currentNode->depth + 1;
				newNode->sameSibling = true;
				newNode->edgeTypeLchild = 0;
				newNode->edgeTypeRchild = 1;
				
				currentNode = newNode;
			}
			else
			{
				newNode = (BDD_Node*) malloc (sizeof(BDD_Node));
				strcpy( newNode->item, tree->variableOrder[i] );
				newNode->lchild = currentNode->lchild;
				newNode->rchild = currentNode->rchild;
				newNode->isDummy = true;
				newNode->depth = currentNode->depth + 1;
				newNode->type = 'B';
				newNode->sameSibling = true;
				newNode->edgeTypeLchild = 0;
				newNode->edgeTypeRchild = 1;
			
				currentNode->lchild = newNode;
				currentNode->rchild = newNode;
				currentNode = newNode;
			}
		}//end for
	}//end else if ( lh > rh )

	balanceBDD_Node( node->lchild, tree );
	balanceBDD_Node( node->rchild, tree );
}



//Balance the BDD tree
void balanceBDD_Tree ( BDD_Tree *tree )
{
	balanceBDD_Node( tree->root, tree );
}


/**********************************************************************/
/**** Functions related to insertion of repeaters in the BDD ****/


//Insert repeater at a BDD node
void insertRepeaterBDD_Node ( BDD_Node *node, BDD_Tree *tree )
{
	int diff;
	BDD_Node *oldNode, *newNode;
	int hopNodesOfTree; //This variable helps in determining which nodes
	                    //of the tree have to be jumped over
	
	//Since the BDD tree has already been balanced,
	//the following check suffices as the base case
	if( node->lchild == (BDD_Node*)NULL )
		return;
		
	if( nodeAlreadyCovered(node) )
		return;
	
	hopNodesOfTree = 0;	
	diff = tree->height - node->depth - 2;
	if( (diff != 0) && ((diff % tree->distRepeater) == 0) )
	{
		//Repeater(s) have to be added below this node
		if( node->lchild == node->rchild )
		{
			//One repeater needs to be added
			newNode = (BDD_Node*) malloc (sizeof(BDD_Node));
			strcpy( newNode->item, REPEATER_LR );
			newNode->type = 'B';
			newNode->sameSibling = true;
			newNode->isDummy = false;
			newNode->depth = node->depth + 1;
			newNode->lchild = node->lchild;
			newNode->rchild = node->lchild;
			newNode->edgeTypeLchild = 0;
			newNode->edgeTypeRchild = 1;
			
			(node->lchild)->type = 'B';
			(node->lchild)->sameSibling = true;
			node->lchild = newNode;
			node->rchild = newNode;
			
			hopNodesOfTree = 1;
		}
		else
		{
			//Two repeaters need to be added
			newNode = (BDD_Node*) malloc (sizeof(BDD_Node));
			strcpy( newNode->item, REPEATER_L );
			newNode->type = 'L';
			newNode->sameSibling = false;
			newNode->isDummy = false;
			newNode->depth = node->depth + 1;
			newNode->lchild = node->lchild;
			newNode->rchild = node->lchild;
			newNode->edgeTypeLchild = 0;
			newNode->edgeTypeRchild = 1;
			
			(node->lchild)->type = 'B';
			(node->lchild)->sameSibling = true;
			node->lchild = newNode;
			oldNode = newNode;


			newNode = (BDD_Node*) malloc (sizeof(BDD_Node));
			strcpy( newNode->item, REPEATER_R );
			newNode->type = 'R';
			newNode->sameSibling = false;
			newNode->isDummy = false;
			newNode->depth = node->depth + 1;
			newNode->lchild = node->rchild;
			newNode->rchild = node->rchild;
			newNode->edgeTypeLchild = 0;
			newNode->edgeTypeRchild = 1;
			
			(node->rchild)->type = 'B';
			(node->rchild)->sameSibling = true;
			node->rchild = newNode;
			
			hopNodesOfTree = 2;
		}
	}//end if ( repeater added )

	switch( hopNodesOfTree )
	{
		case 0 :
			insertRepeaterBDD_Node( node->lchild, tree );
			insertRepeaterBDD_Node( node->rchild, tree );
			break;
		case 1 :
			insertRepeaterBDD_Node( newNode->lchild, tree );
			break;
		default:
			insertRepeaterBDD_Node( oldNode->lchild, tree );
			insertRepeaterBDD_Node( newNode->rchild, tree );
	}
}



//Insert repeaters in the BDD tree
void insertRepeatersBDD_Tree( BDD_Tree *tree )
{
	if( (tree->distRepeater == 0) || (tree->distRepeater >= tree->height) )
	{
		//No repeater has to be inserted
		return;
	}
	
	Glob_Count_Nodes = 0;
	insertRepeaterBDD_Node( tree->root, tree );
	
	(tree->root)->depth = 0;
	calculateDepth( tree->root );
	
	tree->height = calculateHeight( tree->root ); 
	
	//A direct way to compute the height of the BDD tree augmented with repeaters
	//tree->height = tree->height + ((tree->height-1) / tree->distRepeater);
}


/**********************************************************************/
/**** Main function ****/

int main()
{
	BDD_Tree *tree;
	
	tree = createBDD_Tree();
	printf("\n<---- Original BDD ---->\n");
	printBDD_Tree( tree );
	printBDD_Tree_Dot( tree, "treeOriginal.dot" );
	
	balanceBDD_Tree( tree );
	
	(tree->root)->depth = 0;
	calculateDepth( tree->root );
	
	printf("\n<---- Balanced BDD ---->\n");
	printBDD_Tree( tree );
	printBDD_Tree_Dot( tree, "treeBalanced.dot" );
	
	reduceBDD_Tree( tree );
	printf("\n<---- Balanced reduced BDD ---->\n");
	printBDD_Tree( tree );
	printBDD_Tree_Dot( tree, "treeReduced.dot" );
		
	insertRepeatersBDD_Tree( tree );
	printf("\n<---- Balanced BDD with repeaters ---->\n");
	printBDD_Tree( tree );
	printBDD_Tree_Dot( tree, "treeBalancedRepeater.dot" );
	
	reduceBDD_Tree( tree );
	printf("\n<---- Balanced reduced BDD with repeaters ---->\n");
	printBDD_Tree( tree );
	printBDD_Tree_Dot( tree, "treeReducedRepeater.dot" );
	
	generateVerilog_BDD_Tree( tree, "bdd_Sbox_code.v" );
	
	return 0;
}
