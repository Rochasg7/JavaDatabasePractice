-- ============================================================
-- TABELA: ALUNOS
-- ============================================================

CREATE TABLE alunos (
    id_aluno INT NOT NULL DEFAULT 0
             COMMENT 'ID do aluno',

    nome VARCHAR(100) NOT NULL DEFAULT 'ni'
         COMMENT 'Nome',

    cidade VARCHAR(50) NOT NULL DEFAULT 'ni'
           COMMENT 'Cidade',

    idade INT NOT NULL DEFAULT 0
          COMMENT 'Idade',

    status VARCHAR(20) NOT NULL DEFAULT 'ni'
           COMMENT 'Status'
);


-- ============================================================
-- TABELA: PROFESSORES
-- ============================================================

CREATE TABLE professores (
    id_professor INT NOT NULL DEFAULT 0
                  COMMENT 'ID do professor',

    nome VARCHAR(100) NOT NULL DEFAULT 'ni'
         COMMENT 'Nome',

    especialidade VARCHAR(50) NOT NULL DEFAULT 'ni'
                  COMMENT 'Especialidade',

    salario DECIMAL(10,2) NOT NULL DEFAULT 0
            COMMENT 'Salário'
);


-- ============================================================
-- TABELA: CURSOS
-- ============================================================

CREATE TABLE cursos (
    id_curso INT NOT NULL DEFAULT 0
              COMMENT 'ID do curso',

    nome_curso VARCHAR(100) NOT NULL DEFAULT 'ni'
                COMMENT 'Nome do curso',

    carga_horaria INT NOT NULL DEFAULT 0
                   COMMENT 'Carga horária',

    id_professor INT NOT NULL DEFAULT 0
                  COMMENT 'ID do professor'
);


-- ============================================================
-- TABELA: MATRÍCULAS
-- ============================================================

CREATE TABLE matriculas (
    id_matricula INT NOT NULL DEFAULT 0
                  COMMENT 'ID da matrícula',

    id_aluno INT NOT NULL DEFAULT 0
              COMMENT 'ID do aluno',

    id_curso INT NOT NULL DEFAULT 0
              COMMENT 'ID do curso',

    data_matricula DATE NOT NULL,

    situacao VARCHAR(20) NOT NULL DEFAULT 'ni'
              COMMENT 'Situação'
);


-- ============================================================
-- PRIMARY KEYS
-- ============================================================

ALTER TABLE alunos
ADD PRIMARY KEY (id_aluno);


ALTER TABLE professores
ADD PRIMARY KEY (id_professor);


ALTER TABLE cursos
ADD PRIMARY KEY (id_curso);


ALTER TABLE matriculas
ADD PRIMARY KEY (id_matricula);


-- ============================================================
-- FOREIGN KEY: CURSOS → PROFESSORES
-- ============================================================

ALTER TABLE cursos
ADD CONSTRAINT fk_cursos_professores
FOREIGN KEY (id_professor)
REFERENCES professores(id_professor)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- ============================================================
-- FOREIGN KEY: MATRÍCULAS → ALUNOS
-- ============================================================

ALTER TABLE matriculas
ADD CONSTRAINT fk_matriculas_alunos
FOREIGN KEY (id_aluno)
REFERENCES alunos(id_aluno)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- ============================================================
-- FOREIGN KEY: MATRÍCULAS → CURSOS
-- ============================================================

ALTER TABLE matriculas
ADD CONSTRAINT fk_matriculas_cursos
FOREIGN KEY (id_curso)
REFERENCES cursos(id_curso)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- ============================================================
-- INSERINDO ALUNOS
-- ============================================================

INSERT INTO alunos
VALUES
    (1,  'Gabriel',  'Conceição dos Ouros', 21, 'Matriculado'),
    (2,  'Jorge',    'Conceição dos Ouros', 21, 'Matriculado'),
    (3,  'Fellipe',  'Conceição dos Ouros', 22, 'Matriculado'),
    (4,  'Natanael', 'Pouso Alegre',        24, 'Matriculado'),
    (5,  'Luiz',     'Pouso Alegre',        22, 'Matriculado'),
    (6,  'Otavio',   'Conceição dos Ouros', 22, 'Matriculado'),
    (7,  'Maria',    'Conceição dos Ouros', 24, 'Não Matriculado'),
    (8,  'Douglas',  'Conceição dos Ouros', 17, 'Não Matriculado'),
    (9,  'João',     'Conceição dos Ouros', 21, 'Não Matriculado'),
    (10, 'Caio',     'Conceição dos Ouros', 18, 'Não Matriculado');


