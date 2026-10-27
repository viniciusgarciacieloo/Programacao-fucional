#lang racket

(require rackunit)

;; Pilha é um dos valores
;; - (pilhaVazia), uma pilha sem elementos
;; - (pilha topo resto), onde topo é o elemento do topo da pilha e resto é uma
;;   Pilha com os demais elementos
(struct pilhaVazia())
(struct pilha(topo resto))

;; Pilha Qualquer -> Pilha
;;
;; Produz uma nova pilha com o elemento x no topo da pilha p.
(define (empilhar p x)
    (pilha x p))

;; Pilha -> Pilha
;;
;; Produz uma nova pilha sem o elemento do topo da pilha p.
;; Se p é vazia, produz uma pilha vazia.
(define (desempilhar p)
    (cond
        [(pilhaVazia? p) (pilhaVazia)]
        [else (pilha-resto p)]))

;; Pilha -> Qualquer
;;
;; Produz o elemento do topo da pilha p.
;; Se p é vazia, produz a mensagem "A Pilha está vazia".
(define (consultar-topo p)
    (cond
        [(pilhaVazia? p) "A Pilha está vazia"]
        [else (pilha-topo p)]))

;; Exemplos

; pilha-teste tem 3 no topo, depois 2 e por último 1
(define pilha-teste (empilhar (empilhar (empilhar (pilhaVazia) 1) 2) 3))

; empilhar
; o último elemento empilhado fica no topo
(check-equal? (consultar-topo (empilhar (pilhaVazia) 1)) 1)
(check-equal? (consultar-topo pilha-teste) 3)
(check-equal? (consultar-topo (empilhar pilha-teste 10)) 10)

; desempilhar
; remove o 3, o 2 fica no topo
(check-equal? (consultar-topo (desempilhar pilha-teste)) 2)
; remove o 3 e o 2, o 1 fica no topo
(check-equal? (consultar-topo (desempilhar (desempilhar pilha-teste))) 1)
; remove todos os elementos, a pilha fica vazia
(check-true (pilhaVazia? (desempilhar (desempilhar (desempilhar pilha-teste)))))
; desempilhar uma pilha vazia produz uma pilha vazia
(check-true (pilhaVazia? (desempilhar (pilhaVazia))))

; consultar-topo
(check-equal? (consultar-topo (pilhaVazia)) "A Pilha está vazia")
; consultar o topo não remove o elemento da pilha
(check-equal? (consultar-topo pilha-teste) 3)
