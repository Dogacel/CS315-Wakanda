%option main
space [ \t]+
newline [\n]

digit [0-9]
character [a-zA-Z]

comment \/\/.*

lcb \{
rcb \}

lb  \[
rb  \]

lp  \(
rb  \)

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


%%
