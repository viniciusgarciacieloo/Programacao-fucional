#lang racket
(require rackunit)
; O seu amigo Alan está planejando uma viagem pro final do ano com a família e está
; considerando diversos destinos. Uma das coisas que ele está levando em consideração é o
; custo da viagem, que inclui, entre outras coisas, hospedagem, combustível e o pedágio.
; Para o cálculo do combustível ele pediu a sua ajuda, ele disse que sabe a distância que vai
; percorrer, o preço do litro do combustível e o rendimento do carro (quantos quilômetros o
; carro anda com um litro de combustível), mas que é muito chato ficar fazer o cálculo
; manualmente, então ele quer que você faça um programa para calcular o gasto de
; combustível em uma viagem.
; Exemplo de entrada
; • Distância: 400 Km
; • Preço do litro: R$ 5
; • Rendimento: 10 Km/l
(define (custo-combustivel distancia preco rendimento)
    (* (/ distancia rendimento) preco))
(custo-combustivel 400 5 10) 

; Depois que você fez o programa para o Alan, a Márcia, amiga em comum de vocês, soube
; que você está oferecendo serviços desse tipo e também quer a sua ajuda. O problema da
; Márcia é que ela sempre tem que fazer a conta manualmente para saber se deve abastecer
; o carro com álcool ou gasolina. A conta que ela faz é verificar se o preço do álcool é até
; 70% do preço da gasolina, se sim, ela abastece o carro com álcool, senão ela abastece o
; carro com gasolina. Você pode ajudar a Márcia também?
(define preco-alcool 1.5)
(define preco-gasolina 5.5)
(define (qual-abastecer preco-alcool preco-gasolina)
    (if (<= preco-alcool (* 0.7 preco-gasolina))
        "Abastecer com álcool"
        "Abastecer com gasolina"))

(qual-abastecer preco-alcool preco-gasolina)

(define (percentual-ir salario)
    (if (<= salario 5000)
        0
        (if (<= salario 10000)
            0.2
            0.3)))

(define (f x)
    (cond
    [(>= x 0) "Positivo"]
    [else "Negativo"]))
(f -20)
(f 10)

; (define (e-logico a b)
;     (cond
;     [(equal? a #f) #f] 
;     [(equal? b #f) #f] 
;     [else #t]))

; ;equal? serve para comparar valores lógicos, strings. Valor de = é de numeros e afins
; ;simplificando
; ;eq? refere a refêrencias   

; (define (e-logico a b)
;     (cond
;     [(equal? a #f) #f] 
;     [else b]))

; (define (ou-logico a b)
;     (cond
;     [(equal? a #t) #t] 
;     [else b]))


