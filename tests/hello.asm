

      .CODE
      .FALIGN
fun
   ;; Saving previous frame
   ADD R6, R6, #-3
   STR R7, R6, #1
   STR R5, R6, #0
   ADD R5, R6, #0

   ;; IF STATEMENT
   BRnz ELSE_0

   ;; IF STATEMENT
   BRnz ELSE_1

   ;; IF STATEMENT
   BRnz ELSE_2

   ;; ELSE STATEMENT
   BRnzp ENDIF_2
ELSE_2

  ;; Adding literal 2
   CONST R0, #2
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; ENDIF STATEMENT
ENDIF_2

   ;; ELSE STATEMENT
   BRnzp ENDIF_1
ELSE_1

   ;; IF STATEMENT
   BRnz ELSE_3

   ;; ELSE STATEMENT
   BRnzp ENDIF_3
ELSE_3

   ;; ENDIF STATEMENT
ENDIF_3

   ;; ENDIF STATEMENT
ENDIF_1
ELSE_0

   ;; Epilogue before return
   LDR R7, R6, #0
   STR R7, R5, #2
   ADD R6, R5, #0
   LDR R5, R6, #0
   LDR R7, R6, #1
   ADD R6, R6, #3
   RET