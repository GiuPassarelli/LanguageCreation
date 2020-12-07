/* recognize tokens for the calculator and print them out */
%{

# include "Parser.tab.h"
// #include <string.h>
int yyerror( char *, ...);

%}

%%

"+"	                      { return ADD; }
"->"                      { return ASSIGN; }
"-"	                      { return SUB; }
"*"	                      { return MUL; }
"/"	                      { return DIV; }
"=="                      { return EQUAL; }
"menorQue"               { return MENOR; }
"maiorQue"               { return MAIOR; }

"("                       { return OP; }
")"                       { return CP; }
"{"                       { return OCB; }
"}"                       { return CCB; }
";"                       { return SEMICOLON; }
","                       { return COMMA; }
[0-9]+	                  { yylval = atoi(yytext); return NUMBER; }

"se"                      { return KEYWORDIF; }
"senao"                   { return KEYWORDELSE; }
"enquanto"                { return KEYWORDWHILE; }
"durante"                 { return KEYWORDFOR; }
"ate"                     { return KEYWORDUNTIL; }
"funcao"                  { return KEYWORDFUNCTION; }
"retorna"                 { return KEYWORDRETURN; }
"emprime"                 { return KEYWORDPRINT; }

[a-zA-Z_][a-zA-Z0-9_]*    { return IDENTIFIER; }
["][^"]*["]               { return PALAVRA; }

\n                        { return EOL; }
"//".*  
[ \t]                     { /* ignore white space */ }
.	                      { yyerror("Mystery character %c\n", *yytext); }

%%

