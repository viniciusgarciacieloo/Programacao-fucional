#lang racket

; 4. Faça um função para receber a idade de uma pessoa e informar:
; -Se ela é maior de idade;
; -Se ela é menor de idade;
; -Se ela tem mais de 65 anos;
(define (idade n)
    (cond
        [(and (>= n 18) (< n 65))"é de maior"]
        [(> n 65)"tem mais de 65 anos"]
        [else "é de menor"]))
(idade 18)
