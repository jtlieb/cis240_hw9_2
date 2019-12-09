#include "stack.h"
#include <stdlib.h>
#include <stdio.h>

void init_stack(stack *x) {
    x -> elt = NULL;
    x -> size = 0;
}

void push(stack *x, int y) {
    elt *new_elt = malloc(sizeof(elt));
    new_elt -> num = y;
    new_elt -> next = x -> elt;
    x -> elt = new_elt;
    x -> size += 1;
}

int pop(stack *x) {
    if (x -> size) {
        elt *delete = x -> elt;
        x -> elt = (x -> elt) -> next;
        x -> size -= 1;
        int rtrn = delete -> num;
        free(delete);
        return rtrn;
    }
    return -1;
}

int peek(stack *x) {
    if (x -> size) {
        return (x -> elt) -> num;
    }
    return -1;
}

