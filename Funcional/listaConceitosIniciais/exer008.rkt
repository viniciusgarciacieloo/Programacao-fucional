#lang racket

; 8) Faça uma função que receba 4 númerose retorne a média ponderada, sabendo-se
; que os pesos são respectivamente: 1, 2, 3 e 4.
(define (media-ponderada num1 num2 num3 num4)
    (/ (+ num1 (* num2 2)(* num3 3)(* num4 4)) (+ 1.0 2.0 3.0 4.0)))
(media-ponderada 10 20 30 40)
