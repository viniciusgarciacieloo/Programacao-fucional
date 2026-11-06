#lang racket

(require rackunit)

; Dinheiro é um número maior ou igual a 0, em reais.
; Percentual é um número entre 0 e 1 (por exemplo, 0.1 representa 10%).
; Natural é um número inteiro maior ou igual a 0.

; Dinheiro -> Dinheiro

; Arredonda valor para duas casas decimais (centavos).

;pergunta ao professor se pode usar essa função para ela poder fazer o arredondamento
(define (arredonda_centavos valor)
    (/ (round (* valor 100)) 100))

; a.

; Dinheiro Percentual Natural -> Dinheiro

; Calcula o total acumulado ao final de t meses, depositando r reais todo mês
; em uma aplicação que rende p ao mês. O depósito do mês rende já no próprio
; mês: o saldo do mês anterior mais o depósito é multiplicado por (1 + p).
; O saldo de cada mês é arredondado para centavos.

(define (total_acumulado r p t)
    (cond
        [(= t 0) 0]
        [else (arredonda_centavos (* (+ (total_acumulado r p (sub1 t)) r) (+ p 1)))]))

; b.

; Dinheiro Percentual Dinheiro -> Natural

; Calcula quantos meses são necessários para que o total acumulado, com
; depósitos de r reais por mês e rendimento de p ao mês, ultrapasse m reais
; (fique maior que m, não apenas igual).
; Requer que r seja maior que 0.
(define (acumular_m r p m)
    ; Natural -> Natural
    ; Produz o primeiro mês, a partir de t, em que o total acumulado é maior que m.
    (define (meses t)
        (cond
            [(> (total_acumulado r p t) m) t]
            [else (meses (+ t 1))]))
    (meses 0))

; Exemplos

; Como os valores são números de ponto flutuante, usamos check-= com uma
; margem de erro.

; arredonda_centavos
; (/ (round (* 3.14159 100)) 100)
(check-= (arredonda_centavos 3.14159) 3.14 0.0001)
; (/ (round (* 1.239 100)) 100)
(check-= (arredonda_centavos 1.239) 1.24 0.0001)
; erro de ponto flutuante é removido
(check-= (arredonda_centavos 110.00000000000001) 110 0.0001)
; valor que já está em centavos não muda
(check-= (arredonda_centavos 364.1) 364.1 0.0001)

; total_acumulado
; nenhum mês, nada acumulado
(check-= (total_acumulado 100 0.1 0) 0 0.0001)
; (* (+ 0 100) 1.1)
(check-= (total_acumulado 100 0.1 1) 110 0.0001)
; (* (+ 110 100) 1.1)
(check-= (total_acumulado 100 0.1 2) 231 0.0001)
; (* (+ 231 100) 1.1)
(check-= (total_acumulado 100 0.1 3) 364.1 0.0001)
; sem rendimento, (* 100 3)
(check-= (total_acumulado 100 0 3) 300 0.0001)
; 12 meses com depósito de 500 e rendimento de 2%
(check-= (total_acumulado 500 0.02 12) 6840.17 0.0001)

; acumular_m
; 110 < 200 e 231 > 200
(check-equal? (acumular_m 100 0.1 200) 2)
; 231 < 300 e 364.1 > 300
(check-equal? (acumular_m 100 0.1 300) 3)
; 110 > 50 já no primeiro mês
(check-equal? (acumular_m 100 0.1 50) 1)
; no mês 0 o total é 0, que não ultrapassa 0
(check-equal? (acumular_m 100 0.1 0) 1)
; casos limite: o total igual a m não ultrapassa m
; 110 = 110, só o mês 2 ultrapassa
(check-equal? (acumular_m 100 0.1 110) 2)
; 364.1 = 364.1, só o mês 4 ultrapassa
(check-equal? (acumular_m 100 0.1 364.1) 4)
; sem rendimento, 300 não ultrapassa 300, então são 4 meses
(check-equal? (acumular_m 100 0 300) 4)
; 6840.17 > 6840 no mês 12
(check-equal? (acumular_m 500 0.02 6840) 12)
