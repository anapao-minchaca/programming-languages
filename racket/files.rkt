#lang racket

(require 2htdp/batch-io)


; with batch-io package
(read-file "ALADDIN.txt")

(read-words/line "ALADDIN.txt")

(read-1strings "toDo.txt")

(read-lines "toDo.txt")

(write-file "toDo.txt" "Estoy en la clase de lenguajes")

(file-exists? "toDo.txt")


; with file ports
(define out (open-output-file "prueba.txt" #:exists 'append))
(display " estoy en la clase de lenguajes" out)
(close-output-port out)
(define in (open-input-file "prueba.txt"))
(read-line in)
(close-input-port in)

(define (downcase-all in)
    (for ([l (in-lines in)])
      (display (string-downcase l))
      (newline)))

(downcase-all (open-input-string
               (string-append
                "Libro de Aladdin")))

(with-input-from-file "ALADDIN.txt"
    (lambda ()
      (for/sum ([l (in-lines)]
                 #:when (string-contains? l "m"))
        1)))

