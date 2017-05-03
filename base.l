

digit [0-9]
letter [A-Za-z]


%{

    int yylineno1;

    int count;

/*
^(.*)\n printf("%4d\t%s", ++yylineno1, yytext);
{letter}({letter}|{digit})*        count++;
*/


%}


%%

[\t ]+  ;
is |
am |
go { printf("%s: is a verb \n", yytext); }
[a-zA-Z]+ { printf("%s: is not a verb \n", yytext); }

.|\n { ECHO; }



%%


int yywrap(void) {
     return 1;
     }
