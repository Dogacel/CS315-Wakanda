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

print_stmt:
    PRINT CONST 
     |PRINT SPACE expression
input_stmt:
    INPUT ID
timenow_stmt:
    TIMENOW ID
read_temp_stmt: 
    READ_TEMP ID
read_hum_stmt:
    READ_HUM ID
read_press_stmt:
    READ_PRESS ID
read_air_stmt:
    READ_AIR ID
read_light_stmt:
    READ_LIGHT ID
read_sound_stmt:
    READ_SOUND ID
receive_stmt:
    RECEIVE ID
send_stmt:
    SEND ID
connect_stmt:
    CONNECT ID
wifi_connect_stmt:
    WIFICONNECT STRING STRING

decleration_stmt:
    type ID
    |type assignment_stmt
assignment_stmt:
    ID EQUALS expression

return_stmt:
    RETURN
    |RETURN expression

if_stmt: 
    matched_if_stmt
    |unmatched_if_stmt
matched_if_stmt:
    IF condition block_stmts ELSE block_stmts
unmatched_if_stmt:
    IF condition block_stmts
    |IF condition block_stmts ELSE unmatched_if_stmt

loop_stmt:
    while_loop
    |for_loop
while_loop:
    FOR condition block_stmts
for_loop:
    FOR iterable block_stmts
condition:
    expression
    |expression logic_operator condition
    |EXMARK condition
    |QUESTIONMARK condition
iterable:
    ID IN iterable_expression
iterable_expression:
    LB NUMBER DOT DOT NUMBER RB

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
