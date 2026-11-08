#lang racket

; 1. Faça uma função que receba uma lista de números inteiros e um inteiro n. Sua 
; função deve remover todas as ocorrências de n
(define (remover_n lst n)
    (cond  
        [(empty? lst) empty]
        [(= (first lst) n) (remover_n (rest lst) n)]
        [else (cons  (first lst) (remover_n (rest lst) n))]))

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

; 3. Faça uma função que receba dois números, a e b, e retorne uma lista com os 
; números inteiros no intervalo [a, b]. Quando a < b, a lista deve ser vazia.
; Exemplos:
; > (intervalo 1 6)
; '(1 2 3 4 5 6)
; > (intervalo 3 14)
; '(3 4 5 6 7 8 9 10 11 12 13 14)
; > (intervalo 6 2)
; '()
; > (intervalo 5 5)
; '(5)

(define (intervalo a b)
    (cond  
        [(> a  b) empty]
        [(= a b) (cons a empty)]
        [else (cons a (intervalo (+ a 1) b))]))

; 4. Faça uma função que retorne o ultimo elemento de uma lista de valores.
; Exemplos:
; > (ultimo (list 1 2 3))
; 3
; > (ultimo (list 1))
; 1
; > (ultimo (list 1 3 4 2 1 7))
; 7

(define (ultimo_elem lst)
    (cond 
        [(empty? lst) empty]
        [(empty? (rest lst)) (first lst)]
        [else (ultimo_elem (rest lst))]))

; 5.Faça uma função que receba uma lista L e um valor natural n, e retorne uma lista 
; contendo os n primeiros elementos de L.
; Quando n for maior que o tamanho da lista, retorne a lista toda.
; Exemplo:
; > (n-primeiros '(4 8 1 3 9 7 5 6) 4)
; '(4 8 1 3)
; > (n-primeiros '(4 8 1 3 9 7 5 6) 0)
; '()
; > (n-primeiros '(4 8) 4)
; ‘(4 8)

(define (n-primeiros lst n)
    (cond
        [(empty? lst) empty]
        [(= n 0) empty]
        [else (cons (first lst) (n-primeiros (rest lst) (sub1 n)))]))