%option noyywrap

%{
#include "for.tab.h"
#include <stdlib.h>
#include <string.h>
%}

digit [0-9]
number ({digit}+)
delim [ \t\n]
ws {delim}+
alpha [A-Za-z]
undr [_]
ident ({alpha}|{undr})({alpha}|{undr}|{digit})*

%%

{ws}            { /* skip whitespace */ }

for             { return FOR; }
int             { return INT; }
return          { return RETURN; }

{ident}         { yylval.sval = strdup(yytext); return ID; }
{number}        { yylval.ival = atoi(yytext); return NUM; }

"+"             { return ADD; }
"-"             { return SUB; }
"*"             { return MUL; }
"/"             { return DIV; }
"="             { return ASSIGN; }
";"             { return SEMI; }
","             { return COMMA; }
"("             { return LPAREN; }
")"             { return RPAREN; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }

"<="            { return LE; }
"<"             { return LT; }
">="            { return GE; }
">"             { return GT; }
"=="            { return EQ; }
"!="            { return NE; }

.               { /* ignore unrecognized character */ }

%%
