#lang racket
(require 2htdp/universe 2htdp/image)

(struct interval (small big))

(define WIDTH  480)
(define HEIGHT 240)
(define TEXT-SIZE 16)
(define TEXT-X 10)
(define TEXT-LOWER-Y 40)
(define TEXT-UPPER-Y 200)
(define SIZE 32)
(define COLOR "red")
(define HELP-TEXT
  (text " for larger numbers, for smaller ones"
        TEXT-SIZE
        "blue"))
(define HELP-TEXT2
  (text "Press = when your number is guessed; q to quit."
        TEXT-SIZE
        "blue"))

(define MT-SC
  (place-image/align
   HELP-TEXT TEXT-X TEXT-UPPER-Y "left" "top"
   (place-image/align
    HELP-TEXT2 TEXT-X TEXT-LOWER-Y "left" "bottom"
    (empty-scene WIDTH HEIGHT))))

(define (guess w)
  (quotient (+ (interval-small w) (interval-big w)) 2))

(define (smaller w)
  (interval (interval-small w)
            (max (interval-small w) (sub1 (guess w)))))

(define (bigger w)
  (interval (min (interval-big w) (add1 (guess w)))
            (interval-big w)))

(define (deal-with-guess w a-key)
  (cond
    [(key=? a-key "up") (bigger w)]
    [(key=? a-key "down") (smaller w)]
    [(or (key=? a-key "q")
         (key=? a-key "="))
     (stop-with w)]
    [else w]
    ))

(define (render w)
  (overlay (text (number->string (guess w)) SIZE COLOR) MT-SC))

(define (render-last-scene w)
  (overlay (text "End" SIZE COLOR) MT-SC))

(define (single? w)
  (= (interval-small w) (interval-big w)))

(define (start lower upper)
  (big-bang (interval lower upper)
            (on-key deal-with-guess)
            (to-draw render)
            (stop-when single? render-last-scene)))

(start 1 100)