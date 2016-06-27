%{
	#include <stdio.h>
	int yylex(void);
	void yyerror(char *);
	
%}
%token LITERALSTRING
%token IF
%token THEN
%token ELSE
%token WHILE
%token DO
%token INPUT
%token OUTPUT
%token RETURN
%token INT
%token FLOAT
%token BOOL
%token CHAR
%token STRING
%token COMA
%token PNTCOMA
%token DOSPUNTOS
%token PARENTESISA
%token PARENTESISC
%token LLAVEA
%token LLAVEC
%token CORCHETEA
%token CORCHETEC
%token COMPARADOR
%token MONEDA
%token IGUAL;
%token DISYUNCION
%token CONJUNCION
%token NEGACION
%token AMPERSAND
%token ARITMETICO
%token LITERALCHAR
%token LITERALFLOAT
%token LITERALINT
%token LITERALBOOL
%token IDENTIFICADOR
%%
Globales:
	|INT DOSPUNTOS IDENTIFICADOR Globales	{printf("CORRECTO\n");}
	|FLOAT DOSPUNTOS IDENTIFICADOR	{printf("CORRECTO\n");}
	|BOOL DOSPUNTOS IDENTIFICADOR	{printf("CORRECTO\n");}
	|CHAR DOSPUNTOS IDENTIFICADOR	{printf("CORRECTO\n");}
	|STRING DOSPUNTOS IDENTIFICADOR	{printf("CORRECTO\n");}
	|INT DOSPUNTOS IDENTIFICADOR CORCHETEA LITERALINT CORCHETEC	{printf("CORRECTO\n");}
        |FLOAT DOSPUNTOS IDENTIFICADOR CORCHETEA LITERALINT CORCHETEC	{printf("CORRECTO\n");}
        |BOOL DOSPUNTOS IDENTIFICADOR CORCHETEA LITERALINT CORCHETEC	{printf("CORRECTO\n");}
        |CHAR DOSPUNTOS IDENTIFICADOR CORCHETEA LITERALINT CORCHETEC	{printf("CORRECTO\n");}
        |STRING DOSPUNTOS IDENTIFICADOR CORCHETEA LITERALINT CORCHETEC	{printf("CORRECTO\n");}
	;
%%

int main(){
extern FILE *yyin;
if((yyin = fopen("codigoIn.txt", "rt"))==NULL)
{
 printf("\nError con el archivo de entrada");
}
else
{
yyparse();
}
fclose(yyin);
}
void yyerror(char *s){
	extern int linea;
	fprintf(stderr, "%s en la linea : %d\n", s, linea);
}

