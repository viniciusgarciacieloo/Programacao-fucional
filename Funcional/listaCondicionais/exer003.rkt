#lang racket

; 3. Faça uma função que receba um número e informe se ele é par ou impar
(define (num2 y)
    (cond
    [(= (modulo y 2 ) 0)"é par"]
    [else "é impar"]))
(num2 22)
