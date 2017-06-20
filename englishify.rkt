;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname englishify) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Number -> String
;; Convert a whole number to its english representation in words

(define (number-0-to-99->english N)
  (if (< N 20)
      (number-0-to-19->english N)
      (number-20-to-99->english N)))

(define (number-20-to-99->english N)
  ;; append the "tens" in words to the "units" in words
  (string-append (tens->english           (quotient N 10))
                 (number-0-to-19->english (remainder N 10))))

;; Number -> String
;; argument must be a whole number between 2 and 9
;; Convert 2, 3, 4, ... 9 to "twenty", ... "ninety"
(define (tens->english N)
  (cond [(= N 2) "twenty"]
        [(= N 3) "thirty"]
        [(= N 4) "forty"]
        [(= N 5) "fifty"]
        [(= N 6) "sixty"]
        [(= N 7) "seventy"]
        [(= N 8) "eighty"]
        [(= N 9) "ninety"]))
  
(define (number-0-to-19->english N)
  (cond [(zero? N) "zero"]
        [(= N 1) "one"]
        [(= N 2) "two"]
        [(= N 3) "three"]
        [(= N 4) "four"]
        [(= N 5) "five"]
        [(= N 6) "six"]
        [(= N 7) "seven"]
        [(= N 8) "eight"]
        [(= N 9) "nine"]
        [(= N 10) "ten"]
        [(= N 11) "eleven"]
        [(= N 12) "twelve"]
        [(= N 13) "thirteen"]
        [(= N 14) "fourteen"]
        [(= N 15) "fifteen"]
        [(= N 16) "sixteen"]
        [(= N 17) "seventeen"]
        [(= N 18) "eighteen"]
        [(= N 19) "nineteen"]))