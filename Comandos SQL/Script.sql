-- ============================================================
-- TABELA: PRODUTO
-- ============================================================

CREATE TABLE produto (
    cod INT,
    nome VARCHAR(20),
    id_categoria INT,

    PRIMARY KEY (cod)
);


-- ============================================================
-- TABELA: CATEGORIA
-- ============================================================

CREATE TABLE categoria (
    id INT,
    nome VARCHAR(20)
);


-- ============================================================
-- ADICIONANDO PRIMARY KEY NA TABELA CATEGORIA
-- ============================================================

ALTER TABLE categoria
ADD PRIMARY KEY (id);


-- ============================================================
-- EXCLUINDO A TABELA CATEGORIA
-- ============================================================

DROP TABLE categoria;


-- ============================================================
-- RECRIANDO A TABELA CATEGORIA
-- ============================================================

CREATE TABLE categoria (
    id INT PRIMARY KEY
       COMMENT 'ID da categoria',

    nome VARCHAR(20) NOT NULL DEFAULT 'NI'
         COMMENT 'Nome da categoria'
);


-- ============================================================
-- ALTERANDO A COLUNA NOME DA TABELA PRODUTO
-- ============================================================
-- Modifica:
--   • Tamanho: VARCHAR(30)
--   • Obrigatoriedade: NOT NULL
--   • Valor padrão: 'NI'
--   • Comentário: Nome do produto


ALTER TABLE produto
MODIFY nome VARCHAR(30)
       NOT NULL
       DEFAULT 'NI'
       COMMENT 'Nome do produto';


-- ============================================================
-- CRIANDO FOREIGN KEY
-- ============================================================
-- Relacionamento:
--   produto.id_categoria → categoria.id
--
-- ON DELETE CASCADE:
-- Se uma categoria for excluída, os produtos relacionados
-- também serão excluídos.
--
-- ON UPDATE CASCADE:
-- Se o ID da categoria for alterado, o ID correspondente
-- nos produtos também será atualizado.


ALTER TABLE produto
ADD CONSTRAINT fk_produto_categoria
FOREIGN KEY (id_categoria)
REFERENCES categoria (id)
ON DELETE CASCADE
ON UPDATE CASCADE;