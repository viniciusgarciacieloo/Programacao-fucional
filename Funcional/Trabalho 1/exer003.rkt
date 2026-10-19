#lang racket

(struct aluno (RA nome nota1 nota2 nota3 nota4 total_faltas))
(define (media M)
    (/ (+ (aluno-nota1 M) (aluno-nota2 M) (aluno-nota3 M) (aluno-nota4 M)) 4))

(define (passou a nota_necessaria carga_horaria max_falta)
    (cond
        [(< (media a) nota_necessaria) "Reprovado por nota"]
        [(> (aluno-total_faltas a) (* max_falta carga_horaria)) "Reprovado por falta"]
        [else "Aprovado"]))

(define (turma_alunos turma nota_necessaria carga_horaria max_falta)
    (cond
        [(empty? turma) 0]
        [else 
            (cond
                [(or (string=? (passou (car turma) nota_necessaria carga_horaria max_falta) "Reprovado por nota") 
                (string=? (passou (car turma) nota_necessaria carga_horaria max_falta) "Reprovado por falta")) 
                (+ 1 (turma_alunos (cdr turma) nota_necessaria carga_horaria max_falta))]
                [else (turma_alunos (cdr turma) nota_necessaria carga_horaria max_falta)])]))

(define (percentual turma nota_necessaria carga_horaria max_falta)
    (define reprovados (turma_alunos turma nota_necessaria carga_horaria max_falta))
    (define total (length turma))
    (* (/ reprovados total) 100))

(define (reprovados_Falta turma nota_necessaria carga_horaria max_falta)
    (cond
        [(empty? turma) 0]
        [(string=? (passou (car turma) nota_necessaria carga_horaria max_falta)"Reprovado por falta")
        (+ 1 (reprovados_Falta (cdr turma) nota_necessaria carga_horaria max_falta))]
        [else (reprovados_Falta (cdr turma) nota_necessaria carga_horaria max_falta)]))

(define (percentual_falta turma nota_necessaria carga_horaria max_falta)
    (define reprovados_falta (reprovados_Falta turma nota_necessaria carga_horaria max_falta))
    (define total (length turma))
    (*(/ reprovados_falta total)100))

(define (reprovados_Nota turma nota_necessaria carga_horaria max_falta)
    (cond
        [(empty? turma) 0]
        [(string=? (passou (car turma) nota_necessaria carga_horaria max_falta)"Reprovado por nota")
        (+ 1 (reprovados_Nota (cdr turma) nota_necessaria carga_horaria max_falta))]
        [else (reprovados_Nota (cdr turma) nota_necessaria carga_horaria max_falta) ]))

(define (percentual_Nota turma nota_necessaria carga_horaria max_falta)
    (define reprovados_nota (reprovados_Nota turma nota_necessaria carga_horaria max_falta))
    (define total (length turma))
    (*(/ reprovados_nota total)100))

(define (mediasReprovados_Nota turma nota_necessaria carga_horaria max_falta)
    (cond
        [(empty? turma) 0]
        [(string=? (passou (car turma) nota_necessaria carga_horaria max_falta) "Reprovado por nota")
        (+ (media (car turma)) 
        (mediasReprovados_Nota (cdr turma) nota_necessaria carga_horaria max_falta))]
        [else (mediasReprovados_Nota (cdr turma) nota_necessaria carga_horaria max_falta)]))

(define (mediaFinal_ReprovadosNota turma nota_necessaria carga_horaria max_falta)
    (/ (mediasReprovados_Nota turma nota_necessaria carga_horaria max_falta) (reprovados_Nota turma nota_necessaria carga_horaria max_falta)))

(define turma-teste
    (list
        (aluno 1 "Vinicius" 8.0 7.0 9.0 6.0 2)
        (aluno 2 "Pedro" 5.0 4.0 6.0 5.0 20)
        (aluno 3 "Alice" 9.0 9.0 8.0 9.5 1)))

(turma_alunos turma-teste 6.0 60 0.25)          ; esperado: 1 (só o Pedro)
(percentual turma-teste 6.0 60 0.25)             ; esperado: ~33.33
(reprovados_Falta turma-teste 6.0 60 0.25)       ; esperado: 0 (ninguém passou do limite de faltas)
(percentual_falta turma-teste 6.0 60 0.25)       ; esperado: 0
(reprovados_Nota turma-teste 6.0 60 0.25)        ; esperado: 1 (Pedro)
(percentual_Nota turma-teste 6.0 60 0.25)        ; esperado: ~33.33
(mediasReprovados_Nota turma-teste 6.0 60 0.25)  ; esperado: 5.0 (só a média do Pedro)
(mediaFinal_ReprovadosNota turma-teste 6.0 60 0.25) ; esperado: 5.0 (soma das médias / quantidade = 5.0/1)