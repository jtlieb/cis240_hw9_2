

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

  ;; Adding literal 16
   CONST R0, #16
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

  ;; Adding literal 8
   CONST R0, #8
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

   ;; Duplicate
   LDR R0, R6, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 4
   CONST R0, #4
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

  ;; Adding literal 0
   CONST R0, #0
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; ELSE STATEMENT
   BRnzp ENDIF_2
ELSE_2

  ;; Adding literal 1
   CONST R0, #1
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; ENDIF STATEMENT
ENDIF_2

   ;; ELSE STATEMENT
   BRnzp ENDIF_1
ELSE_1

  ;; Adding literal 2
   CONST R0, #2
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

  ;; Adding literal 24
   CONST R0, #24
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Greater Than
   LDR R0, R6, #0
   LDR R1, R6, #1
   CMP R0 R1
   BRnz cmp_false_3
   CONST R2, #1
   BRnzp cmp_end_3
cmp_false_3
   CONST R2, #0
cmp_end_3
   ADD R6, R6, #1
   STR R2, R6, #0

   ;; IF STATEMENT
   ADD R6, R6, #1
   LDR R0, R6, #-1
   BRnz ELSE_3

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
   BRnz cmp_false_4
   CONST R2, #1
   BRnzp cmp_end_4
cmp_false_4
   CONST R2, #0
cmp_end_4
   ADD R6, R6, #1
   STR R2, R6, #0

   ;; IF STATEMENT
   ADD R6, R6, #1
   LDR R0, R6, #-1
   BRnz ELSE_4

  ;; Adding literal 3
   CONST R0, #3
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; ELSE STATEMENT
   BRnzp ENDIF_4
ELSE_4

  ;; Adding literal 4
   CONST R0, #4
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; ENDIF STATEMENT
ENDIF_4

   ;; ELSE STATEMENT
   BRnzp ENDIF_3
ELSE_3

   ;; Duplicate
   LDR R0, R6, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 32
   CONST R0, #32
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Greater Than
   LDR R0, R6, #0
   LDR R1, R6, #1
   CMP R0 R1
   BRnz cmp_false_5
   CONST R2, #1
   BRnzp cmp_end_5
cmp_false_5
   CONST R2, #0
cmp_end_5
   ADD R6, R6, #1
   STR R2, R6, #0

   ;; IF STATEMENT
   ADD R6, R6, #1
   LDR R0, R6, #-1
   BRnz ELSE_5

  ;; Adding literal 5
   CONST R0, #5
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; ELSE STATEMENT
   BRnzp ENDIF_5
ELSE_5

  ;; Adding literal -10
   CONST R0, #246
   HICONST R0, #255
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; ENDIF STATEMENT
ENDIF_5

   ;; ENDIF STATEMENT
ENDIF_3

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

  ;; Adding literal 5
   CONST R0, #5
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

  ;; Adding literal 11
   CONST R0, #11
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

  ;; Adding literal 28
   CONST R0, #28
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

  ;; Adding literal 35
   CONST R0, #35
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