-- Active: 1794917657685@@127.0.0.1@3308@transportadora_grupo_2

DROP DATABASE IF EXISTS transportadora_anna;
CREATE DATABASE transportadora_grupo_2;
USE transportadora_grupo_2;
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf_cnpj VARCHAR(18) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    endereco VARCHAR(250) NOT NULL
);

CREATE TABLE motorista (
    id_motorista INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnh VARCHAR(20) NOT NULL UNIQUE,
    categoria_cnh VARCHAR(5) NOT NULL,
    telefone VARCHAR(20) NOT NULL
);

CREATE TABLE veiculo (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL UNIQUE,
    modelo VARCHAR(60) NOT NULL,
    capacidade_kg DECIMAL(10, 2) NOT NULL
);

CREATE TABLE status_entrega (
    id_status INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE entrega (
    id_entrega INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_motorista INT NOT NULL,
    id_veiculo INT NOT NULL,
    id_status INT NOT NULL,
    cidade_destino VARCHAR(100) NOT NULL,
    data_saida DATETIME NOT NULL,
    data_previsao DATETIME NOT NULL,
    CONSTRAINT fk_entrega_cliente FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    CONSTRAINT fk_entrega_motorista FOREIGN KEY (id_motorista) REFERENCES motorista(id_motorista),
    CONSTRAINT fk_entrega_veiculo FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo),
    CONSTRAINT fk_entrega_status FOREIGN KEY (id_status) REFERENCES status_entrega(id_status)
);

CREATE TABLE carga (
    id_carga INT AUTO_INCREMENT PRIMARY KEY,
    id_entrega INT NOT NULL,
    descricao VARCHAR(150) NOT NULL,
    peso_kg DECIMAL(10, 2) NOT NULL,
    CONSTRAINT fk_carga_entrega FOREIGN KEY (id_entrega) REFERENCES entrega(id_entrega)
        ON DELETE CASCADE
);
INSERT INTO status_entrega (descricao) VALUES 
('Pendente'),
('Em Trânsito'),
('Entregue'),
('Cancelada');

INSERT INTO cliente (nome, cpf_cnpj, email, telefone, endereco) VALUES
('Indústria Metalúrgica Alfa Ltda', '12.345.678/0001-90', 'logistica@metalalfa.com.br', '(19) 3441-1000', 'Av. Industrial, 500 - Limeira/SP'),
('Supermercados Bom Preço S/A', '98.765.432/0001-10', 'recebimento@bompreco.com.br', '(19) 3452-2000', 'Rua das Flores, 120 - Piracicaba/SP'),
('Construtora Horizonte', '45.678.912/0001-55', 'obras@horizonte.com.br', '(11) 4002-8922', 'Rod. Anhanguera, Km 105 - Campinas/SP');

INSERT INTO motorista (nome, cnh, categoria_cnh, telefone) VALUES
('Carlos Eduardo Santos', '12345678901', 'E', '(19) 99111-2233'),
('Fernanda Oliveira Lima', '98765432109', 'D', '(19) 99222-3344'),
('Roberto Almeida', '45612378900', 'E', '(19) 99333-4455');

INSERT INTO veiculo (placa, modelo, capacidade_kg) VALUES
('ABC1D23', 'Volvo FH 540', 25000.00),
('XYZ9K88', 'Mercedes-Benz Atego 2426', 14000.00),
('JKL4M56', 'Scania R450', 22000.00);

INSERT INTO entrega (id_cliente, id_motorista, id_veiculo, id_status, cidade_destino, data_saida, data_previsao) VALUES
(1, 1, 1, 3, 'Campinas', '2026-11-01 08:00:00', '2026-11-01 14:00:00'),
(2, 2, 2, 2, 'Piracicaba', '2026-11-05 09:30:00', '2026-11-05 12:00:00'),
(3, 1, 3, 1, 'São Paulo', '2026-11-10 06:00:00', '2026-11-10 15:00:00'),
(1, 3, 1, 2, 'Campinas', '2026-11-12 07:15:00', '2026-11-12 13:30:00');

INSERT INTO carga (id_entrega, descricao, peso_kg) VALUES
(1, 'Bobinas de Aço Galvanizado', 12000.00),
(1, 'Chapas Metálicas Cortadas', 4500.50),
(2, 'Paletes de Alimentos Não Perecíveis', 8200.00),
(3, 'Vigas Estruturais de Ferro', 18500.00),
(4, 'Tubos Industriais', 9300.00);

INSERT INTO cliente (nome, cpf_cnpj, email, telefone, endereco) VALUES
('Agropecuária Terra Fértil Ltda', '23.456.789/0001-12', 'compras@terrafertil.com.br', '(19) 3541-8800', 'Rod. Washington Luís, Km 165 - Araras/SP'),
('Distribuidora de Bebidas Paulista', '34.567.890/0001-23', 'logistica@bebidaspaulista.com.br', '(19) 3404-5500', 'Av. Brasil, 1500 - Americana/SP'),
('Têxtil Santa Bárbara S/A', '56.789.012/0001-34', 'expedicao@textilsb.com.br', '(19) 3455-7700', 'Rua do Algodão, 340 - Santa Bárbara d''Oeste/SP');

