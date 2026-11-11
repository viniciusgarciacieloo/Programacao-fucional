#lang racket

; 4) Escreva uma função que retorne o valor da circunferência de um criculo
; - Circunferência= 2 * Pi * Raio
(define (circuferencia-circulo raio)
    (* pi raio 2))
(circuferencia-circulo 6)
