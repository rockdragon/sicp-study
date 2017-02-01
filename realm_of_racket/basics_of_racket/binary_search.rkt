#lang racket

(define lower 1)
(define upper 100)

(define (start n m)
  (set! lower n)
  (set! upper m))

(define (guess)
  (quotient (+ lower upper) 2))

(define (smaller)
  (set! upper (max lower (sub1 (guess))))
  (guess))

(define (bigger)
  (set! lower (min upper (add1 (guess))))
  (guess))

; example:
(start 1 1000)
(guess)
(smaller)
(bigger)
