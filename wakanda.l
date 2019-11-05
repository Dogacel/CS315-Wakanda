%{
#include <stdio.h>
#include "y.tab.h"
void yyerror(char *);
int maincount = 0;
%}
space [ \t]+
newline [\n]

digit [0-9]
character [a-z]|[A-Z]

comment \/\/.*

lcb \{
rcb \}

lb  \[
rb  \]

lp  \(
rp  \)

multiplication \*
division \/
substraction \-
addition \+
modulus \%

assignment =
equals ==
gt >
lt <
gte >=
lte <=
notequls !=

or or 
and and
not !
optional \?

dot \.
range \.\.
comma \,

if if 
else else
for for
in in

mains main



returns ->
void 0
return return
function func

url_prim URL
print PRINT
input INPUT
wait WAIT
timenow TIMENOW
readtemp (READ[ ]TEMPERATURE)
readhum (READ[ ]HUMIDITY)
readpress (READ[ ]PRESSURE)
readair (READ[ ]AIRQUALITY)
readlight (READ[ ]LIGHT)
readsound (READ[ ]SOUND)
wificonnect WIFICONNECT
connect CONNECT
send SEND
receive RECEIVE
switch SWITCH

integer {digit}+
float [+-]?{digit}*\.{digit}+
number {integer}|{float}
bool (true|TRUE|false|FALSE)
string \"(\\|[^\\\"])*\"
char \'{character}\'
identifier {character}({character}|{digit})*
primitivetype (number|char|string|bool|time|url)[ ]

%option yylineno
%%
{comment} ;

{lcb} return LCB;
{rcb} return RCB;
{lb} return LB;
{rb} return RB;
{lp} return LP;
{rp} return RP;

{range} return RANGE;
{comma} return COMMA;

{multiplication} return MULT;
{division} return DIV; 
{substraction} return MINUS;
{addition} return PLUS;
{modulus} return MOD;

{assignment} return ASSIGN;
{equals} return EQUALS;
{gte} return GTE;
{lte} return LTE;
{gt} return GT;
{lt} return LT;
{notequls} return NOTEQUALS;

{or} return OR;
{and} return AND; 
{not} return NOT;
{optional} return OPTIONAL;

{bool} return BOOL;

{returns} return RETURNS;
{void} return VOID;

{primitivetype} return PRIMITIVE;
{string} return STRING;
{char} return CHAR;
{function} return FUNC;
{number} return NUMBER;

{if} return IF;
{else} return ELSE;
{for} return FOR;
{in} return IN;

{mains} {maincount++; return MAIN;}

{dot} return ENDSTMT;

{url_prim} return URL;
{print} return PRINT;
{input} return INPUT;
{wait} return WAIT;
{timenow} return TIMENOW;
{readtemp} return READ_TEMP;
{readhum} return READ_HUM;
{readpress} return READ_PRESS;
{readair} return READ_AIR;
{readlight} return READ_LIGHT;
{readsound} return READ_SOUND;
{wificonnect} return WIFICONNECT;
{connect} return CONNECT;
{send} return SEND;
{receive} return RECEIVE;
{switch} return SWITCH;

{return} return RETURN;

{identifier} return ID;

{newline} ;
{space} ;

%%

int yywrap(void){
	return 1;
}
