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

; 1) Faça uma função que receba dois número e gere a média aritmética.
(define (media a b)
    (/(+ a b) 2))
(media 50 3.0)

; 2) Escreva uma função que receba um número e retorne seu quadrado.
(define (num a)
    (* a a))
(num 2)

; 3) Escreva uma função que retorne o diâmetro de um circulo.
; - Diâmetro = 2 * Raio
(define (diametro raio)
    (* 2 raio))
(diametro 3)

; 4) Escreva uma função que retorne o valor da circunferência de um criculo
; - Circunferência= 2 * Pi * Raio
(define (circuferencia-circulo raio)
    (* pi raio 2))
(circuferencia-circulo 6)

; 5) Escreva uma função que receba o raio r e retorne a área do criculo de raio r.
; - Área = Pi * Raio * Raio
(define (area-circulo raio)
    (* pi raio raio))
(area-circulo 5)

; 6) Criar uma função que receba os valores da diagonal maior, diagonal menor e
; calcule e retorne a área de um losango.
; A = (D. d) / 2
; Onde A é a área, D é a diagonal maior e d a diagonal menor
(define (area-losangulo diagonal-maior diagonal-menor)
    (/ (* diagonal-maior diagonal-menor) 2))
(area-losangulo 20 10)

; 7) Elabore uma função para calcular e retornar o volume de um cilindro de raio r e
; altura A utilizando a fórmula: V = 3.14159. (r. r). A.
(define(volume-cilindro r altura)
    (* pi r r altura))
(volume-cilindro 4 10)

; 8) Faça uma função que receba 4 númerose retorne a média ponderada, sabendo-se
; que os pesos são respectivamente: 1, 2, 3 e 4.
(define (media-ponderada num1 num2 num3 num4)
    (/ (+ num1 (* num2 2)(* num3 3)(* num4 4)) (+ 1.0 2.0 3.0 4.0)))
(media-ponderada 10 20 30 40)

; 9) Faça uma função que receba o valor de um depósito e o valor da taxa de juros (em
; porcentagem), calcule e retorne o valor total depois do rendimento.
(define(valor-rendimento valor-deposito valor-taxa)
    (+ valor-deposito (* valor-deposito (/ valor-taxa 100))))
(valor-rendimento 100 10)

; 10) Faça uma função que receba os valores dos catetos de um triângulo retângulo e
; retorne a hipotenusa. Use a função (sqrt x) para obter a raiz quadrada de um número.
(define (valor-hipotenusa cateto1 cateto2)
    (sqrt (+(* cateto1 cateto1) (* cateto2 cateto2))))
(valor-hipotenusa 3 4)

; 11) Faça uma função que receba uma temperatura em graus centígrados e retorne o
; valor convertido em graus Fahrenheit. A fórmula de conversão é:
; F = (9. c + 160) / 5
; F é a temperatura em Fahrenheit e C é a temperatura em centígrados.
(define (conversao-em-F temperatura-graus)
    (/ (+ (* 9 temperatura-graus)160 )5 ))
(conversao-em-F 30.0)

; 12) Faça uma função que receba a base menor (b), a base maior (B) e a altura de um
; trapezio e calcule e retorne sua área.
; A =(B + b). h / 2
(define (area-trapezio base-menor base-maior altura)
    (/(*(+ base-maior base-menor)altura)2))
(area-trapezio 2 5 10)

; 13) Faça uma função que receba 3 notas e seus respectivos pesos, calcule e retorne a
; média ponderada dessas notas.
(define(media-ponderada-com-peso nota1 nota2 nota3 peso1 peso2 peso3)
    (ceiling(/ (+ (* nota1 peso1) (* nota2 peso2)(* nota3 peso3)) (+ peso1 peso2 peso3))))
(media-ponderada-com-peso 100 50 80 2 3 1.0)

