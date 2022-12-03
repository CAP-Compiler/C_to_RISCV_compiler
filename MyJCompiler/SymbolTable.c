#include "SymbolTable.h"
#include <ctype.h>
/*Va realizzata un'organizzazione più efficente della symbol val*/
int computeSymbolIndex(char token)
{
	int idx = -1;
	if(islower(token)) {
		idx = token - 'a' + 26;
	} else if(isupper(token)) {
		idx = token - 'A';
	}
	return idx;
} 

/* returns the value of a given symbol */
int IsymbolVal(char symbol,sym symbols)
{
	int bucket = computeSymbolIndex(symbol);
	return symbols.intSym[bucket];
}

float FsymbolVal(char symbol,sym symbols)
{
	int bucket = computeSymbolIndex(symbol);
	return symbols.fsym[bucket];
}

/* updates the value of a given symbol */
void updateSymbolVal(char symbol, int Ival,float Fval,sym *symbols)
{
	int bucket;
	if(Ival != 0 && Fval == 0){
		bucket = computeSymbolIndex(symbol);
		symbols->intSym[bucket] = Ival;
		symbols->tip[bucket] = 0; // servirà dopo per capure il tipo
	}else if(Ival==0 && Fval != 0){
		bucket = computeSymbolIndex(symbol);
		symbols->fsym[bucket] = Fval;
		symbols->tip[bucket] = 1;
	}	
}

// Updata la symboltable ma solo in caso di definizione quindi mette 0;
void IAddSymbol(char symbol,sym *symbols){
	int bucket = computeSymbolIndex(symbol);
	symbols->intSym[bucket] = 0;
}

void FAddSymbol(char symbol,sym *symbols){
	int bucket = computeSymbolIndex(symbol);
	symbols->intSym[bucket] = 0;
}
