#lang racket

; 11. Faça uma função que receba 3 números, A, B e C. Sua função deverá retronar um valor
; booleano, informando se A está no intervalo [B,C]
(define (ta-no-intervalo? a b c)
    (cond
    [(and (> a b)(< a c)) #t]
    [else #f]))

(ta-no-intervalo? 10 5 20)
(ta-no-intervalo? 2 5 40)
