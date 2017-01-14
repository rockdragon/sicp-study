; 对数级别的乘积
(define (multi a n)
  (define (double a) (+ a a))

  (define (halve a) (/ a 2))

  (cond ((= n 0) 0)
        ((even? n) (double (multi a (halve n))))
        ((odd? n) (+ a (multi a (- n 1)))))
)

(multi 2 1024)
