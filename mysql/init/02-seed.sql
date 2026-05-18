USE api_class;

-- ===========================================================================
-- Sistema de Multas
-- ===========================================================================

-- =========================
-- ESTADOS (Brasil)
-- =========================
INSERT INTO m_estado (nome, sigla) VALUES
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
INSERT INTO m_endereco (rua, numero, complemento, bairro, cidade, estado_id) VALUES
('Rua Boulevard', '123', NULL, 'Centro', 'Fortaleza', 6),
('Av. Central', '201', 'Apto 101', 'Centro', 'São Paulo', 25),
('Rua das Flores', '50', NULL, 'Boa Vista', 'Recife', 17),
('Av. da Universidade', '83', NULL, 'Benfica', 'Fortaleza', 6),
('Av. das Nações', '106', 'Sala 12', 'Centro', 'São Paulo', 25),
('Rua das Almas', '58', NULL, 'Santo Amaro', 'Recife', 17);

-- =========================
-- MOTORISTAS
-- =========================
INSERT INTO m_motorista (cnh, nome, data_nascimento, endereco_id) VALUES
('00079324282', 'João Silva', '1990-01-01', 1),
('00096426794', 'Maria Souza', '1985-05-10', 2),
('00074346732', 'Carlos Lima', '1992-09-20', 3);

-- =========================
-- VEÍCULOS
-- =========================
INSERT INTO m_veiculo (placa, marca, modelo, ano) VALUES
('ABC1A23', 'Toyota', 'Corolla', 2020),
('DEF4B56', 'Chevrolet', 'Celta', 2019),
('GHI7C89', 'Ford', 'Focus', 2018);

-- =========================
-- AGENTES
-- =========================
INSERT INTO m_agente (cpf, nome, area_atuacao) VALUES
('65524584561', 'Silva', 'Guarda Municipal'),
('76345685355', 'Costa', 'Polícia Rodoviária Estadual');

-- =========================
-- INFRAÇÕES
-- =========================
INSERT INTO m_infracao (
    data_hora,
    descricao,
    local_id,
    motorista_cnh,
    veiculo_placa,
    agente_cpf
) VALUES
('2026-04-20 10:00:00', 'Excesso de velocidade', 4, '00079324282', 'ABC1A23', '65524584561'),
('2025-03-12 11:30:00', 'Avanço de sinal vermelho', 5, '00096426794', 'DEF4B56', '76345685355'),
('2023-04-01 12:15:00', 'Estacionamento proibido', 6, '00074346732', 'GHI7C89', '65524584561');



-- ===========================================================================
-- Sistema PizzExpress
-- ===========================================================================

-- =========================
-- INGREDIENTES
-- =========================
INSERT INTO p_ingrediente (nome) VALUES
('Queijo'),
('Mussarela'),
('Calabresa'),
('Frango'),
('Bacon'),
('Presunto'),
('Tomate'),
('Cebola'),
('Alho'),
('Orégano'),
('Milho'),
('Catupiry'),
('Azeitona'),
('Parmesão'),
('Provolone'),
('Gorgonzola'),
('Molho'),
('Ovo');

-- =========================
-- PIZZAS
-- =========================
INSERT INTO p_pizza (nome, preco, foto) VALUES
('Calabresa', 45.90, 'calabresa.jpg'),
('Frango Catupiry', 52.50, 'frango-catupiry.jpg'),
('4 Queijos', 58.00, '4-queijos.jpg'),
('Portuguesa', 54.90, 'portuguesa.jpg'),
('Mussarela', 42.00, 'mussarela.jpg'),
('Bacon', 56.50, 'bacon.jpg');

-- =========================
-- Relacionamentos
-- =========================

-- Calabresa
INSERT INTO p_piz_ing (piz_id, ing_id) VALUES
(1, 2),  -- Mussarela
(1, 3),  -- Calabresa
(1, 8),  -- Cebola
(1, 10), -- Orégano
(1, 17); -- Molho

-- Frango Catupiry
INSERT INTO p_piz_ing (piz_id, ing_id) VALUES
(2, 4),  -- Frango
(2, 12), -- Catupiry
(2, 8),  -- Cebola
(2, 10), -- Orégano
(2, 17); -- Molho

-- 4 Queijos
INSERT INTO p_piz_ing (piz_id, ing_id) VALUES
(3, 2),  -- Mussarela
(3, 14), -- Parmesão
(3, 15), -- Provolone
(3, 16), -- Gorgonzola
(3, 10), -- Orégano
(3, 17); -- Molho

-- Portuguesa
INSERT INTO p_piz_ing (piz_id, ing_id) VALUES
(4, 2),  -- Mussarela
(4, 6),  -- Presunto
(4, 7),  -- Tomate
(4, 8),  -- Cebola
(4, 13), -- Azeitona
(4, 18), -- Ovo
(4, 10), -- Orégano
(4, 17); -- Molho

-- Mussarela
INSERT INTO p_piz_ing (piz_id, ing_id) VALUES
(5, 2),  -- Mussarela
(5, 7),  -- Tomate
(5, 10), -- Orégano
(5, 17); -- Molho

-- Bacon
INSERT INTO p_piz_ing (piz_id, ing_id) VALUES
(6, 2),  -- Mussarela
(6, 5),  -- Bacon
(6, 8),  -- Cebola
(6, 10), -- Orégano
(6, 17); -- Molho