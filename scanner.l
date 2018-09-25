%top{
#include <stdio.h>
#include "tokens.h"
}
%{
%}
%option outfile="scanner.c"
%option nodefault
L [[:alpha:]]
D [0-9]
LD [[:alnum:]]
S [[:space:]]
P [\.\(\)\+\-\*,/]
C \/\/.*
O [^[:alnum:]]{-}[[:space:]]{-}[\.\(\)\+\-\*,/]
%%
programa		return Programa;
variables		return Variables;
definir			return Definir;
codigo			return Codigo;
leer			return Leer;
\<\-			return Asignacion;
escribir		return Escribir;
fin			return Fin;
{P}			printf("Token: '%s'\n", yytext);
{L}{LD}*		return Identificador;
{D}+			return Constante;
{O}+			printf("Error Léxico: cadena desconocida: %s\n", yytext);
{O}+|{D}+{L}+{LD}*	printf("Error Léxico: constante inválida: %s\n", yytext);
{L}{LD}*{O}+({LD}|{O})*	printf("Error Léxico: identificador inválido: %s\n", yytext);
{S}+			/*ignorar*/
{C}			;
%%

#include "main.c"
