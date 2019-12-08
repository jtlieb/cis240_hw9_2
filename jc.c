
#include "token.h"



int main(int argc, char **argv) {

    // DECLARING INPUT AND OUTPUT FILES
    FILE *output, *input;

    input = fopen(argv[1], "r");
    if (input == NULL) {
        // DELETE LATER
        printf("input file could not be opened\n");
        exit(1);
    }
    
    // OPENING OUTPUT FILE
    char arg[strlen(argv[1]) + 2];
    strncpy(arg, argv[1], strlen(argv[1]) - 2);
    strcat(arg, ".asm");
    output = fopen(arg, "w");
    if (output == NULL) {
        fclose(input);
        // DELETE LATER
        printf("output file could not be opened\n");
        exit(2);
    }

    // WHILE THE FILE IS OPEN
    // while (!feof(input)) {
    //     printf("hello\n");
    // }
    token *token;
    int status, function = 0, ifs = 0, nested = 0;
    short temp;

    fprintf(output, "        .CODE\n");

    while (!feof(input)) {
        token = malloc(sizeof(token));
        next_token(input, token);
        switch(token -> type) {
            case DEFUN:
                status = next_token(input, token);
                if (status) {
                    break;
                } 

                if (token -> type == IDENT) {
                    fprintf(output, "\n        .FALIGN\n");
                    fprintf(output, "%s\n", token -> str);
                    fprintf(output, "   ;; Saving previous frame\n");
                    fprintf(output, "   ADD R6, R6, #-3\n");
                    fprintf(output, "   STR R7, R6, #1\n");
                    fprintf(output, "   STR R5, R6, #0\n");
                    fprintf(output, "   ADD R5, R6, #0\n");
                    function = 1;
                } else {
                    printf("DEFUN WITHOUT IDENT AFTER\n");
                }
                break;
            case IDENT:
                fprintf(output, "\n   ;; Calling function %s\n", token -> str);
                fprintf(output, "   JSR %s\n", token -> str);

                break;
            case RETURN:
                if (function) {
                    fprintf(output, "\n   ;; Epilogue before return\n");
                    fprintf(output, "   LDR R7, R6, #0\n");
                    fprintf(output, "   STR R7, R5, #2\n");
                    fprintf(output, "   ADD R6, R5, #0\n");
                    fprintf(output, "   LDR R5, R6, #0\n");
                    fprintf(output, "   LDR R7, R6, #1\n");
                    fprintf(output, "   ADD R6, R6, #2\n");
                    fprintf(output, "   RET");
                } else {
                    printf("RETURN OUTSIDE OF FUNCTION\n");
                }
                function = 0;
                break;
            case PLUS:
                fprintf(output, "\n   ;; Add\n");
                fprintf(output, "   LDR R0, R6, #0\n");
                fprintf(output, "   LDR R1, R6, #1\n");
                fprintf(output, "   ADD R0, R0, R1\n");
                fprintf(output, "   STR R0, R6, #1\n");
                fprintf(output, "   ADD R6, R6, #1\n");
                break;
            case MINUS:
                fprintf(output, "\n   ;; Subtract\n");
                fprintf(output, "   LDR R0, R6, #0\n");
                fprintf(output, "   LDR R1, R6, #1\n");
                fprintf(output, "   SUB R0, R0, R1\n");
                fprintf(output, "   STR R0, R6, #1\n");
                fprintf(output, "   ADD R6, R6, #1\n");
                break;
            case MUL:
                fprintf(output, "\n   ;; Multiply\n");
                fprintf(output, "   LDR R0, R6, #0\n");
                fprintf(output, "   LDR R1, R6, #1\n");
                fprintf(output, "   MUL R0, R0, R1\n");
                fprintf(output, "   STR R0, R6, #1\n");
                fprintf(output, "   ADD R6, R6, #1\n");
                break;
            case DIV :
                fprintf(output, "\n   ;; Divide\n");
                fprintf(output, "   LDR R0, R6, #0\n");
                fprintf(output, "   LDR R1, R6, #1\n");
                fprintf(output, "   DIV R0, R0, R1\n");
                fprintf(output, "   STR R0, R6, #1\n");
                fprintf(output, "   ADD R6, R6, #1\n");
                break;
            case MOD:
                fprintf(output, "\n   ;; Modulus\n");
                fprintf(output, "   LDR R0, R6, #0\n");
                fprintf(output, "   LDR R1, R6, #1\n");
                fprintf(output, "   MOD R0, R0, R1\n");
                fprintf(output, "   STR R0, R6, #1\n");
                fprintf(output, "   ADD R6, R6, #1\n");
                break;
            case AND:
                fprintf(output, "\n   ;; And\n");
                fprintf(output, "   LDR R0, R6, #0\n");
                fprintf(output, "   LDR R1, R6, #1\n");
                fprintf(output, "   AND R0, R0, R1\n");
                fprintf(output, "   STR R0, R6, #1\n");
                fprintf(output, "   ADD R6, R6, #1\n");
                break; 
            case OR:
                fprintf(output, "\n   ;; Or\n");
                fprintf(output, "   LDR R0, R6, #0\n");
                fprintf(output, "   LDR R1, R6, #1\n");
                fprintf(output, "   OR R0, R0, R1\n");
                fprintf(output, "   STR R0, R6, #1\n");
                fprintf(output, "   ADD R6, R6, #1\n");
                break;
            case NOT:
                fprintf(output, "\n   ;; Not\n");
                fprintf(output, "   LDR R0, R6, #0\n");
                fprintf(output, "   NOT R0, R0\n");
                fprintf(output, "   STR R0, R6, #0\n");
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
                fprintf(output, "\n   ;; Rotate\n");
                fprintf(output, "   LDR R0, R6, #0\n");
                fprintf(output, "   LDR R1, R6, #1\n");
                fprintf(output, "   LDR R2, R6, #2\n");
                fprintf(output, "   STR R0, R6, #1\n");
                fprintf(output, "   STR R1, R6, #2\n");
                fprintf(output, "   STR R2, R6, #0\n");
                break;
            case ARG:
                break;
            case LITERAL:
                temp = (short) token -> literal_value;
                fprintf(output, "\n  ;; Adding literal %d\n", temp);
                fprintf(output, "   CONST R0, #%d\n", temp & 0xFF);
                fprintf(output, "   HICONST R0, #%d\n", ((temp >> 8) & 0xFF));
                fprintf(output, "   ADD R6, R6, #-1\n");
                fprintf(output, "   STR R0, R6, #0\n");
                break;    
            case BROKEN_TOKEN:
                printf("BROKEN_TOKEN");                    
        }
        
        free(token);
    }



    // CLOSE FILES
    fclose(input);
    fclose(output); 


}


