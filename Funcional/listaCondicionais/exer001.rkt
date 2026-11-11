#lang racket

; 1. Faça uma função que leia um número inteiro e diga se este número é menor que zero,
; igual a zero ou maior que zero.
(define (num x)
    (cond
        [(> x 0) "é positivo"]
        [(< x 0) "é negativo"]
        [else "é igual a 0"]))
(num 25)
