all:
	lex wakanda.l
	cc -o outfile lex.yy.c
	./outfile
clean:
	rm lex.yy.c
	rm outfile
