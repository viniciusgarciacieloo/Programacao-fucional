#lang racket

(require rackunit)

; a)

;; Nota é um número entre 0 e 10.
;; Percentual é um número entre 0 e 1 (por exemplo, 0.25 representa 25%).

;; Aluno é uma estrutura (aluno RA nome nota1 nota2 nota3 nota4 total_faltas) onde
;; - RA é um número natural que identifica o aluno;
;; - nome é uma string com o nome do aluno;
;; - nota1, nota2, nota3 e nota4 são do tipo Nota e representam as 4 avaliações;
;; - total_faltas é um número natural com o total de faltas (em horas/aula).
(struct aluno (RA nome nota1 nota2 nota3 nota4 total_faltas))

;; Turma é um dos valores
;; - empty
;; - (cons Aluno Turma)

;; Situacao é um dos valores
;; - "Aprovado"
;; - "Reprovado por nota"
;; - "Reprovado por falta"

;; Aluno -> Nota
;;
;; Calcula a média aritmética das 4 notas do aluno M.
(define (media M)
    (/ (+ (aluno-nota1 M) (aluno-nota2 M) (aluno-nota3 M) (aluno-nota4 M)) 4))

;; b)

;; Aluno Nota Natural Percentual -> Situacao
;;
;; Verifica a situação do aluno a na disciplina. Produz "Reprovado por nota" se
;; a média do aluno for menor que nota_necessaria; senão produz
;; "Reprovado por falta" se o total de faltas for maior que max_falta da
;; carga_horaria; caso contrário produz "Aprovado".
;; Se o aluno reprovou por nota e por falta, a reprovação por nota é a considerada.
(define (passou a nota_necessaria carga_horaria max_falta)
    (cond
        [(< (media a) nota_necessaria) "Reprovado por nota"]
        [(> (aluno-total_faltas a) (* max_falta carga_horaria)) "Reprovado por falta"]
        [else "Aprovado"]))

;; c)

;; Turma Nota Natural Percentual -> Natural
;;
;; Conta quantos alunos da turma foram reprovados, seja por nota ou por falta.
(define (turma_alunos turma nota_necessaria carga_horaria max_falta)
    (cond
        [(empty? turma) 0]
        [else
            (cond
                [(or (string=? (passou (car turma) nota_necessaria carga_horaria max_falta) "Reprovado por nota")
                (string=? (passou (car turma) nota_necessaria carga_horaria max_falta) "Reprovado por falta"))
                (+ 1 (turma_alunos (cdr turma) nota_necessaria carga_horaria max_falta))]
                [else (turma_alunos (cdr turma) nota_necessaria carga_horaria max_falta)])]))

;; Turma Nota Natural Percentual -> Número
;;
;; Calcula o percentual (de 0 a 100) de alunos reprovados em relação ao total
;; de alunos da turma.
;; Se a turma é vazia, produz 0.
(define (percentual turma nota_necessaria carga_horaria max_falta)
    (define reprovados (turma_alunos turma nota_necessaria carga_horaria max_falta))
    (define total (length turma))
    (cond
        [(= total 0) 0]
        [else (* (/ reprovados total) 100)]))

;; Turma Nota Natural Percentual -> Natural
;;
;; Conta quantos alunos da turma foram reprovados por falta.
(define (reprovados_Falta turma nota_necessaria carga_horaria max_falta)
    (cond
        [(empty? turma) 0]
        [(string=? (passou (car turma) nota_necessaria carga_horaria max_falta)"Reprovado por falta")
        (+ 1 (reprovados_Falta (cdr turma) nota_necessaria carga_horaria max_falta))]
        [else (reprovados_Falta (cdr turma) nota_necessaria carga_horaria max_falta)]))

;; Turma Nota Natural Percentual -> Número
;;
;; Calcula o percentual (de 0 a 100) de alunos reprovados por falta em relação
;; ao total de alunos reprovados da turma.
;; Se nenhum aluno foi reprovado, produz 0.
(define (percentual_falta turma nota_necessaria carga_horaria max_falta)
    (define reprovados_falta (reprovados_Falta turma nota_necessaria carga_horaria max_falta))
    (define total_reprovados (turma_alunos turma nota_necessaria carga_horaria max_falta))
    (cond
        [(= total_reprovados 0) 0]
        [else (* (/ reprovados_falta total_reprovados) 100)]))

