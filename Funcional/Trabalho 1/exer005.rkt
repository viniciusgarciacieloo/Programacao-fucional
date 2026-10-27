#lang racket

(require rackunit)

;; Fila é um dos valores
;; - (filaVazia), uma fila sem elementos
;; - (fila inicio resto), onde inicio é o primeiro elemento da fila e resto é
;;   uma Fila com os demais elementos
(struct filaVazia())
(struct fila(inicio resto))

;; Fila Qualquer -> Fila
;;
;; Produz uma nova fila com o elemento elem adicionado no final de fila_atual.
(define (enfileirar fila_atual elem)
    (cond
        [(filaVazia? fila_atual) (fila elem (filaVazia))]
        [else (fila (fila-inicio fila_atual) (enfileirar (fila-resto fila_atual) elem))]))

;; Fila -> Fila
;;
;; Produz uma nova fila sem o primeiro elemento de fila_atual.
;; Se fila_atual é vazia, produz uma fila vazia.
(define (desenfileirar fila_atual)
    (cond
        [(filaVazia? fila_atual) (filaVazia)]
        [else (fila-resto fila_atual)]))

;; Fila -> Qualquer
;;
;; Produz o primeiro elemento de fila_atual.
;; Se fila_atual é vazia, produz a mensagem "A fila está vazia".
(define (consultar_primeiro fila_atual)
    (cond
        [(filaVazia? fila_atual) "A fila está vazia"]
        [else (fila-inicio fila_atual)]))

;; Exemplos

; fila-teste tem 1 no início, depois 2 e por último 3
(define fila-teste (enfileirar (enfileirar (enfileirar (filaVazia) 1) 2) 3))

; enfileirar
; o primeiro elemento enfileirado continua sendo o primeiro da fila
(check-equal? (consultar_primeiro (enfileirar (filaVazia) 1)) 1)
(check-equal? (consultar_primeiro fila-teste) 1)
(check-equal? (consultar_primeiro (enfileirar fila-teste 10)) 1)
; o elemento enfileirado vai para o final, depois de remover 1, 2 e 3 ele é o primeiro
(check-equal? (consultar_primeiro (desenfileirar (desenfileirar (desenfileirar (enfileirar fila-teste 10))))) 10)

; desenfileirar
; remove o 1, o 2 passa a ser o primeiro
(check-equal? (consultar_primeiro (desenfileirar fila-teste)) 2)
; remove o 1 e o 2, o 3 passa a ser o primeiro
(check-equal? (consultar_primeiro (desenfileirar (desenfileirar fila-teste))) 3)
; remove todos os elementos, a fila fica vazia
(check-true (filaVazia? (desenfileirar (desenfileirar (desenfileirar fila-teste)))))
; desenfileirar uma fila vazia produz uma fila vazia
(check-true (filaVazia? (desenfileirar (filaVazia))))

; consultar_primeiro
(check-equal? (consultar_primeiro (filaVazia)) "A fila está vazia")
; consultar o primeiro não remove o elemento da fila
(check-equal? (consultar_primeiro fila-teste) 1)
