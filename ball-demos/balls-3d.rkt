#lang racket
(require 2htdp/image)
(require 2htdp/universe)
(require racket/random)

(define timescale 0.1)
(define SCENE-WIDTH 800)
(define SCENE-HEIGHT 600)
(define SCENE-DEPTH 600)
(define MT (empty-scene SCENE-WIDTH SCENE-HEIGHT))
;; <hacky code to draw a "cuboid">
(define CUBOID (add-line 
                (add-line
                 (add-line
                  (add-line
                   (place-image (rectangle (- SCENE-WIDTH 40) (- SCENE-HEIGHT 40) "outline" "black")
                                (/ SCENE-WIDTH 2)
                                (/ SCENE-HEIGHT 2)
                                MT)
                   0 0 20 20 "black")
                  SCENE-WIDTH 0 (- SCENE-WIDTH 20) 20 "black")
                 0 SCENE-HEIGHT 20 (- SCENE-HEIGHT 20) "black")
                SCENE-WIDTH SCENE-HEIGHT (- SCENE-WIDTH 20) (- SCENE-HEIGHT 20) "black"))
;; </hacky code to draw a "cuboid">

(define DEFAULT-ACCEL -25)
(define DEFAULT-COLORS '("red" "orange" "yellow" "green" "blue" "purple" "pink"))
(define DEFAULT-BALL-NUMBER 10)
(define DEFAULT-BOUNCE-FACTOR 1)
(define DEFAULT-BALL-WIDTH 10)

;; Vector Interface
(define (make-list-vec x y z) (list x y z))
(define (vec-x v) (car v))
(define (vec-y v) (cadr v))
(define (vec-z v) (caddr v))
(define (add-vectors v1 v2) (map + v1 v2))
(define (scale-vector v s) (map (lambda (x) (* x s)) v))

;; Ball Interface
(define-struct Ball (position
                     velocity
                     acceleration
                     bounce-factor
                     width
                     color))

(define (default-ball)
  (let ([rand-X0 (random SCENE-WIDTH)]
        [rand-Y0 (random SCENE-HEIGHT)]
        [rand-Z0 (random SCENE-DEPTH)]
        [rand-Vx0 (- (random 80) 40)]
        [rand-Vy0 (- (random 80) 40)]
        [rand-Vz0 (- (random 80) 40)]
        [rand-Gx0 (- (random 20) 10)]
        [rand-Gy0 (- (random 20) 10)]
        [rand-Gz0 (- (random 20) 10)]
        [rand-width (random 10 30)]
        [rand-color (random-ref DEFAULT-COLORS)])
    (make-Ball (make-list-vec rand-X0 rand-Y0 rand-Z0)
               (make-list-vec rand-Vx0 rand-Vy0 rand-Vz0)
               (make-list-vec 0 0 DEFAULT-ACCEL) ; try (make-list-vec rand-Gx0 rand-Gy0 rand-Gz0) for weirdness!
               DEFAULT-BOUNCE-FACTOR
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

(define (bounce-ball-on-axis ball vec-axis scene-dimension flip)
  (let ([coord (vec-axis (Ball-position ball))]
        [vcoord (vec-axis (Ball-velocity ball))]
        [bw (Ball-width ball)])
    (if (or (and (<= coord bw) (< vcoord 0))
            (and (>= coord (- scene-dimension bw)) (> vcoord 0)))
        (make-Ball (Ball-position ball)
                   (flip (Ball-velocity ball))
                   (Ball-acceleration ball)
                   (Ball-bounce-factor ball)
                   (Ball-width ball)
                   (Ball-color ball))
        ball)))

(define (bounce-ball-x-axis ball)
  (bounce-ball-on-axis
   ball
   vec-x
   SCENE-WIDTH
   (lambda (vel) (make-list-vec (- (* (Ball-bounce-factor ball) (vec-x vel))) (vec-y vel) (vec-z vel)))))

(define (bounce-ball-y-axis ball)
  (bounce-ball-on-axis
   ball
   vec-y
   SCENE-HEIGHT
   (lambda (vel) (make-list-vec (vec-x vel) (- (* (Ball-bounce-factor ball) (vec-y vel))) (vec-z vel)))))

(define (bounce-ball-z-axis ball)
  (bounce-ball-on-axis
   ball
   vec-z
   SCENE-DEPTH
   (lambda (vel) (make-list-vec (vec-x vel) (vec-y vel) (- (* (Ball-bounce-factor ball) (vec-z vel)))))))

;; World Interface
;; World struct used rather than just a ball list, just in case I want to add more stuff
(define-struct World (balls))
(define WORLD-START (make-World (make-default-balls DEFAULT-BALL-NUMBER)))

(define (move-balls world)
  (define (update-and-bounce-balls balls)
    (if (null? balls)
        '()
        (cons (bounce-ball-x-axis (bounce-ball-y-axis (bounce-ball-z-axis (update-ball-vectors (car balls)))))
              (update-and-bounce-balls (cdr balls)))))
  (make-World (update-and-bounce-balls (World-balls world))))

;; Drawing Interface
;; NB: Representation of depth here is pretty arbitrary, there's probably a more scientific approach.
(define (draw-ball ball)
  (let ([max-width (Ball-width ball)])
    (let ([width-to-draw (+ (* max-width 0.1) (* max-width 0.9 (/ (vec-z (Ball-position ball)) SCENE-DEPTH)))])
      (circle (cond [(< width-to-draw 0) 0]
                    [(> width-to-draw max-width) max-width]
                    [else width-to-draw]) "solid" (Ball-color ball)))))

(define (draw-all world)
  (define (draw-balls balls)
    (if (null? balls)
        CUBOID
        (let ([ball (car balls)]
              [rest (cdr balls)])
          (place-image (draw-ball ball)
                       (vec-x (Ball-position ball))
                       (- SCENE-HEIGHT (vec-y (Ball-position ball)))
                       (draw-balls rest)))))
  (draw-balls (World-balls world)))

;; public static void main () 
(big-bang WORLD-START
          (on-tick move-balls)
          (to-draw draw-all))