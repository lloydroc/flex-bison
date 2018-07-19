/* recognizing this { 1, { 2, 3}, 4 } */
%{
#include "arr-ex1.tab.h"
int yylval;
%}

%%
"["    { return LBRAC; }
"]"    { return RBRAC; }
","    { return COMMA; }
[0-9]+ { yylval = atoi(yytext); return NUM; }
\n     { return EOL; }
[ \t]  { /* ignore whitespace */ }
.      { printf("Mystery character %c\n", *yytext); }
%%
