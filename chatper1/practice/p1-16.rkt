; 线性迭代算幂
(define (fast-exp m n)
  (define (fast-exp-iter m n acc)
    (cond ((= n 0) 1)
          ((= n 1) (* acc m))
          (else (fast-exp-iter m (- n 1) (* acc m)))
          ))
  (fast-exp-iter m n 1)
)
