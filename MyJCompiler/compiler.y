%{
void yyerror (char *s);
int yylex();
extern int yylineno;

#include <stdio.h>     /* C declarations used in actions */
#include <stdlib.h>
#include <ctype.h>
#include "SymbolTable.h"
#include "ErrorHandler.h"

/*la mia symbol table è una struttura descritta dentro SymbolTable.h*/
sym symbols;
%}

/*Union contiene i tipi dei tag che andremo a lavorare e eche nonvanno solo riconosciuti (il tipo è la cosa tra <>)*/
%union {
	int num; 
	float Fnum;
	char id; 
}         /* Yacc definitions */

%start principal 

/* questi token vanno solo riconosciuti possono non avere tipo */
%token print
%token exit_command

/*token di tipo potrebbero pure essere senza tipo*/
%token <type> integer
%token <type> floatin 

/*token per il nome delle variabili*/
%token <id> identifier

/*token relativi a union*/
%token <num> IntNumber
%token <Fnum> FloatNumber

/* Non terminali*/
%type <num> principal exp term 
%type <id> Variables Stamp

%%

/* descriptions of expected inputs     corresponding actions (in C) */

// regola principale
principal	: Variables ';' {;}
			| Stamp ';' {;}
			| principal Variables ';' {;}
			| principal Stamp ';' {;}
			| exit_command ';'		{exit(EXIT_SUCCESS);} //lo mantengo solo per le prove
			| principal exit_command ';'	{exit(EXIT_SUCCESS);}
			;

// regole di tutti i tipi di variabili
Variables : integer identifier '=' exp  { updateSymbolVal($2,$4,0,&symbols); } // definizione + assegnazione (intero)
		  | integer identifier {IAddSymbol($2,&symbols);} //definzione (intero)
		  | floatin identifier '=' exp { updateSymbolVal($2,0,$4,&symbols); } //definzione + assegnazione (float)
		  | floatin identifier {FAddSymbol($2,&symbols);} //definzione (float)
		  | identifier '=' exp {int t;
								 int bucket = computeSymbolIndex($1);
								 if(symbols.intSym[bucket] == 0 && symbols.fsym[bucket] == 0){
									UndefinedVariable($1, yylineno);
								 } 
								 t=symbols.tip[bucket];
								 if(t==0){updateSymbolVal($1,$3,0,&symbols);}
								 else if(t==1){updateSymbolVal($1,0,$3,&symbols);}} //assegnazione generica
          ;

//regole per la stampa
Stamp : print identifier 			
			{ // ogni volta che printo devo capire che tipo printare 
				int t ; 
				int bucket = computeSymbolIndex($2);						
				t=symbols.tip[bucket];                                        //vado a leggere in tip 
				if(t==0) {printf("Printing %d",IsymbolVal($2,symbols));}
				else  {printf("Printing %f",FsymbolVal($2,symbols));}	
			}
		;

/*macro Sottoparte di un'assegnazione*/
exp    	: term                  {$$ = $1;}
       	| exp '+' term          {$$ = $1 + $3;}
       	| exp '-' term          {$$ = $1 - $3;}
       	;

/*Sottoparte più piccola di una espressione*/
term   	: IntNumber             {$$ = $1;}
		| FloatNumber           {$$ = $1;}
		| identifier			
		{  //devo capire cosa mettere al posto della variabile quindi devo prima capire di che tipo è e poi restituire il relativ valore
			int t;
			int bucket = computeSymbolIndex($1); 
			t=symbols.tip[bucket];
			if(t==0) {$$= IsymbolVal($1,symbols);}
			else if(t==1) {$$=FsymbolVal($1,symbols);}
			} 
        ;

%%                    

int main (void) {

	/* init symbol table */

	int i;
	for(i=0; i<52; i++) {
		symbols.intSym[i] = 0;
		symbols.fsym[i] =0;
	}

	return yyparse ( );
}

void yyerror (char *s) {fprintf (stderr, "%s\n", s);} 
