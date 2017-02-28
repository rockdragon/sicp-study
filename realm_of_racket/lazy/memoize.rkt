#lang racket

(#%require (only racket/base current-milliseconds))
(define (runtime) (current-milliseconds))
(define (report-time elapsed-time)
  (display " total: ")  
  (display (string-append(number->string elapsed-time) " seconds\n")))
(define (timer action)
    (let ((start-time (runtime)))
        (action)
        (report-time (- (runtime) start-time))        
      ))

(define (memoize suspended-c)
  (define hidden #f)
  (define run? #f)
  (lambda ()
    (cond [run? hidden]
          [else (set! hidden (suspended-c))
                (set! run? #t)
                hidden]
          )))

(define (lst n) (lambda () (build-list n (lambda (i) i))))

(define lst_n (memoize (lst 100000)))


(timer lst_n)
(timer lst_n)
(timer lst_n)


