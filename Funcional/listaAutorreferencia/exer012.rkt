#lang racket

; 12. Faça uma função que receba uma lista L e retorne um a lista M, onde o i-ésimo
; elemento de M é dado pelo fatorial do i-ésimo valor de L.
; Exemplos:
; > (fatoriais '(1 2 3 4 5))
; '(1 2 6 24 120))
; > (fatoriais '(3 6))
; '(6 720)

; fatorial copiada do exer011, usada pela fatoriais
(define (fatorial N)
    (cond
        [(= N 0) 1]
        [else (* N (fatorial (- N 1)))]))

(define (fatoriais lst)
    (cond
        [(empty? lst) empty]
        [else (cons (fatorial (first lst)) (fatoriais (rest lst)))]))
