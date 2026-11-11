#lang racket

; 8. A Chevrolet abriu uma linha de crédito para compra de carros aos seus clientes. O valor
; máximo da prestação não poderá ultrapassar 40% do salário bruto. Faça uma função que
; receba o salário bruto e o valor da prestação e retorne se o emprestimo pode ou não ser
; concedido.
(define (sim-ou-nao salario_bruto valor_prestacao)
    (cond
        [(< valor_prestacao (* salario_bruto 0.4)) #t]
        [else #f]))
(sim-ou-nao 1000 500)
