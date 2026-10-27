# Programação Funcional

Repositório de estudos e atividades da disciplina **Programação Funcional**, da Universidade Estadual de Maringá (UEM). A ideia é reunir o conteúdo estudado, os exercícios desenvolvidos em Racket e os aprendizados obtidos nos trabalhos práticos.

> **Status:** em desenvolvimento. Os códigos serão adicionados conforme os assuntos forem estudados e implementados.

## Sobre a disciplina

- **Instituição:** Universidade Estadual de Maringá (UEM)
- **Curso indicado no programa:** Bacharelado em Informática
- **Centro:** Centro de Tecnologia
- **Departamento:** Departamento de Informática
- **Disciplina:** Programação Funcional
- **Código:** 11917
- **Carga horária:** 68 horas
- **Periodicidade:** semestral
- **Linguagem usada nos trabalhos práticos:** Racket

## O que será estudado

O foco da disciplina é compreender o paradigma funcional e aprender a projetar programas por meio de funções, tipos de dados e recursão. O programa oficial contempla os seguintes assuntos.

### 1. Introdução à programação funcional
- Histórico da programação funcional.
- Cálculo lambda e sua relação com a definição e aplicação de funções.

### 2. Conceitos básicos
- Valores, expressões, funções e tipos de dados.
- Estratégias de avaliação de expressões.

### 3. Projeto e implementação de funções
- Análise e decomposição de problemas.
- Definição dos tipos de dados necessários.
- Especificação de funções com descrições textuais e exemplos.
- Implementação, verificação e revisão de soluções.

### 4. Tipos algébricos de dados
- Tipos produto e tipos soma.
- Casamento de padrões (*pattern matching*).
- Modelagem de informações com tipos algébricos.
- Construção de programas a partir de modelos de dados.

### 5. Tipos com autorreferência e recursão estrutural
- Representação e processamento de listas, árvores e números naturais.
- Relação entre autorreferência e recursividade.
- Recursão estrutural.
- Polimorfismo paramétrico e composição de funções.
- Projeto de programas que processam estruturas recursivas.

### 6. Funções como entidades de primeira classe
- Funções anônimas.
- Ambientes e fechamentos (*closures*).
- Funções passadas como argumentos e funções retornadas como resultados.
- Aplicação parcial de funções.
- Funções de alta ordem.

### 7. Recursão generativa
- Limitações da recursão estrutural.
- Decomposição de problemas que não acompanha diretamente a estrutura dos dados.
- Término de funções recursivas.
- Corretude e tempo de execução de algoritmos recursivos.

### 8. Acumuladores
- Recursão em cauda.
- Diferenças entre processos iterativos e recursivos.
- Uso de acumuladores para manter resultados parciais.
- Corretude e custo de execução de processos iterativos.

### 9. Efeitos colaterais
- Abordagens para compreender e tratar efeitos colaterais em linguagens funcionais.
- Distinção entre calcular e retornar valores e interagir com o ambiente externo.

## O que será desenvolvido nos trabalhos práticos

Esta seção descreve os **conceitos de programação e as habilidades praticadas** em cada trabalho, em vez de reproduzir os enunciados ou detalhar a pontuação.

### Trabalho Prático 1 — fundamentos funcionais, modelagem e estruturas de dados

O primeiro trabalho aproxima os conceitos fundamentais de situações de programação mais concretas. Ele permite praticar a construção de funções que recebem dados, realizam cálculos e retornam resultados, incluindo o tratamento de regras e condições.

Outro tema central é a **modelagem de informações**: representar uma entidade com diferentes campos e utilizar essa representação para aplicar regras de negócio. A partir disso, trabalha-se com a análise de coleções de registros e com o cálculo de indicadores, como totais, proporções e médias. Esse tipo de problema ajuda a perceber a importância de separar a lógica de processamento da entrada e saída de dados.

