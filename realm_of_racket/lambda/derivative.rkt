#lang racket

; 中值定理：
;       f'(x) = (f(b) - f(a)) / (b - a)
;   ⟹ f'(x) = (f(x+∂) - f(x-∂)) / (2 * ∂)
(define (d/dx fun)
  (define ∂ (/ 1 100000))
  (lambda (x)
    (/ (- (fun (+ x ∂)) (fun (- x ∂))) 2 ∂)))

(define two (d/dx (lambda (x) (* 2 x))))
(map two '(2 -1 0 1 24))
; '(2 2 2 2 2)
