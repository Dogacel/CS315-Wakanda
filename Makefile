
all:
	yacc -d -v wakanda.y
	gcc    -c -o y.tab.o y.tab.c
	lex wakanda.l
	gcc    -c -o lex.yy.o lex.yy.c
	gcc -o parser y.tab.o lex.yy.o 

clean:
	-rm -f *.o lex.yy.c *.tab.* parser *.output
