
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
    strncpy(arg, argv[1], strlen(argv[1]) - 1);
    strcat(arg, "asm");
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

    while (!feof(input)) {
        token = malloc(sizeof(token));
        next_token(input, token);


        free(token);
    }



    // CLOSE FILES
    fclose(input);
    fclose(output); 


}


