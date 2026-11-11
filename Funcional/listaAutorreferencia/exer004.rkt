#lang racket

; 4. Faça uma função que retorne o ultimo elemento de uma lista de valores.
; Exemplos:
; > (ultimo (list 1 2 3))
; 3
; > (ultimo (list 1))
; 1
; > (ultimo (list 1 3 4 2 1 7))
; 7

(define (ultimo_elem lst)
    (cond
        [(empty? lst) empty]
        [(empty? (rest lst)) (first lst)]
        [else (ultimo_elem (rest lst))]))
