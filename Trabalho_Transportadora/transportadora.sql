-- Active: 1794917657685@@127.0.0.1@3308@transportadora_anna_guh
create database transportadora_anna_guh;

use transportadora_anna_guh;

CREATE TABLE entrega_geral (
ID_entrega INT AUTO_INCREMENT PRIMARY KEY,
carga_descricao VARCHAR(100) NOT NULL,
cidade_destino VARCHAR (100) NOT NULL UNIQUE
-- id_pedido INT NOT NULL,
-- CONSTRAINT fk_entrega_pedido FOREIGN KEY (id_pedido)
--         REFERENCES pedido(id_pedido)
);

create table status_entrega (
    id_status int auto_increment primary key
);

create table pedido (
    id_pedido int auto_increment primary key,
    id_entrega_geral int not null,
    CONSTRAINT fk_pedido_entrega FOREIGN KEY (id_entrega_geral)
        REFERENCES entrega_geral(ID_entrega)
);

create table dados_motor (
ID_motorista INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(60) NOT NULL,
cnh VARCHAR (100) NOT NULL UNIQUE,
veiculo_placa VARCHAR (100) NOT NULL UNIQUE
);

create table cliente (
ID_cliente INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
email VARCHAR (100) NOT NULL UNIQUE,
endereco VARCHAR (250) NOT NULL UNIQUE,
telefone VARCHAR (20) NOT NULL UNIQUE
);

create table faz (
ID_faz INT AUTO_INCREMENT PRIMARY KEY
);

drop database if exists transportadora_anna_guh

