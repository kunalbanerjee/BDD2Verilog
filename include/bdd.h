//Author: Kunal Banerjee
//Date: 09-Jan-2014

#ifndef BALANCE_BDD_HEADER
#define BALANCE_BDD_HEADER


#define MAXVAR  256
#define VARNAME 20 

#define REPEATER_L  "R"   // "R_L"
#define REPEATER_R  "R"   // "R_R"
#define REPEATER_LR "R"   // "R_LR"


//Data Structure for BDD node
typedef struct BDD_Node {
	char item[VARNAME];
	struct BDD_Node *lchild;
	struct BDD_Node *rchild;
	bool isDummy; //this attribute is true for dummy nodes, false for others
	int depth;    //depth of the root node is zero
	
	//The following attributes are required for generating the verilog files
	char type;        //'L' for left child, 'R' for right child, 'B' for both, 'X' for root node
	bool sameSibling; //true  if its item is same as that of its sibling
	                  //false otherwise

	//The following attributes are required for generating the dotty files	
	int edgeTypeLchild; //0 - dashed, 1 - solid, 2 - dotted
	int edgeTypeRchild;
	int uid;            //unique identification number
}BDD_Node;


//Data Structure for BDD tree
typedef struct BDD_Tree {
	BDD_Node *root;                      //Pointer to the root of the tree
	int numVariables;                    //Number of varibles
	char variableOrder[MAXVAR][VARNAME]; //Order of the variables
	int distRepeater;                    //Distance (in hops) between repeaters
	int height;                          //Height of the tree
}BDD_Tree;


/**********************************************************************/


/******* Functions defined in balanceBDD.c *******/

/**** Functions related to creation of BDD ****/
void calculateDepth  ( BDD_Node* );
int  calculateHeight ( BDD_Node* );
BDD_Node* createBDD_Node ( char[], BDD_Node*[], int, bool* );
void getGenericVariableName ( char[], char[] );
bool checkSameSibling    ( char[], char[] );
BDD_Tree* createBDD_Tree ( );

/**** Functions related to displaying the BDD ****/
void printBDD_Node ( BDD_Node* );
void printBDD_Tree ( BDD_Tree* );

/**** Functions related to balancing the BDD ****/
void balanceBDD_Node ( BDD_Node*, BDD_Tree* );
void balanceBDD_Tree ( BDD_Tree* );

/**** Functions related to insertion of repeaters in the BDD ****/
void insertRepeaterBDD_Node ( BDD_Node*, BDD_Tree* );
void insertRepeatersBDD_Tree( BDD_Tree* );

/**********************************************************************/


/******* Functions defined in generateDot.c *******/

void generateUidBDD_Node ( BDD_Node* );
bool nodeAlreadyCovered  ( BDD_Node* );
void printBDD_Node_Dot   ( BDD_Node*, FILE*  );
void printBDD_Tree_Dot   ( BDD_Tree*, char[] );

/**********************************************************************/


/******* Functions defined in generateVerilog.c *******/

bool muxAlreadyCreated ( int, char[] );
void updateMUX_Created ( int, char[] );
bool reverseInputs ( BDD_Node* );
int  adjustInputs  ( int, bool );
int  decideInputsToMUX ( BDD_Node*, bool );
void generateVerilog_BDD_Node ( BDD_Node*, BDD_Tree*, FILE*, bool, char );
void generateVerilog_BDD_Tree ( BDD_Tree*, char[] );

/**********************************************************************/


/******* Functions defined in reduceBDD.c *******/

bool isDummyOrRepeater ( BDD_Node* );
void populatePC_Info   ( BDD_Node* );
void reduceBDD_Node    ( BDD_Node*, BDD_Node*[][2] );
void reduceBDD_Tree    ( BDD_Tree* );

/**********************************************************************/

#endif