INSERT INTO motorista (nome, cnh, categoria_cnh, telefone) VALUES
('Marcos Vinícius Pereira', '32165498701', 'E', '(19) 99444-5566'),
('Juliana Costa Mendes', '65498732102', 'D', '(19) 99555-6677'),
('Antônio Carlos Ferreira', '78912345603', 'E', '(19) 99666-7788');

INSERT INTO veiculo (placa, modelo, capacidade_kg) VALUES
('DEF5G67', 'Volkswagen Constellation 24.280', 16000.00),
('GHI8J90', 'Mercedes-Benz Actros 2651', 28000.00),
('MNO2P34', 'Iveco Tector 170E28', 11000.00);

INSERT INTO entrega (id_cliente, id_motorista, id_veiculo, id_status, cidade_destino, data_saida, data_previsao) VALUES
(4, 4, 5, 3, 'Ribeirão Preto', '2026-11-14 05:30:00', '2026-11-14 11:00:00'),
(5, 5, 4, 2, 'Americana', '2026-11-15 10:00:00', '2026-11-15 13:00:00'),
(1, 6, 5, 1, 'Jundiaí', '2026-11-19 07:00:00', '2026-11-19 11:30:00'),
(2, 2, 6, 4, 'Sumaré', '2026-11-20 14:00:00', '2026-11-20 17:00:00');

INSERT INTO carga (id_entrega, descricao, peso_kg) VALUES
(5, 'Sacos de Fertilizantes Agrícolas', 15000.00),
(5, 'Sementes Selecionadas Ensacadas', 6500.00),
(6, 'Engradados de Refrigerantes', 11200.00),
(7, 'Perfis de Aço Laminado', 19800.00),
(8, 'Caixas de Produtos de Limpeza', 4800.00);

UPDATE entrega 
SET id_status = 3 
WHERE id_entrega = 2;

UPDATE cliente
SET telefone = '(19) 3441-9999',
    endereco = 'Av. Industrial, 850 - Distrito Industrial - Limeira/SP'
WHERE id_cliente = 1;

UPDATE veiculo
SET capacidade_kg = capacidade_kg + 1000.00
WHERE placa = 'XYZ9K88';

UPDATE entrega
SET data_previsao = DATE_ADD(data_previsao, INTERVAL 2 HOUR)
WHERE id_status = 1 
  AND cidade_destino = 'São Paulo';

UPDATE entrega
SET id_motorista = 4
WHERE id_entrega = 7;

DELETE FROM carga
WHERE id_entrega = 8 
  AND peso_kg < 5000.00;

DELETE FROM entrega
WHERE id_entrega = 8 
  AND id_status = 4;

DELETE FROM cliente
WHERE id_cliente NOT IN (
    SELECT DISTINCT id_cliente 
    FROM entrega
);

INSERT INTO carga (id_entrega, descricao, peso_kg) VALUES (3, 'Item de Teste', 10.00);
DELETE FROM carga WHERE id_carga = 6;

SELECT * FROM cliente;
SELECT * FROM veiculo;

SELECT 
    nome AS Nome_Cliente, 
    telefone AS Contato, 
    email AS Email_Corporativo
FROM cliente;

SELECT DISTINCT cidade_destino AS Cidades_Atendidas
FROM entrega;

SELECT placa AS Placa, modelo AS Modelo, capacidade_kg AS Capacidade_Kg
FROM veiculo
WHERE capacidade_kg >= 15000.00;

SELECT id_entrega AS Codigo_Entrega, cidade_destino AS Destino, data_saida AS Saida
FROM entrega
WHERE id_status = 2 
  AND (cidade_destino = 'Campinas' OR cidade_destino = 'Piracicaba');

SELECT id_entrega AS Codigo_Entrega, cidade_destino AS Destino
FROM entrega
WHERE cidade_destino IN ('Campinas', 'São Paulo', 'Americana');

SELECT id_entrega AS Codigo_Entrega, cidade_destino AS Destino, data_saida AS Saida
FROM entrega
WHERE data_saida BETWEEN '2026-11-01 00:00:00' AND '2026-11-15 23:59:59';

SELECT id_carga AS Codigo_Carga, descricao AS Descricao_Carga, peso_kg AS Peso_Kg
FROM carga
WHERE descricao LIKE '%Aço%' OR descricao LIKE 'Paletes%';

SELECT 
    UPPER(nome) AS Motorista, 
    CONCAT(cnh, ' - Cat. ', categoria_cnh) AS Documento_CNH
FROM motorista
ORDER BY nome ASC;

