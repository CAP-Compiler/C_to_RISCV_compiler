%{

#include <stdio.h>

%}

/*  declare tokens */

%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL

%token SEMICOLON

%token OC CC
%token IFKEYWORD ELSEKEYWORD

%token  OPERATORG //greater than
%token OPERATORL //lesser than
%token OPERATOREQ
%token OPERATORGEQ
%token OPERATORLEQ


%token OP
%token CP



%%


sentence: 
 |atom SEMICOLON EOL {printf("= %d\n",$1);}
 ;

atom	: IFKEYWORD OP NUMBER OPERATORG NUMBER CP OC exp CC {if($3 > $5){$$= $8;} }
 	| IFKEYWORD OP NUMBER OPERATORL NUMBER CP OC exp CC {if($3 < $5){$$= $8;} }
 	| IFKEYWORD OP NUMBER OPERATORGEQ NUMBER CP OC exp CC {if($3 >= $5){$$= $8;} }
	| IFKEYWORD OP NUMBER OPERATORLEQ NUMBER CP OC exp CC {if($3 <= $5){$$= $8;} }
	| IFKEYWORD OP NUMBER OPERATOREQ NUMBER CP OC exp CC {if($3 = $5){$$= $8;} }
 	;




//calclist:
// |calclist exp EOL //{printf("= %d\n",$2);} //si deve stampare "exp",cioè $2, il risultato è tutto in exp
// ;
 
 
exp: factor	//default $$= $1
 |exp ADD factor {$$= $1 + $3 ;}
 |exp SUB factor {$$= $1 - $3 ;}
 ;


factor: term
 |factor MUL term {$$=$1 * $3;}
 |factor DIV term {$$=$1 / $3;}
 ;
 
term: NUMBER	//default $$= $1
 |ABS term {$$= $2 >=0?$2 : -$2;}
 |OP exp CP { $$=$2; }
 ;

%%


 main(int argc,char **argv()){

	yyparse();
	


}
	
 	
	yyerror(char *s){
	fprintf(stderr,"error %s\n",s);
	
}






