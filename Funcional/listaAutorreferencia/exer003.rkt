#lang racket

; 3. Faça uma função que receba dois números, a e b, e retorne uma lista com os
; números inteiros no intervalo [a, b]. Quando a < b, a lista deve ser vazia.
; Exemplos:
; > (intervalo 1 6)
; '(1 2 3 4 5 6)
; > (intervalo 3 14)
; '(3 4 5 6 7 8 9 10 11 12 13 14)
; > (intervalo 6 2)
; '()
; > (intervalo 5 5)
; '(5)

(define (intervalo a b)
    (cond
        [(> a  b) empty]
        [(= a b) (cons a empty)]
        [else (cons a (intervalo (+ a 1) b))]))
