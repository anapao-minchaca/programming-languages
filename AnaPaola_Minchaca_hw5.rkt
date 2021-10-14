#|

HW_05: Racket Lists

Ana Paola Minchaca
20-09-21

|#

#lang racket

(provide hailstone hailstone-list shift-char caesar-encode-helper caesar-encode)

; FUNCTION: hailstone
; INPUT: initial integer
; OUTPUT: list of numbers

(define (hailstone n)
  (if (= n 0) '() ; return an empty list
      (if (= n 1) 
           (list n) ; return a list with n
           (if (even? n) ; check if the number is even
               (cons n (hailstone (/ n 2))) ; if true, divide it by 2
               (cons n (hailstone (+ (* n 3) 1)))))))
               ; if false, multiply by 3 and add 1

; FUNCTION: hailstone-list
; INPUT: two integers, one lower limit and one upper limit
; OUTPUT: new hailstone list of lower and upper limits

(define (hailstone-list n1 n2)
  (if (> n1 n2)
      empty
      (cons (hailstone n1) (hailstone-list (+ n1 1) n2))))
       ; makes list starting from n1 all the way to n2, using hailstone function

; FUNCTION: shift-char
; INPUT: a character and an integer
; OUTPUT: new char with moved position

(define (shift-char char int)
  (if (char-alphabetic? char) ; checking if the char is an alphabetic char
          (if (>= (char->integer char) 97) ; condition for lower case range "a"
              (if (<= (char->integer char) 122) ; condition for lower case range "z"
                  (integer->char (+ (modulo (+ (- (char->integer char) 97) int) 26) 97))
                  'error)
            (if (>= (char->integer char) 65) ; condition for upper case range "A"
              (if (<= (char->integer char) 90) ; condition for upper case range "Z"
                  (integer->char (+ (modulo (+ (- (char->integer char) 65) int) 26) 65))
                  'error)
                  ' error))
     char)
)

; FUNCTION: caesar-encode-helper
; INPUT: string, integer and boolean
; OUTPUT: string encoded or decoded

(define (caesar-encode-helper string int boolean)
    (if (equal? boolean #t) ; checks if the boolean is #t
      (if (empty? string) empty
          (cond
            ; cond if we are working with strings or lists
            [(string? string) (cons (shift-char (car (string->list string)) (* int -1)) (caesar-encode-helper (cdr (string->list string)) int #t))]
            [(not(string? string)) (cons (shift-char (car string) (* int -1)) (caesar-encode-helper (cdr string) int #t))]
            )
          )
      ; if the boolean is #f
      (if (empty? string) empty
          (cond
            ; cond if we are working with strings or lists
            [(string? string) (cons (shift-char (car (string->list string)) int) (caesar-encode-helper (cdr (string->list string)) int #f))]
            [(not(string? string)) (cons (shift-char (car string) int) (caesar-encode-helper (cdr string) int #f))]
            )
          )
      )
  )

; FUNCTION: caesar-encode
; INPUT: string, integer and boolean
; OUTPUT: string of the list passed in the caesar-encode-helper function

(define (caesar-encode string int boolean)
  (list->string (caesar-encode-helper string int boolean)))
  ; using list->string function to make the list a string














