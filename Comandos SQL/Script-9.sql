CREATE TABLE alunos (
 id_aluno INT,
 nome VARCHAR(100),
 cidade VARCHAR(50),
 idade INT,
 status VARCHAR(20)
);
CREATE TABLE professores (
 id_professor INT,
 nome VARCHAR(100),
 especialidade VARCHAR(50),
 salario DECIMAL(10,2)
);
CREATE TABLE cursos (
 id_curso INT,
 nome_curso VARCHAR(100),
 carga_horaria INT,
 id_professor INT
);
CREATE TABLE matriculas (
 id_matricula INT,
 id_aluno INT,
 id_curso INT,
 data_matricula DATE,
 situacao VARCHAR(20)
);

alter table alunos
add constraint pk_alunos
primary key (id_aluno);

alter table professores
add constraint pk_professor
primary key (id_professor);

alter table cursos
add constraint pk_curso
primary key (id_curso);