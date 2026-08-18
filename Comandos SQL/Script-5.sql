create table ordemDeServico(
cod_ordem int primary key, 
data datetime,
defeito varchar(255),
equipamento varchar(255),
cod_cliente int,
cod_tecnico int,
cod_final int
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

create table relacao_3(
cod_ordem int,
cod_servico int
);

alter table ordemDeServico
  add constraint fk_cod_cliente foreign key(cod_cliente)
  references cliente(cod_cliente)
  on update cascade
  on delete cascade

  
  alter table ordemDeServico
  add constraint fk_cod_tecnico foreign key(cod_tecnico)
  references tecnico(cod_tecnico)
  on update cascade
  on delete cascade

