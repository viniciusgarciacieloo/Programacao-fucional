#lang racket
(require rackunit)

(define (mapeia f lst)
    (cond  
        [(empty? lst) empty]
        [else (cons (f (first lst)) (mapeis f (rest  lst)))]))

(define (lista_quadrado lst)
    (cond  
        [(empty? lst) empty]
        [else (cons (sqr(first lst)) (lista_quadrado (rest lst)))]))

(define (lista_quadrado lst)
    (mapeia sqr lst))

(define (lista-soma1)
    (mapeia add1 lst))


; (check-equal? (lista_quadrado empty) empty)
; (check-equal? (lista_quadrado (list 5)) (list 25))
; (check-equal? (lista_quadrado (list 1 2 3 4 5)) (list 1 4 9 16 25))
