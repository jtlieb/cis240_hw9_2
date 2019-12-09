

      .CODE
      .FALIGN
main
   ;; Saving previous frame
   ADD R6, R6, #-3
   STR R7, R6, #1
   STR R5, R6, #0
   ADD R5, R6, #0

  ;; Adding literal 2
   CONST R0, #2
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 1
   CONST R0, #1
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Less Than
   LDR R0, R6, #0
   LDR R1, R6, #1
   CMP R0 R1
   BRzp cmp_false_0
   CONST R2, #1
   BRnzp cmp_end_0
cmp_false_0
   CONST R2, #0
cmp_end_0
   ADD R6, R6, #1
   STR R2, R6, #0

   ;; Calling function printnum
   JSR printnum
   ADD R6, R6, #-1

  ;; Adding literal 2
   CONST R0, #2
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 2
   CONST R0, #2
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Less Than
   LDR R0, R6, #0
   LDR R1, R6, #1
   CMP R0 R1
   BRzp cmp_false_1
   CONST R2, #1
   BRnzp cmp_end_1
cmp_false_1
   CONST R2, #0
cmp_end_1
   ADD R6, R6, #1
   STR R2, R6, #0

   ;; Calling function printnum
   JSR printnum
   ADD R6, R6, #-1

  ;; Adding literal 1
   CONST R0, #1
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 2
   CONST R0, #2
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Less Than
   LDR R0, R6, #0
   LDR R1, R6, #1
   CMP R0 R1
   BRzp cmp_false_2
   CONST R2, #1
   BRnzp cmp_end_2
cmp_false_2
   CONST R2, #0
cmp_end_2
   ADD R6, R6, #1
   STR R2, R6, #0

   ;; Calling function printnum
   JSR printnum
   ADD R6, R6, #-1

   ;; Calling function endl
   JSR endl
   ADD R6, R6, #-1

  ;; Adding literal 2
   CONST R0, #2
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 1
   CONST R0, #1
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Less Than
   LDR R0, R6, #0
   LDR R1, R6, #1
   CMP R0 R1
   BRp cmp_false_3
   CONST R2, #1
   BRnzp cmp_end_3
cmp_false_3
   CONST R2, #0
cmp_end_3
   ADD R6, R6, #1
   STR R2, R6, #0

   ;; Calling function printnum
   JSR printnum
   ADD R6, R6, #-1

  ;; Adding literal 2
   CONST R0, #2
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 2
   CONST R0, #2
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Less Than
   LDR R0, R6, #0
   LDR R1, R6, #1
   CMP R0 R1
   BRp cmp_false_4
   CONST R2, #1
   BRnzp cmp_end_4
cmp_false_4
   CONST R2, #0
cmp_end_4
   ADD R6, R6, #1
   STR R2, R6, #0

   ;; Calling function printnum
   JSR printnum
   ADD R6, R6, #-1

  ;; Adding literal 1
   CONST R0, #1
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 2
   CONST R0, #2
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Less Than
   LDR R0, R6, #0
   LDR R1, R6, #1
   CMP R0 R1
   BRp cmp_false_5
   CONST R2, #1
   BRnzp cmp_end_5
cmp_false_5
   CONST R2, #0
cmp_end_5
   ADD R6, R6, #1
   STR R2, R6, #0

   ;; Calling function printnum
   JSR printnum
   ADD R6, R6, #-1

   ;; Calling function endl
   JSR endl
   ADD R6, R6, #-1

  ;; Adding literal 2
   CONST R0, #2
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 1
   CONST R0, #1
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Less Than
   LDR R0, R6, #0
   LDR R1, R6, #1
   CMP R0 R1
   BRnp cmp_false_6
   CONST R2, #1
   BRnzp cmp_end_6
cmp_false_6
   CONST R2, #0
cmp_end_6
   ADD R6, R6, #1
   STR R2, R6, #0

   ;; Calling function printnum
   JSR printnum
   ADD R6, R6, #-1

  ;; Adding literal 2
   CONST R0, #2
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 2
   CONST R0, #2
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Less Than
   LDR R0, R6, #0
   LDR R1, R6, #1
   CMP R0 R1
   BRnp cmp_false_7
   CONST R2, #1
   BRnzp cmp_end_7
