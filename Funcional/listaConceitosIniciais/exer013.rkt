#lang racket

; 13) Faça uma função que receba 3 notas e seus respectivos pesos, calcule e retorne a
; média ponderada dessas notas.
(define(media-ponderada-com-peso nota1 nota2 nota3 peso1 peso2 peso3)
    (ceiling(/ (+ (* nota1 peso1) (* nota2 peso2)(* nota3 peso3)) (+ peso1 peso2 peso3))))
(media-ponderada-com-peso 100 50 80 2 3 1.0)
