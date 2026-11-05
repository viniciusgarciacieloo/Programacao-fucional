#lang racket

(require rackunit)

(define (lista-positivos lst)
    (cond   
        [(empty? lst) empty]
        [(positive? (first lst)) (cons (first lst) (lista-positivos (rest lst)))]
        [else (lista-positivos(rest lst))]))

(define (lista-pares lst)
    (cond   
        [(empty? lst) empty]
        [(even? (first lst)) (cons (first lst) (lista-pares (rest lst)))]
        [else (lista-pares(rest lst))]))

; Agora vamos fazer a de alta ordem(caso geral)||
; pred? vai ser a condição que daremos para a função, aqui estamos criando uma função que ja existe pronta
; em racket chamada filter

(define (filtra pred? lst)
    (cond
        [(empty? lst) empty]
        [(pred? (first lst)) (cons (first lst) (filtra pred? (rest lst)))]
        [else (filtra pred? (rest lst))]))

; exemplos do lista-positivos
; (check-equal? (lista-positivos (list 1 2 -3 5 -6 9))
;         (list 1 2 5 9))
; (check-equal? (lista-positivos (list))
;         (list))
; (check-equal? (lista-positivos (list 1 2 3 4 5 6))
;         (list 1 2 3 4 5 6))
; (check-equal? (lista-positivos (list -6 -9 -5 -4 -20))
;         (list))

; exemplos do lista-pares
; (check-equal? (lista-pares (list 1 2 -3 5 -6 9))
;         (list 2 -6 ))
; (check-equal? (lista-pares (list))
;         (list))
; (check-equal? (lista-pares (list 1 2 3 4 5 6))
;         (list 2 4 6))
; (check-equal? (lista-pares (list -6 -9 -5 -4 -20))
;         (list -6 -4 -20))
