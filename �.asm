

      .CODE
      .FALIGN
main
   ;; Saving previous frame
   ADD R6, R6, #-3
   STR R7, R6, #1
   STR R5, R6, #0
   ADD R5, R6, #0

  ;; Adding literal 1
   CONST R0, #1
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Drop
   LDR R0, R6, #0   ADD R6, R6, #-1   STR R0, R6, #0
   ;; Calling function printnum
   JSR printnum
   ADD R6, R6, #-1

   ;; Drop
   ADD R6, R6, #1
   ;; Drop
   ADD R6, R6, #1
   ;; Calling function printnum
   JSR printnum
   ADD R6, R6, #-1

   ;; Epilogue before return
   LDR R7, R6, #0
   STR R7, R5, #2
   ADD R6, R5, #0
   LDR R5, R6, #0
   LDR R7, R6, #1
   ADD R6, R6, #3
   RET