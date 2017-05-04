%{



%}
%%

[\n\t ] ;

-?(([0-9]+)|([0-9]+)\.[0-9]+) { printf("number \n"); }

. ECHO;

%%


int yywrap(void) {
     return 1;
     }


