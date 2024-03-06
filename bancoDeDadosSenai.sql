CREATE DATABASE db_floricultura;

 USE db_floricultura;

 CREATE TABLE tb_cliente (
     id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
     nome VARCHAR(255) NOT NULL,
     rg VARCHAR(15),
     endereco VARCHAR(60),
     telefone CHAR(11)
)  DEFAULT CHARSET utf8;

 CREATE TABLE tb_produto (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(20),
    valor DECIMAL(6 , 2 )
)  DEFAULT CHARSET utf8;

CREATE TABLE tb_funcionario (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    rg VARCHAR(15) UNIQUE
)  DEFAULT CHARSET UTF8;

-- ---------------------------------------------------------------------------

CREATE DATABASE db_escola;

USE db_escola;

CREATE TABLE tb_aluno (
    id_aluno INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    rg VARCHAR(15) NOT NULL
)  DEFAULT CHARSET UTF8;

CREATE TABLE tb_professor (
    id_professor INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    rg VARCHAR(15) NOT NULL,
    materia VARCHAR(20)
)  DEFAULT CHARSET UTF8;

CREATE TABLE tb_sala (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_professor INT,
    FOREIGN KEY (id_aluno)
        REFERENCES tb_aluno (id_aluno),
    FOREIGN KEY (id_professor)
        REFERENCES tb_professor (id_professor)
)  DEFAULT CHARSET UTF8;

DROP TABLE tb_sala;

---------------------------------------------------------------------------

CREATE DATABASE db_produtos_de_limpeza;

USE db_produtos_de_limpeza;

CREATE TABLE tb_cliente (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    rg VARCHAR(15) NOT NULL,
    endereco VARCHAR(60) NOT NULL,
    telefone CHAR(11) NOT NULL,
    status_cliente VARCHAR(10) NOT NULL,
    limite_credito DECIMAL(9 , 2 )
)  DEFAULT CHARSET UTF8;

CREATE TABLE tb_produto (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(20) NOT NULL,
    codigo INT NOT NULL,
    quantidade INT NOT NULL,
    categoria VARCHAR(20) NOT NULL,
    preco DECIMAL(6 , 2 )
)  DEFAULT CHARSET UTF8;

---------------------------------------------------------------------------

CREATE DATABASE db_sistema_policia;

USE db_sistema_policia;

CREATE TABLE tb_soldado (
    id_soldado INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    RM VARCHAR(20) NOT NULL,
    dt_nasc DATE NOT NULL
)  DEFAULT CHARSET UTF8;

CREATE TABLE tb_arma (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_soldado INT,
    num_serie INT NOT NULL,
    tipo VARCHAR(35) NOT NULL,
    calibre VARCHAR(25) NOT NULL,
    tip_municao VARCHAR(25) NOT NULL,
    FOREIGN KEY (id_soldado)
        REFERENCES tb_soldado (id_soldado)
)  DEFAULT CHARSET UTF8;

---------------------------------------------------------------------------

CREATE DATABASE db_sistema_hospitalar;

USE db_sistema_hospitalar;

CREATE TABLE tb_medico (
    id_medico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    CRM VARCHAR(20) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    especialidade VARCHAR(255)
)  DEFAULT CHARSET UTF8;

CREATE TABLE tb_paciente (
    id_paciente INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    endereco VARCHAR(120) NOT NULL,
    idade INT NOT NULL,
    codRH VARCHAR(20) NOT NULL
)  DEFAULT CHARSET UTF8;

CREATE TABLE tb_consulta (
    id_consulta INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_medico INT,
    id_paciente INT,
    dt_realizacao DATE NOT NULL,
    descricao VARCHAR(955) NOT NULL,
    FOREIGN KEY (id_medico)
        REFERENCES tb_medico (id_medico),
    FOREIGN KEY (id_paciente)
        REFERENCES tb_paciente (id_paciente)
)  DEFAULT CHARSET UTF8;

---------------------------------------------------------------------------

CREATE DATABASE db_empresa_transporte;

USE db_empresa_transporte;

CREATE TABLE tb_encomenda (
    id_encomenda INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dt_encomenda DATE NOT NULL,
    peso DECIMAL(5 , 2 ) NOT NULL,
    destino VARCHAR(255) NOT NULL
)  DEFAULT CHARSET UTF8;

CREATE TABLE tb_caminhao (
    id_caminhao INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_encomenda INT,
    qty_encomenda INT NOT NULL,
    qty_viagem INT NOT NULL,
    cpcd_vol FLOAT NOT NULL,
    cpcd_peso FLOAT NOT NULL,
    FOREIGN KEY (id_encomenda)
        REFERENCES tb_encomenda (id_encomenda)
)  DEFAULT CHARSET UTF8;

CREATE TABLE tb_empresa (
    id_empresa INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_caminhao INT,
    qty_caminhao INT NOT NULL,
    FOREIGN KEY (id_caminhao)
        REFERENCES tb_caminhao (id_caminhao)
)  DEFAULT CHARSET UTF8;

----------------------------------------------------------------------------

create database db_floricultura_jessica;

use db_floricultura_jessica;

create table tb_cliente(
IDCliente int not null primary key auto_increment,
Nome varchar(255) not null,
RG varchar(15) unique,
endereco varchar(60),
telefone char(11)
)default charset utf8;

create table tb_venda(
IDVenda int not null primary key auto_increment,
valor decimal(8,2) not null,
data_compra datetime not null,
IDCliente int not null,
IDProduto int not null,
foreign key(IDCliente) references tb_cliente(IDCliente),
foreign key(IDProduto) references tb_produto(IDProduto)
);

create table tb_produto(
IDProduto int not null primary key auto_increment,
Tipo varchar(20) not null,
Preco decimal(6,2)
)default charset utf8;

create table tb_funcionario(
IDFuncionario int not null primary key auto_increment,
Nome varchar(255) not null,
RG varchar(15) unique
) default charset utf8;
