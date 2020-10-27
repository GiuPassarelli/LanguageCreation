# LanguageCreation

## Para rodar as análises léxica e sintática:

    make -f Makefile
    ./Parser

## Alguns exemplos de testes rodados:

### Definição de variável:

    > varia1 -> var1;
    > varia2 -> 10 + 6*5;
    > varia3 -> " wkla[j82;82 ";

### Definição de função:

    > funcao ola(u1, uv2) {kjbs -> 8*7; outrafuncao(arg1, arg2);}

### Chamada de função:

    > ola(u1, uv2);

### Condicional:

    > se (var123){nova_var -> 7*2;}
    > se (var123 maior igual a nova_var){func3(var123);}

### LOOPS:

    > enquanto (var1 menor que var2) { var3-> 8*6-7; }
    > durante (ii -> 7 ate 10+2){func3(ii);}