cmp_false_7
   CONST R2, #0
cmp_end_7
   ADD R6, R6, #1
   STR R2, R6, #0

   ;; Calling function printnum
   JSR printnum
   ADD R6, R6, #-1

  ;; Adding literal 1
   CONST R0, #1
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 2
   CONST R0, #2
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Less Than
   LDR R0, R6, #0
   LDR R1, R6, #1
   CMP R0 R1
   BRnp cmp_false_8
   CONST R2, #1
   BRnzp cmp_end_8
cmp_false_8
   CONST R2, #0
cmp_end_8
   ADD R6, R6, #1
   STR R2, R6, #0

   ;; Calling function printnum
   JSR printnum
   ADD R6, R6, #-1

   ;; Calling function endl
   JSR endl
   ADD R6, R6, #-1

  ;; Adding literal 2
   CONST R0, #2
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 1
   CONST R0, #1
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Greater/Equal
   LDR R0, R6, #0
   LDR R1, R6, #1
   CMP R0 R1
   BRn cmp_false_9
   CONST R2, #1
   BRnzp cmp_end_9
cmp_false_9
   CONST R2, #0
cmp_end_9
   ADD R6, R6, #1
   STR R2, R6, #0

   ;; Calling function printnum
   JSR printnum
   ADD R6, R6, #-1

  ;; Adding literal 2
   CONST R0, #2
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 2
   CONST R0, #2
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Greater/Equal
   LDR R0, R6, #0
   LDR R1, R6, #1
   CMP R0 R1
   BRn cmp_false_10
   CONST R2, #1
   BRnzp cmp_end_10
cmp_false_10
   CONST R2, #0
cmp_end_10
   ADD R6, R6, #1
   STR R2, R6, #0

   ;; Calling function printnum
   JSR printnum
   ADD R6, R6, #-1

  ;; Adding literal 1
   CONST R0, #1
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 2
   CONST R0, #2
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Greater/Equal
   LDR R0, R6, #0
   LDR R1, R6, #1
   CMP R0 R1
   BRn cmp_false_11
   CONST R2, #1
   BRnzp cmp_end_11
cmp_false_11
   CONST R2, #0
cmp_end_11
   ADD R6, R6, #1
   STR R2, R6, #0

   ;; Calling function printnum
   JSR printnum
   ADD R6, R6, #-1

   ;; Calling function endl
   JSR endl
   ADD R6, R6, #-1

  ;; Adding literal 2
   CONST R0, #2
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 1
   CONST R0, #1
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Greater Than
   LDR R0, R6, #0
   LDR R1, R6, #1
   CMP R0 R1
   BRnz cmp_false_12
   CONST R2, #1
   BRnzp cmp_end_12
cmp_false_12
   CONST R2, #0
cmp_end_12
   ADD R6, R6, #1
   STR R2, R6, #0

   ;; Calling function printnum
   JSR printnum
   ADD R6, R6, #-1

  ;; Adding literal 2
   CONST R0, #2
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 2
   CONST R0, #2
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Greater Than
   LDR R0, R6, #0
   LDR R1, R6, #1
   CMP R0 R1
   BRnz cmp_false_13
   CONST R2, #1
   BRnzp cmp_end_13
cmp_false_13
   CONST R2, #0
cmp_end_13
   ADD R6, R6, #1
   STR R2, R6, #0

   ;; Calling function printnum
   JSR printnum
   ADD R6, R6, #-1

  ;; Adding literal 1
   CONST R0, #1
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 2
   CONST R0, #2
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Greater Than
   LDR R0, R6, #0
   LDR R1, R6, #1
   CMP R0 R1
   BRnz cmp_false_14
   CONST R2, #1
   BRnzp cmp_end_14
cmp_false_14
   CONST R2, #0
cmp_end_14
   ADD R6, R6, #1
   STR R2, R6, #0

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