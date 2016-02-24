%{
#include "y.tab.h"
extern int yylval;
%}

%%
[ \t] 	{ ; }
[0-9]+ 	{ 
		sscanf(yytext, "%d", &yylval); 
		printf("\nRead number %d\n", yylval); 
		return INTEGER; 
	}
[-+*/\n] 	{ return *yytext; }
. 	{ yyerror("unrecognized character"); return 0; }
%%

int yywrap(void) {
    return 1;
}