#lang racket

; structure definition
(struct student (name id# dorm) #:transparent)

; instance
(define joe (student 'joe 1234 'DobbyHall))

; accessor
(student-name joe)
(student-id# joe)
(student-dorm joe)
