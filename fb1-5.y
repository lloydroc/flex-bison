/* simplest version of a calculator */
%{
#include <stdio.h>
%}

/* declare tokens */
%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL

%%

calclist:
 | calclist exp EOL { printf("= %d\n", $2); }
 ;

exp:
 | exp ADD factor { $$ = $1 + $3; }
 | exp SUB factor { $$ = $1 - $3; }
 ;

factor:
 | factor MUL factor { $$ = $1 * $3; }
 | factor DIV factor { $$ = $1 / $3; }
 ;

term: NUMBER
 | ABS term { $$ = $2 >=0 ? $2 : -$2; }
 ;
%%
int
main(int argc, char **argv)
{
  yyparse();
}

yyerror(char *s)
{
  fprintf(stderr,"error %s\n",s);
}
/* simplest version of a calculator */
%{
#include <stdio.h>
%}

/* declare tokens */
%token NUMBER
%token ADD SUB MUL DIV ABS
%token EOL

%%

calclist:
 | calclist exp EOL { printf("= %d\n", $2); }
 ;

exp: factor
 | exp ADD factor { $$ = $1 + $3; }
 | exp SUB factor { $$ = $1 - $3; }
 ;

factor: term
 | factor MUL factor { $$ = $1 * $3; }
 | factor DIV factor { $$ = $1 / $3; }
 ;

term: NUMBER
 | ABS term { $$ = $2 >= 0 ? $2 : -$2; }
 ;

%%
int
main(int argc, char **argv)
{
  yyparse();
}

int
yyerror(char *s)
{
  fprintf(stderr,"error %s\n",s);
}