/* simplest version of calculator */
%{
# include <stdio.h>

int yylex();
int yyerror(char *s);

%}

/* declare tokens */
%token NUMBER
%token ADD SUB MUL DIV
%token EQUAL MENOR MAIOR MENOREQ MAIOREQ DENTRO
%token OP CP OCB CCB
%token EOL SEMICOLON COMMA
%token IDENTIFIER ASSIGN PALAVRA
%token KEYWORDIF KEYWORDELSE KEYWORDWHILE KEYWORDFOR KEYWORDUNTIL KEYWORDFUNCTION KEYWORDRETURN

%%

calclist: /* nothing */
    | calclist exp EOL { printf("= %d\n> ", $2); }
    | calclist variable EOL { printf("> "); }
    | calclist afirmacao EOL { printf("> "); }
    | calclist funcao EOL { printf("> "); }
    | calclist EOL { printf("> "); } /* blank line or a comment */
    ;

enquanto: KEYWORDWHILE OP condicao CP OCB afirmacoes CCB ;

durante: KEYWORDFOR OP IDENTIFIER ASSIGN exp KEYWORDUNTIL exp CP OCB afirmacoes CCB ;

condicional:
    KEYWORDIF OP condicao CP OCB afirmacoes CCB
    | KEYWORDIF OP condicao CP OCB afirmacoes CCB KEYWORDELSE OCB afirmacoes CCB

condicao: exp
    | exp op_condicional exp
    ;

afirmacoes: afirmacao
    | afirmacao afirmacoes


afirmacao:
    | variable
    | chamada_funcao SEMICOLON
    | condicional
    | durante
    | enquanto
    ;

op_condicional: EQUAL | MENOR | MAIOR | MENOREQ | MAIOREQ | DENTRO ;

chamada_funcao: IDENTIFIER OP CP
    | IDENTIFIER OP parametros CP
    ;

parametros: 
    | IDENTIFIER
    | IDENTIFIER COMMA parametros
    ;

funcao:
    KEYWORDFUNCTION chamada_funcao OCB afirmacoes CCB
    | KEYWORDFUNCTION chamada_funcao OCB afirmacoes KEYWORDRETURN OP exp CP CCB
    | KEYWORDFUNCTION chamada_funcao OCB afirmacoes KEYWORDRETURN OP IDENTIFIER CP CCB
    ;

variable: 
    IDENTIFIER ASSIGN exp SEMICOLON
    | IDENTIFIER ASSIGN PALAVRA SEMICOLON
    | IDENTIFIER ASSIGN chamada_funcao SEMICOLON
    ;

exp: term
    | exp ADD exp { $$ = $1 + $3; }
    | exp SUB term { $$ = $1 - $3; }
    ;

term: factor
    | term MUL factor { $$ = $1 * $3; }
    | term DIV factor { $$ = $1 / $3; }
    ;

factor: NUMBER
    | IDENTIFIER
    | OP exp CP { $$ = $2; }
    | ADD factor { $$ = $2; }
    | SUB factor { $$ = - $2; }
    ;

%%

int main(){
  printf("> "); 
  yyparse();
}

int yyerror(char *s){
  fprintf(stderr, "error: %s\n", s);
}