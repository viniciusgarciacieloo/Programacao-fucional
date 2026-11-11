#lang racket

; 14. Faça uma função (para cada subitem) que receba 3 números e retorne o resultado de:
; a. Maior número – Menor número
; b. Número do meio * Menor número
; c. Número do meio + Maior número
; Para decidir entre o maior, o menor e o do meio, suponha que estes números compõem
; um conjunto ordenado, o primeiro é o menor, o segundo o do meio e o terceiro o maior.
; Dica: Implemente funções para obter o maior, o menor e o valor do meio entre 3
; números, e as utilize em todas os subitens.
(define (qual-o-maior? a b c)
    (cond
        [(and(> a b)(> a c)) a]
        [(and (> b a)(> b c)) b]
        [else c]))

(define (qual-o-menor a b c)
    (cond
    [(and(< a b)(< a c))a]
    [(and (< b a)(< b c))b]
    [else c]))

(define (qual-o-meio a b c)
    (-(+ a b c) (qual-o-maior? a b c) (qual-o-menor a b c)))

(define (calcula-menos a b c)
    (- (qual-o-maior? a b c) (qual-o-menor a b c)))

(define (calcula-multi a b c)
    (* (qual-o-meio a b c) (qual-o-menor a b c)))

(define (calcula-soma a b c)
    (+ (qual-o-meio a b c) (qual-o-maior? a b c)))

(qual-o-maior? 2 3 10)
(qual-o-menor 2 5 10)
(qual-o-menor 1 0 5)
(calcula-menos 2 5 6)
(calcula-soma 2 5 6)
(calcula-multi 2 5 6)
