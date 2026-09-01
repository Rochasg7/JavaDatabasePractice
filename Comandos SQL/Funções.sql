-- ============================================================
-- TABELA: VENDAS
-- ============================================================

CREATE TABLE vendas (
    nf              INT NOT NULL PRIMARY KEY,
    cod_produto     INT,
    nome_produto    VARCHAR(50),
    qtd_vendida     INT,
    vlr_desconto    NUMERIC(12,2),
    vlr_total       NUMERIC(12,2)
);


-- ============================================================
-- INSERINDO DADOS
-- ============================================================

INSERT INTO vendas
VALUES
    (1, 101, 'Camisa',  2, 40, 260),
    (2, 102, 'Calça',   3, 90, 699),
    (3, 103, 'Jaqueta', 1, 40, 499),
    (4, 104, 'Sapato',  1, 30, 389);


-- ============================================================
-- FUNÇÃO MAX()
-- Retorna o maior valor de uma coluna
-- ============================================================

SELECT MAX(vlr_total) AS "Maior valor de vendas"
FROM vendas;

SELECT MAX(qtd_vendida) AS "Maior quantidade vendida"
FROM vendas;

SELECT MAX(vlr_desconto) AS "Maior valor de desconto"
FROM vendas;


-- ============================================================
-- FUNÇÃO MIN()
-- Retorna o menor valor de uma coluna
-- ============================================================

SELECT MIN(vlr_total) AS "Menor valor de vendas"
FROM vendas;

SELECT MIN(qtd_vendida) AS "Menor quantidade vendida"
FROM vendas;

SELECT MIN(vlr_desconto) AS "Menor valor de desconto"
FROM vendas;


-- ============================================================
-- FUNÇÃO SUM()
-- Soma os valores de uma coluna
-- ============================================================

SELECT SUM(vlr_total) AS "Valor total de vendas"
FROM vendas;

SELECT SUM(qtd_vendida) AS "Quantidade total vendida"
FROM vendas;

SELECT SUM(vlr_desconto) AS "Valor total de desconto"
FROM vendas;


-- ============================================================
-- FUNÇÃO AVG()
-- Retorna a média dos valores de uma coluna
-- ============================================================

SELECT AVG(vlr_total) AS "Valor médio de vendas"
FROM vendas;

SELECT AVG(qtd_vendida) AS "Quantidade média vendida"
FROM vendas;

SELECT AVG(vlr_desconto) AS "Valor médio de desconto"
FROM vendas;


-- ============================================================
-- FUNÇÃO COUNT()
-- Conta registros
-- ============================================================

INSERT INTO vendas
VALUES (5, NULL, 'Camisa', 2, 40, 260);


-- Conta todas as linhas
SELECT COUNT(*) AS "Contagem de linhas"
FROM vendas;


-- Conta apenas valores NÃO NULOS da coluna
SELECT COUNT(cod_produto) AS "Contagem de linhas"
FROM vendas;


-- Visualiza todos os registros
SELECT *
FROM vendas;


-- ============================================================
-- OPERAÇÕES MATEMÁTICAS
-- ============================================================
-- Operadores:
-- +  Adição
-- -  Subtração
-- /  Divisão
-- *  Multiplicação
--
-- Parênteses () são usados para definir prioridades
-- nas operações.


-- Valor unitário de cada produto
SELECT
    nome_produto,
    (vlr_total / qtd_vendida) AS "Valor unitário"
FROM vendas;


-- Valor médio geral das vendas
SELECT
    (SUM(vlr_total) / SUM(qtd_vendida)) AS "Valor médio"
FROM vendas;


-- ============================================================
-- AGRUPAMENTO: GROUP BY
-- ============================================================
-- Agrupa os registros para permitir operações agregadas
-- como SUM(), COUNT(), AVG(), MAX() e MIN().


-- Valor total vendido por produto
SELECT
    nome_produto,
    SUM(vlr_total) AS "Valor total por produto"
