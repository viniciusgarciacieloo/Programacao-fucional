#lang racket

; 9. Faça uma função que receba 3 medidas e verifique se essas medidas podem formar um
; triangulo. Caso possam formar, verifique qual o tipo de triangulo (equilátero, isóceles
; ou escaleno).
; -Só é possível formar triangulo quando a soma de dois lados é menor que a do lado
; restante
; -Um triângulo é equilatero se ele tem todos lados iguais
; -Um triângulo é isóceles se tem dois lados iguais
; -Um triângulo é escaleno quando todos seus lados são diferentes

(define (e-possivel? ladoa ladob ladoc)
    (cond
        [(not (and ( > (+ ladoa ladob) ladoc) ( > (+ ladob ladoc) ladoa) ( > (+ ladoa ladoc ) ladob )))"não é possivel"]
        [(and (= ladoa ladob) (= ladob ladoc))"é equilatero"]
        [(or (= ladoa ladob) (= ladob ladoc))"é isoceles"]
        [else "é escaleno"]))

(e-possivel? 5 5 5)
(e-possivel? 5 5 8)
(e-possivel? 3 4 5)
(e-possivel? 1 1 10)
