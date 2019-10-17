all:
	lex wakanda.l
	cc -o outfile lex.yy.c
	./outfile
