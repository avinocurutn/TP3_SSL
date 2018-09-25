char *token_names[] = {"Fin de Archivo", "Identificador", "Constante", "Programa", "Variables", 
	    	       "Definir", "Código", "Leer", "Asignación", "Escribir", "Fin"};
int main() {
	enum token t;
	while ((t = yylex()))
		switch (t) {
			case Programa: printf("Token: %s\n", token_names[t]); break;
			case Variables: printf("Token: %s\n", token_names[t]); break;
			case Definir: printf("Token: %s\n", token_names[t]); break;
			case Codigo: printf("Token: %s\n", token_names[t]); break;
			case Leer: printf("Token: %s\n", token_names[t]); break;
			case Asignacion: printf("Token: %s\n", token_names[t]); break;
			case Escribir: printf("Token: %s\n", token_names[t]); break;
			case Fin: printf("Token: %s\n", token_names[t]); break;
			case Identificador: case Constante: printf("Token: %s\tlexema: %s\n", token_names[t], yytext); break;
			case FDT: printf("%s", token_names[t]);
		}
	return 0;
}
