#lang racket

; 1. (Valor 5,0) Uma árvore binária de busca (ABB) pode ser definida da seguinte maneira:
; ◦ Um nó N com uma chave e duas sub-árvores binárias de busca, tais que:
; ▪ Todos os nós da subárvore direita tem a chave maior que a chave do no N;
; ▪ Todos os nós da subárvore esquerda tem a chave menor que a chave do no N;
; ◦ Uma árvore vazia;
; Ou seja, é uma árvore onde cada nó tem no máximo dois filhos, e todo nó armazena um
; valor de chave. Além disso, existe uma relação entre os nós da árvore, de forma que,
; todo nó possui seus filhos direitos com chaves maiores que a dele próprio, e todos seus
; filhos esquerdos com chaves menores que a própria chave.
; Sendo assim, implemente as 3 operações a seguir de uma árvore binária de busca:
; a. inserir um no na árvore

(struct arvoreVazia ())
(struct arvore (no esquerda direita))

(define (inserir arvore_atual elem)
  (cond
    [(arvoreVazia? arvore_atual) (arvore elem (arvoreVazia) (arvoreVazia))]
    [(= elem (arvore-no arvore_atual)) arvore_atual]
    [(< elem (arvore-no arvore_atual))
     (arvore (arvore-no arvore_atual)
             (inserir (arvore-esquerda arvore_atual) elem)
             (arvore-direita arvore_atual))]
    [else
     (arvore (arvore-no arvore_atual)
             (arvore-esquerda arvore_atual)
             (inserir (arvore-direita arvore_atual) elem))]))

; b. Remover um nó da árvore

(define (menor arvore_atual)
  (cond
      [(arvoreVazia? (arvore-esquerda arvore_atual)) (arvore-no arvore_atual)]
      [else (menor (arvore-esquerda arvore_atual))]))

(define (remover arvore_atual elem)
  (cond
      [(arvoreVazia? arvore_atual) arvore_atual]
      [(< elem (arvore-no arvore_atual))
        (arvore (arvore-no arvore_atual) (remover (arvore-esquerda arvore_atual) elem)
        (arvore-direita arvore_atual))]
      [(> elem (arvore-no arvore_atual))
        (arvore (arvore-no arvore_atual) (arvore-esquerda arvore_atual)
        (remover (arvore-direita arvore_atual) elem))]
      [else 
        (cond
          [(and (arvoreVazia? (arvore-esquerda arvore_atual)) (arvoreVazia? (arvore-direita arvore_atual))) 
          (arvoreVazia)]
          [(arvoreVazia? (arvore-esquerda arvore_atual)) (arvore-direita arvore_atual)]
          [(arvoreVazia? (arvore-direita arvore_atual)) (arvore-esquerda arvore_atual)]
          [else (arvore (menor (arvore-direita arvore_atual))
          (arvore-esquerda arvore_atual) (remover (arvore-direita arvore_atual) (menor (arvore-direita arvore_atual))))])]))

; c. Buscar um nó com um valor de chave;

(define (buscar_no arvore_atual elem)
  (cond
    [(arvoreVazia? arvore_atual) (arvoreVazia)]
    [(< elem (arvore-no arvore_atual)) (buscar_no (arvore-esquerda arvore_atual) elem)]
    [(> elem (arvore-no arvore_atual)) (buscar_no (arvore-direita arvore_atual) elem)]
    [else arvore_atual]))