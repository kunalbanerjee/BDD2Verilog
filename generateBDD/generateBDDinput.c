//Author: Kunal Banerjee
//Date: 27-Mar-2014
//Generate BDD inputs from the outputs of blif.dot.bdd


#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_NAME  30
#define MAX_NODES 256
#define SEPARATOR "s" //Currently supported separators -- "s" and "p"


struct SingleBDDnode {
	char realName[MAX_NAME];
	char virtName[MAX_NAME];
	int count;
}SBN[MAX_NODES];



void findVirtName ( char* realName, int total, char* virtName )
{
	int i;
	char int2str[6];
	
	for( i = 0; i < total; i++ )
	{
		if( strcmp( SBN[i].realName, realName ) == 0 )
		{
			strcpy( virtName, SBN[i].virtName );
			strcat( virtName, SEPARATOR );
			sprintf( int2str, "%d", SBN[i].count );
			strcat( virtName, int2str );
			return;
		}
	}
	
	//virtName = realName -- this holds for the leaf nodes 0 and 1
	strcpy( virtName, realName );
}



int main ( int argc, char* argv[] )
{
	FILE *fileName, *fileOut;
	char virtName[MAX_NAME], outputFileName[MAX_NAME + 10];
	char source[MAX_NAME], destination[MAX_NAME];
	int countNodes, countIsotopes, countEdges;
	int totalNodes, totalIsotopes, totalEdges, total;
	int checkScanf;
	
	if( argc != 2 )
	{
		printf("\nYou have to supply a file name.\nExiting...\n");
		exit(0);
	}
	
	fileName = fopen( argv[1], "r" );
	
	if( fileName == NULL )
	{
		printf("\nCould not open the file.\nExiting...\n");
		exit(0);
	}
	
	checkScanf = fscanf(fileName,"%d\n",&totalNodes);
	if( checkScanf == EOF )
	{
		printf("\nError in input: Number of nodes expected.\nExiting...\n");
		exit(0);
	}
	
	total = 0;
	
	for( countNodes = 1; countNodes <= totalNodes; countNodes++ )
	{
		countIsotopes = 0;
	
		checkScanf = fscanf(fileName,"{ rank = same; \" %s \";\n",virtName);
		if( checkScanf == EOF )
		{
			printf("\nError in input: Format expected: { rank = same; \" %%s \";\\n\nExiting...");
			exit(0);
		}
		
		checkScanf = fscanf(fileName,"%d\n",&totalIsotopes);
		if( checkScanf == EOF )
		{
			printf("\nError in input: Number of isotopes expected.\nExiting...\n");
			exit(0);
		}
		
		for( countIsotopes = 1; countIsotopes <= totalIsotopes; countIsotopes++ )
		{
			checkScanf = fscanf(fileName,"\"%[^\"]\";\n",SBN[total].realName);
			if( checkScanf == EOF )
			{
				printf("\nError in input: Format expected: \"%%s\";\\n\nExiting...");
				exit(0);
			}
			
			strcpy( SBN[total].virtName, virtName );
			SBN[total].count = countIsotopes;
			total++;
		}
		
		checkScanf = fscanf(fileName,"}\n");
	}
	
	
	//By this time all the nodes have been read.
	//Now, the edges have to be read.
	
	checkScanf = fscanf(fileName,"%d\n",&totalEdges);
	if( checkScanf == EOF )
	{
		printf("\nError in input: Number of edges expected.\nExiting...\n");
		exit(0);
	}

	if( totalEdges != (2 * total) )
	{
		printf("\nNodes: %d\tEdges: %d",total,totalEdges);
		printf("\nError in input: Number of edges != 2 * Number of nodes -- a basic BDD property.\nExiting...\n");
		exit(0);
	}
	
	//Create the output file name
	strcpy( outputFileName, argv[1] );
	strcat( outputFileName, ".bdd.txt" );
	
	fileOut = fopen( outputFileName, "w" );
	fprintf(fileOut,"%d\n",total);
	
	for( countEdges = 1; countEdges <= totalEdges; countEdges++ )
	{
		if( (countEdges % 2) == 1 )
		{
			checkScanf = fscanf(fileName,"\"%[^\"]\" -> \"%[^\"]\";\n",source,destination);
			if( checkScanf == EOF )
			{
				printf("\nError in input: Format expected: \"%%s\" -> \"%%s\";\\n\nExiting...\n");
				exit(0);
			}
			
			findVirtName(source, total, virtName);
			fprintf(fileOut,"%s\n",virtName);
			findVirtName(destination, total, virtName);
			fprintf(fileOut,"%s 1 ",virtName);
		}
		else
		{
			checkScanf = fscanf(fileName,"\"%[^\"]\" -> \"%[^\"]\" [style = dashed];\n",source,destination);
			if( checkScanf == EOF )
			{
				printf("\nError in input: Format expected: \"%%s\" -> \"%%s\" [style = dashed];\\n\nExiting...\n");
				exit(0);
			}
			
			findVirtName(destination, total, virtName);
			fprintf(fileOut,"%s 0\n",virtName);
		}
	}
	
	fclose( fileOut );
	fclose( fileName );
	
	printf("\nOutput file: %s -- successfully created.\n",outputFileName);
	
	return 0;
}
