create table vendas (
nf int not null primary key,
cod_produto int,
nome_produto varchar(50),
qtd_vendida int,
vlr_desconto numeric(12,2),
vlr_total numeric(12,2)
)

insert into vendas values
(1, 101, 'camisa', 2, 40, 260),
(2, 102, 'calça', 3, 90, 699),
(3, 103, 'jaqueta', 1, 40, 499),
(4, 104, 'sapato', 1, 30, 389)



-- Função MAX

select max(vlr_total) as "Maior valor de vendas"
from vendas

select max(qtd_vendida) as "Maior Quantidade Vendida"
from vendas

select max(vlr_desconto) as "Maior valor de desconto"
from vendas


-- Função MIN

select min(vlr_total) as "Menor valor de vendas"
from vendas

select min(qtd_vendida) as "Menor Quantidade Vendida"
from vendas

select min(vlr_desconto) as "Menor valor de desconto"
from vendas


-- Função SUM

select sum(vlr_total) as "Valor total de vendas"
from vendas

select sum(qtd_vendida) as "Quantidade total Vendida"
from vendas

select sum(vlr_desconto) as "Valor total de desconto"
from vendas


-- Função AVG

select avg(vlr_total) as "Valor médio de vendas"
from vendas

select avg(qtd_vendida) as "Quantidade média Vendida"
from vendas

select avg(vlr_desconto) as "Valor médio de desconto"
from vendas


-- Função COUNT

insert into vendas
values (5, null, 'camisa', 2, 40, 260)

select count(*) "Contagem de linhas"
from vendas

select count(cod_produto) "Contagem de linhas"
from vendas

select * from vendas

-- Operações
-- Cáculos matemáticos simples ou complexos
-- Usa-se () para definir prioridades

select nome_produto,
(vlr_total / qtd_vendida) as "Valor Unitário"
from vendas

select (sum(vlr_total) / sum(qtd_vendida)) as "Valor médio"
from vendas

+ - / *

-- Agrupamento GROUP BY
-- Agrupa valores agregados extratificando os dados

select nome_produto,
sum(vlr_total) as "Valor total por produto"
from vendas
group by 1