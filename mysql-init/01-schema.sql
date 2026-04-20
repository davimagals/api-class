-- Criação do banco
CREATE DATABASE IF NOT EXISTS multas;
USE multas;

-- =========================
-- Tabela: Estado (endereço)
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
    logradouro VARCHAR(100) NOT NULL,
    numero VARCHAR(10),
    complemento VARCHAR(100),
    bairro VARCHAR(50),
    cidade VARCHAR(50) NOT NULL,
    estado_id INT NOT NULL,
    
    FOREIGN KEY (estado_id) REFERENCES estado(id)
);

-- =========================
-- Tabela: Motorista
-- =========================
CREATE TABLE motorista (
    cnh CHAR(9) PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco_id INT NOT NULL,

    FOREIGN KEY (endereco_id) REFERENCES endereco(id)
);

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
    motorista_cnh CHAR(9) NOT NULL,
    veiculo_placa CHAR(7) NOT NULL,
    agente_cpf CHAR(11) NOT NULL,
    
    FOREIGN KEY (local_id) REFERENCES endereco(id)
    FOREIGN KEY (motorista_id) REFERENCES motorista(cnh),
    FOREIGN KEY (veiculo_id) REFERENCES veiculo(placa),
    FOREIGN KEY (agente_id) REFERENCES agente(id)
);