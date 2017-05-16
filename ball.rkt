;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname pastoral-image) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(define timescale 0.03)
(define SCENE-WIDTH 400)
(define SCENE-HEIGHT 400)
(define BALL-WIDTH 10)
(define MT (empty-scene SCENE-WIDTH SCENE-HEIGHT))

(define ACCEL -60)
(define BOUNCE-FACTOR 0.8)
(define H0 300)
(define X0 (/ SCENE-WIDTH 2))
(define V0 0)

(define-struct World (height speed))
(define WORLD-START (make-World H0 V0))

(define (draw-all world)
  (place-image
   (circle BALL-WIDTH "solid" "olive")
   X0 (- SCENE-HEIGHT (World-height world)) 
   MT))

(define (move-ball world)
  (bounce-if-underground (make-World
                          (update-position (World-height world) (World-speed world)) ; New position
                          (update-velocity (World-speed world) ACCEL); New velocity
                          )))

(define (update-position x v)
  (+ x (* timescale v)))

(define (update-velocity v a)
  (+ v (* timescale a)))

(define (bounce-if-underground world)
  (if (> (World-height world) (/ BALL-WIDTH 2))
      world
      (make-World
       (/ BALL-WIDTH 2)
       (- (* BOUNCE-FACTOR (World-speed world))))))