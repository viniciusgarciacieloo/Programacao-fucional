#lang racket

; 2. Faça uma função para ler um número e, se ele for maior do que 20, então retornar a
; metade do número, caso contrario, retonar o próprio número.
(define (maior_que_20 a )
    (cond
        [(> a 20)(/ a 2.0)]
        [else a]))

(maior_que_20 20.1)
