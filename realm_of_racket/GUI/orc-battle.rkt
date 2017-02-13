#lang racket

(require rackunit)
(require 2htdp/universe 2htdp/image)

; structures
(struct orc-world (player lom attack#) #:transparent)
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
(equal? (first players) (third players))

(check-equal? (first players) (third players))

