#lang racket

; 中值定理：
;       f'(x) = (f(b) - f(a)) / (b - a)
;   ⟹ f'(x) = (f(x+∂) - f(x-∂)) / (2 * ∂)
(define (d/dx fun)
  (define ∂ (/ 1 100000))
  (lambda (x)
    (/ (- (fun (+ x ∂)) (fun (- x ∂))) 2 ∂)))
