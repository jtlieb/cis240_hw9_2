

      .CODE
      .FALIGN
test
   ;; Saving previous frame
   ADD R6, R6, #-3
   STR R7, R6, #1
   STR R5, R6, #0
   ADD R5, R6, #0

  ;; Adding literal 7
   CONST R0, #7
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 8
   CONST R0, #8
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Add
   LDR R0, R6, #0
   LDR R1, R6, #1
   ADD R0, R0, R1
   STR R0, R6, #1
   ADD R6, R6, #1

   ;; Calling function printnum
   JSR printnum
   ADD R6, R6, #-1

   ;; Calling function endl
   JSR endl
   ADD R6, R6, #-1

  ;; Adding literal 15
   CONST R0, #15
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

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