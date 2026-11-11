#lang racket

; 10. Faça uma função que receba a idade de um nadador e o classifique em uma das
; seguintes categorias:

; Idade Categoria
; 5 ate 7 anos Infantil A
; 8 ate 10 anos Infantil B
; 11 ate 13 anos Juvenil A
; 14 ate 17 anos Juvenil B
; Maiores de 18 anos Adulto
(define (qual-categoria? idade)
    (cond
        [(< idade 5)"nao tem idade para nadar em alguma categoria"]
        [(<= idade 7) "infantil A"]
        [(<= idade 10)"infantil B"]
        [(<= idade 13)"juvenil A"]
        [(<= idade 17)"juvenil B"]
        [else "adulto"]))

(qual-categoria? 2)
(qual-categoria? 5)
(qual-categoria? 9)
(qual-categoria? 12)
(qual-categoria? 15)
(qual-categoria? 20)
