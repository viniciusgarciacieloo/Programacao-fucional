#lang racket

; 8. Faça   uma   função   que   receba   um   valor   natural   e   devolva   a   soma   de   seus
; algarismos.
; Exemplos:
; > (soma-algarismos 1234)
; 10
; > (soma-algarismos 92)
; 11

(define (soma-algarismos n)
    (cond
        [(= n 0) 0]
        [else (+ (remainder n 10) (soma-algarismos (quotient n 10)))]))
