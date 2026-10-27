#lang racket

(require rackunit)

;; Preco é um número positivo que representa o valor de um jogo em reais.
;; Percentual é um número entre 0 e 1 (por exemplo, 0.2 representa 20%).

;; Preco Percentual Preco -> Preco
;;
;; Calcula o preço promocional de um jogo aplicando o percentual de desconto
;; sobre valor_jogo. Se o preço com desconto for maior que
;; valor_jogo_concorrente, produz valor_jogo_concorrente; caso contrário,
;; produz o preço com desconto.
(define (valorDescontado valor_jogo percentual valor_jogo_concorrente)
    (cond
        [(> (- valor_jogo (* valor_jogo percentual)) valor_jogo_concorrente) valor_jogo_concorrente]
        [else (- valor_jogo (* valor_jogo percentual))]))

; Como os valores são números de ponto flutuante, usamos check-= com uma
; margem de erro em vez de check-equal?.

; preço com desconto menor que o preço da concorrente
; (- 100 (* 100 0.2))
(check-= (valorDescontado 100 0.2 90) 80 0.0001)
; (- 59.90 (* 59.90 0.5))
(check-= (valorDescontado 59.90 0.5 40) 29.95 0.0001)

; preço com desconto igual ao preço da concorrente (caso limite)
; (- 100 (* 100 0.2))
(check-= (valorDescontado 100 0.2 80) 80 0.0001)

; preço com desconto maior que o preço da concorrente
; (- 100 (* 100 0.1)) = 90 > 80, então produz o preço da concorrente
(check-= (valorDescontado 100 0.1 80) 80 0.0001)
; sem desconto, (- 200 (* 200 0)) = 200 > 150, então produz o preço da concorrente
(check-= (valorDescontado 200 0 150) 150 0.0001)
