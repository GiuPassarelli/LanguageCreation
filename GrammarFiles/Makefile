Parser: Lexer.l Parser.y
	bison -d Parser.y
	flex Lexer.l
	cc -o $@ Parser.tab.c lex.yy.c -lfl
