-- =========================
-- Criação do banco
-- =========================
CREATE DATABASE IF NOT EXISTS api_class;
USE api_class;

-- ===========================================================================
-- Sistema de Multas
-- ===========================================================================

-- =========================
-- Tabela: Estado
-- =========================
CREATE TABLE m_estado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    sigla CHAR(2) NOT NULL UNIQUE
);

-- =========================
-- Tabela: Endereço
-- =========================
CREATE TABLE m_endereco (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estado_id INT NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    rua VARCHAR(100) NOT NULL,
    numero VARCHAR(10), -- permite "S/N", "12A", etc
    complemento VARCHAR(100),

    CONSTRAINT fk_endereco_estado
        FOREIGN KEY (estado_id)
        REFERENCES m_estado(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- índice para performance
CREATE INDEX idx_endereco_estado ON m_endereco(estado_id);

-- =========================
-- Tabela: Motorista
-- =========================
CREATE TABLE m_motorista (
    cnh CHAR(11) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco_id INT NOT NULL,

    CONSTRAINT fk_motorista_endereco
        FOREIGN KEY (endereco_id)
        REFERENCES m_endereco(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

CREATE INDEX idx_motorista_endereco ON m_motorista(endereco_id);

-- =========================
-- Tabela: Veículo
-- =========================
CREATE TABLE m_veiculo (
    placa CHAR(7) PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano YEAR NOT NULL
);

-- =========================
-- Tabela: Agente de Trânsito
-- =========================
CREATE TABLE m_agente (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    area_atuacao VARCHAR(30) NOT NULL
);

-- =========================
-- Tabela: Infração
-- =========================
CREATE TABLE m_infracao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    descricao TEXT NOT NULL,

    local_id INT NOT NULL,
    motorista_cnh CHAR(11) NOT NULL,
    veiculo_placa CHAR(7) NOT NULL,
    agente_cpf CHAR(11) NOT NULL,

    CONSTRAINT fk_infracao_local
        FOREIGN KEY (local_id)
        REFERENCES m_endereco(id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_infracao_motorista
        FOREIGN KEY (motorista_cnh)
        REFERENCES m_motorista(cnh)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_infracao_veiculo
        FOREIGN KEY (veiculo_placa)
        REFERENCES m_veiculo(placa)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_infracao_agente
        FOREIGN KEY (agente_cpf)
        REFERENCES m_agente(cpf)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- índices para consultas mais rápidas
CREATE INDEX idx_infracao_motorista ON m_infracao(motorista_cnh);
CREATE INDEX idx_infracao_veiculo ON m_infracao(veiculo_placa);
CREATE INDEX idx_infracao_agente ON m_infracao(agente_cpf);
CREATE INDEX idx_infracao_local ON m_infracao(local_id);