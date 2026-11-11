#lang racket

; 5) Escreva uma função que receba o raio r e retorne a área do criculo de raio r.
; - Área = Pi * Raio * Raio
(define (area-circulo raio)
    (* pi raio raio))
(area-circulo 5)
