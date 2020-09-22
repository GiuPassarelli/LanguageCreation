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

VARIAVEL = IDENTIFICADOR "->" (VALOR | CHAMADA_FUNCAO) ";"

VALOR = EXPRESSAO | PALAVRA

EXPRESSAO = TERMO, {("+" | "-"), TERMO}

TERMO = FATOR, {("*" | "/"), FATOR}

FATOR = ("+" | "-") FATOR | "(" EXPRESSAO ")" | NUMERO

IDENTIFICADOR = LETRA {LETRA | DIGITO}

LETRA = "A" | "B" | "C" | "D" | "E" | "F" | "G" | "H" | "I" | "J" | "K" | "L" | "M" | "N" | "O" | "P" | "Q" | "R" | "S" | "T" | "U" | "V" | "W"
        | "X" | "Y" | "Z" | "a" | "b" | "c" | "d" | "e" | "f" | "g" | "h" | "i" | "j" | "k" | "l" | "m" | "n" | "o" | "p" | "q" | "r" | "s" 
        | "t" | "u" | "v" | "w" | "x" | "y" | "z" 

NUMERO = DIGITO {DIGITO}

DIGITO = "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9"

PALAVRA = "CARACTER-PALAVRA {CARACTER-PALAVRA}"

CARACTER-PALAVRA = qualquer caracter que não seja aspas duplas

#### Exemplo:

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
