#|

HW_02: Racket Recursion

Ana Paola Minchaca
30-08-21

|#

#lang racket

; FUNCTION: get-pi-regular computes the value of pi using the infinite series with regular recursion
; INPUT: number of terms to compute
; OUTPUT: approximation of the value pi

(define (get-pi-regular term)
  (if (= term 0) 0 ; in case the term equals 0
      (if (= term 1) 4 ; base case
          (+ (/ (* (expt -1 (+ term 1)) 4)(- (* term 2) 1))(get-pi-regular(sub1 term)))
          ; implementation of the infinite series with regular recursion 
          )
      )
  )

; FUNCTION: get-pi computes the value of pi using the infinite series with tail recursion
; INPUT: number of terms to compute
; OUTPUT: approximation of the value pi

(define (get-pi term)
  (define (get-pi-tail term a) ; defining the tail recursion function 
    (if (= term 0) 0 ; in case the term equals 0
        (if (= term 1) a ; base case
            (get-pi-tail (sub1 term) (+ (/ (* (expt -1 (+ term 1)) 4)(- (* term 2) 1)) a))
            ; implementation of the infinite series with tail recursion
            )
        )
    )
  (get-pi-tail term 4) ; calling the tail recursion again
  )

; FUNCTION: ln-2 computes the value of the natural logarithm of 2
; using the infinite series with tail recursion
; INPUT: number of terms to compute
; OUTPUT: approximation of the natural logarithm of 2

(define (ln-2 term)
  (define (ln-2-tail term a) ; defining the tail recursion function
    (if (= term 0) 0 ; in case the term equals 0
        (if (= term 1) a ; base case 
            (ln-2-tail (sub1 term) (+ (/ 1 (* (* 2 term) (- (* 2 term) 1))) a))
            ; implementation of the infinite series with tail recursion
            )
        )
    )
  (ln-2-tail term 0.5) ; calling the tail recursion again 
  )

; FUNCTION: russian regular takes two numbers, one is multiplied by 2 and the other is divided by 2
; for any odd value of the second number, the value is added to the result
; INPUT: two numbers
; OUTPUT: multiplication between the two numbers

(define (russian-*-regular a b)
  (if (or (= a 0)(= b 0)) 0 ; if a or b equals 0 then the result is 0
      (if (= b 1) a ; base case 
          (if (= (remainder b 2) 1) ; condition if the value is odd
              (+ (russian-*-regular (* a 2) (quotient b 2)) a)
              ; if it's true then the function is called and the corresponding value of a is added 
              (russian-*-regular (* a 2) (quotient b 2))
              ; if it's false the function is called but the values of a aren't added 
              )
          )
      )
  )

; FUNCTION: russian tail takes two numbers, one is multiplied by 2 and the other is divided by 2
; for any odd value of the second number, the value is added to the result
; INPUT: two numbers
; OUTPUT: multiplication between the two numbers

(define (russian-* a b)
  (define (russian-*-tail a b add) ; defining the tail recursion function 
    (if (or (= a 0) (= b 0)) 0 ; if a or b equals 0 then the result is 0
        (if (= b 1) a ; base case
            (if (= (remainder b 2) 1) ; condition if the value is odd
                (+ (russian-*-tail (* a 2) (quotient b 2) add) a)
                ; if it's true, the tail function is called and the values of a are added
                (russian-*-tail (* a 2) (quotient b 2) 0)
                ; if it's false, the tail function is called normally so it doesn't add anything
                )
            )
        )
    )
  (russian-*-tail a b 0) ; calling the tail recursion again 
  )  
                      
