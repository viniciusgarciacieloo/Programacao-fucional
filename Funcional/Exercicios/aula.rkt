#lang racket

; (struct ponto (x y))
; (define origem (ponto 0 0))
; (define x 100)
; #transparent deixa tudo visível

; (struct alunos(eu ra curso))
; (define alunos (struct-copy aluno eu [ra 143653] curso[tal])) ;struct-copy muda o valor atribuido antes 

(struct ponto(x y))
(define (distancia-origem p)
  (sqrt (+ (sqr (ponto-x p))
           (sqr (ponto-y p)))))
            
(distancia-origem (ponto 4 3))