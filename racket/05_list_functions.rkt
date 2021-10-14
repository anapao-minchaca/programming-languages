#|
Functions to work with lists

Ana Paola Minchaca
2021-09-07
|#

#lang racket

(require racket/trace)

; declare the functions that you have in this file
(provide sum-list sum-list-t duplicate)

(trace-define (sum-list lst)
  (if (empty? lst)
      0
      ; Add first element plus the sum of all elements in the rest of the list
      (+ (car lst) (sum-list (cdr lst)))))

(define (sum-list-t lst)
  (trace-let loop
             ([lst lst] [result 0])
             (if (empty? lst)
                 result
                 (loop (cdr lst) (+ result(car lst))))))

(define (duplicate lst)
  (let loop
    ([lst lst] [result empty])
    (if (empty? lst)
        result
        (loop (cdr lst) (append result (list (car lst) (car lst)))))))