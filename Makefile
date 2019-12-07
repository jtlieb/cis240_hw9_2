
jc: jc.c token.c
	clang -Wall -o jc jc.c token.c

all: jc
clean :
	rm jc *.o