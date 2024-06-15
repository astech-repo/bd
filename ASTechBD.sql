CREATE DATABASE AStech;
USE ASTech;
Create table USUARIOS
(
ID int auto_increment PRIMARY key,
nome VARCHAR (100),
email VARCHAR (100),
telefone VARCHAR (100),
endereco_rua VARCHAR (80),
enedereco_numero VARCHAR (80),
endereco_estado VARCHAR (80),
endereco_cep VARCHAR (80),
meio_de_contato VARCHAR (100)
);

Create table APARELHO(
ID int auto_increment Primary Key,
marca VARCHAR (30),
modelo VARCHAR (30),
numero_serie VARCHAR (50),
ano_fabricacao VARCHAR (4),
outras_espeficacoes VARCHAR (200),
FOREIGN KEY (ID) REFERENCES USUARIOS(ID)
);

Create table Problema(
ID int auto_increment Primary Key,
descricao VARCHAR (500),
data_inicio VARCHAR (8),
frequencia  VARCHAR (20),
passos_tomados VARCHAR (500),
erro_alerta VARCHAR (300),
FOREIGN KEY (ID) REFERENCES APARELHO (ID)

);