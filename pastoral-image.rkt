;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname pastoral-image) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)

(beside/align "bottom" 
 (above
  (isosceles-triangle 40 80 "solid" "darkred")
  (overlay/xy
   (square 10 "solid" "skyblue")
   -5 -5
   (overlay/align "middle" "bottom"
                  (rectangle 12 16 "solid" "darkolivegreen")
                  (rectangle 40 35 "solid" "gold"))))
 (above
  (circle 20 "solid" "forestgreen")
  (rectangle 10 20 "solid" "brown")))