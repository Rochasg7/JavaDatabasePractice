create table ordemDeServico(
cod_ordem int primary key, 
data datetime,
defeito varchar(255),
equipamento varchar(255)
);

create table cliente(
cod_cliente int primary key,
nome varchar(30),
empresa varchar(255),
telefone varchar(255)
);

create table tecnico(
cod_tecnico int primary key,
nome varchar(30)
);

create table servico(
cod_servico int primary key,
atividade varchar(255)
);

create table finalizacao(
cod_final int primary key,
valor_total numeric(10,2),
data datetime,
data_entrega datetime
);

drop table ordemDeServico;

