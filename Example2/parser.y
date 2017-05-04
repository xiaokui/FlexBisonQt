


%{

#include <stdio.h>

extern int yylex(void);
void yyerror(const char *s);


%}

%token NOUN PRONOUN VERB ADVERB ADJECTIVE PREPOSITION CONJUNCTION


%%


sentence: subject VERB object {printf("Sentence is valid.\n");}
    ;

subject: NOUN
    | PRONOUN
    ;

object: NOUN
    ;


%%

void yyerror(const char *s)
{
    fprintf(stderr, "%s\n", s);
}

