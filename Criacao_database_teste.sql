CREATE DATABASE mustech_db;
use mustech_db;

Create table IF NOT EXISTS tblUsuario(
    id_usuario int not null auto_increment PRIMARY key,
    nome VARCHAR (100),
    email VARCHAR (200),
    telefone VARCHAR (11),
    endereco_rua longtext,
    enedereco_numero int ,
    endereco_estado VARCHAR (2),
    endereco_cep VARCHAR (8),
    meio_de_contato VARCHAR (100)
);

Create table IF NOT EXISTS tblAparelho(
    id_aparelho int not null auto_increment Primary Key,
    tipo_aparelho VARCHAR (150),
    marca VARCHAR (150),
    modelo VARCHAR (150),
    numero_serie VARCHAR (50),
    imei VARCHAR (50), 
    estado_garantia bool,
    outras_espeficacoes VARCHAR (200),
    id_usuario int not null,
    FOREIGN KEY (id_usuario) REFERENCES tblUsuario(id_usuario)
);

Create table IF NOT EXISTS tblProblema(
    id_problema int not null auto_increment Primary Key,
    descricao longtext,
    conduta  longtext,
    sintomas longtext,
    comportamento longtext,
    erro_alerta longtext,
    id_aparelho int not null,
    FOREIGN KEY (id_aparelho) REFERENCES tblAparelho(id_aparelho)
);