SELECT 
    placa AS Placa, 
    modelo AS Modelo, 
    capacidade_kg AS Capacidade_Atual,
    ROUND(capacidade_kg * 0.90, 2) AS Carga_Segura_90_Porcento
FROM veiculo
ORDER BY capacidade_kg DESC;

SELECT 
    COUNT(*) AS Total_Itens_Carga,
    SUM(peso_kg) AS Peso_Total_Transportado,
    ROUND(AVG(peso_kg), 2) AS Media_Peso_Carga,
    MIN(peso_kg) AS Menor_Carga,
    MAX(peso_kg) AS Maior_Carga
FROM carga;

SELECT 
    cidade_destino AS Cidade_Destino, 
    COUNT(id_entrega) AS Qtde_Entregas
FROM entrega
GROUP BY cidade_destino
HAVING COUNT(id_entrega) >= 1
ORDER BY Qtde_Entregas DESC;

SELECT 
    E.id_entrega AS Codigo_Entrega,
    C.nome AS Cliente,
    M.nome AS Motorista,
    V.placa AS Placa_Veiculo,
    E.cidade_destino AS Destino,
    S.descricao AS Status_Entrega,
    DATE_FORMAT(E.data_saida, '%d/%m/%Y %H:%i') AS Data_Saida,
    DATE_FORMAT(E.data_previsao, '%d/%m/%Y %H:%i') AS Previsao_Chegada
FROM entrega AS E
INNER JOIN cliente AS C 
    ON C.id_cliente = E.id_cliente
INNER JOIN motorista AS M 
    ON M.id_motorista = E.id_motorista
INNER JOIN veiculo AS V 
    ON V.id_veiculo = E.id_veiculo
INNER JOIN status_entrega AS S 
    ON S.id_status = E.id_status
ORDER BY E.data_saida DESC;

SELECT 
    E.id_entrega AS Codigo_Entrega,
    C.nome AS Cliente,
    V.modelo AS Veiculo,
    V.capacidade_kg AS Capacidade_Maxima_Kg,
    COUNT(CA.id_carga) AS Qtde_Cargas,
    SUM(CA.peso_kg) AS Peso_Total_Kg,
    (V.capacidade_kg - SUM(CA.peso_kg)) AS Capacidade_Livre_Kg
FROM entrega AS E
INNER JOIN cliente AS C 
    ON C.id_cliente = E.id_cliente
INNER JOIN veiculo AS V 
    ON V.id_veiculo = E.id_veiculo
INNER JOIN carga AS CA 
    ON CA.id_entrega = E.id_entrega
GROUP BY E.id_entrega, C.nome, V.modelo, V.capacidade_kg
ORDER BY Peso_Total_Kg DESC;

SELECT 
    M.nome AS Motorista,
    M.cnh AS CNH,
    M.categoria_cnh AS Categoria,
    COUNT(E.id_entrega) AS Total_Entregas
FROM motorista AS M
LEFT JOIN entrega AS E 
    ON E.id_motorista = M.id_motorista
GROUP BY M.id_motorista, M.nome, M.cnh, M.categoria_cnh
ORDER BY Total_Entregas DESC;

SELECT 
    C.id_cliente AS Codigo_Cliente, 
    C.nome AS Cliente
FROM cliente AS C
LEFT JOIN entrega AS E 
    ON E.id_cliente = C.id_cliente
WHERE E.id_entrega IS NULL;

SELECT 
    descricao AS Carga, 
    peso_kg AS Peso_Kg,
    CASE 
        WHEN peso_kg < 5000.00 THEN 'Carga Leve'
        WHEN peso_kg <= 10000.00 THEN 'Carga Média'
        ELSE 'Carga Pesada'
    END AS Classificacao_Carga
FROM carga
ORDER BY peso_kg ASC;

SELECT 
    id_carga AS Codigo_Carga, 
    descricao AS Carga, 
    peso_kg AS Peso_Kg
FROM carga
WHERE peso_kg > (
    SELECT AVG(peso_kg) 
    FROM carga
)
ORDER BY peso_kg DESC;

START TRANSACTION;

INSERT INTO entrega (id_cliente, id_motorista, id_veiculo, id_status, cidade_destino, data_saida, data_previsao)
VALUES (2, 3, 2, 1, 'Americana', '2026-11-18 08:00:00', '2026-11-18 11:00:00');

SET @ultima_entrega = LAST_INSERT_ID();

INSERT INTO carga (id_entrega, descricao, peso_kg)
VALUES (@ultima_entrega, 'Caixas de Bebidas', 6400.00);

COMMIT;

START TRANSACTION;

UPDATE entrega SET id_status = 4 WHERE id_entrega = 1;

ROLLBACK;

CREATE INDEX idx_entrega_cidade ON entrega(cidade_destino);
CREATE INDEX idx_entrega_data_saida ON entrega(data_saida);

EXPLAIN SELECT id_entrega, id_cliente, cidade_destino, data_saida
FROM entrega
WHERE cidade_destino = 'Campinas';
