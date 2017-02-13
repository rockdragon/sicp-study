#lang racket

; l to r
(define (my-foldl f base lst)
    (cond   [(empty? lst) base]
            [else (my-foldl f (f (first lst) base) (rest lst))]))
(my-foldl cons empty '(a b c))
; '(c b a)

; r to l
(define (my-foldr f base lst)
    (cond   [(empty? lst) base]
            [else (f (first lst) (my-foldr f base (rest lst)))]))
(my-foldr cons empty '(a b c))
; '(a b c)

; build list
(define (my-build-list n f)
  (define (builder k)
    (cond [(= n k) empty]
          [else (cons (f k) (builder (add1 k)))]))
  (builder 0))
(my-build-list 10 (lambda (x) (+ x 1)))
; '(1 2 3 4 5 6 7 8 9 10)

; apply
(define (my-sum lst) (apply + lst))
(my-sum '(1 3 4 7 9))
; 24
(define (my-max lst) (apply max lst))
(my-max '(3 1 5 2 6 4))
;6
