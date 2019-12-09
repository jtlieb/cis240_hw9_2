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

int next_token(FILE *file, token *token) {
    char str[201];
    memset(str, 0, strlen(str));
    int index = 0;
    int c = fgetc(file); 

    // READING IN NEXT TOKEN
    while (1) {
        if (c == ' ' || c == '\n') {
            if (index > 0) {
                break;
            } else {
                c = fgetc(file);
            }
        } else if (c == EOF) {
            if (index == 0) {
            return 1;
            } else {
            break;
            }
        } else if (c == ';') {
            while(1) {
                if (c == '\n') {
                    break;
                } else if (c == EOF) {
                    if (index == 0) {
                        return 1;
                    } else {
                        break;
                    }
                }
                c = fgetc(file);
            }
        } else {
        str[index] = (char) c;
        c = fgetc(file);
        index++;
        }
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
    } else if (str[0] == 'a' && str[1] == 'r' && str[2] == 'g' && isdigit(str[3])) {
        int arg = atoi(&str[3]);
        if (strlen(str) <= 5) {
            if (arg <= 20 && arg > 0) {
                token -> type = ARG; 
                token -> arg_no = arg;
            } else {
                token -> type = BROKEN_TOKEN;
            }
        } else {
            token -> type = BROKEN_TOKEN;
        }
    } else {
        if (str[0] == '-' && isNumber(&str[1])) {
            token -> type = LITERAL;
            token -> literal_value = -1 * atoi(&str[1]);

        } else if (isNumber(str)) {
            token -> type = LITERAL;
            token -> literal_value = atoi(str);

        } else if (isHex(str)) {
            token -> type = LITERAL;
            for (int i = 2; i < strlen(str); i++) {
                token -> literal_value *= 16;
                if (!isdigit(str[i])) {
                    switch(str[i]) {
                        case 'A':
                        case 'a':
                            token -> literal_value += 10;
                            break;
                        case 'B':
                        case 'b':
                            token -> literal_value += 11;
                            break;

                        case 'C':
                        case 'c':
                            token -> literal_value += 12;
                            break;
                        case 'D':
                        case 'd':
                            token -> literal_value += 13;
                            break;   
                        case 'E':
                        case 'e':
                            token -> literal_value += 14;
                            break;
                        case 'F':
                        case 'f':
                            token -> literal_value += 15;
                            break;     
                    }
                } else {
                    token -> literal_value += atoi(&str[i]);
                }
            }
        } else {
            token -> type = BROKEN_TOKEN;
        }
    }

    if (defun) {
        if (token -> type != BROKEN_TOKEN) {
        printf("******************* \nERROR: NO DEFUN AFTER \n******************* \n"); 
        exit(1);
        } else if (validFunctionName(str)) {
            token -> type = IDENT;
            defun = 0;
        }
    }

    if (token -> type == BROKEN_TOKEN && validFunctionName(str)) {
        token -> type = IDENT;
    }
    // AT END OF FUNCTION, CLEARS STRING
    

    if (token -> type == DEFUN) {
        defun = 1;
    } else if (defun) {
        printf("**************************\nCALLLED DEFUN BUT DID NOT DEFINE FUNCTION\n**************************\n");
        exit(1);
    }
    strcpy(token -> str, str);
    print_token(token);
    return 0;

    

}



// Extra functions which you may wish to define and use , or not
const char *token_type_to_string (int type);

void print_token (token *theToken) {
    switch(theToken -> type) {
        case DEFUN:
            printf("DEFUN");
            break;
        case IDENT:
            printf("IDENT");
            break;
        case RETURN:
            printf("RETURN");
            break;
        case PLUS:
            printf("PLUS");
            break;
        case MINUS:
            printf("MINUS");
            break;
        case MUL:
            printf("MUL");
            break;
        case DIV :
            printf("DIV");
            break;
        case MOD:
            printf("MOD");
            break;
        case AND:
            printf("AND");
            break; 
        case OR:
            printf("OR");
            break;
        case NOT:
            printf("NOT");
            break;
        case LT:
            printf("LT");
            break;
        case LE:
            printf("LE");
            break;
        case EQ:
            printf("EQ");
            break;
        case GE:
            printf("GE");
            break;
        case GT: 
            printf("GT");
            break;
        case IF :
            printf("IF");
            break;
        case ELSE:
            printf("ELSE");
            break;
        case ENDIF:
            printf("ENDIF");
            break;   
        case DROP:
            printf("DROP");
            break;
        case DUP:
            printf("DUP");
            break;
        case SWAP:
            printf("SWAP");
            break;
        case ROT :
            printf("ROT");
            break;
        case ARG:
            printf("ARG%d", theToken -> arg_no);
            break;
        case LITERAL:
            printf("LITERAL %d", theToken -> literal_value);
            break;    
        case BROKEN_TOKEN:
            printf("BROKEN_TOKEN");                    
    }
    printf(":  '%s'\n",  theToken -> str);
}

