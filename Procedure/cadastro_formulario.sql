/*
=======================================
Author: José Vinícius Soares Nunes
Data Alteração / Criação: 18/06/2024
=======================================
*/

CREATE PROCEDURE InsertAparelhoProblema(
    IN p_tipo_aparelho VARCHAR(150),
    IN p_marca VARCHAR(150),
    IN p_modelo VARCHAR(150),
    IN p_numero_serie VARCHAR(50),
    IN p_imei VARCHAR(50),
    IN p_estado_garantia BOOL,
    IN p_outras_especificacoes VARCHAR(200),
    IN p_nome_usuario VARCHAR(255),
    IN p_email VARCHAR(255),
    IN p_telefone VARCHAR(11),
    IN p_endereco_rua LONGTEXT,
    IN p_endereco_numero INT,
    IN p_endereco_estado VARCHAR(2),
    IN p_endereco_cep VARCHAR(8),
    IN p_meio_de_contato VARCHAR(100),
    IN p_descricao LONGTEXT,
    IN p_conduta LONGTEXT,
    IN p_sintomas LONGTEXT,
    IN p_comportamento LONGTEXT,
    IN p_erro_alerta LONGTEXT,
)
BEGIN
    DECLARE v_id_usuario INT;
    DECLARE v_last_id INT;

    INSERT INTO tblUsuario (
        nome, 
        email, 
        telefone, 
        endereco_rua, 
        enedereco_numero, 
        endereco_estado, 
        endereco_cep, 
        meio_de_contato
    ) VALUES (
        p_nome_usuario, 
        p_email, 
        p_telefone, 
        p_endereco_rua, 
        p_endereco_numero, 
        p_endereco_estado, 
        p_endereco_cep, 
        p_meio_de_contato
    );

    SET v_id_usuario = LAST_INSERT_ID();

    INSERT INTO tblAparelho (
        tipo_aparelho, 
        marca, 
        modelo, 
        numero_serie, 
        imei, 
        estado_garantia, 
        outras_especificacoes, 
        id_usuario
    ) VALUES (
        p_tipo_aparelho, 
        p_marca, 
        p_modelo, 
        p_numero_serie, 
        p_imei, 
        p_estado_garantia, 
        p_outras_especificacoes, 
        v_id_usuario
    );

    SET v_last_id = LAST_INSERT_ID();

    INSERT INTO tblProblema (
        descricao, 
        conduta, 
        sintomas, 
        comportamento, 
        erro_alerta, 
        id_aparelho
    ) VALUES (
        p_descricao, 
        p_conduta, 
        p_sintomas, 
        p_comportamento, 
        p_erro_alerta,
        v_last_id
    );
    
END