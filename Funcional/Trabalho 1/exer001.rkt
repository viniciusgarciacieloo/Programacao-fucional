#lang racket

(define (num_aredonda X N)
    (define fator (expt 10 N))
    (define multiplicado (* X fator))
    (define arredondado (round multiplicado))
    (/ arredondado fator))

; adicionar os teste que o professor pediu