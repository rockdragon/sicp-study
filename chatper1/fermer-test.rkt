; 费马小定理检测素数
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1)m ))
                    m))))

(define (square n) (* n n))

(define (fermer-test n)
  (define (try-it a)
    (= a (expmod a n n)))
  (try-it (+ 1 (random (- n 1))))
  )

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermer-test n) (fast-prime? n (- times 1)))
        (else false)))
