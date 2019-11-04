%option main
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

main main


returns ->
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

integer [+-]?{digit}+
float [+-]?{digit}*\.{digit}+
number {integer}|{float}
bool (true|TRUE|false|FALSE)
string \"(\\|[^\\\"])*\"
char \'{character}\'
identifier {character}({character}|{digit})*
primitivetype (number|char|string|bool|time)[ ]

%%
{comment} printf("COMMENT");

{lcb} printf("LCB");
{rcb} printf("RCB");
{lb} printf("LB");
{rb} printf("RB");
{lp} printf("LP");
{rp} printf("RP");

{range} printf("RANGE");
{dot} printf("DOT");
{comma} printf("COMMA");

{multiplication} printf("MULT");
{division} printf("DIV"); 
{substraction} printf("MINUS");
{addition} printf("PLUS");
{modulus} printf("MOD");

{assignment} printf("ASSIGN");
{equals} printf("EQUALS");
{gte} printf("GTE");
{lte} printf("LTE");
{gt} printf("GT");
{lt} printf("LT");
{notequls} printf("NOTEQUALS");

{or} printf("OR");
{and} printf("AND"); 
{not} printf("NOT");
{optional} printf("OPTIONAL");

{returns} printf("RETURNS");

{primitivetype} printf("PRIMITIVE");
{string} printf("STRING");
{char} printf("CHAR");
{function} printf("FUNC");
{number} printf("NUMBER");

{if} printf("IF");
{else} printf("ELSE");
{for} printf("FOR");
{in} printf("IN");

{main} printf("MAIN");

{url_prim} printf("URL");
{print} printf("PRINT");
{input} printf("INPUT");
{wait} printf("WAIT");
{timenow} printf("TIMENOW");
{readtemp} printf("READ_TEMP");
{readhum} printf("READ_HUM");
{readpress} printf("READ_PRESS");
{readair} printf("READ_AIR");
{readlight} printf("READ_LIGHT");
{readsound} printf("READ_SOUND");
{wificonnect} printf("WIFICONNECT");
{connect} printf("CONNECT");
{send} printf("SEND");
{receive} printf("RECEIVE");
{switch} printf("SWITCH");

{return} printf("RETURN");

{newline} printf("NL\n");
{identifier} printf("ID");

%%
