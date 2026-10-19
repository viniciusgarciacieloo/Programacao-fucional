DINAMICAS

ponteiro é uma ponteiro (aponta) (p) (aponta para 3 lugares possíveis: caixinha, guardado ou perdido)
caixinha é caixinha (é apontada) (p^)

p^ <- 8; 
p <- q; faça o p apontar para onde o q ta apontando
p <- 8;p aponta para a posição 8 de memória

novo(p); cria uma caixinha e faz o p apontar para ela

nil = constante para onde apontamos os ponteiros que não usamos; p = nil

dispose(p); destruir a caixinha que o p aponta (fica livre)

ponteiro do tipo nó

TpNó = registro
    info: ?;
    prox: ^tpNó;
fim; 

[info]prox(ponteiro)]

CRIAÇÃO DA LISTA ENCADEADA/LIGADA
p, q:^TpNó
leia(x); (2)
novo(q); []] <- q(ponteiro); q^ caixinha do tipo ^TpNó (para acessar q^ faz q^.info) (q^.prox) 
q^.info <- x; [2]]
q^.prox <- p; está apontando para onde o p ta apontando [2]nil]
p <- q; p aponta para onde o q esta apotando

obs: Vetor consegue acessar qualquer elemento pelo índice 
