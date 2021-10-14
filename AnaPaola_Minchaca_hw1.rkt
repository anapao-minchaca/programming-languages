#|
HW_01 Racket Functions

Ana Paola Minchaca García
2021-08-22
|#

#lang racket

; FUNCTION: is-triangle? determines if the lengths make a valid triangle
; INPUT: the length of three sides
; OUTPUT: returns a boolean

(define (is-triangle? a b c)
  (cond
    [(and (> (+ a b) c) (> (+ b c) a) (> (+ c a) b)) #t] ; valid if two sides are greater than the third side
    [(or (<= a 0) (<= b 0) (<= c 0)) #f] ; not valid if sides are lower than 0
    (else #f)))

; FUNCTION: triangle-type determines the type of the triangle
; INPUT: the length of three sides using the is-triangle function
; OUTPUT: returns 'INVALID, 'EQUILATERAL, 'ISOCELES, 'SCALENE

(define (triangle-type a b c)
  (cond
    [(not (is-triangle? a b c)) 'INVALID] ; it is not a valid triangle
    [(and (= a b) (= b c)) 'EQUILATERAL] ; all sides are equal
    [(or (= a b) (= b c) (= c a)) 'ISOCELES] ; any of it's two sides are equal
    (else 'SCALENE)))

; FUNCTION: point-quadrant see the quadrant where the 2D point is located
; INPUT: the coordinates of a 2D point
; OUTPUT: returns 'ORIGIN, 'X_AXIS, 'Y_AXIS, 'I, 'II, 'III, 'IV

(define (point-quadrant x y)
  (cond
    [(and (> x 0) (> y 0)) 'I] ; x positive and y positive 
    [(and (< x 0) (> y 0)) 'II] ; x negative and y positive
    [(and (< x 0) (< y 0)) 'III] ; x negative and y negative
    [(and (> x 0) (< y 0)) 'IV] ; x positive and y negative
    [(and (= x 0) (> y 0)) 'Y_AXIS] ; x equal to 0 and y positive
    [(and (= x 0) (< y 0)) 'Y_AXIS] ; x equal to 0 and y negative
    [(and (= y 0) (> x 0)) 'X_AXIS] ; y equal to 0 and x positive
    [(and (= y 0) (< x 0))'X_AXIS] ; y equal to 0 and x negative
    (else 'ORIGIN))) ; otherwise it is on the origin

; FUNCTION: parking-ticket determines how much you should pay in a parking lot
; INPUT: number of hours, minutes and the symbol 'STAMPED, 'UNSTAMPED, 'LOST
; OUTPUT: returns the amount to pay for parking time

(define (parking-ticket hours minutes symbol)
  (case symbol ; we dividide it in symbols, depending if it's STAMPED, UNSTAMPED or LOST
    ['STAMPED ; STAMPED condition
     (cond
       [(and (= hours 0)(= minutes 0)) 0] ; if there is no time, the person has to pay $0
       [(or (and (<= hours 2) (< minutes 1)) (< hours 2)) 5] ; pay $5 for the first 2 hours or less
       [(or (and (<= hours 3) (< minutes 1)) (and (= hours 2)(> minutes 1)))  (+ 5 12)] ; pay an additional $12 to the $5 for the third hour or less 
       [(cond
          [(and (>= hours 3) (and (>= minutes 0) (<= minutes 15))) (+ (* (- hours 2) 12) 5 5)] ; condition for the first fraction of hour for every additional 15 minutes after the third hour
          [(and (>= hours 3) (and (>= minutes 0) (<= minutes 30))) (+ (* (- hours 2) 12) 5 5 3)] ; condition for the second fraction of hour for every additional 30 minutes after the third hour
          [(and (>= hours 3) (and (>= minutes 0) (<= minutes 45))) (+ (* (- hours 2) 12) 5 5 3 2)] ; condition for the third fraction of hour for every additional 45 minutes after the third hour
          [(and (>= hours 3) (and (>= minutes 0) (<= minutes 60))) (+ (* (- hours 2) 12) 5 5 3 2 2)] ; condition for the fourth fraction of hour for every additional 60 minutes after the third hour
          )]
       )]
    ['UNSTAMPED ; UNSTAMPED condition
     (cond
       [(and (= hours 0) (= minutes 0)) 12] ; if there is no time, the person has to pay $12
       [(or (and (<= hours 1) (< minutes 1)) (< hours 1)) 12] ; pay $12 for the first hour or less
       [(cond
          [(and (>= hours 1) (and (>= minutes 1) (<= minutes 15))) (+ (* hours 12) 5)] ; condition for the first fraction of hour every additional 15 minutes after the first hour
          [(and (>= hours 1) (and (>= minutes 1) (<= minutes 30))) (+ (* hours 12) 5 3)] ; condition for the first fraction of hour every additional 30 minutes after the first hour
          [(and (>= hours 1) (and (>= minutes 1) (<= minutes 45))) (+ (* hours 12) 5 3 2)] ; condition for the first fraction of hour every additional 45 minutes after the first hour
          [(and (>= hours 1) (and (>= minutes 1) (<= minutes 60))) (+ (* hours 12) 5 3 2 2)] ; condition for the first fraction of hour every additional 60 minutes after the first hour
          )]
       )]
  ['LOST 100])) ; LOST condition: if the ticket is lost the person has to pay $100


