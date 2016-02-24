%{
#include<stdio.h>
#define YYSTYPE int
%}
%token INTEGER
%left '+' '-'
%left '*' '/'
%%
list:   
    | list '\n'
    | list expr '\n'  {printf("\t%d\n",$2);}
    ;
expr:   INTEGER			{ $$ = $1; }
    |   expr '+' expr 	{$$ = $1+$3;}
    |   expr '-' expr 	{$$ = $1-$3;}
    |   expr '*' expr 	{$$ = $1*$3;}
    |   expr '/' expr 	{$$ = $1/$3;}
    ;
%%

int main(void)
{
    yyparse();
    return 0;
}

int yyerror(char *s) {
    fprintf(stderr, "*%s*\n", s);
    return 0;
}