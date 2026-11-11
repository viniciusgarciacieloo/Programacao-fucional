#lang racket

; 10. Faça um programa que receba um valor N, sendo N um inteiro maior que 0 e
; retorne uma lista contendo cada digito N

(define (cada-digito n)
    (cond
        [(= (quotient n 10) 0) (list n)]
        [else (append (cada-digito (quotient n 10)) (list (remainder n 10)))]))
