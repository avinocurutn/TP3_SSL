%{
#include <stdio.h>
#include <strings.h>
#include "tokens.h"
%}
%option header-file="scanner.h"
%option outfile="scanner.c" 
%option yylineno
L [[:alpha:]]
D [0-9]
LD [[:alnum:]]
S [[:space:]]
P [.()+*,/\-]
C \/\/.*
O [^[:alnum:]]{-}[[:space:]]{-}[.()+*,/\-]
%%
programa		{yylval = strdup(yytext); return PROGRAMA;}
variables		{yylval = strdup(yytext); return VARIABLES;}
definir			{yylval = strdup(yytext); return DEFINIR;}
codigo			{yylval = strdup(yytext); return CODIGO;}
leer			{yylval = strdup(yytext); return LEER;}
\<\-			{yylval = strdup(yytext); return ASIGNACION;}
escribir		{yylval = strdup(yytext); return ESCRIBIR;}
fin			{yylval = strdup(yytext); return FIN;}
{P}			{return yytext[0];}
{L}{LD}*		{yylval = strdup(yytext); return IDENTIFICADOR;}
{D}+			{yylval = strdup(yytext); return CONSTANTE;}
{O}+			{yylexerrs++; yyerror("Error léxico");} //printf("Error Léxico: cadena desconocida: %s\n", yytext);
{O}+|{D}+{L}+{LD}*	{yylexerrs++; yyerror("Error léxico");} //printf("Error Léxico: constante inválida: %s\n", yytext);
{L}{LD}*{O}+({LD}|{O})*	{yylexerrs++; yyerror("Error léxico");} //printf("Error Léxico: identificador inválido: %s\n", yytext);
{S}+			/*ignorar*/
{C}			;
%%

