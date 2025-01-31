# LanguageCreation

## EBNF

### DEFINIÇÃO DE LOOPS:

ENQUANTO = "enquanto" "(" CONDICAO ")" "{" {AFIRMACAO} "}"

DURANTE = "durante" "(" IDENTIFICADOR -> EXPRESSAO "ate" EXPRESSAO ")" "{" {AFIRMACAO} "}"

### DEFINIÇÃO DE CONDICIONAL:

CONDICIONAL = "se" "(" CONDICAO ")" "{" {AFIRMACAO} "}" [ "senao" "{" {AFIRMACAO} "}" ]

CONDICAO = EXPRESSAO [OPERACAO-CONDICIONAL EXPRESSAO]

PRINT = "imprime" "(" (EXPRESSAO | IDENTIFICADOR) ")" ";"

AFIRMACAO = VARIAVEL | CHAMADA_FUNCAO ";" | ENQUANTO | DURANTE | CONDICIONAL | PRINT

OPERACAO-CONDICIONAL = "==" | "maiorQue" | "menorQue"

### DEFINIÇÃO DE FUNÇÃO:

CHAMADA_FUNCAO = IDENTIFICADOR "(" [PARAMETROS] ")"

PARAMETROS = IDENTIFICADOR {"," IDENTIFICADOR}

FUNCAO = "funcao" CHAMADA_FUNCAO "{" {AFIRMACAO} ["retorna" "(" (EXPRESSAO | IDENTIFICADOR) ")" ] "}"

### DEFINIÇÃO DE VARIAVEL:

VARIAVEL = IDENTIFICADOR "->" (EXPRESSAO | PALAVRA | CHAMADA_FUNCAO) ";"

EXPRESSAO = TERMO, {("+" | "-"), TERMO}

TERMO = FATOR, {("*" | "/"), FATOR}

FATOR = ("+" | "-") FATOR | "(" EXPRESSAO ")" | NUMERO

IDENTIFICADOR = ( a-z | A-Z | _ ), { a-z | A-Z | 0-9 | _ }

NUMERO = 0-9 {0-9}

PALAVRA = '"' {qualquer caracter que não seja aspas duplas} '"'

#### Exemplos:

    a->4;
    enquanto(a>7){
        a->a+1;
    }
    imprime(a);
    
    funcao funcao_soma(numero){
        retorna(numero+10);
    }
    
    durante c->7*2 ate 40/2{
        se(c>16){
            b->funcao_soma(c);
        }
        senao{
            b->funcao_soma(c+5);
        }
    }
    
    imprime(b);
