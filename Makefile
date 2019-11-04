LEX = lex
YACC = yacc -d

CC = gcc


all: parser

parser: y.tab.o lex.yy.o
	$(CC) -o parser y.tab.o lex.yy.o 


lex.yy.o: lex.yy.c y.tab.h
lex.yy.o y.tab.o: y.tab.c


y.tab.c y.tab.h: wakanda.y
	$(YACC) -v wakanda.y


lex.yy.c: wakanda.l
	$(LEX) wakanda.l

clean:
	-rm -f *.o lex.yy.c *.tab.* parser *.output
