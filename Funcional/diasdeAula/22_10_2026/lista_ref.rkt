#lang racket
(require rackunit)

(define  (lista-ref lst k)
    (cond
        [(empty? lst) (error "posicao invalida")]
        [(zero? k) (first lst)]
        [else (lista-ref (rest lst) (sub1 k))]))


(check-exn exn:fail? (thunk (lista-ref empty 0)))
(check-exn exn:fail? (thunk (lista-ref empty 2)))
(check-equal? (lista-ref (list 3 2 8) 0) 3)
(check-equal? (lista-ref (list 3 2 8 10) 2) 8)
(check-exn exn:fail? (thunk (lista-ref (list 3 2 8 10) 4)))

