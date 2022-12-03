#ifndef __SYMBOLTABLE__
#define __SYMBOLTABLE__

typedef struct{ 
	int intSym[52];
	double fsym[52];
	int tip[52];
}sym;


float FsymbolVal(char symbol,sym symbols);
int IsymbolVal(char symbol,sym symbols);
void updateSymbolVal(char symbol, int Ival,float Fval,sym *symbols);
void IAddSymbol(char symbol,sym *symbols);
void FAddSymbol(char symbol,sym *symbols);
int computeSymbolIndex(char token);

#endif