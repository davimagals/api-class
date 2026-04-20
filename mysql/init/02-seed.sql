USE multas;

-- =========================
-- ESTADOS (Brasil)
-- =========================
INSERT INTO estado (nome, sigla) VALUES
('Acre','AC'),
('Alagoas','AL'),
('Amapá','AP'),
('Amazonas','AM'),
('Bahia','BA'),
('Ceará','CE'),
('Distrito Federal','DF'),
('Espírito Santo','ES'),
('Goiás','GO'),
('Maranhão','MA'),
('Mato Grosso','MT'),
('Mato Grosso do Sul','MS'),
('Minas Gerais','MG'),
('Pará','PA'),
('Paraíba','PB'),
('Paraná','PR'),
('Pernambuco','PE'),
('Piauí','PI'),
('Rio de Janeiro','RJ'),
('Rio Grande do Norte','RN'),
('Rio Grande do Sul','RS'),
('Rondônia','RO'),
('Roraima','RR'),
('Santa Catarina','SC'),
('São Paulo','SP'),
('Sergipe','SE'),
('Tocantins','TO');

-- =========================
-- ENDEREÇOS
-- =========================
INSERT INTO endereco (logradouro, numero, cidade, estado_id) VALUES
('Rua Boulevard', '123', 'Fortaleza', 6),
('Av. Central', '201', 'São Paulo', 25),
('Rua das Flores', '50', 'Recife', 17),
('Av. da Universidade', '83', 'Fortaleza', 6),
('Av. das Nações', '106', 'São Paulo', 25),
('Rua das Almas', '58', 'Recife', 17);

-- =========================
-- MOTORISTAS
-- =========================
INSERT INTO motorista (cnh, nome, data_nascimento, endereco_id) VALUES
('793242826', 'João Silva', '1990-01-01', 1),
('964267942', 'Maria Souza', '1985-05-10', 2),
('074346732', 'Carlos Lima', '1992-09-20', 3);

-- =========================
-- VEÍCULOS
-- =========================
INSERT INTO veiculo (placa, marca, modelo, ano) VALUES
('ABC1A23', 'Toyota', 'Corolla', 2020),
('DEF4B56', 'Chevrolet', 'Celta', 2019),
('GHI7C89', 'Ford', 'Focus', 2018);

-- =========================
-- AGENTES
-- =========================
INSERT INTO agente (cpf, nome, area_atuacao) VALUES
('65524584561', 'Silva', 'Guarda Municipal'),
('76345685355', 'Costa', 'PRE');

-- =========================
-- INFRAÇÕES (3 registros)
-- =========================
INSERT INTO infracao (
    data_hora,
    descricao,
    local_id,
    motorista_cnh,
    veiculo_placa,
    agente_cpf
) VALUES
('2026-04-20 10:00:00', 'Excesso de velocidade', 4, '793242826', 'ABC1A23', '65524584561'),
('2025-03-12 11:30:00', 'Avanço de sinal vermelho', 5, '964267942', 'DEF4B56', '76345685355'),
('2023-04-01 12:15:00', 'Estacionamento proibido', 6, '074346732', 'GHI7C89', '65524584561');