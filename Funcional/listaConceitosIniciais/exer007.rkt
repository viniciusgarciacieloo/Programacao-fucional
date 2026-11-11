#lang racket

; 7) Elabore uma função para calcular e retornar o volume de um cilindro de raio r e
; altura A utilizando a fórmula: V = 3.14159. (r. r). A.
(define(volume-cilindro r altura)
    (* pi r r altura))
(volume-cilindro 4 10)
