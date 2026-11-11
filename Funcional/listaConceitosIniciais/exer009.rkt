#lang racket

; 9) Faça uma função que receba o valor de um depósito e o valor da taxa de juros (em
; porcentagem), calcule e retorne o valor total depois do rendimento.
(define(valor-rendimento valor-deposito valor-taxa)
    (+ valor-deposito (* valor-deposito (/ valor-taxa 100))))
(valor-rendimento 100 10)
