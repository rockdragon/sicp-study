#lang racket


(define (make-lazy+ i)
  (lambda ()
    (apply  + (build-list (* 500 i) values))))

(define long-big-list (build-list 5000 make-lazy+))

(define (compute-every-1000th l)
  (for/list ([thunk l] [i (in-naturals)]
                       #:when (zero? (remainder i 1000)))
    (thunk)))


(compute-every-1000th long-big-list)


