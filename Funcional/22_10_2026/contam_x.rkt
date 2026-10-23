#lang racket

(define (contem_x? lst)
    (cond
        [(empty? lst) #f]
        [(= (first lst) x) #t])
        [else (contem_x? (rest lst))])

        