#lang racket

(define lazy+
  (delay (apply + (build-list 5000000 values))))

(force lazy+)