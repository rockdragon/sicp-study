; 对数级别的乘积
(define (multi-log a n)
  (define (double a) (+ a a))

  (define (halve a) (/ a 2))

  (cond ((= n 0) 0)
        ((even? n) (double (multi-log a (halve n))))
        ((odd? n) (+ a (multi-log a (- n 1)))))
)

(multi-log 2 1024)