;; Turma Nota Natural Percentual -> Natural
;;
;; Conta quantos alunos da turma foram reprovados por nota.
(define (reprovados_Nota turma nota_necessaria carga_horaria max_falta)
    (cond
        [(empty? turma) 0]
        [(string=? (passou (car turma) nota_necessaria carga_horaria max_falta)"Reprovado por nota")
        (+ 1 (reprovados_Nota (cdr turma) nota_necessaria carga_horaria max_falta))]
        [else (reprovados_Nota (cdr turma) nota_necessaria carga_horaria max_falta) ]))

;; Turma Nota Natural Percentual -> Número
;;
;; Calcula o percentual (de 0 a 100) de alunos reprovados por nota em relação
;; ao total de alunos reprovados da turma.
;; Se nenhum aluno foi reprovado, produz 0.
(define (percentual_Nota turma nota_necessaria carga_horaria max_falta)
    (define reprovados_nota (reprovados_Nota turma nota_necessaria carga_horaria max_falta))
    (define total_reprovados (turma_alunos turma nota_necessaria carga_horaria max_falta))
    (cond
        [(= total_reprovados 0) 0]
        [else (* (/ reprovados_nota total_reprovados) 100)]))

;; Turma Nota Natural Percentual -> Número
;;
;; Soma as médias dos alunos da turma que foram reprovados por nota.
(define (mediasReprovados_Nota turma nota_necessaria carga_horaria max_falta)
    (cond
        [(empty? turma) 0]
        [(string=? (passou (car turma) nota_necessaria carga_horaria max_falta) "Reprovado por nota")
        (+ (media (car turma))
        (mediasReprovados_Nota (cdr turma) nota_necessaria carga_horaria max_falta))]
        [else (mediasReprovados_Nota (cdr turma) nota_necessaria carga_horaria max_falta)]))

;; Turma Nota Natural Percentual -> Nota
;;
;; Calcula a nota média dos alunos da turma que foram reprovados por nota.
;; Se nenhum aluno foi reprovado por nota, produz 0.
(define (mediaFinal_ReprovadosNota turma nota_necessaria carga_horaria max_falta)
    (define total_reprovados_nota (reprovados_Nota turma nota_necessaria carga_horaria max_falta))
    (cond
        [(= total_reprovados_nota 0) 0]
        [else (/ (mediasReprovados_Nota turma nota_necessaria carga_horaria max_falta) total_reprovados_nota)]))

;; Exemplos

; Em todos os exemplos a nota necessária é 6.0, a carga horária é 60 e o
; percentual máximo de faltas é 0.25, ou seja, o limite é (* 0.25 60) = 15 faltas.

(define turma-teste
    (list
        (aluno 1 "Vinicius" 8.0 7.0 9.0 6.0 2)     ; média 7.5, 2 faltas    -> "Aprovado"
        (aluno 2 "Pedro" 5.0 4.0 6.0 5.0 20)       ; média 5.0, 20 faltas   -> "Reprovado por nota"
        (aluno 3 "Alice" 9.0 9.0 8.0 9.5 1)))      ; média 8.875, 1 falta   -> "Aprovado"

(define turma-teste2
    (list
        (aluno 1 "Vinicius" 8.0 7.0 9.0 6.0 2)     ; média 7.5, 2 faltas    -> "Aprovado"
        (aluno 2 "Pedro" 5.0 4.0 6.0 5.0 20)       ; média 5.0, 20 faltas   -> "Reprovado por nota"
        (aluno 4 "Maria" 7.0 8.0 7.0 8.0 30)       ; média 7.5, 30 faltas   -> "Reprovado por falta"
        (aluno 5 "Joao" 3.0 4.0 5.0 4.0 0)))       ; média 4.0, 0 faltas    -> "Reprovado por nota"

; media
; (/ (+ 8.0 7.0 9.0 6.0) 4)
(check-= (media (aluno 1 "Vinicius" 8.0 7.0 9.0 6.0 2)) 7.5 0.0001)
; (/ (+ 5.0 4.0 6.0 5.0) 4)
(check-= (media (aluno 2 "Pedro" 5.0 4.0 6.0 5.0 20)) 5.0 0.0001)

