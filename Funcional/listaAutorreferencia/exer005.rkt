#lang racket

; 5.Faça uma função que receba uma lista L e um valor natural n, e retorne uma lista
; contendo os n primeiros elementos de L.
; Quando n for maior que o tamanho da lista, retorne a lista toda.
; Exemplo:
; > (n-primeiros '(4 8 1 3 9 7 5 6) 4)
; '(4 8 1 3)
; > (n-primeiros '(4 8 1 3 9 7 5 6) 0)
; '()
; > (n-primeiros '(4 8) 4)
; ‘(4 8)

(define (n-primeiros lst n)
    (cond
        [(empty? lst) empty]
        [(= n 0) empty]
        [else (cons (first lst) (n-primeiros (rest lst) (sub1 n)))]))
