#lang racket

; 遍历
(define (my-map func lst)
  (cond [(empty? lst) empty]
        [else (cons (func (first lst))
                    (my-map func (rest lst)))]))

; add1
(my-map (lambda (x) (+ x 1)) '(1 2 3 4 5))

; 筛选
(define (my-filter pred lst)
  (cond [(empty? lst) empty]
        [(pred (first lst))
         (cons (first lst) (my-filter pred (rest lst)))]
        [else (my-filter pred (rest lst))]
        ))
; pred = x > 0
(my-filter (lambda (x) (> x 0)) '(-1 2 -3 4 -5 6))

; ormap
(define (my-ormap pred lst)
  (cond [(empty? lst) #f]
        [else (or (pred (first lst))
                  (my-ormap pred (rest lst)))]))

(my-ormap (lambda (x) (> x 5)) '(-1 2 -3 4 -5 6))

; andmap
(define (my-andmap pred lst)
  (cond [(empty? lst) #t]
        [else (and (pred (first lst))
                   (my-andmap pred (rest lst)))]))

(my-andmap (lambda (x) (> x 5)) '(-1 2 -3 4 -5 6))
