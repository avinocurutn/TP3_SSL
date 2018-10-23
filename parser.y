%code top{
#include <stdio.h>
#include "scanner.h"
}
%code provides{
void yyerror(const char *);
extern int yylexerrs;
}
%defines "parser.h"
%output "parser.c"
%token PROGRAMA VARIABLES DEFINIR CODIGO LEER ASIGNACION ESCRIBIR FIN IDENTIFICADOR CONSTANTE
%define api.value.type {char *}
%define parse.error verbose

%%
programa: PROGRAMA FIN;
/*
todo	            : programa { if (yynerrs || yylexerrs) YYABORT;};
programa            : encabezado bloquePrograma FIN;
encabezado          : PROGRAMA '\n';
bloquePrograma      : bloqueVariables bloqueCodigo;
bloqueVariables	    : encabezadoVariables declaracionVariables;
encabezadoVariables : VARIABLES '\n';
declaracionVariables: variable | declaracionVariables variable;
variable            : DEFINIR IDENTIFICADOR '.' '\n' | '\n';
bloqueCodigo        : encabezadoCodigo declaracionCodigo;
encabezadoCodigo    : CODIGO '\n';
declaracionCodigo   : declaracionCodigo sentencia '\n';
sentencia           : instruccion '.';
instruccion         : leer | escribir | asignacion;
leer                : LEER '(' IDENTIFICADOR ',' IDENTIFICADOR ')';
escribir            : ESCRIBIR '(' expresion ')';
asignacion          : IDENTIFICADOR ASIGNACION expresion;
expresion           : termino | expresion '+' termino | expresion '-' termino;
termino             : factor | termino '*' factor | termino'/' factor;
factor              : CONSTANTE | IDENTIFICADOR | '-' IDENTIFICADOR | '(' expresion ')';
*/
%%

int yylexerrs = 0;
int main() {
	switch( yyparse() ){
	case 0:
		puts("Pertenece al LIC"); return 0;
	case 1:
		puts("No pertenece al LIC"); return 1;
	case 2:
		puts("Memoria insuficiente"); return 2;
	}
	return 0;
}
/* Informa la ocurrencia de un error. */
void yyerror(const char *s){
	printf("línea #%d: %s\n", yylineno, s);
	return;
}