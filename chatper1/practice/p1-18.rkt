; log(n)级别的乘法
(define (multi a b)
  (define (double a) (+ a a))
  (define (halve a) (/ a 2))
  (define (multi-iter a b product)
    (cond ((= b 0)
           product)
          ((even? b)
           (multi-iter (double a)
                       (halve b)
                       product))
          ((odd? b)
           (multi-iter a
                       (- b 1)
                       (+ a product))))
  )

  (multi-iter a b 0)
)

(multi 10 20)
