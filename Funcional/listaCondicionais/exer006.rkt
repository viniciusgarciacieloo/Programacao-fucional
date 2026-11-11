#lang racket

; 6. Faça um função que receba o salário de um funcionário e calcule e retorne seu imposto
; de renda com base na tabela a seguir:
; Intervalo do Salário Desconto do imposto de renda
; Até 1500,00 Isento
; Entre 1500,01 e 3000,00 10%
; Entre 3000,01 e 4500,00 20%
; Acima de 4500,01 30%
(define (salario S)
    (cond
        [(<= S 1500.00) S]
        [(and (> S 1500.00)(<= S 3000.00)) (+(* S 0.1) S)]
        [(and (> S 3000.00)(<= S 4500.00))(+(* S 0.2)S)]
        [else (+(* S 0.3)S)]))
(salario 100)
(salario 2000)
(salario 4000)
(salario 5000)
