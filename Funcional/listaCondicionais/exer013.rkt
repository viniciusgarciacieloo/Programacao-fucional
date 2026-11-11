#lang racket

; 13. Faça uma função que receba duas notas de um aluno e retorne qual conceito o aluno
; obteve de acordo com sua média.
; Média Conceito
; Menor que 5 E
; Maior ou igual a 5 e menor que 6 D
; Maior ou igual a 6 e menor que 7 C
; Maior ou igual a 7 e menor que 9 B
; Maior ou igual a 9 A
(define (qual-conceito? a b)
    (cond
        [( < (/(+ a b)2) 5) "conceito E"]
        [( < (/(+ a b)2) 6) "conceito D"]
        [( < (/(+ a b)2) 7) "conceito C"]
        [( < (/(+ a b)2) 9) "conceito B"]
        [else "conceito A"]))

(qual-conceito? 100 60)
