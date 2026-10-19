#lang racket

(define (valorDescontado valor_jogo percentual valor_jogo_concorrente)
    (cond
        [(> (- valor_jogo (* valor_jogo percentual)) valor_jogo_concorrente) valor_jogo_concorrente]
        [else (- valor_jogo (* valor_jogo percentual))]))
; (Valor 1,5) O natal está chegando e as plataformas de jogos digitais estão fazendo o
; planejamento das promoções de jogos. A empresa que você trabalha precisa realizar
; uma atualização na loja virtual de forma que o preço promocional dos jogos deverá
; obedecer a regra a seguir:
; ◦ Deverá ser dado um percentual de desconto em um jogo informado pelo setor
; financeiro (cada jogo terá seu percentual próprio). Caso o preço do jogo com desconto
; fique maior que o preço da loja concorrente, o preço de venda do jogo
; deverá ser o mesmo da loja concorrente;
; Considerando essas informações, e que o preço do jogo na loja concorrente poderá ser
; usado como um argumento da sua função, projete uma função que calcule o preço do
; jogo com o desconto concedido.