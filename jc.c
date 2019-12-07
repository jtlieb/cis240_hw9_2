#include <stdio.h> 
#include <stdlib.h>
#include <string.h>
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
    char *x = "test";
    fprintf(output, "%s", x);






}


