#lang racket

; 7. Faça uma função que receba um valor para x e retorne o valor de f(x):
; f(x)
; 1, se x <= 1
; 2,se 1< x <= 2
; x^2,se 2< x ≤3
; x^3,se x > 3
(define (qual_o_x x)
    (cond
        [(<= x 1) 1]
        [(and (> x 1)(<= x 2)) 2]
        [(and (> x 2)(<= x 3)) (* x x)]
        [else (* x x x)]))

(qual_o_x 0)
(qual_o_x 1.5)
(qual_o_x 2.5)
(qual_o_x 4)
