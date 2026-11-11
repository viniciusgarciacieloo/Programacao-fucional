#lang racket

; 10) Faça uma função que receba os valores dos catetos de um triângulo retângulo e
; retorne a hipotenusa. Use a função (sqrt x) para obter a raiz quadrada de um número.
(define (valor-hipotenusa cateto1 cateto2)
    (sqrt (+(* cateto1 cateto1) (* cateto2 cateto2))))
(valor-hipotenusa 3 4)
