#lang racket

; structure definition
(struct student (name id# dorm) #:transparent)

; instance
(define joe (student 'joe 1234 'DobbyHall))

; accessor
(student-name joe)
(student-id# joe)
(student-dorm joe)

; members: point-x point-y point?
(struct point (x y) #:transparent)

; pythagorean theorem
(define (distance-to-origin p)
    (sqrt (+ (sqrt (point-x p)) (sqrt (point-y p)))))
