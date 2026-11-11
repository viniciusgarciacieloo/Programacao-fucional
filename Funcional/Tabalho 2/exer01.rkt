#lang racket

(require rackunit)
; Chave é um número.

; Arvore é um dos valores
; - empty, uma árvore sem nós;
; - (arvore no esquerda direita), onde no é a Chave do nó, esquerda é uma Arvore
;   com todas as chaves menores que no e direita é uma Arvore com todas as
;   chaves maiores que no.

(struct arvore (no esquerda direita) #:transparent)

; a. inserir um no na árvore

; Arvore Chave -> Arvore

; Produz uma nova árvore com a chave elem inserida em arvore_atual, mantendo a
; regra da árvore binária de busca. Se elem já existe na árvore, produz
; arvore_atual sem mudanças, pois a árvore não tem chaves repetidas.

(define (inserir arvore_atual elem)
  (cond
    [(empty? arvore_atual) (arvore elem empty empty)]
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
    [(empty? (arvore-esquerda arvore_atual)) (arvore-no arvore_atual)]
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
    [(empty? arvore_atual) arvore_atual]
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
       [(and (empty? (arvore-esquerda arvore_atual))
             (empty? (arvore-direita arvore_atual)))
        empty]
       [(empty? (arvore-esquerda arvore_atual)) (arvore-direita arvore_atual)]
       [(empty? (arvore-direita arvore_atual)) (arvore-esquerda arvore_atual)]
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
    [(empty? arvore_atual) empty]
    [(< elem (arvore-no arvore_atual)) (buscar_no (arvore-esquerda arvore_atual) elem)]
    [(> elem (arvore-no arvore_atual)) (buscar_no (arvore-direita arvore_atual) elem)]
    [else arvore_atual]))

; Exemplos

; Como a estrutura arvore é #:transparent, o check-equal? compara as árvores
; inteiras, chave por chave.

; Chave -> Arvore
; Produz uma árvore com um só nó, usada para escrever os exemplos.
(define (folha chave)
  (arvore chave empty empty))

; arvore-exemplo:
;         5
;        / \
;       3   8
;      / \ / \
;     1  4 6  9
(define arvore-exemplo
  (arvore 5
          (arvore 3 (folha 1) (folha 4))
          (arvore 8 (folha 6) (folha 9))))

; inserir

; árvore vazia, o elemento vira a raiz e os dois lados ficam vazios
(check-equal? (inserir empty 5) (arvore 5 empty empty))

; inserir 5, 3 e 8 nessa ordem, o 3 fica à esquerda e o 8 à direita
(check-equal? (inserir (inserir (inserir empty 5) 3) 8)
              (arvore 5 (folha 3) (folha 8)))

; 0 é menor que 5, 3 e 1, então vai para a esquerda do 1
(check-equal? (inserir arvore-exemplo 0)
              (arvore 5
                      (arvore 3 (arvore 1 (folha 0) empty) (folha 4))
                      (arvore 8 (folha 6) (folha 9))))

; 10 é maior que 5, 8 e 9, então vai para a direita do 9
(check-equal? (inserir arvore-exemplo 10)
              (arvore 5
                      (arvore 3 (folha 1) (folha 4))
                      (arvore 8 (folha 6) (arvore 9 empty (folha 10)))))

; 7 é maior que 5, menor que 8 e maior que 6, então vai para a direita do 6
(check-equal? (inserir arvore-exemplo 7)
              (arvore 5
                      (arvore 3 (folha 1) (folha 4))
                      (arvore 8 (arvore 6 empty (folha 7)) (folha 9))))

; chave repetida na raiz, produz a própria árvore
(check-eq? (inserir arvore-exemplo 5) arvore-exemplo)

; chave repetida em uma folha, a árvore não muda
(check-equal? (inserir arvore-exemplo 4) arvore-exemplo)

; menor

; o nó mais à esquerda da árvore
(check-equal? (menor arvore-exemplo) 1)
; o menor da subárvore direita, (arvore-esquerda 8) = 6
(check-equal? (menor (arvore-direita arvore-exemplo)) 6)
; árvore sem nada à esquerda, o menor é a própria raiz
(check-equal? (menor (arvore 8 empty (folha 9))) 8)

; remover

; árvore vazia, não há o que remover
(check-equal? (remover empty 5) empty)

; chave que não existe, a árvore continua igual
(check-equal? (remover arvore-exemplo 7) arvore-exemplo)

; nó sem filhos (folha), o 1 vira uma árvore vazia
(check-equal? (remover arvore-exemplo 1)
              (arvore 5
                      (arvore 3 empty (folha 4))
                      (arvore 8 (folha 6) (folha 9))))

; nó só com filho à direita, sem o 1 o 3 só tem o 4, que sobe
(check-equal? (remover (remover arvore-exemplo 1) 3)
              (arvore 5
                      (folha 4)
                      (arvore 8 (folha 6) (folha 9))))

; nó só com filho à esquerda, sem o 4 o 3 só tem o 1, que sobe
(check-equal? (remover (remover arvore-exemplo 4) 3)
              (arvore 5
                      (folha 1)
                      (arvore 8 (folha 6) (folha 9))))

; árvore com um só nó, fica vazia
(check-equal? (remover (folha 5) 5) empty)

; nó com dois filhos, o 3 é trocado por (menor (arvore-direita 3)) = 4
(check-equal? (remover arvore-exemplo 3)
              (arvore 5
                      (arvore 4 (folha 1) empty)
                      (arvore 8 (folha 6) (folha 9))))

; nó com dois filhos, o 8 é trocado por (menor (arvore-direita 8)) = 9
(check-equal? (remover arvore-exemplo 8)
              (arvore 5
                      (arvore 3 (folha 1) (folha 4))
                      (arvore 9 (folha 6) empty)))

; raiz com dois filhos, o 5 é trocado por (menor (arvore-direita 5)) = 6
;         6
;        / \
;       3   8
;      / \   \
;     1   4   9
(check-equal? (remover arvore-exemplo 5)
              (arvore 6
                      (arvore 3 (folha 1) (folha 4))
                      (arvore 8 empty (folha 9))))

; remover produz uma árvore nova, arvore-exemplo não muda
(check-equal? arvore-exemplo
              (arvore 5
                      (arvore 3 (folha 1) (folha 4))
                      (arvore 8 (folha 6) (folha 9))))

; buscar_no

; chave na raiz, produz a árvore inteira
(check-equal? (buscar_no arvore-exemplo 5) arvore-exemplo)
; chave à esquerda, 3 < 5, produz o nó do 3 com os filhos 1 e 4
(check-equal? (buscar_no arvore-exemplo 3) (arvore 3 (folha 1) (folha 4)))
; chave em uma folha, 6 > 5 e 6 < 8
(check-equal? (buscar_no arvore-exemplo 6) (folha 6))
; chave que não existe, 7 > 5, 7 < 8, 7 > 6 e a direita do 6 é vazia
(check-equal? (buscar_no arvore-exemplo 7) empty)
; chaves menores e maiores que todas
(check-equal? (buscar_no arvore-exemplo 0) empty)
(check-equal? (buscar_no arvore-exemplo 10) empty)
; a chave removida não é mais encontrada
(check-equal? (buscar_no (remover arvore-exemplo 5) 5) empty)
; árvore vazia
(check-equal? (buscar_no empty 5) empty)
