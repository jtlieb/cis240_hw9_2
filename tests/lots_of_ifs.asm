

      .CODE
      .FALIGN
testIfs
   ;; Saving previous frame
   ADD R6, R6, #-3
   STR R7, R6, #1
   STR R5, R6, #0
   ADD R5, R6, #0

   ;; Moving ARG1 to the top of the stack
   LDR R0, R5, #3
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Duplicate
   LDR R0, R6, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 10
   CONST R0, #10
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Greater Than
   LDR R0, R6, #0
   LDR R1, R6, #1
   CMP R0 R1
   BRnz cmp_false_0
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

   ;; Duplicate
   LDR R0, R6, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 5
   CONST R0, #5
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Greater Than
   LDR R0, R6, #0
   LDR R1, R6, #1
   CMP R0 R1
   BRnz cmp_false_1
   CONST R2, #1
   BRnzp cmp_end_1
cmp_false_1
   CONST R2, #0
cmp_end_1
   ADD R6, R6, #1
   STR R2, R6, #0

   ;; IF STATEMENT
   ADD R6, R6, #1
   LDR R0, R6, #-1
   BRnz ELSE_1

  ;; Adding literal 11
   CONST R0, #11
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; ELSE STATEMENT
   BRnzp ENDIF_1
ELSE_1

  ;; Adding literal 12
   CONST R0, #12
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; ENDIF STATEMENT
ENDIF_1

   ;; ELSE STATEMENT
   BRnzp ENDIF_0
ELSE_0

   ;; Duplicate
   LDR R0, R6, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 20
   CONST R0, #20
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Greater Than
   LDR R0, R6, #0
   LDR R1, R6, #1
   CMP R0 R1
   BRnz cmp_false_2
   CONST R2, #1
   BRnzp cmp_end_2
cmp_false_2
   CONST R2, #0
cmp_end_2
   ADD R6, R6, #1
   STR R2, R6, #0

   ;; IF STATEMENT
   ADD R6, R6, #1
   LDR R0, R6, #-1
   BRnz ELSE_2

  ;; Adding literal 13
   CONST R0, #13
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; ELSE STATEMENT
   BRnzp ENDIF_2
ELSE_2

  ;; Adding literal 14
   CONST R0, #14
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; ENDIF STATEMENT
ENDIF_2

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

  ;; Adding literal 8
   CONST R0, #8
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Calling function testIfs
   JSR testIfs
   ADD R6, R6, #-1

   ;; Calling function printnum
   JSR printnum
   ADD R6, R6, #-1

   ;; Calling function endl
   JSR endl
   ADD R6, R6, #-1

  ;; Adding literal 4
   CONST R0, #4
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Calling function testIfs
   JSR testIfs
   ADD R6, R6, #-1

   ;; Calling function printnum
   JSR printnum
   ADD R6, R6, #-1

   ;; Calling function endl
   JSR endl
   ADD R6, R6, #-1

  ;; Adding literal 45
   CONST R0, #45
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Calling function testIfs
   JSR testIfs
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