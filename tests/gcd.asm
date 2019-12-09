

      .CODE
      .FALIGN
gcd
   ;; Saving previous frame
   ADD R6, R6, #-3
   STR R7, R6, #1
   STR R5, R6, #0
   ADD R5, R6, #0

   ;; Moving ARG2 to the top of the stack
   LDR R0, R5, #4
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 0
   CONST R0, #0
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Less Than
   LDR R0, R6, #0
   LDR R1, R6, #1
   CMP R0 R1
   BRnp cmp_false_0
   CONST R2, #1
   BRnzp cmp_end_0
cmp_false_0
   CONST R2, #0
cmp_end_0
   ADD R6, R6, #1
   STR R2, R6, #0

   ;; IF STATEMENT
   ADD R6, R6, #1
   LDR R0, R6, #-1
   BRnz ELSE_0

   ;; Moving ARG1 to the top of the stack
   LDR R0, R5, #3
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; ELSE STATEMENT
   BRnzp ENDIF_0
ELSE_0

   ;; Moving ARG2 to the top of the stack
   LDR R0, R5, #4
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Moving ARG1 to the top of the stack
   LDR R0, R5, #3
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Modulus
   LDR R0, R6, #0
   LDR R1, R6, #1
   MOD R0, R0, R1
   STR R0, R6, #1
   ADD R6, R6, #1

   ;; Moving ARG2 to the top of the stack
   LDR R0, R5, #4
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Calling function gcd
   JSR gcd
   ADD R6, R6, #-1

   ;; ENDIF STATEMENT
ENDIF_0

   ;; Epilogue before return
   LDR R7, R6, #0
   STR R7, R5, #2
   ADD R6, R5, #0
   LDR R5, R6, #0
   LDR R7, R6, #1
   ADD R6, R6, #3
   RET

      .CODE
      .FALIGN
main
   ;; Saving previous frame
   ADD R6, R6, #-3
   STR R7, R6, #1
   STR R5, R6, #0
   ADD R5, R6, #0

  ;; Adding literal 462
   CONST R0, #206
   HICONST R0, #1
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 1071
   CONST R0, #47
   HICONST R0, #4
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Calling function gcd
   JSR gcd
   ADD R6, R6, #-1

   ;; Calling function printnum
   JSR printnum
   ADD R6, R6, #-1

   ;; Calling function endl
   JSR endl
   ADD R6, R6, #-1

   ;; Epilogue before return
   LDR R7, R6, #0
   STR R7, R5, #2
   ADD R6, R5, #0
   LDR R5, R6, #0
   LDR R7, R6, #1
   ADD R6, R6, #3
   RET