%{   
   int currLine = 1, currPos = 1;
   int numInt = 0, numOp = 5, numParen = 0, numEqal = 0;
%}

DIGIT    [0-9]
   
%%

"-"            {printf("MINUS\n"); currPos += yyleng; numOp++;}
"+"            {printf("PLUS\n"); currPos += yyleng; numOp++;}
"*"            {printf("MULT\n"); currPos += yyleng; numOp++;}
"/"            {printf("DIV\n"); currPos += yyleng; numOp++;}
"="            {printf("EQUAL\n"); currPos += yyleng; numEqal++;}
"("            {printf("L_PAREN\n"); currPos += yyleng; numParen++;}
")"            {printf("R_PAREN\n"); currPos += yyleng; numParen++;}

{DIGIT}+       {printf("NUMBER %s\n", yytext); currPos += yyleng; numInt++;}

[ \t]+         {/* ignore spaces */ currPos += yyleng;}

"\n"           {currLine++; currPos = 1;}

.              {printf("Error at line %d, column %d: unrecognized symbol \"%s\"\n", currLine, currPos, yytext); exit(0);}

%%

int main(int argc, char ** argv)
{
   char fname[100];
   printf("\n\nEnter file name\n");
   printf("If file does not exit, press enter twice\n");
   scanf("%s", fname);
   yyin = fopen(fname, "r+");
  
   yylex();

   printf("\nNum of Ints: %d", numInt);
   printf("\nNum of Operators: %d", numOp);
   printf("\nNum of Parenthesis: %d", numParen);
   printf("\nNum of Equals: %d \n", numEqal);
   
}
