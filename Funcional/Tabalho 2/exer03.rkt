#lang racket

(require rackunit)

; (X Y -> X) X (Listof Y) -> (Listof X)
;  Produz uma lista em que o i-ésimo elemento é o resultado de aplicar f ao
; valor ini e aos elementos das posições 1 até i de lst, da esquerda para a
; direita. Cada resultado é calculado uma única vez e usado como o ini da
; posição seguinte, então nenhuma operação é refeita. Se lst é vazia, produz
; uma lista vazia.

(define (scan f ini lst)
    (cond
        [(empty? lst) empty]
        [else
            (define resultado (f ini (first lst)))
            (cons resultado (scan f resultado (rest lst)))]))

; Exemplos

; Exemplos do enunciado
; lista vazia
(check-equal? (scan + 0 (list)) '())
; (+ 2 9) = 11, (+ 11 3) = 14, (+ 14 1) = 15, (+ 15 7) = 22
(check-equal? (scan + 2 (list 9 3 1 7)) '(11 14 15 22))
; (* 1 2) = 2, (* 2 3) = 6, (* 6 5) = 30
(check-equal? (scan * 1 (list 2 3 5)) '(2 6 30))
; (append '() '(1 2)) = '(1 2), (append '(1 2) '(3)) = '(1 2 3), ...
(check-equal? (scan append (list ) (list (list 1 2) (list 3) (list 4 5)))
              '((1 2) (1 2 3) (1 2 3 4 5)))
; (append '(0) '(1 2)) = '(0 1 2), (append '(0 1 2) '(3)) = '(0 1 2 3), ...
(check-equal? (scan append (list 0) (list (list 1 2) (list 3) (list 4 5)))
              '((0 1 2) (0 1 2 3) (0 1 2 3 4 5)))

; Exemplos adicionais
; lista com um elemento, (+ 5 7) = 12
(check-equal? (scan + 5 (list 7)) '(12))
; a ordem dos argumentos importa, (- 10 1) = 9, (- 9 2) = 7, (- 7 3) = 4
(check-equal? (scan - 10 (list 1 2 3)) '(9 7 4))
; maior valor até cada posição, (max 0 3) = 3, (max 3 1) = 3, (max 3 4) = 4, ...
(check-equal? (scan max 0 (list 3 1 4 1 5)) '(3 3 4 4 5))
; com strings, (string-append "a" "b") = "ab", (string-append "ab" "c") = "abc"
(check-equal? (scan string-append "a" (list "b" "c")) '("ab" "abc"))