-- ============================================================
-- INSERINDO PROFESSORES
-- ============================================================

INSERT INTO professores
VALUES
    (1, 'Gustavo',  'Banco de Dados',           6500.00),
    (2, 'Rafael',   'Programacao',              7200.00),
    (3, 'André',    'Redes',                    4800.00),
    (4, 'Jubileu',  'Seguranca da Informacao',  5500.00),
    (5, 'Esley',    'Analise de Sistemas',      5000.00);


-- ============================================================
-- INSERINDO CURSOS
-- ============================================================

INSERT INTO cursos
VALUES
    (1, 'Banco de Dados',          120, 1),
    (2, 'Programacao Web',         100, 2),
    (3, 'Redes de Computadores',    80, 3),
    (4, 'Business Intelligence',   140, 1),
    (5, 'Back-End Java',            160, 2),
    (6, 'Seguranca Digital',        110, 4);


-- ============================================================
-- INSERINDO MATRÍCULAS
-- ============================================================

INSERT INTO matriculas
VALUES
    (1,  1, 1, '2025-01-10', 'Ativa'),
    (2,  2, 2, '2025-01-11', 'Ativa'),
    (3,  3, 3, '2025-01-12', 'Cancelada'),
    (4,  4, 4, '2025-01-13', 'Ativa'),
    (5,  5, 5, '2025-01-14', 'Ativa'),
    (6,  6, 1, '2025-01-15', 'Trancada'),
    (7,  7, 2, '2025-01-16', 'Ativa'),
    (8,  8, 3, '2025-01-17', 'Ativa'),
    (9,  9, 4, '2025-01-18', 'Ativa'),
    (10, 10, 5, '2025-01-19', 'Cancelada'),
    (11, 1, 6, '2025-01-20', 'Ativa'),
    (12, 2, 1, '2025-01-21', 'Ativa'),
    (13, 3, 2, '2025-01-22', 'Ativa'),
    (14, 4, 3, '2025-01-23', 'Trancada'),
    (15, 5, 6, '2025-01-24', 'Ativa');


-- ============================================================
-- CONSULTAS
-- ============================================================


-- ------------------------------------------------------------
-- 1. ALUNOS MATRICULADOS
-- ------------------------------------------------------------

SELECT *
FROM alunos
WHERE status = 'Matriculado';


-- ------------------------------------------------------------
-- 2. ALUNOS EM ORDEM ALFABÉTICA
-- ------------------------------------------------------------

SELECT *
FROM alunos
ORDER BY nome ASC;


-- ------------------------------------------------------------
-- 3. PROFESSORES POR SALÁRIO — MAIOR PARA MENOR
-- ------------------------------------------------------------

SELECT *
FROM professores
ORDER BY salario DESC;


-- ------------------------------------------------------------
-- 4. CURSOS COM MAIS DE 100 HORAS
-- ------------------------------------------------------------

SELECT *
FROM cursos
WHERE carga_horaria > 100
ORDER BY carga_horaria DESC;


-- ------------------------------------------------------------
-- 5. SELECIONANDO COLUNAS ESPECÍFICAS DOS ALUNOS
-- ------------------------------------------------------------

SELECT
    nome AS aluno,
    cidade AS cidade_aluno,
    idade AS idade_aluno
FROM alunos;


-- ------------------------------------------------------------
-- 6. PROFESSORES COM SALÁRIO ACIMA DE 5000
-- ------------------------------------------------------------

SELECT *
FROM professores
WHERE salario > 5000;


-- ------------------------------------------------------------
-- 7. ALUNOS COM IDADE ENTRE 18 E 25 ANOS
-- ------------------------------------------------------------

SELECT *
FROM alunos
WHERE idade BETWEEN 18 AND 25;


-- ------------------------------------------------------------
-- 8. CURSOS QUE COMEÇAM COM A LETRA "B"
-- ------------------------------------------------------------

SELECT *
FROM cursos
WHERE nome_curso LIKE 'B%';


-- ------------------------------------------------------------
-- 9. ALUNOS DE POUSO ALEGRE QUE ESTÃO MATRICULADOS
-- ------------------------------------------------------------

SELECT *
FROM alunos
WHERE cidade = 'Pouso Alegre'
  AND status = 'Matriculado';