#lang racket

(require rackunit)
(require 2htdp/universe 2htdp/image)

; structures
(struct orc-world (player lom attack# target) #:mutable #:transparent)
(struct monster ([health #:mutable]) #:transparent)
(struct orc monster (club) #:transparent)
(struct hydra monster () #:transparent)
(struct slime monster (sliminess) #:transparent)
(struct brigand monster () #:transparent)
(struct player (health agility strength) #:mutable #:transparent)

; constants
(define MAX-HEALTH 35)
(define MAX-AGILITY 35)
(define MAX-STRENGTH 35)
(define CLUB-STRENGTH 10)
(define MONSTER-HEALTH0 10)
(define DAMAGE 2)
(define HEALTH 2)
(define LOSE "LOSE")
(define WIN "WIN")
(define PER-ROW 4)
(define MONSTER# 12)

; functions
(define (interval+ v delta mx)
  (define calculated (+ v delta))
  (if (<= calculated mx) calculated mx))

(define (player-update! setter selector mx)
  (lambda (player delta)
    (setter player (interval+ (selector player) delta mx))))

(define player-health+
  (player-update! set-player-health! player-health MAX-HEALTH))

(define player-strength+ 
  (player-update! set-player-strength! player-strength MAX-STRENGTH))

(define (start)
  (big-bang (initialize-orc-world)
            (on-key player-acts-on-monsters)
            (to-draw render-orc-battle)
            (stop-when end-of-orc-battle? render-the-end)))

(define (initialize-orc-world)
  (define player0 (initialize-player))
  (define lom0 (initialize-monster))
  (orc-world player0 lom0 (random-number-of-attacks player0) 0))

(define (end-of-orc-battle? w)
  (or (win? w) (lose? w)))

(define (win? w)
  (all-dead? (orc-world-lom w)))

(define (lose? w)
  (player-dead? (orc-world-player w)))

(define (render-the-end w)
  (render-orcß-world w #f (message (if (lose? w) LOSE WIN))))

(define (player-acts-on-monster w k)
  (cond
    [(zero? (orc-world-attack# w)) (void)]
    [(key=? "s" k) (stab w)]
    [(key=? "h" k) (heal w)]
    [(key=? "f" k) (flail w)]
    [(key=? "e" k) (end-turn w)]
    [(key=? "n" k) (initialize-orc-world)]
    [(key=? "right" k) (move-target w +1)]
    [(key=? "left" k) (move-target w -1)]
    [(key=? "down" k) (move-target w (+ PER-ROW))]
    [(key=? "up" k) (move-target w (- PER-ROW))])
  (give-monster-turn-if-attack#=0 w)
  )


; invocation
(check-equal? (let ([p (player 1 2 3)])
                (player-strength+ p -3)
                p)
              (player 1 2 0))

(define player1 (player 1 2 3))
(set-player-health! player1 33)
(define player2 (player 10 20 30))
(set-player-health! player2 66)
(define player3 player1)
(set-player-agility! player3 666)
(define players (list player1 player2 player3))

(define lom (list (orc 9 3) (orc 9 4) (orc 9 1)))
(define owl (orc-world 'some-player lom 2 0))
(list-ref (orc-world-lom owl) 2)

