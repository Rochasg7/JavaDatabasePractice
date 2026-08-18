CREATE TABLE alunos (
 id_aluno INT not null default 0 comment 'Id_Aluno',
 nome VARCHAR(100) not null default 'ni' comment 'Nome',
 cidade VARCHAR(50) not null default 'ni' comment 'Cidade',
 idade INT not null default 0 comment 'Idade',
 status VARCHAR(20) not null default 'ni' comment 'Status'
);
CREATE TABLE professores (
 id_professor INT not null default 0 comment 'Id_Professor',
 nome VARCHAR(100) not null default 'ni' comment 'Nome',
 especialidade VARCHAR(50) not null default 'ni' comment 'Especialidade',
 salario DECIMAL(10,2) not null default 0 comment 'Salario'
);
CREATE TABLE cursos (
 id_curso int not null default 0 comment 'Id_Curso',
 nome_curso VARCHAR(100) not null default 'ni' comment 'Nome_Curso',
 carga_horaria INT not null default 0 comment 'Carga horária',
 id_professor INT not null default 0 comment 'Id_Professor'
);
CREATE TABLE matriculas (
 id_matricula INT not null default 0 comment 'Id_Matricula',
 id_aluno INT not null default 0 comment 'Id_Aluno',
 id_curso INT not null default 0 comment 'Id_Curso',
 data_matricula DATE not null,
 situacao VARCHAR(20) not null default 'ni' comment 'Situacao'
);

ALTER TABLE alunos
ADD PRIMARY KEY (id_aluno);

ALTER TABLE professores
ADD PRIMARY KEY (id_professor);

ALTER TABLE cursos
ADD PRIMARY KEY (id_curso);

ALTER TABLE matriculas
ADD PRIMARY KEY (id_matricula);

ALTER TABLE cursos
ADD CONSTRAINT fk_cursos_professores
FOREIGN KEY (id_professor)
REFERENCES professores(id_professor)
on delete cascade
on update cascade;

ALTER TABLE matriculas
ADD CONSTRAINT fk_matriculas_alunos
FOREIGN KEY (id_aluno)
REFERENCES alunos(id_aluno)
on delete cascade
on update cascade;

ALTER TABLE matriculas
ADD CONSTRAINT fk_matriculas_cursos
FOREIGN KEY (id_curso)
REFERENCES cursos(id_curso)
on delete cascade
on update cascade;

INSERT INTO alunos VALUES
	(1, 'Gabriel', 'Conceição dos Ouros', 21, 'Matriculado'),
	(2, 'Jorge', 'Conceição dos Ouros', 21, 'Matriculado'),
	(3, 'Fellipe', 'Conceição dos Ouros', 22, 'Matriculado'),
	(4, 'Natanael', 'Pouso Alegre', 24, 'Matriculado'),
	(5, 'Luiz', 'Pouso Alegre', 22, 'Matriculado'),
	(6, 'Otavio', 'Conceição dos Ouros', 22, 'Matriculado'),
	(7, 'Maria', 'Conceição dos Ouros', 24, 'Não Matriculado'),
	(8, 'Douglas', 'Conceição dos Ouros', 17, 'Não Matriculado'),
	(9, 'João', 'Conceição dos Ouros', 21, 'Não Matriculado'),
	(10, 'Caio', 'Conceição dos Ouros', 18, 'Não Matriculado');

INSERT INTO professores VALUES
	(1, 'Gustavo', 'Banco de Dados', 6500.00),
	(2, 'Rafael', 'Programacao', 7200.00),
	(3, 'André', 'Redes', 4800.00),
	(4, 'Jubileu', 'Seguranca da Informacao', 5500.00),
	(5, 'Esley', 'Analise de Sistemas', 5000.00);

INSERT INTO cursos VALUES
	(1, 'Banco de Dados', 120, 1),
	(2, 'Programacao Web', 100, 2),
	(3, 'Redes de Computadores', 80, 3),
	(4, 'Business Intelligence', 140, 1),
	(5, 'Back-End Java', 160, 2),
	(6, 'Seguranca Digital', 110, 4);

INSERT INTO matriculas VALUES
	(1, 1, 1, '2025-01-10', 'Ativa'),
	(2, 2, 2, '2025-01-11', 'Ativa'),
	(3, 3, 3, '2025-01-12', 'Cancelada'),
	(4, 4, 4, '2025-01-13', 'Ativa'),
	(5, 5, 5, '2025-01-14', 'Ativa'),
	(6, 6, 1, '2025-01-15', 'Trancada'),
	(7, 7, 2, '2025-01-16', 'Ativa'),
	(8, 8, 3, '2025-01-17', 'Ativa'),
	(9, 9, 4, '2025-01-18', 'Ativa'),
	(10, 10, 5, '2025-01-19', 'Cancelada'),
	(11, 1, 6, '2025-01-20', 'Ativa'),
	(12, 2, 1, '2025-01-21', 'Ativa'),
	(13, 3, 2, '2025-01-22', 'Ativa'),
	(14, 4, 3, '2025-01-23', 'Trancada'),
	(15, 5, 6, '2025-01-24', 'Ativa');

SELECT *
FROM alunos
WHERE status = 'Matriculado';

SELECT *
FROM alunos
ORDER BY nome ASC;

SELECT *
FROM professores
ORDER BY salario DESC;

SELECT *
FROM cursos
WHERE carga_horaria > 100
ORDER BY carga_horaria DESC;

SELECT
	nome AS aluno,
    cidade AS cidade_aluno,
    idade AS idade_aluno
FROM alunos;

SELECT *
FROM professores
WHERE salario > 5000;

SELECT *
FROM alunos
WHERE idade BETWEEN 18 AND 25;

SELECT *
FROM cursos
WHERE nome_curso LIKE 'B%';

SELECT *
FROM alunos
WHERE cidade = 'Pouso Alegre'
AND status = 'Matriculado';