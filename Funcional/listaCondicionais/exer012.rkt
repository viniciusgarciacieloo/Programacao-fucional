#lang racket

; 12. Faça uma função que receba um ponto no plano cartesiano e retorne em qual quadrante
; ele se encontra.
(define (qual-quadrante? x y)
    (cond
        [(and (> x 0) (> y 0)"primeiro quadrante")]
        [(and (< x 0) (> y 0))"segundo quadrante"]
        [(and (< x 0) (< y 0))"terceiro quadrante"]
        [else "quarto quadrante"]))

(qual-quadrante? 2 2)
(qual-quadrante? -2 2)
(qual-quadrante? -2 -2)
(qual-quadrante? 2 -3)
