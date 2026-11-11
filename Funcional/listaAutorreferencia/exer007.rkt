#lang racket

; 7. Faça  uma  função que receba um  número inteiro e conte  quantos dígitos  esse
; número tem:
; Exemplos:
; > (conta-digitos 1234)
; 4
; > (conta-digitos 222)
; 3

(define (conta-digitos n)
    (cond
        [(= (quotient n 10) 0) 1]
        [else (+ (conta-digitos (quotient n 10)) 1)]))
