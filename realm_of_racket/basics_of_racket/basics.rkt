#lang racket

(symbol=? 'foo 'foo)
(expt 2 10)
(sqrt -1.0)
(* (sqrt -1) (sqrt -1))
(/ 4 6)
(substring (string-append "Hello," "world") 6)

; custom error
(error 'heck "looks like something got wrong")

; division
(remainder 13 4)
(quotient 13 4)
(/ 13 4)

; cons
(cons 'a (cons 'b (cons 'c empty)))
; list
(list 'a 'b 'c)
; '()
'(a b c)

; list functions
(define list '(a b c))
(first list)
(rest list)
(car list)
(cdr list)

; nested list
'(cat '(monkey donkey) duck)
'('(peas carrots tomatoes) '(pork beef chicken))
