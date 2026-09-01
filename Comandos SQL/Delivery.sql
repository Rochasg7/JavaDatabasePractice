-- ============================================================
-- TABELA: EMPRESA
-- ============================================================

CREATE TABLE empresa (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    cnpj VARCHAR(255),
    email VARCHAR(255),
    telefone VARCHAR(255),
    endereco VARCHAR(255)
);


-- ============================================================
-- TABELA: ENTREGADOR
-- ============================================================

CREATE TABLE entregador (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    cpf VARCHAR(255),
    rg VARCHAR(255),
    celular VARCHAR(255),
    id_empresa INT
);


-- ============================================================
-- TABELA: CLIENTE
-- ============================================================

CREATE TABLE cliente (
    telefone VARCHAR(255) PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    pontoreferencia VARCHAR(255),
    nascimento DATE
);


-- ============================================================
-- TABELA: PEDIDO
-- ============================================================

CREATE TABLE pedido (
    id INT PRIMARY KEY,
    status VARCHAR(255),
    taxa_entrega VARCHAR(255),
    data DATETIME,
    telefone_cliente VARCHAR(255),
    id_entregador INT
);


-- ============================================================
-- TABELA: ITEM_PEDIDO
-- ============================================================

CREATE TABLE item_pedido (
    quantidade INT,
    id_marmita INT,
    id_pedido INT
);


-- ============================================================
-- TABELA: MARMITA
-- ============================================================

CREATE TABLE marmita (
    id INT PRIMARY KEY,
    nome VARCHAR(255),
    descricao MEDIUMTEXT,
    tamanho VARCHAR(255),
    valor VARCHAR(255)
);


-- ============================================================
-- TABELA: LOGIN
-- ============================================================

CREATE TABLE login (
    id INT PRIMARY KEY,
    email VARCHAR(255),
    senha VARCHAR(255),
    nivel_acesso INT
);


-- ============================================================
-- FOREIGN KEY: PEDIDO → CLIENTE
-- ============================================================

ALTER TABLE pedido
ADD CONSTRAINT fk_pedido_cliente
FOREIGN KEY (telefone_cliente)
REFERENCES cliente(telefone)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- ============================================================
-- FOREIGN KEY: PEDIDO → ENTREGADOR
-- ============================================================

ALTER TABLE pedido
ADD CONSTRAINT fk_pedido_entregador
FOREIGN KEY (id_entregador)
REFERENCES entregador(id)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- ============================================================
-- FOREIGN KEY: ENTREGADOR → EMPRESA
-- ============================================================

ALTER TABLE entregador
ADD CONSTRAINT fk_entregador_empresa
FOREIGN KEY (id_empresa)
REFERENCES empresa(id)
ON DELETE CASCADE
ON UPDATE CASCADE;