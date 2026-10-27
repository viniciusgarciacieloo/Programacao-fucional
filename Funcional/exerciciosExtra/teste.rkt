#lang racket
(displayln "Olá, Racket no VS Code!")
(define n 5)
(define (square n) (* n n))
(square n)
(define (plus a b) (+ a b))
(plus 2 2)
(define subtract (lambda (a b) (- a b)))
(subtract 5 2)
(define cubo (lambda (x) (* x x x) ))
(cubo 3)

(define maior 
    (lambda (a b)
        (cond [(> a b) a]
        [else b])))
(maior 5 10)

(define eh-par?
    (lambda (n)
        (cond [(= (modulo n 2) 0) #t]
        [else #f])))
(eh-par? 3)

(define numeros (list 1 2 3 4 5))
(define quadrado 
    (map (lambda (x) (* x x)) numeros))
quadrado

(define lista (list 1 2 3 4 5))
(define texto
    (map (lambda (x) (string-append "Número: " (number->string x))) lista))
texto

(define lista-numeros (list 3 -5 8 -2 0 7 -10))
(define numpositivos
    (filter (lambda (x) (> x 0)) lista-numeros))
numpositivos

(define lista-nome (list "gato" "cachorro" "ovo" "rato" "asa"))
(define tres
	(filter (lambda(x) (= (string-length x) 3))lista-nome))
tres


; testa se algum divisor de 2 até (n-1) divide n
(define (tem-divisor? n d)
  (cond [(>= d n) #f]                          ; caso base: testou todos, não achou divisor
        [(= (modulo n d) 0) #t]                ; achou um divisor -> não é primo
        [else (tem-divisor? n (+ d 1))]))      ; senão, testa o próximo divisor

(define (primo? n)
  (cond [(< n 2) #f]                    ; 0 e 1 não são primos
        [else (not (tem-divisor? n 2))])) ; primo = não tem divisor

(define numeros-primos (list 2 3 4 5 6 7 8 9 10 11))
(define primos (filter primo? numeros-primos))
primos

(define lista-2(list 1 2 3 4 5 6 7 8 9 10))
(define div3
    (filter (lambda (x) (= (modulo x 3) 0)) lista-2))
(define soma100
    (map (lambda (x) (+ x 100)) div3))
soma100

(define lista-idade (list 15 22 8 30 17 45 12 18))
(define maior-idade
    (filter (lambda (x) (>= x 18)) lista-idade))
(define texto-maior-idade
    (map (lambda (x) (string-append "Tem " (number->string x) " anos")) maior-idade))
texto-maior-idade

(define lista-num2 (list -3 -2 -1 0 1 2 3))
(define transformar
    (map (lambda(x)
    (cond [(> x 0) (string-append (number->string x) " é positivo")]
          [(< x 0) (string-append (number->string x) " é negativo")]
          [else (string-append (number->string x) " é zero")])) lista-num2))
; string-append é a concatenação de strings, number->string converte número para string
transformar

(define lista-3 (list 1 2 3 4 5 6 7 8 9 10))
(define meu-map
    (lambda (f lst)
        (cond [(null? lst) '()] ; caso base: lista vazia
              [else (cons (f (car lst)) (meu-map f (cdr lst)))]))) ; aplica f ao primeiro elemento e recursivamente ao resto da lista
(meu-map (lambda (x) (* x x)) lista-3)

(define meu-filter
    (lambda (pred lst)
        (cond [(null? lst) '()] ; caso base: lista vazia
              [(pred (car lst)) (cons (car lst) (meu-filter pred (cdr lst)))] ; se o predicado é verdadeiro, inclui o elemento
              [else (meu-filter pred (cdr lst))]))) ; senão, continua com o resto da lista

(define (soma-se lst pred)
  (cond [(null? lst) 0]
        [(pred (car lst)) (+ (car lst) (soma-se (cdr lst) pred))]
        [else (soma-se (cdr lst) pred)]))

(define lista1(list 10 -25 3 -47 8 16))
(define maior_que_15
    (filter (lambda(x) (> x 15)) lista1))
maior_que_15

(define lista2(list "maça" "banana" "uva" "kiwi" "melancia"))
(define tam
	(map string-length lista2))
tam

(define todos-positivos? 
	(map (lambda (x) (> x 0)) lista1))
todos-positivos?

; (foldr funcao valor-inicial lista).

; racket
; (foldr + 0 (list 1 2 3 4))  ; 10 -> soma tudo, começando de 0
; (foldr * 1 (list 1 2 3 4))  ; 24 -> multiplica tudo, começando de 1
(foldr + 0 (list 5 10 15 20))

(define area-retangulo
	(lambda (base altura)
		(* base altura)))
(area-retangulo 20 10)

(struct ponto(x y))
(struct ponto2(x2 y2))
(define distancia
    (lambda (ponto ponto2)
        (sqrt (+ (expt (- (ponto-x ponto) (ponto2-x2 ponto2)) 2)
                 (expt (- (ponto-y ponto) (ponto2-y2 ponto2)) 2)))))
distancia (ponto 1 2) (ponto2 4 6)

(struct circulo (raio))
(struct retangulo (base altura))

(define (area-forma f)
  (cond
    [(circulo? f)   (* pi (sqr (circulo-raio f)))]
    [(retangulo? f) (* (retangulo-base f) (retangulo-altura f))]
    [else (error "Forma inválida ou desconhecida")]))

