create table usuario (
    codusuario int not null comment 'codigo do usuario',
    login varchar(255) not null comment 'login de acesso',
    senha varchar(255) not null comment 'senha do usuario',
    nomecargo varchar(255) not null comment 'cargo do usuario',
    primary key (codusuario)
);

create table aluno (
    codaluno int not null comment 'codigo do aluno',
    matriculaaluno int not null comment 'matricula do aluno',
    cpf varchar(20) not null comment 'cpf do aluno',
    datanasc date not null comment 'data de nascimento do aluno',
    nome varchar(255) not null comment 'nome do aluno',
    codusuario int not null comment 'codigo do usuario associado',
    primary key (codaluno)
);

create table professor (
    codprofessor int not null comment 'codigo do professor',
    datanasc date not null comment 'data de nascimento do professor',
    matriculaprofessor int not null comment 'matricula do professor',
    cpf varchar(20) not null comment 'cpf do professor',
    nome varchar(255) not null comment 'nome do professor',
    codusuario int not null comment 'codigo do usuario associado',
    primary key (codprofessor)
);

create table materia (
    codmateria int not null comment 'codigo da materia',
    horario time not null comment 'horario da materia',
    nome varchar(255) not null comment 'nome da materia',
    codprofessor int not null comment 'codigo do professor responsavel',
    sala varchar(255) not null comment 'sala da materia',
    primary key (codmateria)
);

create table curso (
    codcurso int not null comment 'codigo do curso',
    nome varchar(255) not null comment 'nome do curso',
    codaluno int not null comment 'codigo do aluno',
    codprofessor int not null comment 'codigo do professor',
    codmateria int not null comment 'codigo da materia',
    primary key (codcurso)
);

create table professorcurso (
    codprofessorcurso int not null comment 'codigo do relacionamento professor curso',
    codprofessor int not null comment 'codigo do professor',
    codcurso int not null comment 'codigo do curso',
    primary key (codprofessorcurso)
);

create table cursomateria (
    codcursomateria int not null comment 'codigo do relacionamento curso materia',
    codmateria int not null comment 'codigo da materia',
    codcurso int not null comment 'codigo do curso',
    primary key (codcursomateria)
);

alter table aluno
add constraint fk_aluno_usuario
foreign key (codusuario)
references usuario (codusuario);

alter table professor
add constraint fk_professor_usuario
foreign key (codusuario)
references usuario (codusuario);

alter table materia
add constraint fk_materia_professor
foreign key (codprofessor)
references professor (codprofessor);

alter table curso
add constraint fk_curso_aluno
foreign key (codaluno)
references aluno (codaluno);

alter table curso
add constraint fk_curso_professor
foreign key (codprofessor)
references professor (codprofessor);

alter table curso
add constraint fk_curso_materia
foreign key (codmateria)
references materia (codmateria);

alter table professorcurso
add constraint fk_professorcurso_professor
foreign key (codprofessor)
references professor (codprofessor);

alter table professorcurso
add constraint fk_professorcurso_curso
foreign key (codcurso)
references curso (codcurso);

alter table cursomateria
add constraint fk_cursomateria_materia
foreign key (codmateria)
references materia (codmateria);

alter table cursomateria
add constraint fk_cursomateria_curso
foreign key (codcurso)
references curso (codcurso);