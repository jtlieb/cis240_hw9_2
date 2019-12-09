
typedef struct elt {
    int num;
    struct elt *next;

} elt;

typedef struct {

    elt *elt;
    int size;

} stack;



void init_stack(stack *x);
void push(stack *x, int y);
int pop(stack *x);
int peek(stack *x);