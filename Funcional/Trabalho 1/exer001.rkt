#lang racket

(require rackunit)

;; Real é um número real qualquer.
;; Natural é um número inteiro maior ou igual a 0.

;; Real Natural -> Real
;;
;; Produz o número X arredondado para N casas decimais.
;; Quando o dígito descartado é exatamente 5, o arredondamento é feito para o
;; número par mais próximo (comportamento da função round do Racket).
(define (num_aredonda X N)
    (define fator (expt 10 N))
    (define multiplicado (* X fator))
    (define arredondado (round multiplicado))
    (/ arredondado fator))

; Como o resultado é um número de ponto flutuante, usamos check-= com uma
; margem de erro em vez de check-equal?.

; Exemplos do enunciado
; (/ (round (* 3.14159265359 10)) 10)
(check-= (num_aredonda 3.14159265359 1) 3.1 0.0000001)
; (/ (round (* 3.14159265359 100)) 100)
(check-= (num_aredonda 3.14159265359 2) 3.14 0.0000001)
; (/ (round (* 3.14159265359 1000)) 1000)
(check-= (num_aredonda 3.14159265359 3) 3.142 0.0000001)
; (/ (round (* 3.14159265359 10000)) 10000)
(check-= (num_aredonda 3.14159265359 4) 3.1416 0.0000001)

; Testes adicionais
; N = 0, arredonda para um número inteiro
; (/ (round (* 2.71828 1)) 1)
(check-= (num_aredonda 2.71828 0) 3.0 0.0000001)
; arredondamento para cima
; (/ (round (* 2.71828 100)) 100)
(check-= (num_aredonda 2.71828 2) 2.72 0.0000001)
; número negativo
; (/ (round (* -1.23456 1000)) 1000)
(check-= (num_aredonda -1.23456 3) -1.235 0.0000001)
; número com menos casas decimais do que N, não muda o valor
; (/ (round (* 5.5 1000)) 1000)
(check-= (num_aredonda 5.5 3) 5.5 0.0000001)
; dígito descartado é exatamente 5, arredonda para o par mais próximo
; (/ (round (* 2.5 1)) 1)
(check-= (num_aredonda 2.5 0) 2.0 0.0000001)
; (/ (round (* 3.5 1)) 1)
(check-= (num_aredonda 3.5 0) 4.0 0.0000001)
