
jc: jc.c token.c stack.c
	clang -Wall -o jc jc.c token.c stack.c
all: jc
clean :
	rm jc *.o