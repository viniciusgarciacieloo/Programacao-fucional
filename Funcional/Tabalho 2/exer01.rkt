#lang racket

(require rackunit)
; Chave é um número.

; Arvore é um dos valores
; - (arvoreVazia), uma árvore sem nós;
; - (arvore no esquerda direita), onde no é a Chave do nó, esquerda é uma Arvore
;   com todas as chaves menores que no e direita é uma Arvore com todas as
;   chaves maiores que no.

(struct arvoreVazia ())
(struct arvore (no esquerda direita))

; a. inserir um no na árvore

; Arvore Chave -> Arvore

; Produz uma nova árvore com a chave elem inserida em arvore_atual, mantendo a
; regra da árvore binária de busca. Se elem já existe na árvore, produz
; arvore_atual sem mudanças, pois a árvore não tem chaves repetidas.

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

; Arvore -> Chave

; Produz a menor chave de arvore_atual, que é a chave do nó mais à esquerda.
; Requer que arvore_atual não seja vazia.

(define (menor arvore_atual)
  (cond
    [(arvoreVazia? (arvore-esquerda arvore_atual)) (arvore-no arvore_atual)]
    [else (menor (arvore-esquerda arvore_atual))]))

; Arvore Chave -> Arvore
;
; Produz uma nova árvore sem o nó de chave elem, mantendo a regra da árvore
; binária de busca. Se elem não existe na árvore, produz uma árvore igual a
; arvore_atual. Ao encontrar o nó:
; - se ele não tem filhos, ele é trocado por uma árvore vazia;
; - se ele tem só um filho, esse filho ocupa o lugar dele;
; - se ele tem dois filhos, a menor chave da subárvore direita ocupa o lugar
;   dele e é removida da subárvore direita.

(define (remover arvore_atual elem)
  (cond
    [(arvoreVazia? arvore_atual) arvore_atual]
    [(< elem (arvore-no arvore_atual))
     (arvore (arvore-no arvore_atual)
             (remover (arvore-esquerda arvore_atual) elem)
             (arvore-direita arvore_atual))]
    [(> elem (arvore-no arvore_atual))
     (arvore (arvore-no arvore_atual)
             (arvore-esquerda arvore_atual)
             (remover (arvore-direita arvore_atual) elem))]
    [else
     (cond
       [(and (arvoreVazia? (arvore-esquerda arvore_atual))
             (arvoreVazia? (arvore-direita arvore_atual)))
        (arvoreVazia)]
       [(arvoreVazia? (arvore-esquerda arvore_atual)) (arvore-direita arvore_atual)]
       [(arvoreVazia? (arvore-direita arvore_atual)) (arvore-esquerda arvore_atual)]
       [else
        (arvore (menor (arvore-direita arvore_atual))
                (arvore-esquerda arvore_atual)
                (remover (arvore-direita arvore_atual)
                         (menor (arvore-direita arvore_atual))))])]))

; c. Buscar um nó com um valor de chave;

; Arvore Chave -> Arvore
;
; Produz o nó de arvore_atual que tem a chave elem, junto com as suas
; subárvores. Se elem não existe na árvore, produz uma árvore vazia.

(define (buscar_no arvore_atual elem)
  (cond
    [(arvoreVazia? arvore_atual) (arvoreVazia)]
    [(< elem (arvore-no arvore_atual)) (buscar_no (arvore-esquerda arvore_atual) elem)]
    [(> elem (arvore-no arvore_atual)) (buscar_no (arvore-direita arvore_atual) elem)]
    [else arvore_atual]))

; Exemplos

; Como as estruturas não são comparadas com check-equal?, os exemplos verificam
; as chaves e as subárvores com arvore-no, arvore-esquerda e arvore-direita.

; arvore-exemplo:
(define arvore-exemplo
  (arvore 5
          (arvore 3
                  (arvore 1 (arvoreVazia) (arvoreVazia))
                  (arvore 4 (arvoreVazia) (arvoreVazia)))
          (arvore 8
                  (arvore 6 (arvoreVazia) (arvoreVazia))
                  (arvore 9 (arvoreVazia) (arvoreVazia)))))

; inserir

; árvore vazia, o elemento vira a raiz e os dois lados ficam vazios
(check-equal? (arvore-no (inserir (arvoreVazia) 5)) 5)
(check-true (arvoreVazia? (arvore-esquerda (inserir (arvoreVazia) 5))))
(check-true (arvoreVazia? (arvore-direita (inserir (arvoreVazia) 5))))

; inserir 5, 3 e 8 nessa ordem, o 3 fica à esquerda e o 8 à direita
(check-equal? (arvore-no (arvore-esquerda (inserir (inserir (inserir (arvoreVazia) 5) 3) 8))) 3)
(check-equal? (arvore-no (arvore-direita (inserir (inserir (inserir (arvoreVazia) 5) 3) 8))) 8)

; 0 é menor que 5, 3 e 1, então vai para a esquerda do 1
(check-equal? (arvore-no (arvore-esquerda (arvore-esquerda (arvore-esquerda (inserir arvore-exemplo 0))))) 0)

; 10 é maior que 5, 8 e 9, então vai para a direita do 9
(check-equal? (arvore-no (arvore-direita (arvore-direita (arvore-direita (inserir arvore-exemplo 10))))) 10)

