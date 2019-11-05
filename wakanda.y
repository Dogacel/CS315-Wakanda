%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(char* s);
extern int yylineno;
int maincount;
%}

%token LCB
%token RCB
%token LB
%token RB
%token LP
%token RP
%token RANGE
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
%token VOID
%token BOOL
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
%token ID
%token ENDSTMT

%start program


%%

program:
    function_definitions

//----FUNCTIONS---//

function_definitions:
    function
    |function function_definitions

function:
    function_signature block_stmts

function_signature:
    MAIN
    |FUNC ID custom_function_signature RETURNS function_return_type

custom_function_signature:
    LP function_parameter_list RP
    |LP RP

function_return_type:
    type
    |VOID

function_parameter_list:
    function_parameter
    |function_parameter COMMA

function_parameter:
    type ID

//---STATEMENTS---//

block_stmts:
    LCB RCB
    |LCB stmts RCB

stmts:
    stmt
    |stmt stmts

stmt:
    function_call
    |primivitive_stmt
    |assignment_stmt
    |decleration_stmt
    |return_stmt
    |if_stmt
    |loop_stmt

//---FUNCTION CALL---//

function_call:
    ID LP funciton_call_parameters RP
    |ID LP RP

funciton_call_parameters:
    nonlogical_expression
    |nonlogical_expression COMMA funciton_call_parameters

primivitive_stmt:
    print_stmt
    |input_stmt
    |timenow_stmt
    |read_temp_stmt
    |read_hum_stmt
    |read_press_stmt
    |read_air_stmt
    |read_light_stmt
    |read_sound_stmt
    |receive_stmt
    |send_stmt
    |connect_stmt
    |wait_stmt
    |wifi_connect_stmt

print_stmt:
    PRINT nonlogical_expression

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
    READ_SOUND number_or_id ID

receive_stmt:
    RECEIVE ID ID

send_stmt:
    SEND ID number_or_id

connect_stmt:
    CONNECT ID

wait_stmt:
    WAIT nonlogical_expression

wifi_connect_stmt:
    WIFICONNECT STRING STRING

decleration_stmt:
    type ID
    |type assignment_stmt

assignment_stmt:
    ID ASSIGN expression

return_stmt:
    RETURN nonlogical_expression

if_stmt: 
    matched_if_stmt
    |unmatched_if_stmt

matched_if_stmt:
    IF expression block_stmts ELSE block_stmts

unmatched_if_stmt:
    IF expression block_stmts
    |IF expression block_stmts ELSE unmatched_if_stmt

loop_stmt:
    while_loop
    |for_loop

while_loop:
    FOR expression block_stmts

for_loop:
    FOR iterable block_stmts

expression:
    nonlogical_expression
    |nonlogical_expression logic_operator expression
    |NOT expression
    |OPTIONAL expression

iterable:
    ID IN iterable_nonlogical_expression

iterable_nonlogical_expression:
    LB number_or_id RANGE number_or_id RB

number_or_id:
    NUMBER
    |ID


//---DATA TYPES--//

type:
    PRIMITIVE

nonlogical_expression:
    primary
    |nonlogical_expression arithmetic_operator primary

primary:
    const
    |ID
    |function_call
    |LP nonlogical_expression RP
    |SWITCH NUMBER
    |URL STRING

const:
    CHAR
    |STRING
    |NUMBER
    |BOOL
    |VOID

arithmetic_operator:
    PLUS
    |MINUS
    |MULT
    |DIV
    |MOD

logic_operator:
    OR
    |AND
    |NOT
    |NOTEQUALS
    |GT
    |LT
    |GTE
    |LTE
    |EQUALS

%%

void yyerror(char *s) {
	fprintf(stdout, "line %d: %s\n", yylineno,s);
}
int main(void){
    yyparse();
    if(yynerrs < 1) {
        if (maincount == 0) {
            printf("No main method found!\n");
        } else if(maincount > 1) {
            printf("You can't have multiple mains.\n");
        } else {
            printf("Parsing is successful\n");
        }
    }
 return 0;
}
