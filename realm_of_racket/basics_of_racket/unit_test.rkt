#lang racket

; structure definition
(struct point (x y) #:transparent)
(define p1 (point 10 20))
(define p2 (point 10 20))

; test cases
(require rackunit)
(check-pred number? 6)
(check-= 10 60 33 "range overflow")
