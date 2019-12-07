#include "token.h"


int line_number = 0;
int defun = 0;

int isNumber(char *str) {
    int rtrn = 1;
    for (int i = 0; i < strlen(str); i++) {
        if (!isdigit(str[i])) {
            rtrn = 0;
            break;
        }
    }
    return rtrn;
}

int isHex(char *str) {
    int rtrn = 1;
    if (str[0] != '0' || str[1] != 'x' || strlen(str) <= 2) {
        rtrn = 0;
    }

    for (int i = 2; i < strlen(str); i++) {
        if (!isxdigit(str[i])) {
            rtrn = 0;
            break;
        }
    }

    return rtrn;
}

int validFunctionName(char *str) {
    if (!isalpha(str[0])) {
        return 0;
    }
    if (strlen(str) == 1) {
        return 1;
    }

    for (int i = 1; i < strlen(str); i++) {
        if (!(isalnum(str[i]) || str[i] != '_' || str[i] != '-') ) {
            return 0;
        }
    }
    return 1;
}

void next_token(FILE *file, token *token) {
    char str[201];
    int index = 0;
    int c = fgetc(file); 

    // READING IN NEXT TOKEN
    while (c != ' ' && c != EOF && c != '\n') {
        str[index] = (char) c;
        c = fgetc(file);
        index++;
    }
    
    if (!strcmp(str, "defun")) {
        token -> type = DEFUN;

    } else if (!strcmp(str, "+")) {
        token -> type = PLUS;

    } else if (!strcmp(str, "-")) {
        token -> type = MINUS;
    } else if (!strcmp(str, "*")) {
        token -> type = MUL;

    } else if (!strcmp(str, "/")) {
        token -> type = DIV;
    } else if (!strcmp(str, "%")) {
        token -> type = MOD;
    } else if (!strcmp(str, "and")) {
        token -> type = AND;
    } else if (!strcmp(str, "or")) {
        token -> type = OR;
    } else if (!strcmp(str, "not")) {
        token -> type = OR;
    } else if (!strcmp(str, "lt")) {
        token -> type = LT;
    } else if (!strcmp(str, "le")) {
        token -> type = LE;
    } else if (!strcmp(str, "eq")) {
        token -> type = EQ;
    } else if (!strcmp(str, "gt")) {
        token -> type = GT;
    } else if (!strcmp(str, "ge")) {
        token -> type = GE;
    } else if (!strcmp(str, "if")) {
        token -> type = IF;
    } else if (!strcmp(str, "else")) {
        token -> type = ELSE;
    } else if (!strcmp(str, "endif")) {
        token -> type = ENDIF;
    } else if (!strcmp(str, "drop")) {
        token -> type = DROP;
    } else if (!strcmp(str, "dup")) {
        token -> type = DUP;
    } else if (!strcmp(str, "swap")) {
        token -> type = SWAP;
    } else if (!strcmp(str, "rot")) {
        token -> type = ROT;
    } else if (!strcmp(str, "return")) {
        token -> type = RETURN;
    }else if (str[0] == 'a' && str[1] == 'r' && str[2] == 'g' && isdigit(str[3])) {
        int arg = atoi(&str[4]);
        if (strlen(str) <= 5) {
            if (strlen(str) == 5) {
                arg = arg * 10 + atoi(&str[5]);
            }
        if (arg <= 20) {
            printf("HELLO\n\n");

        
        token -> type = ARG; 
        token -> arg_no = arg;
        } else {
            token -> type = BROKEN_TOKEN;
        }
        } else {
            token -> type = BROKEN_TOKEN;
        }
    } else {
        if (isNumber(str)) {
            token -> type = LITERAL;
        } else if (isHex(str)) {
            token -> type = LITERAL;
        } else {
            token -> type = BROKEN_TOKEN;
            printf("BROKEN TOKEN: %s\n", str);
        }
    }

    if (defun) {
        if (token -> type != BROKEN_TOKEN) {
        printf("ERROR: NO DEFUN AFTER \n"); 
        } else if (validFunctionName(str)) {
            token -> type = IDENT;
            defun = 0;
        }
    }
    // AT END OF FUNCTION, CLEARS STRING
    

    if (token -> type == DEFUN) {
        defun = 1;
    }
    strcpy(token -> str, str);


    for (int i = 0; i <= index; i++) {
        str[i] = (char) NULL;
    }

    print_token(token);

    

}


int read_token (token *theToken, FILE *theFile);

// Extra functions which you may wish to define and use , or not
const char *token_type_to_string (int type);

void print_token (token *theToken) {
    printf("%u:  %s\n", theToken -> type, theToken -> str);
}

