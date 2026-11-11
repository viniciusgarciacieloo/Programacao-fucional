#lang racket

; 11. Faça   uma   função   que   receba   um   valor   natural   N   e   retorne   o   fatorial   deste
; número.
; > (fatorial 4)
; 24
; > (fatorial 6)
; 720
; > (fatorial 0)
; 1

(define (fatorial N)
    (cond
        [(= N 0) 1]
        [else (* N (fatorial (- N 1)))]))
