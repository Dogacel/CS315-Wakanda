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
colon :
atsign \@

if if 
else else
for for
in in

include include
initial initial
main main
end end

finally finally
success success
failed failed
ok (OK|ok)
fail (FAIL|fail)
log LOG

unused _

returns ->
return return
function func
await await
switch switch

integer [+-]?{digit}+
float [+-]?{digit}*\.{digit}+
number {integer}|{float}
bool (true|TRUE|false|FALSE)
string \"(\\|[^\\\"])*\"
char \'{character}\'
identifier {character}({character}|{digit})*
primitivetype (number|char|string|bool|time|sensor)[ ]

%%
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
{colon} printf("<COLON>");

{atsign} printf("<ATSIGN>");

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
{number} printf("<NUMBER>");
{await} printf("<AWAIT>");

{if} printf("<IF>");
{else} printf("<ELSE>");
{for} printf("<FOR>");
{in} printf("<IN>");

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

{newline} printf("<NL>\n");
{identifier} printf("<ID>");

%%
