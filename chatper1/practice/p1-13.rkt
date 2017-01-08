

(define (gap-between-fib-and-φ n)
  ;exp
  (define (fast-exp m n)
    (define (fast-exp-iter m n acc)
      (cond ((= n 0) 1)
            ((= n 1) (* acc m))
            (else (fast-exp-iter m (- n 1) (* acc m)))
            ))
    (fast-exp-iter m n 1))
  ;fib
  (define (fib n)
    (cond   ((= n 0) 0)
            ((= n 1) 1)
            (else   (+  (fib (- n 1))
                        (fib (- n 2))))))
  ;φ
  (define (φ n)
    (/ (fast-exp (/ (+ 1 (sqrt 5)) 2) n) (sqrt 5))
    )
  ;gap
  (abs (- (φ n) (fib n)))
)

(gap-between-fib-and-φ 5)
(gap-between-fib-and-φ 11)
(gap-between-fib-and-φ 16)
