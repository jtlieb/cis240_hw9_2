

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

  ;; Adding literal 3
   CONST R0, #3
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

   ;; Calling function printnum
   JSR printnum
   ADD R6, R6, #-1

   ;; Calling function endl
   JSR endl
   ADD R6, R6, #-1

  ;; Adding literal 7000
   CONST R0, #88
   HICONST R0, #27
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal -834
   CONST R0, #190
   HICONST R0, #252
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