/*NORBERTO RAFAEL ANDRANGO DIAZ*/
%{
#include <stdio.h>
int linea=1;
%}

opComparacion		("<="|">="|"!="|">"|"<"|"=="|"!=")
opAsignacion		("="|"&")
opLogico		("||"|"&&"|"!")
opAritmetico		("+"|"-"|"*"|"/")
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
{literalString}         printf("%s\tLITERALSTRING\n", yytext);

if			printf("%s\tIF\n", yytext);
then			printf("%s\tTHEN\n", yytext);
else			printf("%s\tELSE\n", yytext);
while			printf("%s\tWHILE\n", yytext);
do			printf("%s\tDO\n", yytext);
input			printf("%s\tINPUT\n", yytext);
output			printf("%s\tOUTPUT\n", yytext);
return			printf("%s\tRETURN\n", yytext);

int[ \t]+		printf("%s\tINT\n", yytext);
float[ \t]+		printf("%s\tFLOAT\n", yytext);
bool[ \t]+		printf("%s\tBOOL\n", yytext);
char[ \t]+		printf("%s\tCHAR\n", yytext);
string[ \t]+		printf("%s\tSTRING\n", yytext);

,			printf("%s\tCOMA\n", yytext);
;			printf("%s\tPNTCOMA\n", yytext);
:			printf("%s\tDOSPUNTOS\n", yytext);

"("			printf("%s\tPARENTESISA\n", yytext);
")"			printf("%s\tPARENTESISC\n", yytext);
"{"			printf("%s\tLLAVEA\n", yytext);
"}"			printf("%s\tLLAVEC\n", yytext);
"["			printf("%s\tCORCHETEA\n", yytext);
"]"			printf("%s\tCORCHETEC\n", yytext);

{opComparacion}         printf("%s\tCOMPARADOR\n", yytext);

"$"			printf("%s\tMONEDA\n", yytext);
"="			printf("%s\tIGUAL\n", yytext);

"||"			printf("%s\tDISYUNCION\n", yytext);
"&&"			printf("%s\tCONJUNCION\n", yytext);
"!"			printf("%s\tNEGACION\n", yytext);
"&"                       printf("%s\tAMPERSAND\n", yytext);

{opAritmetico}		printf("%s\tARITMETICO\n", yytext);

{literalChar}		printf("%s\tLITERALCHAR\n", yytext);
{literalFloat}		printf("%s\tLITERALFLOAT\n", yytext);
{literalInt}		printf("%s\tLITERALINT\n", yytext);
{literalBool}		printf("%s\tLITERALBOOL\n", yytext);

{identificador}		printf("%s\tIDENTIFICADOR\n", yytext);
[ \t]+			;
\n			linea++;
.			{printf("%s\tERROR, linea: %d\n", yytext, linea); exit(0);}

%%
int main(){
if((yyin = fopen("codigoIn.txt", "rt"))==NULL)
{
 printf("\nError con el archivo de entrada");
}
else
{
yylex();
}
fclose(yyin);
}
