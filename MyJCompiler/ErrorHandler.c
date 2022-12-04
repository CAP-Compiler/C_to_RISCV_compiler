#include "ErrorHandler.h"

void UndefinedVariable(char VarName, int line){
    printf("Syntax Error: '%c' is undefined in line: %d\n",VarName, line);
}