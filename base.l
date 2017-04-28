

digit [0-9]
letter [A-Za-z]


%{

    int yylineno1;

    int count;

%}




%%

^(.*)\n printf("%4d\t%s", ++yylineno1, yytext);
{letter}({letter}|{digit})*        count++;

%%


int yywrap(void) {
     return 1;
     }
