
#include "token.h"
#include "stack.h"

void finish(FILE *input, FILE *output, stack *stack) {
    

}


int main(int argc, char **argv) {

    // DECLARING INPUT AND OUTPUT FILES
    FILE *output, *input;
    char arg[50];
    char asm_arg[50];

    sscanf(argv[1], "%[^.].j", arg);
    input = fopen(argv[1], "r");
    if (input == NULL) {
        // DELETE LATER
        printf("input file could not be opened\n");
        exit(1);
    }
    
    // OPENING OUTPUT FILE
    sprintf(asm_arg, "%s.asm", arg);
    printf("NAME: %s  %s", asm_arg, arg);
    output = fopen(asm_arg, "w");
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
    token *token = malloc(sizeof(token));
    int status, function = 0, ifs = 0, peeked, elseClause, arg_offset, cmp = 0;
    short temp;
    stack *stack = malloc(sizeof(stack));

    while (!feof(input)) {
        next_token(input, token);


        switch(token -> type) {
            case DEFUN:
                status = next_token(input, token);
                if (status) {
                    break;
                } 

                if (token -> type == IDENT) {
                    fprintf(output, "\n\n      .CODE\n");
                    fprintf(output, "      .FALIGN\n");
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
                fprintf(output, "   ADD R6, R6, #-1\n");

                break;
            case RETURN:

                if (function) {
                    fprintf(output, "\n   ;; Epilogue before return\n");
                    fprintf(output, "   LDR R7, R6, #0\n");
                    fprintf(output, "   STR R7, R5, #2\n");
                    fprintf(output, "   ADD R6, R5, #0\n");
                    fprintf(output, "   LDR R5, R6, #0\n");
                    fprintf(output, "   LDR R7, R6, #1\n");
                    fprintf(output, "   ADD R6, R6, #3\n");
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
                fprintf(output, "\n   ;; Less Than\n");
                fprintf(output, "   LDR R0, R6, #0\n");
                fprintf(output, "   LDR R1, R6, #1\n");
                fprintf(output, "   CMP R0 R1\n");
                fprintf(output, "   BRzp cmp_false_%d\n", cmp);
                // TRUE CLAUSE
                fprintf(output, "   CONST R2, #1\n");
                fprintf(output, "   BRnzp cmp_end_%d\n", cmp);
                fprintf(output, "cmp_false_%d\n", cmp);
                // FALSE CLAUSE
                fprintf(output, "   CONST R2, #0\n");
                fprintf(output, "cmp_end_%d\n", cmp);

                fprintf(output, "   ADD R6, R6, #1\n");
                fprintf(output, "   STR R2, R6, #0\n");

                cmp++;
                break;
            case LE:
                fprintf(output, "\n   ;; Less Than\n");
                fprintf(output, "   LDR R0, R6, #0\n");
                fprintf(output, "   LDR R1, R6, #1\n");
                fprintf(output, "   CMP R0 R1\n");
                fprintf(output, "   BRp cmp_false_%d\n", cmp);
                // TRUE CLAUSE
                fprintf(output, "   CONST R2, #1\n");
                fprintf(output, "   BRnzp cmp_end_%d\n", cmp);
                fprintf(output, "cmp_false_%d\n", cmp);
                // FALSE CLAUSE
                fprintf(output, "   CONST R2, #0\n");
                fprintf(output, "cmp_end_%d\n", cmp);

                fprintf(output, "   ADD R6, R6, #1\n");
                fprintf(output, "   STR R2, R6, #0\n");

                cmp++;
                break;
            case EQ:
                fprintf(output, "\n   ;; Less Than\n");
                fprintf(output, "   LDR R0, R6, #0\n");
                fprintf(output, "   LDR R1, R6, #1\n");
                fprintf(output, "   CMP R0 R1\n");
                fprintf(output, "   BRnp cmp_false_%d\n", cmp);
                // TRUE CLAUSE
                fprintf(output, "   CONST R2, #1\n");
                fprintf(output, "   BRnzp cmp_end_%d\n", cmp);
                fprintf(output, "cmp_false_%d\n", cmp);
                // FALSE CLAUSE
                fprintf(output, "   CONST R2, #0\n");
                fprintf(output, "cmp_end_%d\n", cmp);

                fprintf(output, "   ADD R6, R6, #1\n");
                fprintf(output, "   STR R2, R6, #0\n");

                cmp++;
                break;
            case GE:
                fprintf(output, "\n   ;; Greater/Equal\n");
                fprintf(output, "   LDR R0, R6, #0\n");
                fprintf(output, "   LDR R1, R6, #1\n");
                fprintf(output, "   CMP R0 R1\n");
                fprintf(output, "   BRn cmp_false_%d\n", cmp);
                // TRUE CLAUSE
                fprintf(output, "   CONST R2, #1\n");
                fprintf(output, "   BRnzp cmp_end_%d\n", cmp);
                fprintf(output, "cmp_false_%d\n", cmp);
                // FALSE CLAUSE
                fprintf(output, "   CONST R2, #0\n");
                fprintf(output, "cmp_end_%d\n", cmp);

                fprintf(output, "   ADD R6, R6, #1\n");
                fprintf(output, "   STR R2, R6, #0\n");

                cmp++;
                break;
            case GT: 
                fprintf(output, "\n   ;; Greater Than\n");
                fprintf(output, "   LDR R0, R6, #0\n");
                fprintf(output, "   LDR R1, R6, #1\n");
                fprintf(output, "   CMP R0 R1\n");
                fprintf(output, "   BRnz cmp_false_%d\n", cmp);
                // TRUE CLAUSE
                fprintf(output, "   CONST R2, #1\n");
                fprintf(output, "   BRnzp cmp_end_%d\n", cmp);
                fprintf(output, "cmp_false_%d\n", cmp);
                // FALSE CLAUSE
                fprintf(output, "   CONST R2, #0\n");
                fprintf(output, "cmp_end_%d\n", cmp);

                fprintf(output, "   ADD R6, R6, #1\n");
                fprintf(output, "   STR R2, R6, #0\n");

                cmp++;
                break;
            case IF :
                fprintf(output, "\n   ;; IF STATEMENT\n");
                fprintf(output, "   ADD R6, R6, #1\n");
                fprintf(output, "   LDR R0, R6, #-1\n");
                fprintf(output, "   BRnz ELSE_%d\n", ifs);
                push(stack, ifs);
                ifs++;
                break;
            case ELSE:
                peeked = peek(stack);
                fprintf(output, "\n   ;; ELSE STATEMENT\n");
                fprintf(output, "   BRnzp ENDIF_%d\n", peeked);
                fprintf(output, "ELSE_%d\n", peeked);
                elsed(stack);
                break;
            case ENDIF:
                elseClause = peekElse(stack);
                peeked = pop(stack);
                if (elseClause) {
                    fprintf(output, "\n   ;; ENDIF STATEMENT\n");
                    fprintf(output, "ENDIF_%d\n", peeked);
                } else {
                    fprintf(output, "ELSE_%d\n", peeked);
                }
                break;   
            case DROP:
                fprintf(output, "\n   ;; Drop\n");
                fprintf(output, "   ADD R6, R6, #1");
                break;
            case DUP:
                fprintf(output, "\n   ;; Duplicate\n");
                fprintf(output, "   LDR R0, R6, #0\n");
                fprintf(output, "   ADD R6, R6, #-1\n");
                fprintf(output, "   STR R0, R6, #0\n");
                break;
            case SWAP:
                fprintf(output, "\n   ;; Swap\n");
                fprintf(output, "   LDR R0, R6, #0\n");
                fprintf(output, "   LDR R1, R6, #1\n");
                fprintf(output, "   STR R0, R6, #1\n");
                fprintf(output, "   STR R1, R6, #0\n");
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
                arg_offset = 2 + (token -> arg_no);
                fprintf(output, "\n   ;; Moving ARG%d to the top of the stack\n", (token -> arg_no));
                fprintf(output, "   LDR R0, R5, #%d\n", arg_offset);
                fprintf(output, "   ADD R6, R6, #-1\n");
                fprintf(output, "   STR R0, R6, #0\n");
                
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
                finish(input, output, stack);
                exit(1);                
        }

        
    }


    // CLOSE FILES
    fclose(input);
    fclose(output); 
    int x = pop(stack);
    while (x != -1) {
        pop(stack);
    }
    free(token);
    free(stack);
    
}




