%option main
space [ \t]+
newline [\n]

digit [0-9]
character [a-z]|[A-Z]

comment \/\/.*
multicomment \/\*((\n|[^\*\/])*)\*\/

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

bwor \|
bwand \&
bwxor \^
bwnot \~

dot \.
range \.\.
comma \,

atsign \@

if if 
else else
for for

include include
initial initial
main main
end end

finally finally
success success
failed failed
ok OK
fail FAIL
log LOG

unused _

returns ->
return return
function func
await await

integer {digit}+
float [+-]?{digit}*\.{digit}+
string \"(\\|[^\\\"])*\"
char \'{character}\'
identifier {character}({character}|{digit})*
primitivetype (number|char|string|bool|time)[ ]

%%
{multicomment} printf("<MULTICOMMENT>");
{comment} printf("<COMMENT>");

{lcb} printf("<LCB>");
{rcb} printf("<RCB>");
{lb} printf("<LB>");
{rb} printf("<RB>");
{lp} printf("<LP>");
{rp} printf("<RP>");

{range} printf("<RANGE>");
{dot} printf("<DOT>");
{comma} printf("<COMMA>");

{atsign} printf("<ATSIGN>");

{bwor} printf("<BITWISEOR>");
{bwand} printf("<BITWISEAND>");
{bwxor} printf("<BITWISEXOR>");
{bwnot} printf("<BITWISENOT>");

{multiplication} printf("<MULT>");
{division} printf("<DIV>"); 
{substraction} printf("<MINUS>");
{addition} printf("<PLUS>");
{modulus} printf("<MOD>");

{assignment} printf("<ASSIGN>");
{equals} printf("<EQUALS>");
{gte} printf("<GTE>");
{lte} printf("<LTE>");
{gt} printf("<GT>");
{lt} printf("<LT>");
{notequls} printf("<NOTEQUALS>");

{unused} printf("<UNDERSCORE>");

{or} printf("<OR>");
{and} printf("<AND>"); 
{not} printf("<NOT>");
{optional} printf("<OPTIONAL>");

{returns} printf("<RETURNS>");

{primitivetype} printf("<PRIMITIVE>");
{string} printf("<STRING>");
{char} printf("<CHAR>");
{function} printf("<FUNC>");
{await} printf("<AWAIT>");

{if} printf("<IF>");
{else} printf("<ELSE>");
{for} printf("<FOR>");

{include} printf("<INCLUDE>"); 
{initial} printf("<INITIAL>");
{main} printf("<MAIN>");
{end} printf("<END>");

{finally} printf("<FINALLY>");
{success} printf("<SUCCESS>");
{failed}  printf("<FAILED>");
{ok} printf("<OK>");
{fail} printf("<FAIL>");
{log}  printf("<LOG>");

{return} printf("<RETURN>");

{integer} printf("<INTEGER>");
{float} printf("<FLOAT>");

{newline} printf("<NL>\n");
{identifier} printf("<ID>");

%%
