/* array example
[1,[2,3],4]

*/
%{
#include <stdio.h>
int yylex();
void yyerror(char *s);
%}

/* declare tokens */
%token LBRAC RBRAC COMMA NUM
%token EOL

%%

top: list EOL { printf("@@@1= %d\n",$1); }
   ;

list: LBRAC items RBRAC { printf("@@1= %d\n",$2); }
    ;

items: element { printf("^1= %d\n",$1); }
     | element COMMA items { printf("^2= %d,%d\n",$1,$3); }
     ;

element: list
       | NUM
       ;

%%
int
main(int argc, char **argv)
{
  yyparse();
  return 0;
}

void
yyerror(char *s)
{
  fprintf(stderr,"error: %s\n",s);
}
