#|

Exercises

Ana Paola Minchaca
2021-09-10

|#


#lang racket

; insert without tail recursion

(provide insert insert-tail insertion-sort)

(define (insert n lst)
  (cond
    [(null? lst) (list n)]
    [(<= n (car lst)) (cons n lst)]
    [else (cons (car lst) (insert n (cdr lst)))]))

(define (insert-tail n lst)
  (let loop
    ; rlist will have all elements smaller than n 
    ([lst lst] [rlst empty])
    (cond
      ; when the input list is empty, add the new element at the end
      [(empty? lst) (append rlst (list n))]
      ; join the smaller elements, n and the larget elements
      [(< n (car lst))(append rlst (list n )lst)]
      ; keep looking for an element larger than n
      [else (loop (cdr lst) (append rlst (list (car lst))))])))

(define (insertion-sort lst)
  (let loop
    ([lst lst] [rlst empty])
    (if (empty? lst)
        rlst
        (loop (cdr lst) (insert (car lst) rlst)))))
  
