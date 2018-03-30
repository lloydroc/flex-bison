%option noyywrap
%x SERIAL
%x R1
%x R2
%x R3
%x R4
%x R5
%x R6
%x R7
%x R8
READING "---.-"|[1-9][0-9]\.[0-9]
%{
char *serialno;
float r1,r2,r3,r4,r5,r6,r7,r8;
void print_reading();
%}

%%
"Serial Number:"[ ]+ { BEGIN SERIAL; }
<SERIAL>[a-zA-Z0-9]+ { serialno = strdup(yytext); BEGIN(INITIAL); }
^{READING}           { r1 = atof(yytext); BEGIN(R2); }
<R2>{READING}        { r2 = atof(yytext); BEGIN(R3); }
<R3>{READING}        { r3 = atof(yytext); BEGIN(R4); }
<R4>{READING}        { r4 = atof(yytext); BEGIN(R5); }
<R5>{READING}        { r5 = atof(yytext); BEGIN(R6); }
<R6>{READING}        { r6 = atof(yytext); BEGIN(R7); }
<R7>{READING}        { r7 = atof(yytext); BEGIN(R8); }
<R8>{READING}        { r8 = atof(yytext); BEGIN(INITIAL); print_reading(); }
<INITIAL,R1,R2,R3,R4,R5,R6,R7,R8>.
\n

%%

/*
<SERIAL>[a-zA-Z0-9]+ {
                       { int c;
                         while((c = input()) && c != '\n');
                         serialno = strdup(yytext);
                         printf("{\"serialno\": \"%s\",",serialno);
                         yyterminate();
                         BEGIN INITIAL;
                       }
                     }

*/

#include<string.h>

int
main(int argc, char **argv) {
  if(argc > 1) {
    if(!(yyin = fopen(argv[1],"r"))) {
      perror(argv[1]);
      return EXIT_FAILURE;
    }
    yylex();
  }
  return EXIT_SUCCESS;
}

void
print_reading() {
  printf("{\"serialno\":\"%s\",",serialno);
  if(r1 != 0.0) printf("\"M1Lavg\":%.1f,",r1);
  if(r2 != 0.0) printf("\"M1Lpk\":%.1f,",r2);
  if(r3 != 0.0) printf("\"M1Lmax\":%.1f,",r3);
  if(r4 != 0.0) printf("\"M1Lmin\":%.1f,",r4);
  if(r5 != 0.0) printf("\"M2Lavg\":%.1f,",r5);
  if(r6 != 0.0) printf("\"M2Lpk\":%.1f,",r6);
  if(r7 != 0.0) printf("\"M2Lmax\":%.1f,",r7);
  if(r8 != 0.0) printf("\"M2Lmin\":%.1f",r8);
  printf("}");
  printf("\n");
}
