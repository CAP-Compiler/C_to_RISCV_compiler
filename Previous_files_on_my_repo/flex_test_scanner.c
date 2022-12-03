#include <stdio.h>
#include "Definitions.h"

//using the functions and variables in the C compiled flex file
extern int yylex();
//actual token value
extern char* yytext;
//line number
extern int yylineno;

//a serial array containing the names of the input file
char* names[] = {"name", "config", "comm", "serial", "answer"};

int main()
{
    //name token and value token
    int ntoken, vtoken;
    //parsing of the first input
    ntoken = yylex();
    while(ntoken)
    {
        //we expect the name token first
        printf("ntoken: %d\n", ntoken);
        //step by step parsing of the next input
        ntoken = yylex();

    }
    return 0;
}
