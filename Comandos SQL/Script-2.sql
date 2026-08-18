create table empresa(
id int primary key,
nome varchar(255),
cnpj varchar(255),
email varchar(255),
telefone varchar(255),
endereco varchar(255)
);

create table entregador(
id int primary key,
nome varchar(255),
cpf varchar(255),
rg varchar(255),
celular varchar(255)
);

create table cliente(
telefone varchar(255) primary key,
nome varchar(255),
endereco varchar(255),
pontoreferencia varchar(255),
nascimento date
);

create table pedido(
id int primary key,
status varchar(255),
taxa_entrega varchar(255),
data datetime
);

create table item_pedido(
quantidade int
);

create table marmita(
id int primary key,
nome varchar(255),
descricao mediumtext,
tamanho varchar(255),
valor varchar(255)
);

create table login(
id int primary key,
email varchar(255),
senha varchar(255),
nivel_acesso int
);

alter table pedido  
  add constraint foreign key(telefone_cliente)
  references cliente(telefone)
  on delete cascade 
  on update cascade;