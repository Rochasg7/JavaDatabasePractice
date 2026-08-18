create table produto(
cod int,
nome varchar(20),
id_categoria int,
primary key (cod)
);

create table categoria(
id int,
nome varchar(20)
);

alter table categoria
add primary key(id);

drop table categoria;

create table categoria(id int primary key comment "id da categoria",nome varchar(20) default 'NI' not null comment "nome da categoria");

alter table produto
modify nome varchar(30)
not null
default 'NI'
comment "Nome do produto"

alter table produto
add constraint foreign key(id_categoria)
references categoria(id)
on delete cascade
on update cascade;
