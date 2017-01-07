; 书上的
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 3 3)

; 原始定义：https://zh.wikipedia.org/wiki/%E9%98%BF%E5%85%8B%E6%9B%BC%E5%87%BD%E6%95%B8
(define (ACK m n)
  (cond ((= m 0) (+ n 1))
        ((= n 0) (ACK (- m 1) 1))
        (else (ACK (- m 1) (ACK m (- n 1))))))
