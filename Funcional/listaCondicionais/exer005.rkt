#lang racket

; 5. Faça uma função que receba uma temperatura em graus celsios e uma string. Se a string
; informada for ‘Kelvin’ seu algoritmo deverá converter a temperatura para Kelvin. Se a
; string for ‘Fahrenheit’ a temperatura deverá ser convertida para Fahrenheit.
(define (qual_e? temC str)
    (cond
        [(equal? str "kelvin")(+ temC 273.15)]
        [(equal? str "fahrenheit")(/(+(* 9 temC)160)5)]
        [else "temperatura invalida"]))

(qual_e? 25 "kelvin")
