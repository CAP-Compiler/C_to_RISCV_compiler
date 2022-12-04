# C_to_RISCV_compiler
University project whose porpouse is to create a compiler which takes C snippets and translate them to assembly

## Aims and Objectives

The aim of the project is to create a compiler which translates C language snippets into assembly (RISC-V) language code. The C microbenchmarks are taken from the past exams exercises of the course "Computer Architecture" held at the Universtity of Siena at the computer engineering department.


## First Step

**Understanding Flex/Lex**

As stated in the ["Compiler Construction using Flex and Bison" by Anthony A. Bay](https://www.admb-project.org/tools/flex/compiler.pdf):

>Lex and Flex are tools for generating scanners: programs which recognize lexical patterns in text. Flex is a faster version of Lex.

Lets start with and *example* to understand better the syntax of Flex.

We want to build a **"hello Counter"**, a program wich counts the repetitions of "hello" in a text file as input.

Create a text file with the **.l** extension

Flex has this type of syntax
```
%{

//Definitions

}%

%%

Recognized_patter   Action

%%

// C code

```
**Definitions** are the variables to declare or costants. **Recognized_pattern** are the characters we want to be recognized by Flex. They will correspond to an action. **Action** Action which corresponds to a recognized pattern.


Regarding our examples, we want to count the number of "hello" and the number of lines in a given text, so we would type
```
%{

int num_lines=0,num_hello=0;

}%
```
After that, it is time to write the patterns and the corresponding actions
```
%%

"hello"   ++num_hello;

"\n"      ++num_lines;

.       ;

%%
```

For every `hello` increment num_hello `++num_hello`
For every line feed `\n` increment num_lines `++num_lines`
For every other character `.` do nothing `;`


**Now it is time to write the main.**

We will call the `yylex()` function
>Lex generates a file containing the function yylex() which returns an integer denoting the token recognized.

```
main(){

yylex();
printf("The number of hellos is = %d\n The number of lines is= %d\n",num_hello,num_lines);

}
```


So the actual code would look like this:
```
%{

int num_lines=0,num_hello=0;
%}

%%

"hello"   ++num_hello;

"\n"      ++num_lines;

.       ;

%%

main(){

yylex();
printf("The number of hellos is = %d\n The number of lines is= %d\n",num_hello,num_lines);

}

```

As an example we could use the below input-text.

```
hello, I am Marco, how are you?
hello Marco, I am Giovanni, I am good.
hello, I am Antonio.
I am Andrea.
Why didn't you say hello Andrea?
```

Compile it:

`flex hello_counter.l` 
`gcc lex.yy.c -ll`
`./a.out < hello-text`

**Output**: `The number of hellos is = 4 The number of lines is= 5`

#####################################################################################

This was just a simple example on how flex is supposed to work. Just the fundamentals.


Now it is time to start using Bison , the parser.

## Bison 
