#lang racket

; 1. Faça uma função que receba uma lista de números inteiros e um inteiro n. Sua
; função deve remover todas as ocorrências de n
(define (remover_n lst n)
    (cond
        [(empty? lst) empty]
        [(= (first lst) n) (remover_n (rest lst) n)]
        [else (cons  (first lst) (remover_n (rest lst) n))]))
