create table estoque( 
  cod_produto int not null primary key comment 'código individual do produto',
  nome_produto varchar(50) comment 'nome do produto',
  categoria varchar(20) comment 'categoria do produto',
  qtde int comment 'quantidade do produto em estoque',
  vlr_unitario numeric(12,2) comment 'valor para cada unidade do produto'
)

-- teste o schema criado
select * from estoque 


-- insira os registros
insert into estoque values 
  (1,'sabao em po','limpeza',59,15.95),
  (2,'detergente','limpeza',102,2.25),
  (3,'desinfetante','limpeza',88,5.95),
  (4,'macarrao','mercearia',234,12.95),
  (5,'arroz','mercearia',342,25.65),
  (6,'feijao','mercearia',123,4.75),
  (7,'oleo','mercearia',345,9.95),
  (8,'farinha','mercearia',645,4.39),
  (9,'refrigerante','bebidas',675,8.99),
  (10,'agua','bebidas',567,2.69)

-- teste o schema criado com os registros inseridos
select * from estoque 

-- QUESTÃO 1
-- Qual a quantidade total de produtos no estoque?
select sum(qtde) as "Quantidade total de produtos no estoque"
from estoque

-- QUESTÃO 2
-- Qual a quantidade total de produtos no estoque por categoria?
select categoria,
sum(qtde) as "Quantidade total por categoria"
from estoque
group by 1

-- QUESTÃO 3
-- Qual a quantidade média de produtos no estoque pertencentes à categoria limpeza?
select avg(qtde) as "Quantidade média de itens na limpeza"
from estoque
where categoria ='limpeza'

-- QUESTÃO 4
-- Qual o nome dos produtos por ordem crescente de valor unitário?
select nome_produto, vlr_unitario 
from estoque
order by (vlr_unitario) asc 

-- QUESTÃO 5
-- Qual o preço médio unitário dos produtos do estoque?
select avg(vlr_unitario)
from estoque

-- QUESTÃO 6
-- Considerando que cada tupla representa o registro de um produto, quantos produtos estão cadastrados neste estoque?
select count(cod_produto)
from estoque

-- QUESTÃO 7 -- Análise do estoque mínimo.
--- Estoque mínimo = menor quantidade que um produto deve possuir no estoque, para que a empresa opere em segurança.
--- Estoque mínimo = 100. 
-- Quantos produtos estão abaixo do estoque mínimo?
select count(cod_produto) as "Produtos abaixo de 100 unidades"
from estoque
where qtde < 100

-- QUESTÃO 8
-- Quantos produtos estão acima do estoque mínimo?
select count(cod_produto) as "Produtos acima de 100 unidades"
from estoque
where qtde > 100

-- QUESTÃO 9
-- Qual a quantidade total de produtos em estoque por categoria considerando apenas os casos em que os produtos estejam
-- acima do estoque mínimo?
select categoria,
sum(qtde) as "Quantidade de produtos por categoria"
from estoque
where qtde > 100
group by categoria

-- QUESTÃO 10
-- Estruture uma consulta que apresente a menor e a maior quantidade de produtos por categoria
select categoria,
min(qtde) as "Menor quantidade",
max(qtde) as "Maior quantidade"
from estoque
group by categoria

create table produto (
cod int PRIMARY KEY,
nome varchar(50),
qtde int,
cod_categoria int,
vlr_unitario numeric(12,2)
);

create table categoria (
cod int primary key,
nome varchar(20)
);

insert into categoria
values (1, 'Mercearia'),
	     (2, 'Bebidas'),
	     (4, 'Açougue')
	   
alter table produto add constraint fk_categoria
	foreign key (cod_categoria)
	references categoria (cod)
	on delete cascade 
	on update cascade;

alter table produto drop constraint fk_categoria

insert into produto
	values  (1, 'Arroz tipo 1 5kg', 150, 1, 22.50),
	   		  (2, 'Feijão Carioca 2kg', 120, 1, 6.50),
	   		  (3, 'Sabão em Pó Omo 1kg', 110, 3, 19.50),
	   		  (4, 'Pepsi Black 2l', 340, 2, 5.99);