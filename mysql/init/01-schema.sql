-- =========================
-- Criação do banco
-- =========================
CREATE DATABASE IF NOT EXISTS multas;
USE multas;

-- =========================
-- Tabela: Estado
-- =========================
CREATE TABLE estado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sigla CHAR(2) NOT NULL UNIQUE
);

-- =========================
-- Tabela: Endereço
-- =========================
CREATE TABLE endereco (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(10), -- permite "S/N", "12A", etc
    complemento VARCHAR(100),
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado_id INT NOT NULL,

    CONSTRAINT fk_endereco_estado
        FOREIGN KEY (estado_id)
        REFERENCES estado(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- índice para performance
CREATE INDEX idx_endereco_estado ON endereco(estado_id);

-- =========================
-- Tabela: Motorista
-- =========================
CREATE TABLE motorista (
    cnh CHAR(11) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco_id INT NOT NULL,

    CONSTRAINT fk_motorista_endereco
        FOREIGN KEY (endereco_id)
        REFERENCES endereco(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE INDEX idx_motorista_endereco ON motorista(endereco_id);

-- =========================
-- Tabela: Veículo
-- =========================
CREATE TABLE veiculo (
    placa CHAR(7) PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano YEAR NOT NULL
);

-- =========================
-- Tabela: Agente de Trânsito
-- =========================
CREATE TABLE agente (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    area_atuacao VARCHAR(30) NOT NULL
);

-- =========================
-- Tabela: Infração
-- =========================
CREATE TABLE infracao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    descricao TEXT NOT NULL,

    local_id INT NOT NULL,
    motorista_cnh CHAR(11) NOT NULL,
    veiculo_placa CHAR(7) NOT NULL,
    agente_cpf CHAR(11) NOT NULL,

    CONSTRAINT fk_infracao_local
        FOREIGN KEY (local_id)
        REFERENCES endereco(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_infracao_motorista
        FOREIGN KEY (motorista_cnh)
        REFERENCES motorista(cnh)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_infracao_veiculo
        FOREIGN KEY (veiculo_placa)
        REFERENCES veiculo(placa)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_infracao_agente
        FOREIGN KEY (agente_cpf)
        REFERENCES agente(cpf)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- índices para consultas mais rápidas
CREATE INDEX idx_infracao_motorista ON infracao(motorista_cnh);
CREATE INDEX idx_infracao_veiculo ON infracao(veiculo_placa);
CREATE INDEX idx_infracao_agente ON infracao(agente_cpf);
CREATE INDEX idx_infracao_local ON infracao(local_id);