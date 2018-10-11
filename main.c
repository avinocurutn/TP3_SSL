/*
 * UTN - FRBA - Sintaxis y Semántica de los Lenguajes
 * TP 03 - 2018
 * Título: Scanner en Flex
 * GRUPO NRO 1:            
 * +-------------------------+-----------------------------------+----------+
 * |    Apellido y Nombre    |               Email               |  Legajo  |
 * +-------------------------+-----------------------------------+----------+
 * | Gimeno Guido            | gimenoguido@gmail.com             | 156381-6 |
 * | Mateika Hernán          | her.mateika@gmail.com             | 162746-6 |
 * | Vicente Sebastián Ariel | vicente.sebastian.ariel@gmail.com | 155725-7 |
 * | Vinocur Adrian          | adrian.vinocur@gmail.com          | 163002-7 |
 * +-------------------------+-----------------------------------+----------+ 
*/

#include <stdio.h>
#include "tokens.h"

extern int yylex();
extern char* yytext;

char *token_names[] = {"Fin de Archivo", "Identificador", "Constante", "Programa", "Variables", 
	    	       "Definir", "Código", "Leer", "Asignación", "Escribir", "Fin"};
int main() {
	enum token t;
	while ((t = yylex())) {
		//Los mayores a 11 se imprimen como caracteres en ASCII
		if(t < 11) {
			switch (t) {
				case Identificador: case Constante: printf("Token: %s\tlexema: %s\n", token_names[t], yytext); break;
				default: printf("Token: %s\n", token_names[t]); break;
			}
		} else {
			printf("Token: '%c'\n", t);
		}
	}
	printf("%s\n", token_names[t]);
	return 0;
}
