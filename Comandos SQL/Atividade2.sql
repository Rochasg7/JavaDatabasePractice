-- PREPARAÇÃO DO AMBIENTE
-- CRIE O SCHEMA ATV2
-- CRIE A TABELA ABAIXO E INSIRA OS REGISTROS À SEGUIR

create table fornecedor(
  id int, 
  nome varchar(50), 
  id_municipio int 
)

insert into fornecedor 
values (1, 'Fornecedor 1', 1),
       (2, 'Fornecedor 2', 2),
       (3, 'Fornecedor 3', 3),
       (4, 'Fornecedor 4', 4),
       (5, 'Fornecedor 5', 4)

create table produto(
  id int,
  nome varchar(50), 
  id_fornecedor int
)

insert into produto 
values (1, 'produto 1',4),
       (2, 'produto 2',4),
       (3, 'produto 3',2),
       (4, 'produto 4',1),
       (5, 'produto 5',3),
       (6, 'produto 6',4),
       (7, 'produto 7',1),
       (8, 'produto 8',2),
       (9, 'produto 9',5),
       (10, 'produto 10',1),
       (11, 'produto 11',4),
       (12, 'produto 12',null),
       (13, 'produto 13',null),
       (14, 'produto 14',2),
       (15, 'produto 15',3),
       (16, 'produto 16',4),
       (17, 'produto 17',5),
       (18, 'produto 18',4),
       (19, 'produto 19',3),
       (20, 'produto 20',1)

       
-- QUESTÃO 1
-- Relacione o nome de todos os produtos e o nome do fornecedor correspondente. Caso não exista fornecedor a consulta deverá retornar null.
select p.nome as produto, f.nome as fornecedor
from produto as p
left join fornecedor as f 
on p.id_fornecedor = f.id;

-- QUESTÃO 2
-- Realize a contagem de produtos por fornecedor incluindo os produtos que não possuem fornecedor. 
select f.nome as fornecedor, count(p.id) as "Quantidade de produtos"
from produto as p
left join fornecedor as f
on p.id_fornecedor = f.id
group by f.nome;

-- QUESTÃO 3
-- Relacione apenas os produtos que possuem fornecedor. 
select p.nome as produto, f.nome as fornecedor
from produto as p
inner join fornecedor as f 
on p.id_fornecedor = f.id;

-- QUESTÃO 4
-- Relacione a contagem de produtos por fornecedor desconsiderando aqueles que não possuem fornecedor.
-- Não utilize where ou outro tipo de condicional. 
select f.nome as fornecedor, count(p.id) as "Quantidade de produtos"
from produto as p
inner join fornecedor as f
on p.id_fornecedor = f.id
group by f.nome;

-- QUESTÃO 5
-- Relacione o nome dos produtos que não possuem fornecedor. 
select p.nome as produto, f.nome as fornecedor
from produto as p
left join fornecedor as f
on p.id_fornecedor = f.id
where id_fornecedor is null;

create table compra(
  nf int,
  id_produto int,
  qtde int,
  vlr_compra numeric(12,2)
)

insert into compra 
values (1001, 12, 1000, 1950),
       (1002, 14, 1200, 1234),
       (1003, 1, 1300, 1234),
       (1004, 3, 1040, 345),
       (1005, 5, 1200, 5345),
       (1006, 8, 1340, 5234),
       (1007, 2, 1450, 4123),
       (1008, 20, 3400, 12356),
       (1009, 12, 13400, 19234),
       (10010, 1, 10340, 11230),
       (10011, 4, 1340, 12320),
       (10012, 17, 3400, 54332),
       (10013, 19, 5300, 4534),
       (10014, 18, 56700, 43534),
       (10015, 6, 1056, 43543),
       (10016, 8, 156, 345),
       (10017, 9, 1450, 43555),
       (10018, 14, 4500, 4345),
       (10019, 14, 1500, 2345),
       (10020, 1, 1060, 6534)

-- QUESTÃO 6
-- Apresente o valor total das compras realizadas por fornecedor.       
select f.nome as fornecedor, sum(c.vlr_compra) as "Valor total de compras"
from compra as c
inner join produto as p on c.id_produto = p.id
inner join fornecedor as f on p.id_fornecedor = f.id 
group by f.nome;
       
-- QUESTÃO 7
-- Apresente o valor total das compras realizadas por produto.
select p.nome as produto, sum(c.vlr_compra) as "Valor total de compras"
from compra as c
inner join produto as p on c.id_produto = p.id
group by p.nome;

-- QUESTÃO 8
-- Apresente o total da quantidade comprada por produto.
select p.nome as produto, sum(c.qtde) as "Quantidade total de compras"
from compra as c
inner join produto as p on c.id_produto = p.id
group by p.nome;

-- QUESTÃO 9
-- Relacione o nome do fornecedor, o nome do produto e o valor total comprado.
select f.nome as fornecedor, p.nome as produto, sum(c.vlr_compra) as "Valor total de compras"
from compra as c
inner join produto as p on c.id_produto = p.id
inner join fornecedor as f on p.id_fornecedor = f.id 
group by f.nome, p.nome;

create table municipio(
  id int,
  nome varchar(50),
  uf char(2)
)

insert into municipio 
values (1, 'São Paulo', 'SP'),
       (2, 'Porto Alegre', 'RS'),
       (3, 'Belo Horizonte', 'MG'),
       (4, 'Rio de Janeiro', 'RJ')

-- QUESTÃO 10
-- Relacione a NF, o nome dos fornecedores e o nome dos produtos para as compras feitas apenas com fornecedores de fora de SP.       
select c.nf, f.nome as fornecedor, p.nome as produto, m.nome as municipio
from compra as c
inner join produto as p on c.id_produto = p.id
inner join fornecedor as f on p.id_fornecedor = f.id 
inner join municipio as m on f.id_municipio = m.id
where m.uf != 'SP';