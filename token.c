#include "token.h"


int line_number = 0;

int read_token (token *theToken, FILE *theFile);

// Extra functions which you may wish to define and use , or not
const char *token_type_to_string (int type);

void print_token (token *theToken);

