#|
Functions that use conditionals

Ana Paola Minchaca
2021-08-20
|#

#lang racket

; simple if, always has an else clause

(define (number-sign number)
  (if (< number 0)
      ; When expression is true
      'negative
      (if (> number 0)
          ; When expression is false
          'positive
          'zero)))

; cond allows the use of nested if conditions

(define (number-sign-cond number)
  (cond
    ((< number 0) 'negative)
    ((> number 0) 'positive)
    (else 'zero)))

; case is used to compare the specified variable against a set of values

(define (letter-to-grade letter)
  (case letter
    ['A 100]
    ['B 80]
    ['C 60]
    [else 'invalid]))

; case can be compared to a list of values

(define (month-days month)
  (case month
    [(2) 28]
    [(1 3 5 7 8 10 12) 31]
    [(4 6 9 11) 30]))

; exercises

;licencia
(define (license edad licencia)
  (cond
    ((< edad 0) 'Respuesta_incorrecta)
    ((> edad 18) '¿Tienes_identificación_oficial?
    (case licencia
      ['s 'Trámite_de_licencia_concedido]
      ['n 'No_cumples_requisitos]
      [else 'Respuesta_incorrecta]))
    (else 'No_cumples_requisitos)))

; mayor de 3 num
(define (mayor x y z)
  (cond
    [(and (> x y) (> x z)) x]
    [(and (> y x) (> y z)) y]
    [(and (> z x) (> z y)) z]))

; finding the next dat from a given date
(define (leap? year)
  (and (zero? (remainder year 4))
       (or (not (zero? (remainder year 100)))
           (zero? (remainder year 400)))))

;  (if (zero? (remainder year 4))
;     (if (not (zero? (remainder year 100)))
;         (if (zero? (remainder year 400))
;             )
;         )
;     ))

(define (next-day day month year)
  (cond
    [(= day (months-days month year))
     (if (= 12 month)
         (list 1 1 (add1 year))
         (list 1 (add1 month) year))]
    [else
     (list (add1 day) month year)]))