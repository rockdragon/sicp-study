; 线性递归算幂
(define (fast-exp m n)
  (define (fast-exp-iter m n acc)
    (cond ((= n 0) 1)
          ((= n 1) (* acc m))
          (else (fast-exp-iter m (- n 1) (* acc m)))
          ))
  (fast-exp-iter m n 1)
)

; O(Log(n))次 递归算幂
(define (fast-expt b n)
  (define (square x) (* x x))
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt  b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(fast-expt 6 3)
