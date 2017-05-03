%{

#include "parser.h"


    #define   LOOKUP 0

int state;

int add_word(int type, char *word);
int lookup_word(char *word);


%}
%%


\n { state = LOOKUP; }

\.\n  {
            state = LOOKUP;
            return 0;  /* end of sentence */
      }


^verb {state = VERB; }
^adj {state = ADJECTIVE; }
^noun { state = NOUN; }
^prep { state = PREPOSITION; }
^pron { state = PRONOUN; }
^conj { state = CONJUNCTION; }

[a-zA-Z]+  {
                if (state != LOOKUP) {
                    add_word(state, yytext);
                } else {
                    switch(lookup_word(yytext)) {
                    case VERB:
                        //printf("%s: is verb\n", yytext);
                        return (VERB);
                    case ADJECTIVE:
                        return (ADJECTIVE);
                    case ADVERB:
                        return (ADVERB);
                    case NOUN:
                        //printf("%s: is noun\n", yytext);
                        return (NOUN);
                    case PREPOSITION:
                        return (PREPOSITION);
                    case PRONOUN:
                        return (PRONOUN);
                    case CONJUNCTION:
                        return (CONJUNCTION);
                    default:
                        printf("%s: don't recongnize\n", yytext); break;
                    }
                }
            }
. ;

%%


int yywrap(void) {
     return 1;
     }



struct word {
    char *word_name;
    int word_type;
    struct word *next;
};

struct word *word_list;

extern void *malloc();



int add_word(int type, char *word)
{
    struct word *wp;

    if (lookup_word(word) != LOOKUP)
    {
        printf("!!! warning: word %s already defined \n", word);
        return 0;
    }

    wp = (struct word *) malloc(sizeof(struct word));
    wp->next = word_list;

    wp->word_name = (char *)malloc(strlen(word)+1);
    strcpy(wp->word_name, word);
    wp->word_type = type;
    word_list = wp;

    return 1;
}

int lookup_word(char *word)
{
    struct word *wp = word_list;

    for (; wp; wp = wp->next) {
        if (strcmp(wp->word_name, word) == 0) {
            return wp->word_type;
        }
    }

    return LOOKUP;
}

