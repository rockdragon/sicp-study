#lang racket

; f(n) = f(n-1) + 2*f(n-2) + 3*(f(n-3)) if n >=3

; 递归版本
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3 ))))
                 )))

(f 7)

; 迭代版本
(define (f-tail n)
  (define (f-tail-iter n f1 f2 f3)
    (cond ((< n 3) n)
          ((= n 3) (+ f1 (* 2 f2) (* 3 f3)))
          (else (f-tail-iter (- n 1) (+ f1 (* 2 f2) (* 3 f3)) f1 f2))
          ))
  (f-tail-iter n 2 1 0)
)

(f-tail 7)
