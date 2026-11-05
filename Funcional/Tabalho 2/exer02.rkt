#lang racket

; 2. (Valor 2,5) Luiz irá começar a investir uma parte fixa do seu salário todo mês. Ele pediu
; sua ajuda para resolver duas situações:

; a. Sabe-se que ele depositará em sua aplicação uma quantia de r reais todos os
; meses. Além disso, a aplicação na qual Luiz está investindo tem um rendimento
; mensal fixo de p% ao mês. Faça uma função que calcule o total acumulado
; por Luiz ao final de t meses.

; pergunta ao professor se pode usar essa função para ela poder fazer o arredondamento
(define (arredonda_centavos valor)
    (/ (round (* valor 100)) 100))

(define (total_acumulado r p t)
    (cond
        [(= t 0) 0]
        [else (arredonda_centavos (* (+ (total_acumulado r p (sub1 t)) r) (+ p 1)))]))

; b. Além disso, ele quer saber quanto tempo ele levaria para acumular um
; montante de m Reais, se mantivesse esse deposito de r Reais mensais com
; rendimento de p% ao mês. Sendo assim, projete uma função receba r, p e m e
; retorne o tempo (em meses) para que ele ultrapasse o total de m Reais.

(define (acumular_m r p m)
    (define (messes t)
        (cond
            [(> (total_acumulado r p t) m) t]
            [else (messes (+ t 1))]))
    (messes 0))