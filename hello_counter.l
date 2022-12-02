
%{

int num_lines=0,num_hello=0;
%}

%%

hello	++num_hello;

\n	++num_lines;

.	;

%%

main(){

yylex();
printf("The number of hellos is = %d\n The number of lines is= %d\n",num_hello,num_lines);

}
