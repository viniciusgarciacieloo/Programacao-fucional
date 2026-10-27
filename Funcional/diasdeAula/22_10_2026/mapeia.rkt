#lang racket

(require rackunit)

(define (mapeia f lst)
    (cond  
        [(empty? lst) empty]
        [else (cons (f (first lst)) (mapeis f (rest  lst)))]))

; O mapeia criado aqui é a função pronta do racket MAP