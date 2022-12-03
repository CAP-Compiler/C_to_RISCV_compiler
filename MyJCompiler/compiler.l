

%{
#include "y.tab.h"
void yyerror (char *s);
int yylex();
%}



%%
"int"				   {return integer;}
"float"                {return floatin;}
"print"				   {return print;}
[a-zA-Z][_a-zA-Z0-9]*  {yylval.id = yytext[0]; return identifier;}
[0-9]+                 {yylval.num = atoi(yytext); return IntNumber;}
[0-9]+(\.[0-9]+)?      {yylval.Fnum = atof(yytext); return FloatNumber; printf("%f\n",yylval.Fnum = atof(yytext));}
[ \t\n]                ;
[-+=;]           	   {return yytext[0];}


%%
int yywrap (void) {return 1;}

