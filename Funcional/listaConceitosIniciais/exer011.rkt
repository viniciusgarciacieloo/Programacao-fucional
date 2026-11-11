#lang racket

; 11) Faça uma função que receba uma temperatura em graus centígrados e retorne o
; valor convertido em graus Fahrenheit. A fórmula de conversão é:
; F = (9. c + 160) / 5
; F é a temperatura em Fahrenheit e C é a temperatura em centígrados.
(define (conversao-em-F temperatura-graus)
    (/ (+ (* 9 temperatura-graus)160 )5 ))
(conversao-em-F 30.0)