; passou
; média 7.5 >= 6.0 e 2 faltas <= 15
(check-equal? (passou (aluno 1 "Vinicius" 8.0 7.0 9.0 6.0 2) 6.0 60 0.25) "Aprovado")
; média 5.0 < 6.0 (também passou do limite de faltas, mas a nota é verificada antes)
(check-equal? (passou (aluno 2 "Pedro" 5.0 4.0 6.0 5.0 20) 6.0 60 0.25) "Reprovado por nota")
; média 7.5 >= 6.0, mas 30 faltas > 15
(check-equal? (passou (aluno 4 "Maria" 7.0 8.0 7.0 8.0 30) 6.0 60 0.25) "Reprovado por falta")
; casos limite: média exatamente 6.0 e faltas exatamente 15
(check-equal? (passou (aluno 6 "Ana" 6.0 6.0 6.0 6.0 15) 6.0 60 0.25) "Aprovado")

; turma_alunos
; só o Pedro reprovou
(check-equal? (turma_alunos turma-teste 6.0 60 0.25) 1)
; Pedro, Maria e Joao reprovaram
(check-equal? (turma_alunos turma-teste2 6.0 60 0.25) 3)
; turma vazia
(check-equal? (turma_alunos empty 6.0 60 0.25) 0)

; percentual
; (* (/ 1 3) 100)
(check-= (percentual turma-teste 6.0 60 0.25) 33.3333 0.0001)
; (* (/ 3 4) 100)
(check-= (percentual turma-teste2 6.0 60 0.25) 75 0.0001)
; turma vazia
(check-= (percentual empty 6.0 60 0.25) 0 0.0001)

; reprovados_Falta
; o Pedro passou do limite de faltas, mas foi reprovado por nota
(check-equal? (reprovados_Falta turma-teste 6.0 60 0.25) 0)
; só a Maria
(check-equal? (reprovados_Falta turma-teste2 6.0 60 0.25) 1)

; percentual_falta
; 0 reprovados por falta de 1 reprovado, (* (/ 0 1) 100)
(check-= (percentual_falta turma-teste 6.0 60 0.25) 0 0.0001)
; 1 reprovado por falta de 3 reprovados, (* (/ 1 3) 100)
(check-= (percentual_falta turma-teste2 6.0 60 0.25) 33.3333 0.0001)
; nenhum aluno reprovado
(check-= (percentual_falta (list (aluno 1 "Vinicius" 8.0 7.0 9.0 6.0 2)) 6.0 60 0.25) 0 0.0001)

; reprovados_Nota
; só o Pedro
(check-equal? (reprovados_Nota turma-teste 6.0 60 0.25) 1)
; Pedro e Joao
(check-equal? (reprovados_Nota turma-teste2 6.0 60 0.25) 2)

; percentual_Nota
; 1 reprovado por nota de 1 reprovado, (* (/ 1 1) 100)
(check-= (percentual_Nota turma-teste 6.0 60 0.25) 100 0.0001)
; 2 reprovados por nota de 3 reprovados, (* (/ 2 3) 100)
(check-= (percentual_Nota turma-teste2 6.0 60 0.25) 66.6667 0.0001)
; nenhum aluno reprovado
(check-= (percentual_Nota (list (aluno 1 "Vinicius" 8.0 7.0 9.0 6.0 2)) 6.0 60 0.25) 0 0.0001)

; mediasReprovados_Nota
; só a média do Pedro
(check-= (mediasReprovados_Nota turma-teste 6.0 60 0.25) 5.0 0.0001)
; (+ 5.0 4.0), médias do Pedro e do Joao
(check-= (mediasReprovados_Nota turma-teste2 6.0 60 0.25) 9.0 0.0001)

; mediaFinal_ReprovadosNota
; (/ 5.0 1)
(check-= (mediaFinal_ReprovadosNota turma-teste 6.0 60 0.25) 5.0 0.0001)
; (/ (+ 5.0 4.0) 2)
(check-= (mediaFinal_ReprovadosNota turma-teste2 6.0 60 0.25) 4.5 0.0001)
; nenhum aluno reprovado por nota
(check-= (mediaFinal_ReprovadosNota (list (aluno 1 "Vinicius" 8.0 7.0 9.0 6.0 2)) 6.0 60 0.25) 0 0.0001)
; turma vazia
(check-= (mediaFinal_ReprovadosNota empty 6.0 60 0.25) 0 0.0001)
