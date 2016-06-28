/*NORBERTO RAFAEL ANDRANGO DIAZ*/
%{
#include <stdio.h>
int linea=1;
void yyerror(char *);
#include "AnalisisLex2.tab.h"
%}

opComparacion		("<="|">="|"!="|">"|"<"|"=="|"!=")
opAdd			("+"|"-")
opMul			("*"|"/")
identificador		[a-zA-Z]([a-zA-Z]|[0-9]|"_")*
literalInt		("-"?[0-9]*)
literalChar		\'.\'
literalBool		(true|false)
literalFloat		([0-9]+"."[0-9]+)
literalString		\".*\"
Comentario1		"//".*
%x Comentario2
%%
"/*"			BEGIN(Comentario2);
<Comentario2>\n		linea++;
<Comentario2>"*/"	BEGIN(INITIAL);
<Comentario2>.		;

		
{Comentario1}		;
{literalString}         return LITERALSTRING;

if			return IF;
then			return THEN;
else			return ELSE;
while			return WHILE;
do			return DO;
input			return INPUT;
output			return OUTPUT;
return			return RETURN;

int			return INT;
float			return FLOAT;
bool			return BOOL;
char			return CHAR;
string			return STRING;

,			return COMA;
;			return PNTCOMA;
:			return DOSPUNTOS;

"("			return PARENTESISA;
")"			return PARENTESISC;
"{"			return LLAVEA;
"}"			return LLAVEC;
"["			return CORCHETEA;
"]"			return CORCHETEC;

{opComparacion}         return COMPARADOR;

"$"			return MONEDA;
"="			return IGUAL;


"||"			return DISYUNCION;
"&&"			return CONJUNCION;
"!"			return NEGACION;
"&"			return AMPERSAND;

{opAdd}			return ADD;
{opMul}			return MUL;

{literalChar}		return LITERALCHAR;
{literalFloat}		return LITERALFLOAT;
{literalInt}		return LITERALINT;
{literalBool}		return LITERALBOOL;

{identificador}		return IDENTIFICADOR;
[ \t]+			;
\n			linea++;
.			{
printf("%s\t,Error lexico, linea: %d\n", yytext, linea);}

%%

int yywrap(void){
return 1;
}
