-- ============================================================
-- TABELA: CLIENTE
-- ============================================================

CREATE TABLE cliente (
    cod_cliente INT PRIMARY KEY
                 COMMENT 'ID do cliente',

    nome VARCHAR(30) NOT NULL DEFAULT 'ni'
         COMMENT 'Nome',

    empresa VARCHAR(30) NOT NULL DEFAULT 'ni'
            COMMENT 'Empresa',

    telefone VARCHAR(255) NOT NULL DEFAULT 'ni'
             COMMENT 'Telefone'
);


-- ============================================================
-- TABELA: TÉCNICO
-- ============================================================

CREATE TABLE tecnico (
    cod_tecnico INT PRIMARY KEY
                 COMMENT 'ID do técnico',

    nome VARCHAR(30) NOT NULL DEFAULT 'ni'
         COMMENT 'Nome'
);


-- ============================================================
-- TABELA: FINALIZAÇÃO
-- ============================================================

CREATE TABLE finalizacao (
    cod_final INT PRIMARY KEY
               COMMENT 'Código',

    valor_total NUMERIC(10,2) NOT NULL DEFAULT 0
                COMMENT 'Valor total',

    data DATETIME,

    data_entrega DATETIME
);


-- ============================================================
-- TABELA: ORDEM DE SERVIÇO
-- ============================================================

CREATE TABLE ordemdeservico (
    cod_ordem INT PRIMARY KEY
              COMMENT 'ID da ordem',

    data DATETIME,

    defeito VARCHAR(255) DEFAULT 'ni'
            COMMENT 'Defeito',

    equipamento VARCHAR(255) NOT NULL DEFAULT 'ni'
                COMMENT 'Equipamento',

    cod_cliente INT NOT NULL DEFAULT 0
                COMMENT 'ID do cliente',

    cod_tecnico INT NOT NULL DEFAULT 0
                COMMENT 'ID do técnico',

    cod_final INT NOT NULL DEFAULT 0
              COMMENT 'ID da finalização'
);


-- ============================================================
-- TABELA: SERVIÇO
-- ============================================================

CREATE TABLE servico (
    cod_servico INT PRIMARY KEY
                 COMMENT 'Código do serviço',

    atividade VARCHAR(255) NOT NULL DEFAULT 'ni'
              COMMENT 'Atividade'
);


-- ============================================================
-- TABELA: RELAÇÃO ENTRE SERVIÇO E ORDEM DE SERVIÇO
-- ============================================================

CREATE TABLE relacao_3 (
    cod_servico INT NOT NULL DEFAULT 0
                 COMMENT 'ID do serviço',

    cod_ordem INT NOT NULL DEFAULT 0
              COMMENT 'ID da ordem'
);


-- ============================================================
-- FOREIGN KEY: SERVIÇO
-- ============================================================

ALTER TABLE relacao_3
ADD CONSTRAINT fk_servico
FOREIGN KEY (cod_servico)
REFERENCES servico(cod_servico)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- ============================================================
-- FOREIGN KEY: ORDEM DE SERVIÇO
-- ============================================================

ALTER TABLE relacao_3
ADD CONSTRAINT fk_ordem
FOREIGN KEY (cod_ordem)
REFERENCES ordemdeservico(cod_ordem)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- ============================================================
-- FOREIGN KEY: CLIENTE
-- ============================================================

ALTER TABLE ordemdeservico
ADD CONSTRAINT fk_cod_cliente
FOREIGN KEY (cod_cliente)
REFERENCES cliente(cod_cliente)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- ============================================================
-- FOREIGN KEY: TÉCNICO
-- ============================================================

ALTER TABLE ordemdeservico
ADD CONSTRAINT fk_cod_tecnico
FOREIGN KEY (cod_tecnico)
REFERENCES tecnico(cod_tecnico)
ON DELETE CASCADE
ON UPDATE CASCADE;


-- ============================================================
-- FOREIGN KEY: FINALIZAÇÃO
-- ============================================================

ALTER TABLE ordemdeservico
ADD CONSTRAINT fk_cod_final
FOREIGN KEY (cod_final)
REFERENCES finalizacao(cod_final)
ON DELETE CASCADE
ON UPDATE CASCADE;