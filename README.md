# LanguageCreation

## EBNF

### DEFINIÇÃO DE LOOPS:

ENQUANTO = "enquanto" "(" CONDICAO ")" "{" {AFIRMACAO} "}"

DURANTE = "durante" IDENTIFICADOR -> EXPRESSAO "ate" EXPRESSAO "{" {AFIRMACAO} "}"

### DEFINIÇÃO DE CONDICIONAL:

CONDICIONAL = "se" "(" CONDICAO ")" "{" {AFIRMACAO} "}" [ "senao" "{" {AFIRMACAO} "}" ]

CONDICAO = EXPRESSAO [OPERACAO-CONDICIONAL EXPRESSAO]

AFIRMACAO = VARIAVEL | CHAMADA_FUNCAO ";" | ENQUANTO | DURANTE | CONDICIONAL

OPERACAO-CONDICIONAL = "==" | "maior que" | "menor que" | "maior igual a" | "menor igual a" | "dentro de"

### DEFINIÇÃO DE FUNÇÃO:

CHAMADA_FUNCAO = IDENTIFICADOR "(" [PARAMETROS] ")"

PARAMETROS = IDENTIFICADOR {"," IDENTIFICADOR}

FUNCAO = "funcao" CHAMADA_FUNCAO "{" {AFIRMACAO} ["retorna" "(" (EXPRESSAO | IDENTIFICADOR) ")" ";"] "}"

### DEFINIÇÃO DE VARIAVEL:

VARIAVEL = IDENTIFICADOR "->" (EXPRESSAO | PALAVRA | CHAMADA_FUNCAO) ";"

EXPRESSAO = TERMO, {("+" | "-"), TERMO}

TERMO = FATOR, {("*" | "/"), FATOR}

FATOR = ("+" | "-") FATOR | "(" EXPRESSAO ")" | NUMERO

IDENTIFICADOR = ( a-z | A-Z | _ ), { a-z | A-Z | 0-9 | _ }

NUMERO = 0-9 {0-9}

PALAVRA = '"' {qualquer caracter que não seja aspas duplas} '"'

#### Exemplos:

    enquanto(a>7){
        a->a+1;
    }
    
    
    durante a->7*2 ate 40/2{
        se(a>16){
            b->funcao_soma(a);
        }
        senao{
            b->funcao_soma(a+5);
        }
    }

    funcao funcao_soma(numero){
        retorna(numero+10);
    }
