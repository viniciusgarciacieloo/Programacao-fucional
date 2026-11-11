#lang racket

; 9. Faça uma função que receba dois números naturais X e n. Sua função deverá
; retornar o n-ésimo digito menos significativo de X.
; Exemplos:
; > (digito 123 1)
; 3
; > (digito 87654 3)
; 6

(define (digito x n)
    (cond
        [(= n 1) (remainder x 10)]
        [else (digito (quotient x 10) (- n 1))]))
