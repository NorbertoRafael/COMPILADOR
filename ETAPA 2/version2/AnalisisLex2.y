%{
	#include <stdio.h>
	int yylex(void);
	void yyerror(char *);
	extern FILE *yyin;	
	extern int linea;
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
%token IGUAL
%token DISYUNCION
%token CONJUNCION
%token NEGACION
%token AMPERSAND
%token ADD
%token MUL 
%token LITERALCHAR
%token LITERALFLOAT
%token LITERALINT
%token LITERALBOOL
%token IDENTIFICADOR
%%



funcion : encabezado locales cuerpo
       { 
         printf("\n Syntactical Analisys done without erros!\n"); 
         return 0; 
	}; 

encabezado: tipo DOSPUNTOS atributos PNTCOMA;
locales: variable PNTCOMA
	|variable PNTCOMA locales
;



atributos:|variable
	|variable COMA atributos;

variable: tipo DOSPUNTOS IDENTIFICADOR;

tipo: INT|FLOAT|STRING|CHAR|BOOL;


cuerpo: LLAVEA lista_comandos LLAVEC;

lista_comandos: lista_comandos comando
		|comando;

comando: comandoIF
	|comandoWH
	|Atribucion
	|cuerpo;

comandoIF: IF expL THEN comando
	|IF expL THEN comando ELSE comando;

comandoWH: WHILE expL DO comando;

Atribucion: IDENTIFICADOR IGUAL expA PNTCOMA;

expL: expA COMPARADOR expA
	|expA COMPARADOR expA CONJUNCION expL
	|expA COMPARADOR expA DISYUNCION expL;

expA: expBasica ADD expBasica
	|expBasica MUL expBasica
	|PARENTESISA expBasica ADD expBasica PARENTESISC
        |PARENTESISA expBasica MUL expBasica PARENTESISC
	|expBasica;

expBasica:	expA
		|IDENTIFICADOR
		|LITERALINT
		|LITERALFLOAT
		|LITERALSTRING
		|LITERALCHAR
		|LITERALBOOL;



%%

int main(){

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

	fprintf(stderr, "%s en la linea : %d\n", s, linea);
}

