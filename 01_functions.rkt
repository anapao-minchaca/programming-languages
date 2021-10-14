#|
First examples of functions in Racket

Ana Paola Minchaca
2021-08-17
|#

; Indicate the language we need to interpret this file
#lang racket

; Declare the functions in this file
(provide triangle-area)

(define (triangle-area base height)
  (/ (* base height) 2.0))

(define (years-to-100 age current-year)
  (+ (- 100 age) current-year))

(define (lustrum-year birth-year current-year)
  (/ (- current-year birth-year) 5.0))

(define (weight initial-weight final-weight months)
  (/ (- initial-weight final-weight) months))

(define (pendiente x1 y1 x2 y2)
  (/ (- y2 y1) (- x2 x1)))

(define (cost num_messages megas num_minutes)
  (* 0.80 (+ num_messages megas num_minutes)))

(define (distance x1 y1 x2 y2)
  (sqrt (+ (sqr (- x2 x1)) (sqr(- y2 y1)))))


; first examples of recursion

;(define (factorial n)
  ;(if (= n 0) 1 (*(factorial(- n 1))n)))

; regular recursion

(define (factorial n)
  (if (zero? n)
      1
      (* n (factorial (sub1 n)))))

; tail recursion
(define (fact-tail n a)
  (if (zero? n)
      a
      (fact-tail (sub1 n) (* n a))))