

      .CODE
      .FALIGN
main
   ;; Saving previous frame
   ADD R6, R6, #-3
   STR R7, R6, #1
   STR R5, R6, #0
   ADD R5, R6, #0

  ;; Adding literal 31744
   CONST R0, #0
   HICONST R0, #124
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 20
   CONST R0, #20
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 100
   CONST R0, #100
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 100
   CONST R0, #100
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 14
   CONST R0, #14
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Calling function lc4_draw_rect
   JSR lc4_draw_rect
   ADD R6, R6, #-1

  ;; Adding literal 13056
   CONST R0, #0
   HICONST R0, #51
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 20
   CONST R0, #20
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 80
   CONST R0, #80
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 80
   CONST R0, #80
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 24
   CONST R0, #24
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Calling function lc4_draw_rect
   JSR lc4_draw_rect
   ADD R6, R6, #-1

  ;; Adding literal 31744
   CONST R0, #0
   HICONST R0, #124
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 20
   CONST R0, #20
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 60
   CONST R0, #60
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 60
   CONST R0, #60
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 34
   CONST R0, #34
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Calling function lc4_draw_rect
   JSR lc4_draw_rect
   ADD R6, R6, #-1

  ;; Adding literal 13056
   CONST R0, #0
   HICONST R0, #51
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 20
   CONST R0, #20
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 40
   CONST R0, #40
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 40
   CONST R0, #40
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 44
   CONST R0, #44
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Calling function lc4_draw_rect
   JSR lc4_draw_rect
   ADD R6, R6, #-1

  ;; Adding literal 32752
   CONST R0, #240
   HICONST R0, #127
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 20
   CONST R0, #20
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 20
   CONST R0, #20
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 20
   CONST R0, #20
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

  ;; Adding literal 54
   CONST R0, #54
   HICONST R0, #0
   ADD R6, R6, #-1
   STR R0, R6, #0

   ;; Calling function lc4_draw_rect
   JSR lc4_draw_rect
   ADD R6, R6, #-1

   ;; Epilogue before return
   LDR R7, R6, #0
   STR R7, R5, #2
   ADD R6, R5, #0
   LDR R5, R6, #0
   LDR R7, R6, #1
   ADD R6, R6, #3
   RET