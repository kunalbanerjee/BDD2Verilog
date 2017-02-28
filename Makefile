#Balance BDD and generate corresponding Verilog code
#Author: Kunal Banerjee
#Date: 06-Sep-2013

CC=gcc
CFLAGS=-Wall -g -c
INCLUDES=-I ./include/

all: bddVerilog

#creates the executable file
bddVerilog : balanceBDD.o reduceBDD.o generateDot.o generateVerilog.o
	$(CC) -g -o ./bin/bddVerilog ./obj/*.o


#creates the object files
balanceBDD.o :
	$(CC) $(CFLAGS) $(INCLUDES) ./src/balanceBDD.c -o ./obj/balanceBDD.o

reduceBDD.o :
	$(CC) $(CFLAGS) $(INCLUDES) ./src/reduceBDD.c -o ./obj/reduceBDD.o

generateDot.o :
	$(CC) $(CFLAGS) $(INCLUDES) ./src/generateDotPaper.c -o ./obj/generateDot.o

generateVerilog.o :
	$(CC) $(CFLAGS) $(INCLUDES) ./src/generateVerilog.c -o ./obj/generateVerilog.o


clean :
	rm -rf ./obj/*.o
	rm -rf ./bin/bddVerilog