O trabalho também aborda **tipos de dados e estruturas abstratas**. Implementar estruturas como pilhas e filas ajuda a compreender como os dados podem ser organizados e quais operações caracterizam cada estrutura, sem depender diretamente de uma implementação pronta da linguagem.

Em termos de aprendizagem, os principais temas são:
- definição de funções e transformação de valores;
- expressões condicionais e representação de regras;
- modelagem de registros e processamento de coleções;
- cálculo de estatísticas a partir de dados;
- representação e operações sobre estruturas abstratas de dados;
- uso de recursão, autorreferência e ausência de mudança de estado quando apropriado;
- documentação de funções com comentários e exemplos de teste.

### Trabalho Prático 2 — recursão, árvores e funções de alta ordem

O segundo trabalho aprofunda o uso de **estruturas de dados recursivas** por meio de árvores binárias de busca. Esse tipo de estrutura permite estudar como a organização dos dados estabelece propriedades entre cada nó e suas subárvores, além de exigir raciocínio recursivo para percorrer e transformar a árvore sem perder essas propriedades.

Também são explorados **processos recursivos para modelar cálculos ao longo do tempo**. Esse contexto ajuda a praticar a definição de casos-base, a evolução de um estado calculado a cada etapa e a identificação de quando uma condição desejada foi alcançada.

Um conceito importante é o de **função de alta ordem**. Em vez de receber apenas dados simples, uma função pode receber outra função como argumento. A operação `scan` explora essa ideia ao aplicar uma operação sucessivamente sobre os elementos de uma lista e produzir os resultados acumulados. Esse problema também chama atenção para a eficiência: resultados parciais devem ser reutilizados em vez de recalculados sem necessidade.

Em termos de aprendizagem, os principais temas são:
- modelagem de árvores e manutenção de suas propriedades;
- recursão para buscar, inserir e remover dados em estruturas hierárquicas;
- algoritmos recursivos para cálculos progressivos;
- funções passadas como argumentos;
- processamento acumulado de listas;
- corretude e eficiência, evitando recomputações desnecessárias;
- documentação das funções e criação de exemplos adicionais de teste.


## Estrutura do repositório

```text
programacao-funcional/
├── README.md
├── .gitignore
├── diasdeAula/
├── exerciciosExtras/       # Exercícios de aula e experimentos
├── trabalho-01/      # Estudos e implementação do Trabalho Prático 1
└── trabalho-02/      # Estudos e implementação do Trabalho Prático 2
```

## Como executar os arquivos Racket

1. Instale o [Racket](https://racket-lang.org/).
2. Abra um arquivo `.rkt` no DrRacket ou execute pelo terminal:

   ```bash
   racket nome-do-arquivo.rkt
   ```

3. Execute os exemplos e testes para conferir o comportamento das funções.

## Referências indicadas no programa

- Felleisen, Matthias; Findler, Robert Bruce; Flatt, Matthew; Krishnamurthi, Shriram. *How to Design Programs: An Introduction to Programming and Computing*. MIT Press, 2018.
- Fisler, Kathi; Krishnamurthi, Shriram; Lerner, Benjamin S.; Politz, Joe Gibbs. *A Data-Centric Introduction to Computing*, 2023.
- Dybvig, R. Kent. *The Scheme Programming Language*. MIT Press, 2009.
- Abelson, Harold; Sussman, Gerald Jay; Sussman, Julie. *Structure and Interpretation of Computer Programs*. 2nd edition. MIT Press, 1996.
- Lipovača, Miran. *Learn You a Haskell for Great Good!: A Beginner's Guide*. No Starch Press, 2011.
- Hutton, Graham. *Programming in Haskell*. Cambridge, 2006.

---

**Fonte:** programa oficial da disciplina e enunciados dos Trabalhos Práticos 1 e 2 disponibilizados para a organização deste repositório. Se houver alterações nas orientações, prevalece a versão mais recente fornecida pelo professor.
