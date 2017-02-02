#lang racket

(symbol=? 'foo 'foo)

(expt 2 10)

(sqrt -1.0)

(* (sqrt -1) (sqrt -1))

(/ 4 6)

(substring (string-append "Hello," "world") 6)

; cons
(cons 1 (cons 2 (cons 3 empty)))
