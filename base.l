


%{

    int yylineno1;


%}




%%

^(.*)\n printf("%4d\t%s", ++yylineno1, yytext);

%%


int yywrap(void) {
     return 1;
     }
