(define (fib n)
    (cond   ((= n 0) 0)
            ((= n 1) 1)
            (else   (+  (fib (- n 1))
                        (fib (- n 2))))))

(display (fib 10))

; 尾递归版本
(define (fib-tail n)
    (define (fib-iter n acc1 acc2)
      (cond ((and (< n 0) (= n 0)) 0)
            ((= n 1) acc1)
            (else (fib-iter (- n 1) acc2 (+ acc1 acc2)))))
    (fib-iter n 0 1)
)

(fib-tail 6)
