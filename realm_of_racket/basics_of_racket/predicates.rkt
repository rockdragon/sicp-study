#lang racket

(cons? '(what is that aboot?))

(real? (sqrt -1))

(struct point (x y) #:transparent)
(define pt1 (point -1 2))
(define pt2 (point -1 2))
(equal? pt1 pt2)    ; will return #t
(eq? pt1 pt2)       ; will return #f
