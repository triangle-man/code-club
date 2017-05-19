#lang racket
(require 2htdp/image)
(require 2htdp/universe)
(require racket/random)

(define timescale 0.05)
(define SCENE-WIDTH 800)
(define SCENE-HEIGHT 600)
(define MT (empty-scene SCENE-WIDTH SCENE-HEIGHT))
(define DEFAULT-ACCEL -150)
(define DEFAULT-COLORS '("red" "orange" "yellow" "green" "blue" "purple" "pink"))
(define DEFAULT-BALL-NUMBER 150)
(define DEFAULT-BOUNCE-FACTOR 1)

;; Vector Interface
(define (make-2d-vec x y) (vector x y))
(define (vec-x v) (vector-ref v 0))
(define (vec-y v) (vector-ref v 1))
(define (add-vectors v1 v2) (vector-map + v1 v2))
(define (scale-vector v s) (vector-map (lambda (x) (* x s)) v))
(define vec-0 (make-2d-vc 0 0))

;; Ball Interface
(define-struct Ball (position
                     velocity
                     acceleration
                     bounce-factor
                     width
                     color))

(define (default-ball) ; Good question here: why is this `(default-ball)` instead of `default-ball`?
  (let ([rand-X0 (random SCENE-WIDTH)]
        [rand-Y0 (random SCENE-HEIGHT)]
        [rand-Vx0 (- (random 80) 40)]
        [rand-Vy0 (- (random 80) 40)]
        [rand-width (random 5 25)]
        [rand-gx (- (random 20) 10)]
        [rand-gy (- (random 20) 10)]
        [rand-color (random-ref DEFAULT-COLORS)])
    (make-Ball (make-2d-vec rand-X0 rand-Y0)
               (make-2d-vec rand-Vx0 rand-Vy0)
               (make-2d-vec rand-gx rand-gy) ; try (make-2d-vec 0 DEFAULT-ACCEL) for physics!
               DEFAULT-BOUNCE-FACTOR ; try (+ 0.79 (/ 1 width)) for ball bounciness based on size!
               rand-width
               rand-color)))

(define (make-default-balls n)
  (if (<= n 0)
      '()
      (cons (default-ball) (make-default-balls (- n 1)))))

(define (update-position pos vel)
  (add-vectors pos (scale-vector vel timescale)))

(define (update-velocity vel acc)
  (add-vectors vel (scale-vector acc timescale)))

(define (update-ball-vectors ball)
  (make-Ball (update-position (Ball-position ball) (Ball-velocity ball))
             (update-velocity (Ball-velocity ball) (Ball-acceleration ball))
             (Ball-acceleration ball)
             (Ball-bounce-factor ball)
             (Ball-width ball)
             (Ball-color ball)))

;; Physics of bouncing is modelled pretty terribly here.
;; The bounce only decreases the magnitude of the "flipped" component of velocity.
(define (bounce-ball-x-axis ball)
  (define (flip velocity) (make-2d-vec (- (* (Ball-bounce-factor ball) (vec-x velocity))) (vec-y velocity)))
  (let ([x (vec-x (Ball-position ball))]
        [vx (vec-x (Ball-velocity ball))]
        [bw (Ball-width ball)])
    (if (or (and (<= x bw) (< vx 0))
            (and (>= x (- SCENE-WIDTH bw)) (> vx 0)))
        (make-Ball (Ball-position ball)
                   (flip (Ball-velocity ball))
                   (Ball-acceleration ball)
                   (Ball-bounce-factor ball)
                   (Ball-width ball)
                   (Ball-color ball))
        ball)))

(define (bounce-ball-y-axis ball)
  (define (flip velocity) (make-2d-vec (vec-x velocity) (- (* (Ball-bounce-factor ball) (vec-y velocity)))))
  (let ([y (vec-y (Ball-position ball))]
        [vy (vec-y (Ball-velocity ball))]
        [bw (Ball-width ball)])
    (if (or (and (<= y bw) (< vy 0))
            (and (>= y (- SCENE-HEIGHT bw)) (> vy 0)))
        (make-Ball (Ball-position ball)
                   (flip (Ball-velocity ball))
                   (Ball-acceleration ball)
                   (Ball-bounce-factor ball)
                   (Ball-width ball)
                   (Ball-color ball))
        ball)))

;; World Interface
;; World struct used rather than just a ball list, just in case I want to add more stuff
(define-struct World (balls))
(define WORLD-START (make-World (make-default-balls DEFAULT-BALL-NUMBER)))

(define (move-balls world)
  (define (update-and-bounce-balls balls)
    (if (null? balls)
        '()
        (cons (bounce-ball-x-axis (bounce-ball-y-axis (update-ball-vectors (car balls))))
              (update-and-bounce-balls (cdr balls)))))
  (make-World (update-and-bounce-balls (World-balls world))))

;; Drawing Interface
(define (draw-all world)
  (define (draw-balls balls)
    (if (null? balls)
        MT
        (let ([ball (car balls)]
              [rest (cdr balls)])
          (place-image (circle (Ball-width ball) "solid" (Ball-color ball))
                       (vec-x (Ball-position ball))
                       (- SCENE-HEIGHT (vec-y (Ball-position ball)))
                       (draw-balls rest)))))
  (draw-balls (World-balls world)))

;; Main
(big-bang WORLD-START
          (on-tick move-balls)
          (to-draw draw-all))
