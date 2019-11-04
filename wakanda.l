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
read_temp READ TEMPERATURE
read_hum READ HUMIDITY
read_press READ PRESSURE
read_air READ AIRQUALITY
read_light READ LIGHT
read_sound READ SOUND
wifi_connect WIFICONNECT
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
{read_temp} printf("READ_TEMP");
{read_hum} printf("READ_HUM");
{read_press} printf("READ_PRESS");
{read_air} printf("READ_AIR");
{read_light} printf("READ_LIGHT");
{read_sound} printf("READ_SOUND");
{wifi_connect} printf("WIFICONNECT")
{connect} printf("CONNECT")
{send} printf("SEND");
{receive} printf("RECEIVE");
{switch} printf("SWITCH");

{return} printf("RETURN");

{newline} printf("NL\n");
{identifier} printf("ID");

%%
