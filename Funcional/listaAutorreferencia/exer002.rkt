#lang racket

; 2. Faça uma função que receba uma lista de strings L e uma string separadora S.
; Sua função deverá juntar todas as strings de L separadas pela string S.
; Obs: a ultima strings não deve ser seguida pelo separadora.
; Exemplos:
; > (junta (list "ola" "tudo bem?") ", ")
; "ola, tudo bem?"
; > (junta (list "ola" "mundo!") " ")
; "ola mundo!"
; > (junta (list "ra" "nome" "nota") ",")
; "ra,nome,nota"
; > (junta (list "string unica") "!")
; "string única"
; > (junta (list "a" "b" "c" "d" "e" "f" "g") " ")
; "a b c d e f g"
; > (junta (list "inteiro" "real") "->")
; "inteiro->real"

(define (junta lstL lstS)
    (cond
        [(empty? lstL) ""]
        [(empty? (rest lstL)) (first lstL)]
        [else (string-append (first lstL) lstS (junta (rest lstL) lstS))]))
