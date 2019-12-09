        .CODE

        .FALIGN
square
   ;; Saving previous frame
   ADD R6, R6, #-3
   STR R7, R6, #1
   STR R5, R6, #0
   ADD R5, R6, #0

   ;; Multiply
   LDR R0, R6, #0
   LDR R1, R6, #1
   MUL R0, R0, R1
   STR R0, R6, #1
   ADD R6, R6, #1

   ;; Epilogue before return
   LDR R7, R6, #0
   STR R7, R5, #2
   ADD R6, R5, #0
   LDR R5, R6, #0
   LDR R7, R6, #1
   ADD R6, R6, #2
   RET
        .FALIGN
main
   ;; Saving previous frame
   ADD R6, R6, #-3
   STR R7, R6, #1
   STR R5, R6, #0
   ADD R5, R6, #0

  ;; Adding literal 4
   CONST R0, #4
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Calling function square
   JSR square

   ;; Calling function printnum
   JSR printnum

   ;; Calling function endl
   JSR endl

  ;; Adding literal 5
   CONST R0, #5
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Calling function square
   JSR square

   ;; Calling function printnum
   JSR printnum

   ;; Calling function endl
   JSR endl

   ;; Epilogue before return
   LDR R7, R6, #0
   STR R7, R5, #2
   ADD R6, R5, #0
   LDR R5, R6, #0
   LDR R7, R6, #1
   ADD R6, R6, #2
   RET