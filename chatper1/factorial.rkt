;普通版本
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

;尾递归版本
(define (factorial-acc n acc)
  (if (= n 1)
      acc
      (factorial-acc (- n 1) (* n acc))))

(factorial-acc 6 1)
