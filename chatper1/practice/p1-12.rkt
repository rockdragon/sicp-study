; 帕斯卡三角形
; row:
; 0        1
; 1       1 1
; 2      1 2 1
; 3     1 3 3 1
; 4    1 4 6 4 1
; 5   . . . . . .
; col: 0 1 2 3 4

(define (pascal row col)
  (cond ((= col 1) 1)
        ((= row col) 1)
        (else (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col)))
  ))

(pascal 5 3)
