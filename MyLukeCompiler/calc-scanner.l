%{

#include "calculator-parser.tab.h" //è il file .h con i valori dei token generati dal parser


%}

%%

"+"	{return ADD; }
"-"	{return SUB; }
"*"	{return MUL; }
"/"	{return DIV; }
"|"	{return ABS; }
[0-9]+	{yylval=atoi(yytext); return NUMBER; }
\n	{return EOL; }
"("	{return OP;}
")"	{return CP;}
"{"	{return OC;}    //OpenCurly
"}"	{return CC;}	//CloseCUrly
[ \t]	{/* ignore whitespaces */}


">"	{return OPERATORG;} //greater than
"<"	{return OPERATORL;} //lesser than
"=="	{return OPERATOREQ;} 
">="	{return OPERATORGEQ;} //greater equal than
"<="	{return OPERATORLEQ;} //lesser equal than


";"	{return SEMICOLON;}

"if"	{return IFKEYWORD;}
"else"  {return ELSEKEYWORD;}




"//".*	{   }   //printf("Caratttere non riconosciuto %c\n",*yytext);

%%


//tutto questo lo posso togliere perchè fa già tutto il parser

/*
main(int argc,char **argv()){

	int token;
	
	
	while(token=yylex()){
	
	printf("%d",token);
	if(token==NUMBER) printf(" =%d\n",yylval);
	else printf("\n");
	}

return 0;


}
*/
