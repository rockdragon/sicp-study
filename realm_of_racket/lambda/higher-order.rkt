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
