;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname englishify) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Number -> String
;; Convert a whole number to its english representation in words

;; zero   0
;; units  1-9
;; teens  10-19
;; tens   20, 30, 40, ..., 90

(define ZERO "zero")
(define HUNDRED "hundred")
(define THOUSAND "thousand")
(define MILLION "million")
(define BILLION "billion")

;; Number (less than 10) -> String
(define (units N)
  (cond [(= N 1) "one"]
        [(= N 2) "two"]
        [(= N 3) "three"]
        [(= N 4) "four"]
        [(= N 5) "five"]
        [(= N 6) "six"]
        [(= N 7) "seven"]
        [(= N 8) "eight"]
        [(= N 9) "nine"]))

;; Number 10-19 -> String
(define (teens N)
  (cond [(= N 10) "ten"]
        [(= N 11) "eleven"]
        [(= N 12) "twelve"]
        [(= N 13) "thirteen"]
        [(= N 14) "fourteen"]
        [(= N 15) "fifteen"]
        [(= N 16) "sixteen"]
        [(= N 17) "seventeen"]
        [(= N 18) "eighteen"]
        [(= N 19) "nineteen"]))

;; Number -> String
;; argument must be a whole number between 2 and 9
;; Convert 2, 3, 4, ... 9 to "twenty", ... "ninety"
(define (tens N)
  (cond [(= N 2) "twenty"]
        [(= N 3) "thirty"]
        [(= N 4) "forty"]
        [(= N 5) "fifty"]
        [(= N 6) "sixty"]
        [(= N 7) "seventy"]
        [(= N 8) "eighty"]
        [(= N 9) "ninety"]))

;; Number -> String
(define (number->english N)
  (cond [(zero? N) ZERO]
        [(< N 10) (units N)]
        [(< N 20) (teens N)]
        [(< N 100) (number-20-to-99->english N)]
        [(< N 1000) (number-100-to-999->english N)]
        [(< N 1000000) (number-1000-to-999999->english N)]
        [else "Number too big to write."]))

;; Number -> String
;; (number-20-to-99->english 25) => "twenty-five"
;; (number-20-to-99->english 20) => "twenty"
(define (number-20-to-99->english N)
  (string-append
   (tens (quotient N 10))
   (possible-unit-suffix (remainder N 10))))

;; Number -> String
(define (number-100-to-999->english N)
  (string-append
   (units (quotient N 100))
   " "
   HUNDRED
   (possible-tens-suffix (remainder N 100))))

;; Number -> String
;; (number-1000-to-999999->english 4321) =>
;;;   "four thousand, three hundred and twenty-one"
(define (number-1000-to-999999->english N)
  STUFF GOES HERE)

;; Number -> String
(define (possible-tens-suffix N)
  (if (zero? N)
      ""
      (string-append " and " (number->english N))))
  
;; Number->String
;; (possible-suffix 0) => ""
;; (possible-suffix 3) => "-three"
(define (possible-unit-suffix N)
  (if (zero? N)
      ""
      (string-append "-" (units N))))

  

  
