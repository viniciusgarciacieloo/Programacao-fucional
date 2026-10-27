#lang racket
(require rackunit)

; (struct lista (primeiro resto) #:transparent)
; (struct vazia () #:transparent)

; (define (soma-lista lst)
;     (cond
;         [(vazia? lst) 0]
;         [else (+ (lista-primeiro lst) (soma-lista (lista-resto lst)))]))

; (define lv (vazia))
; (define l1 (lista 6 (lista 2 (lista 3 (vazia)))))
; (define l2 (lista 9 (vazia)))

; (check-equal? (soma-lista lv) 0)
; (check-equal? (soma-lista l1) 11)
; (check-equal? (soma-lista l2) 9)
; (check-equal? (soma-lista (lista 1 (lista 2 (lista 3 (vazia))))) 6)

; refazendo soma lista 

(define (soma-lista2 lst)
  (cond
    [(empty? lst) 0]
    [else (+ (first lst) (soma-lista2 (rest lst)))]))

(check-equal? (soma-lista2 '(1 2 3 4)) 10)
(check-equal? (soma-lista2 empty) 0)
(check-equal? (soma-lista2 '()) 0)


; (print lv)
; (print l1)
; (print l2)
; (define l (lista 3 (lista 6 (lista 2 vazia))))
; (print l)

(define (contem lst val)
  (cond 
    [(empty? lst) #t]
    [(equal? (first lst) val) #t]
    [else (contem(rest lst) val)]))


(define (remove_negativo lst)
  (cond
    [(empty? lst) empty]
    [(< (first lst) 0) remove_negativo (rest lst)] ; função que verifica se é negative?
    [else (cons (first lst) (remove_negativo (rest lst)))]))

(define (soma-ate n)
  (cond
    [(zero? n) 0]
    [else + n (soma-ate(sub1 n))]))
  

(define (insere-fim lst)
  (cond
    [(empty? lst) (cons n empty)] ; ou (list n)
    [else (cons (first lst) (insere-fim(rest lst)))]))

(define (lista-natural n)
  (cond
    [(zero? n) empty]
    [else (insere-fim (lista-natural (sub1 n)) n)]))
  

(define (inverte lst)
  (cond
    [(empty? lst)empty]
    [(append (inverte (rest lst)) (list (first lst)))]))

(check-equal? (inverte (list 1 2 3 4)) (list 4 3 2 1))
(check-equal? (inverte (list )))