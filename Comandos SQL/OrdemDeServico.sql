CREATE TABLE cliente (
    cod_cliente INT PRIMARY KEY COMMENT 'Id do cliente',
    nome VARCHAR(30) NOT NULL DEFAULT 'ni' COMMENT 'nome',
    empresa VARCHAR(30) NOT NULL DEFAULT 'ni' COMMENT 'empresa',
    telefone VARCHAR(255) NOT NULL DEFAULT 'ni' COMMENT 'telefone'
);

CREATE TABLE tecnico (
    cod_tecnico INT PRIMARY KEY COMMENT 'Id do tecnico',
    nome VARCHAR(30) NOT NULL DEFAULT 'ni' COMMENT 'nome'
);

CREATE TABLE finalizacao (
    cod_final INT PRIMARY KEY COMMENT 'Codigo',
    valor_total NUMERIC(10,2) NOT NULL DEFAULT 0 COMMENT 'valor total',
    data DATETIME,
    data_entrega DATETIME
);

CREATE TABLE ordemdeservico (
    cod_ordem INT PRIMARY KEY COMMENT 'Id da ordem',
    data DATETIME,
    defeito VARCHAR(255) DEFAULT 'ni' COMMENT 'defeito',
    equipamento VARCHAR(255) NOT NULL DEFAULT 'ni' COMMENT 'equipamento',
    cod_cliente INT NOT NULL DEFAULT 0 COMMENT 'Id do cliente',
    cod_tecnico INT NOT NULL DEFAULT 0 COMMENT 'Id do tecnico',
    cod_final INT NOT NULL DEFAULT 0 COMMENT 'Id codigo final'
);

CREATE TABLE servico (
    cod_servico INT PRIMARY KEY COMMENT 'Codigo do serviço',
    atividade VARCHAR(255) NOT NULL DEFAULT 'ni' COMMENT 'atividade'
);

CREATE TABLE relacao_3 (
    cod_servico INT NOT NULL DEFAULT 0 COMMENT 'Id codigo servico',
    cod_ordem INT NOT NULL DEFAULT 0 COMMENT 'Id codigo ordem'
);

ALTER TABLE relacao_3
ADD CONSTRAINT fk_servico
FOREIGN KEY (cod_servico)
REFERENCES servico(cod_servico)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE relacao_3
ADD CONSTRAINT fk_ordem
FOREIGN KEY (cod_ordem)
REFERENCES ordemdeservico(cod_ordem)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE ordemdeservico
ADD CONSTRAINT fk_cod_cliente
FOREIGN KEY (cod_cliente)
REFERENCES cliente(cod_cliente)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE ordemdeservico
ADD CONSTRAINT fk_cod_tecnico
FOREIGN KEY (cod_tecnico)
REFERENCES tecnico(cod_tecnico)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE ordemdeservico
ADD CONSTRAINT fk_cod_final
FOREIGN KEY (cod_final)
REFERENCES finalizacao(cod_final)
ON DELETE CASCADE
ON UPDATE CASCADE;

