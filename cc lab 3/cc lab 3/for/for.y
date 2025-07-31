%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void yyerror(char *s);
int yylex();
%}

/* Declare union type */
%union {
    int ival;
    char *sval;
}

/* Declare token types */
%token <ival> NUM
%token <sval> ID
%token ADD SUB MUL DIV ASSIGN SEMI COMMA LPAREN RPAREN LBRACE RBRACE
%token LE LT GT GE EQ NE
%token INT FOR RETURN

%start program

%%

program:
    INT ID LPAREN RPAREN LBRACE decls for_stmt ret_stmt RBRACE {
        printf("parsing finished\n");
    }
    ;

decls:
    INT ID COMMA ID SEMI                 // int i, n;
    INT ID ASSIGN NUM SEMI               // int sum = 0;
    ;

for_stmt:
    FOR LPAREN ID ASSIGN NUM SEMI ID LE ID SEMI ID ADD ADD RPAREN 
    LBRACE sum_loop RBRACE
    ;

sum_loop:
    ID ADD ASSIGN ID SEMI
    ;

ret_stmt:
    RETURN NUM SEMI
    ;

%%

void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}

int main()
{
    yyparse();
    return 0;
}
