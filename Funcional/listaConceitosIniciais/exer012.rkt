#lang racket

; 12) Faça uma função que receba a base menor (b), a base maior (B) e a altura de um
; trapezio e calcule e retorne sua área.
; A =(B + b). h / 2
(define (area-trapezio base-menor base-maior altura)
    (/(*(+ base-maior base-menor)altura)2))
(area-trapezio 2 5 10)
