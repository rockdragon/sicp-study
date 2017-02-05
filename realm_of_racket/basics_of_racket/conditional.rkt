#lang racket

; if form
(if (odd? 5)
    'odd-number
    (/ 1 0))

; cond form
(define x 7)
(cond   [(= x 7)]
        [(odd? x) 'odd-number]
        [else 'even-number'])

; recursion form
(define (length list)
    (if (empty? list)
        0
        (add1 (length (rest list)))))

; when: perform action if its condition return #t
(when (and file-modified (ask-user-about-saving))
    (save-file))

; unless: perform action if its condition return #f
(unless (ask-user-whether-to-keep-file)
    (delete-file))

; take value via key in list
(define tasks '(1 clean 3 homework 4 party))
(define (take-value key lst)
  (define members (member key lst))
  (if members
      (second members)
      '()))

(take-value 2 tasks)