FROM vendas
GROUP BY 1;


-- ============================================================
-- TABELA: PRODUTO
-- ============================================================

CREATE TABLE produto (
    cod             INT PRIMARY KEY,
    nome            VARCHAR(50),
    qtde            INT,
    cod_categoria   INT,
    vlr_unitario    NUMERIC(12,2)
);


-- ============================================================
-- TABELA: CATEGORIA
-- ============================================================

CREATE TABLE categoria (
    cod     INT PRIMARY KEY,
    nome    VARCHAR(20)
);


-- ============================================================
-- INSERINDO CATEGORIAS
-- ============================================================

INSERT INTO categoria
VALUES
    (1, 'Mercearia'),
    (2, 'Bebidas'),
    (4, 'Açougue');


-- ============================================================
-- CRIANDO RELACIONAMENTO ENTRE PRODUTO E CATEGORIA
-- ============================================================
-- produto.cod_categoria → categoria.cod
--
-- ON DELETE CASCADE:
-- Se a categoria for excluída, os produtos relacionados
-- também serão excluídos.
--
-- ON UPDATE CASCADE:
-- Se o código da categoria for alterado, o código relacionado
-- nos produtos também será atualizado.


ALTER TABLE produto
ADD CONSTRAINT fk_categoria
FOREIGN KEY (cod_categoria)
REFERENCES categoria (cod)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- ============================================================
-- REMOVENDO A CONSTRAINT
-- ============================================================

ALTER TABLE produto
DROP CONSTRAINT fk_categoria;


-- ============================================================
-- INSERINDO PRODUTOS
-- ============================================================

INSERT INTO produto
VALUES
    (1, 'Arroz tipo 1 5kg',    150, 1, 22.50),
    (2, 'Feijão Carioca 2kg',  120, 1,  6.50),
    (3, 'Sabão em Pó Omo 1kg', 110, 3, 19.50),
    (4, 'Pepsi Black 2l',      340, 2,  5.99);


-- ============================================================
-- CONSULTANDO AS TABELAS
-- ============================================================

SELECT *
FROM produto;

SELECT *
FROM categoria;


-- ============================================================
-- INNER JOIN
-- ============================================================
-- Retorna apenas os registros que possuem correspondência
-- nas DUAS tabelas.
--
-- Normalmente relacionamos:
-- PRIMARY KEY (PK) ↔ FOREIGN KEY (FK)


SELECT
    p.nome AS produto,
    c.nome AS categoria
FROM produto AS p

INNER JOIN categoria AS c
    ON p.cod_categoria = c.cod;


-- ============================================================
-- LEFT JOIN
-- ============================================================
-- Retorna:
-- 1. Todos os registros da tabela da ESQUERDA
-- 2. Os registros correspondentes da tabela da DIREITA
--
-- Caso não exista correspondência, os campos da tabela direita
-- aparecerão como NULL.


SELECT
    p.nome AS produto,
    c.nome AS categoria
FROM produto AS p

LEFT JOIN categoria AS c
    ON p.cod_categoria = c.cod;


-- ============================================================
-- RIGHT JOIN
-- ============================================================
-- Retorna:
-- 1. Todos os registros da tabela da DIREITA
-- 2. Os registros correspondentes da tabela da ESQUERDA
--
-- Caso não exista correspondência, os campos da tabela esquerda
-- aparecerão como NULL.


SELECT
    p.nome AS produto,
    c.nome AS categoria
FROM produto AS p

RIGHT JOIN categoria AS c
    ON p.cod_categoria = c.cod;


-- ============================================================
-- JOIN + AGREGAÇÃO + GROUP BY
-- ============================================================
-- Conta quantos produtos existem em cada categoria.


SELECT
    c.nome AS categoria,
    COUNT(p.cod) AS "Quantidade de produtos"

FROM produto AS p

INNER JOIN categoria AS c
    ON p.cod_categoria = c.cod

GROUP BY 1

ORDER BY 1;