#lang racket

; 1. Faça uma função que leia um número inteiro e diga se este número é menor que zero,
; igual a zero ou maior que zero.
(define (num x)
    (cond 
        [(> x 0) "é positivo"]
        [(< x 0) "é negativo"]
        [else "é igual a 0"]))
(num 25)

; 2. Faça uma função para ler um número e, se ele for maior do que 20, então retornar a
; metade do número, caso contrario, retonar o próprio número.
(define (maior_que_20 a )
    (cond
        [(> a 20)(/ a 2.0)]
        [else a]))
(maior_que_20 20.1)

; 3. Faça uma função que receba um número e informe se ele é par ou impar
(define (num2 y)
    (cond
    [(= (modulo y 2 ) 0)"é par"]
    [else "é impar"]))
(num2 22)

; 4. Faça um função para receber a idade de uma pessoa e informar:
; -Se ela é maior de idade;
; -Se ela é menor de idade;
; -Se ela tem mais de 65 anos;
(define (idade n)
    (cond
        [(and (>= n 18) (< n 65))"é de maior"]
        [(> n 65)"tem mais de 65 anos"]
        [else "é de menor"]))
(idade 18)

; 5. Faça uma função que receba uma temperatura em graus celsios e uma string. Se a string
; informada for ‘Kelvin’ seu algoritmo deverá converter a temperatura para Kelvin. Se a
; string for ‘Fahrenheit’ a temperatura deverá ser convertida para Fahrenheit.
(define (qual_e? temC str)
    (cond
        [(equal? str "kelvin")(+ temC 273.15)]
        [(equal? str "fahrenheit")(/(+(* 9 temC)160)5)]
        [else "temperatura invalida"]))
    
(qual_e? 25 "kelvin")

; 6. Faça um função que receba o salário de um funcionário e calcule e retorne seu imposto
; de renda com base na tabela a seguir:
; Intervalo do Salário Desconto do imposto de renda
; Até 1500,00 Isento
; Entre 1500,01 e 3000,00 10%
; Entre 3000,01 e 4500,00 20%
; Acima de 4500,01 30%
(define (salario S)
    (cond
        [(<= S 1500.00) S]
        [(and (> S 1500.00)(<= S 3000.00)) (+(* S 0.1) S)]
        [(and (> S 3000.00)(<= S 4500.00))(+(* S 0.2)S)]
        [else (+(* S 0.3)S)]))
(salario 100)
(salario 2000)
(salario 4000)
(salario 5000)

; 7. Faça uma função que receba um valor para x e retorne o valor de f(x):
; f(x)
; 1, se x <= 1
; 2,se 1< x <= 2
; x^2,se 2< x ≤3
; x^3,se x > 3
(define (qual_o_x x)
    (cond
        [(<= x 1) 1]
        [(and (> x 1)(<= x 2)) 2]
        [(and (> x 2)(<= x 3)) (* x x)]
        [else (* x x x)]))
    
(qual_o_x 0)
(qual_o_x 1.5)
(qual_o_x 2.5)
(qual_o_x 4)

; 8. A Chevrolet abriu uma linha de crédito para compra de carros aos seus clientes. O valor
; máximo da prestação não poderá ultrapassar 40% do salário bruto. Faça uma função que
; receba o salário bruto e o valor da prestação e retorne se o emprestimo pode ou não ser
; concedido.
(define (sim-ou-nao salario_bruto valor_prestacao)
    (cond
        [(< valor_prestacao (* salario_bruto 0.4)) #t]
        [else #f]))
(sim-ou-nao 1000 500)

; 9. Faça uma função que receba 3 medidas e verifique se essas medidas podem formar um
; triangulo. Caso possam formar, verifique qual o tipo de triangulo (equilátero, isóceles
; ou escaleno).
; -Só é possível formar triangulo quando a soma de dois lados é menor que a do lado
; restante
; -Um triângulo é equilatero se ele tem todos lados iguais
; -Um triângulo é isóceles se tem dois lados iguais
; -Um triângulo é escaleno quando todos seus lados são diferentes

(define (e-possivel? ladoa ladob ladoc)
    (cond 
        [(not (and ( > (+ ladoa ladob) ladoc) ( > (+ ladob ladoc) ladoa) ( > (+ ladoa ladoc ) ladob )))"não é possivel"]
        [(and (= ladoa ladob) (= ladob ladoc))"é equilatero"]
        [(or (= ladoa ladob) (= ladob ladoc))"é isoceles"]
        [else "é escaleno"]))

(e-possivel? 5 5 5)
(e-possivel? 5 5 8)
(e-possivel? 3 4 5)
(e-possivel? 1 1 10)

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

; 11. Faça uma função que receba 3 números, A, B e C. Sua função deverá retronar um valor
; booleano, informando se A está no intervalo [B,C]
(define (ta-no-intervalo? a b c)
    (cond
    [(and (> a b)(< a c)) #t]
    [else #f]))

(ta-no-intervalo? 10 5 20)
(ta-no-intervalo? 2 5 40)

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

; 13. Faça uma função que receba duas notas de um aluno e retorne qual conceito o aluno
; obteve de acordo com sua média.
; Média Conceito
; Menor que 5 E
; Maior ou igual a 5 e menor que 6 D
; Maior ou igual a 6 e menor que 7 C
; Maior ou igual a 7 e menor que 9 B
; Maior ou igual a 9 A
(define (qual-conceito? a b)
    (cond
        [( < (/(+ a b)2) 5) "conceito E"]
        [( < (/(+ a b)2) 6) "conceito D"]
        [( < (/(+ a b)2) 7) "conceito C"]
        [( < (/(+ a b)2) 9) "conceito B"]
        [else "conceito A"]))

; 14. Faça uma função (para cada subitem) que receba 3 números e retorne o resultado de:
; a. Maior número – Menor número
; b. Número do meio * Menor número
; c. Número do meio + Maior número
; Para decidir entre o maior, o menor e o do meio, suponha que estes números compõem
; um conjunto ordenado, o primeiro é o menor, o segundo o do meio e o terceiro o maior.
; Dica: Implemente funções para obter o maior, o menor e o valor do meio entre 3
; números, e as utilize em todas os subitens.
(define (qual-o-maior? a b c)
    (cond
        [(and(> a b)(> a c)) a]
        [(and (> b a)(> b c)) b]
        [else c]))

(define (qual-o-menor a b c)
    (cond
    [(and(< a b)(< a c))a]
    [(and (< b a)(< b c))b]
    [else c]))

(define (qual-o-meio a b c)
    (-(+ a b c) (qual-o-maior? a b c) (qual-o-menor a b c))) 

(define (calcula-menos a b c)
    (- (qual-o-maior? a b c) (qual-o-menor a b c)))

(define (calcula-multi a b c)
    (* (qual-o-meio a b c) (qual-o-menor a b c)))

(define (calcula-soma a b c)
    (+ (qual-o-meio a b c) (qual-o-maior? a b c)))

(qual-o-maior? 2 3 10)
(qual-o-menor 2 5 10)
(qual-o-menor 1 0 5)
(calcula-menos 2 5 6)
(calcula-soma 2 5 6)
(calcula-multi 2 5 6)