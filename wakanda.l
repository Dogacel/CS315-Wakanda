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
comma \,

atsign \@

if if 
else else
loop for

include include
initial initial
main main
end end

finally finally
success success
failed failed
ok OK
fail FAIL

returns ->
return return
function func

integer [+-]?{digit}+
float [+-]?{digit}*\.{digit}+
string \"(\\|[^\\\"])*\"
identifier {character}+

%%

{lcb} printf("LCB");
{rcb} printf("RCB");
{lb} printf("LB");
{rb} printf("RB");
{lp} printf("LP");
{rp} printf("RP");

{string} printf("STRING");
{comment} printf("COMMENT");
{function} printf("FUNC");

{include} printf("INCLUDE"); 
{initial} printf("INITIAL");
{main} printf("MAIN");
{end} printf("END");

{integer} printf("INTEGER");
{float} printf("FLOAT");
{identifier} printf("ID");

%%
