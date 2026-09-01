-- ============================================================
-- TABELA: ESTOQUE
-- ============================================================

CREATE TABLE estoque (
    cod_produto     INT NOT NULL PRIMARY KEY
                    COMMENT 'Código individual do produto',
    nome_produto    VARCHAR(50)
                    COMMENT 'Nome do produto',
    categoria       VARCHAR(20)
                    COMMENT 'Categoria do produto',
    qtde            INT
                    COMMENT 'Quantidade do produto em estoque',
    vlr_unitario    NUMERIC(12,2)
                    COMMENT 'Valor de cada unidade do produto'
);


-- ============================================================
-- TESTANDO O SCHEMA CRIADO
-- ============================================================

SELECT *
FROM estoque;


-- ============================================================
-- INSERINDO REGISTROS
-- ============================================================

INSERT INTO estoque
VALUES
    (1,  'Sabão em pó',  'Limpeza',   59,  15.95),
    (2,  'Detergente',   'Limpeza',  102,   2.25),
    (3,  'Desinfetante', 'Limpeza',   88,   5.95),
    (4,  'Macarrão',     'Mercearia', 234, 12.95),
    (5,  'Arroz',        'Mercearia', 342, 25.65),
    (6,  'Feijão',       'Mercearia', 123,  4.75),
    (7,  'Óleo',         'Mercearia', 345,  9.95),
    (8,  'Farinha',      'Mercearia', 645,  4.39),
    (9,  'Refrigerante', 'Bebidas',   675,  8.99),
    (10, 'Água',         'Bebidas',   567,  2.69);


-- ============================================================
-- TESTANDO O SCHEMA COM OS REGISTROS INSERIDOS
-- ============================================================

SELECT *
FROM estoque;


-- ============================================================
-- QUESTÃO 1
-- ============================================================
-- Qual a quantidade total de produtos no estoque?

SELECT
    SUM(qtde) AS "Quantidade total de produtos no estoque"
FROM estoque;


-- ============================================================
-- QUESTÃO 2
-- ============================================================
-- Qual a quantidade total de produtos no estoque por categoria?

SELECT
    categoria,
    SUM(qtde) AS "Quantidade total por categoria"
FROM estoque
GROUP BY categoria;


-- ============================================================
-- QUESTÃO 3
-- ============================================================
-- Qual a quantidade média de produtos no estoque pertencentes
-- à categoria Limpeza?

SELECT
    AVG(qtde) AS "Quantidade média de itens na limpeza"
FROM estoque
WHERE categoria = 'Limpeza';


-- ============================================================
-- QUESTÃO 4
-- ============================================================
-- Qual o nome dos produtos por ordem crescente de valor unitário?

SELECT
    nome_produto,
    vlr_unitario
FROM estoque
ORDER BY vlr_unitario ASC;


-- ============================================================
-- QUESTÃO 5
-- ============================================================
-- Qual o preço médio unitário dos produtos do estoque?

SELECT
    AVG(vlr_unitario) AS "Preço médio unitário"
FROM estoque;


-- ============================================================
-- QUESTÃO 6
-- ============================================================
-- Considerando que cada tupla representa o registro de um
-- produto, quantos produtos estão cadastrados neste estoque?

SELECT
    COUNT(cod_produto) AS "Quantidade de produtos cadastrados"
FROM estoque;


-- ============================================================
-- QUESTÃO 7 — ANÁLISE DO ESTOQUE MÍNIMO
-- ============================================================
-- Estoque mínimo = 100 unidades.
--
-- Quantos produtos estão abaixo do estoque mínimo?

SELECT
    COUNT(cod_produto) AS "Produtos abaixo de 100 unidades"
FROM estoque
WHERE qtde < 100;


-- ============================================================
-- QUESTÃO 8
-- ============================================================
-- Quantos produtos estão acima do estoque mínimo?

SELECT
    COUNT(cod_produto) AS "Produtos acima de 100 unidades"
FROM estoque
WHERE qtde > 100;


-- ============================================================
-- QUESTÃO 9
-- ============================================================
-- Qual a quantidade total de produtos em estoque por categoria,
-- considerando apenas os produtos acima do estoque mínimo?

SELECT
    categoria,
    SUM(qtde) AS "Quantidade de produtos por categoria"
FROM estoque
WHERE qtde > 100
GROUP BY categoria;


-- ============================================================
-- QUESTÃO 10
-- ============================================================
-- Apresente a menor e a maior quantidade de produtos
-- por categoria.

SELECT
    categoria,
    MIN(qtde) AS "Menor quantidade",
    MAX(qtde) AS "Maior quantidade"
FROM estoque
GROUP BY categoria;