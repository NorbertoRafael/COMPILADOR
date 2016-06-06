/*NORBERTO RAFAEL ANDRANGO DIAZ*/
%{
#include <stdio.h>
int linea=1;
%}

Reservada		(int|float|bool|char|string|if|then|else|while|do|input|output|return)
caracterEspecial	(","|";"|":"|"("|")"|"["|"]"|"{"|"}"|"+"|"-"|"*"|"/"|"<"|">"|"="|"!"|"&"|"$")
operadorCompuesto	("<="|">="|"!="|"=="|"||"|"&&")
identificador		[a-zA-Z]([a-zA-Z]|[0-9]|"_")*
literalInt		("-"?[0-9]*)
literalChar		\'.\'
literalBool		(true|false)
literalFloat		([0-9]+"."[0-9]+)
literalString		\".*\"

%%
{literalString}         printf("%s\tLITERALSTRING\n", yytext);
{Reservada}		printf("%s\tRESERVADA\n", yytext);
{caracterEspecial}	printf("%s\tCARACTERESPECIAL\n", yytext);
{operadorCompuesto}	printf("%s\tOPERADORCOMPUESTO\n", yytext);
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
