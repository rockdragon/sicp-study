#lang racket

(symbol=? 'foo 'foo)

(expt 2 10)

(sqrt -1.0)

(* (sqrt -1) (sqrt -1))

(/ 4 6)

(substring (string-append "Hello," "world") 6)

; cons
(cons 'a (cons 'b (cons 'c empty)))
; list
(list 'a 'b 'c)
; '()
'(a b c)
