%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(char* s);
extern int yylineno;
%}

%token COMMENT
%token LCB
%token RCB
%token LB
%token RB
%token LP
%token RP
%token RANGE
%token DOT
%token COMMA
%token MULT
%token DIV 
%token MINUS
%token PLUS
%token MOD
%token ASSIGN
%token EQUALS
%token GTE
%token LTE
%token GT
%token LT
%token NOTEQUALS
%token OR
%token AND 
%token NOT
%token OPTIONAL
%token RETURNS
%token PRIMITIVE
%token STRING
%token CHAR
%token FUNC
%token NUMBER
%token IF
%token ELSE
%token FOR
%token IN
%token MAIN
%token URL
%token PRINT
%token INPUT
%token WAIT
%token TIMENOW
%token READ_TEMP
%token READ_HUM
%token READ_PRESS
%token READ_AIR
%token READ_LIGHT
%token READ_SOUND
%token WIFICONNECT
%token CONNECT
%token SEND
%token RECEIVE
%token SWITCH
%token RETURN
%token NL
%token ID

%start program

%%

program:
    MAIN LCB expressions RCB

expressions:
    expression
    |expression expressions

expression:
    PRINT STRING

%%

void yyerror(char *s) {
	fprintf(stdout, "line %d: %s\n", yylineno,s);
}
int main(void){
 yyparse();
if(yynerrs < 1){
		printf("Parsing is successful\n");
	}
 return 0;
}