; 7 é maior que 5, menor que 8 e maior que 6, então vai para a direita do 6
(check-equal? (arvore-no (arvore-direita (arvore-esquerda (arvore-direita (inserir arvore-exemplo 7))))) 7)

; a raiz e o outro lado não mudam
(check-equal? (arvore-no (inserir arvore-exemplo 7)) 5)
(check-equal? (arvore-no (arvore-esquerda (inserir arvore-exemplo 7))) 3)

; chave repetida na raiz, produz a própria árvore
(check-eq? (inserir arvore-exemplo 5) arvore-exemplo)

; chave repetida em uma folha, o 4 continua sem filhos
(check-true (arvoreVazia? (arvore-esquerda (buscar_no (inserir arvore-exemplo 4) 4))))
(check-true (arvoreVazia? (arvore-direita (buscar_no (inserir arvore-exemplo 4) 4))))

; menor

; o nó mais à esquerda da árvore
(check-equal? (menor arvore-exemplo) 1)
; o menor da subárvore direita, (arvore-esquerda 8) = 6
(check-equal? (menor (arvore-direita arvore-exemplo)) 6)
; árvore sem nada à esquerda, o menor é a própria raiz
(check-equal? (menor (arvore 8 (arvoreVazia) (arvore 9 (arvoreVazia) (arvoreVazia)))) 8)

; remover

; árvore vazia, não há o que remover
(check-true (arvoreVazia? (remover (arvoreVazia) 5)))

; chave que não existe, a árvore continua com todas as chaves
(check-equal? (arvore-no (remover arvore-exemplo 7)) 5)
(check-equal? (arvore-no (buscar_no (remover arvore-exemplo 7) 6)) 6)
(check-equal? (arvore-no (buscar_no (remover arvore-exemplo 7) 9)) 9)

; nó sem filhos (folha), o 1 vira uma árvore vazia
(check-true (arvoreVazia? (arvore-esquerda (arvore-esquerda (remover arvore-exemplo 1)))))
(check-equal? (arvore-no (arvore-esquerda (remover arvore-exemplo 1))) 3)

; nó só com filho à direita, sem o 1 o 3 só tem o 4, que sobe
(check-equal? (arvore-no (arvore-esquerda (remover (remover arvore-exemplo 1) 3))) 4)

; nó só com filho à esquerda, sem o 4 o 3 só tem o 1, que sobe
(check-equal? (arvore-no (arvore-esquerda (remover (remover arvore-exemplo 4) 3))) 1)

; árvore com um só nó, fica vazia
(check-true (arvoreVazia? (remover (arvore 5 (arvoreVazia) (arvoreVazia)) 5)))

; nó com dois filhos, o 8 é trocado por (menor (arvore-direita 8)) = 9
(check-equal? (arvore-no (arvore-direita (remover arvore-exemplo 8))) 9)
(check-equal? (arvore-no (arvore-esquerda (arvore-direita (remover arvore-exemplo 8)))) 6)
(check-true (arvoreVazia? (arvore-direita (arvore-direita (remover arvore-exemplo 8)))))

; raiz com dois filhos, o 5 é trocado por (menor (arvore-direita 5)) = 6
;         6
;        / \
;       3   8
;      / \   \
;     1   4   9
(check-equal? (arvore-no (remover arvore-exemplo 5)) 6)
(check-equal? (arvore-no (arvore-esquerda (remover arvore-exemplo 5))) 3)
(check-true (arvoreVazia? (arvore-esquerda (arvore-direita (remover arvore-exemplo 5)))))
(check-equal? (arvore-no (arvore-direita (arvore-direita (remover arvore-exemplo 5)))) 9)

; a chave removida não é mais encontrada
(check-true (arvoreVazia? (buscar_no (remover arvore-exemplo 5) 5)))
(check-true (arvoreVazia? (buscar_no (remover arvore-exemplo 3) 3)))

; remover produz uma árvore nova, arvore-exemplo não muda
(check-equal? (arvore-no arvore-exemplo) 5)
(check-equal? (arvore-no (arvore-direita arvore-exemplo)) 8)

; buscar_no

; chave na raiz
(check-equal? (arvore-no (buscar_no arvore-exemplo 5)) 5)
; chave à esquerda, 3 < 5
(check-equal? (arvore-no (buscar_no arvore-exemplo 3)) 3)
; chave em uma folha, 6 > 5 e 6 < 8
(check-equal? (arvore-no (buscar_no arvore-exemplo 6)) 6)
; o nó encontrado vem com as suas subárvores, os filhos do 3 são 1 e 4
(check-equal? (arvore-no (arvore-esquerda (buscar_no arvore-exemplo 3))) 1)
(check-equal? (arvore-no (arvore-direita (buscar_no arvore-exemplo 3))) 4)
; chave que não existe, 7 > 5, 7 < 8, 7 > 6 e a direita do 6 é vazia
(check-true (arvoreVazia? (buscar_no arvore-exemplo 7)))
; chaves menores e maiores que todas
(check-true (arvoreVazia? (buscar_no arvore-exemplo 0)))
(check-true (arvoreVazia? (buscar_no arvore-exemplo 10)))
; árvore vazia
(check-true (arvoreVazia? (buscar_no (arvoreVazia) 5)))
