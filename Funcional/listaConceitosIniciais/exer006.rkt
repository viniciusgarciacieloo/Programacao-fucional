#lang racket

; 6) Criar uma função que receba os valores da diagonal maior, diagonal menor e
; calcule e retorne a área de um losango.
; A = (D. d) / 2
; Onde A é a área, D é a diagonal maior e d a diagonal menor
(define (area-losangulo diagonal-maior diagonal-menor)
    (/ (* diagonal-maior diagonal-menor) 2))
(area-losangulo 20 10)
