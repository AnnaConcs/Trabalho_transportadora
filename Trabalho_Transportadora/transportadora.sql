-- Active: 1794917657685@@127.0.0.1@3308@transportadora_anna_guh
create database transportadora_anna_guh;

use transportadora_anna_guh;

CREATE TABLE entrega_geral (
ID_entrega INT AUTO_INCREMENT PRIMARY KEY,
carga_descricao VARCHAR(100) NOT NULL,
cidade_destino VARCHAR (100) NOT NULL UNIQUE
);

create table status_entrega (
    id_status int auto_increment primary key
);

create table