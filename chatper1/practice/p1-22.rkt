#lang racket

(include "../prime.rkt")

(#%require (only racket/base current-milliseconds))
(define (runtime) (current-milliseconds))

(define (next-odd n)
    (if (odd? n)
        (+ 2 n)
        (+ 1 n)))

(define (search-for-primes n)
    (let ((start-time (runtime)))
        (continue-primes n 3)
        (report-time (- (runtime) start-time))        
      ))

(define (continue-primes n count)
    (cond ((= count 0)
            (display "are primes."))
          ((prime? n)
            (display n)
            (newline)
            (continue-primes (next-odd n) (- count 1)))
          (else
            (continue-primes (next-odd n) count))))

(define (report-time elapsed-time)
  (display " total: ")  
  (display (string-append(number->string elapsed-time) " seconds")))

(search-for-primes 100000000)
