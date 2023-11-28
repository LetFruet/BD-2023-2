-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-02 14:04:54.605

-- tables
-- Table: anuncio
CREATE TABLE anuncio (
    cd_anuncio int  NOT NULL,
    nm_anuncio varchar(30)  NOT NULL,
    ds_anuncio varchar(50)  NOT NULL,
    validade_anuncio date  NOT NULL,
    prioridade_anuncio int  NOT NULL,
    vl_anuncio decimal(4,2)  NOT NULL,
    vl_venda decimal(4,2)  NOT NULL,
    cep_anuncio int  NOT NULL,
    cd_situacao int  NOT NULL,
    cd_categoria int  NOT NULL,
    cd_tipo int  NOT NULL,
    cd_foto int  NOT NULL,
    cd_classificacao int  NOT NULL,
    cd_cep int  NOT NULL,
    CONSTRAINT anuncio_pk PRIMARY KEY (cd_anuncio)
);

-- Table: cadastro_usuario
CREATE TABLE cadastro_usuario (
    cd_usuario int  NOT NULL,
    nm_usuario varchar(50)  NOT NULL,
    email_usuario varchar(50)  NOT NULL,
    dt_nascimento date  NOT NULL,
    genero_usuario char(1)  NOT NULL,
    tel_usuario varchar(15)  NOT NULL,
    nr_endereco int  NOT NULL,
    cd_tipo_usuario int  NOT NULL,
    CONSTRAINT cadastro_usuario_pk PRIMARY KEY (cd_usuario)
);

-- Table: categoria_anuncio
CREATE TABLE categoria_anuncio (
    cd_categoria int  NOT NULL,
    tp_categoria varchar(30)  NOT NULL,
    CONSTRAINT categoria_anuncio_pk PRIMARY KEY (cd_categoria)
);

-- Table: cep_regiao
CREATE TABLE cep_regiao (
    cd_cep int  NOT NULL,
    nr_cep char(8)  NOT NULL,
    regiao_cd_regiao int  NOT NULL,
    CONSTRAINT cep_regiao_pk PRIMARY KEY (cd_cep)
);

-- Table: classificacao_anuncio
CREATE TABLE classificacao_anuncio (
    cd_classificacao int  NOT NULL,
    tp_classificacao varchar(15)  NOT NULL,
    CONSTRAINT classificacao_anuncio_pk PRIMARY KEY (cd_classificacao)
);

-- Table: endereco
CREATE TABLE endereco (
    nr_endereco int  NOT NULL,
    nr_cep int  NOT NULL,
    ds_complemento varchar(50)  NOT NULL,
    nm_bairro varchar(50)  NOT NULL,
    cd_localidade int  NOT NULL,
    tp_logradouro varchar(30)  NOT NULL,
    CONSTRAINT endereco_pk PRIMARY KEY (nr_endereco)
);

-- Table: excluir_anuncio
CREATE TABLE excluir_anuncio (
    cd_exclusao int  NOT NULL,
    dt_exclusao date  NOT NULL,
    hr_exclusao time  NOT NULL,
    cd_razao int  NOT NULL,
    cd_anuncio int  NOT NULL,
    CONSTRAINT excluir_anuncio_pk PRIMARY KEY (cd_exclusao)
);

-- Table: indicativo_msn
CREATE TABLE indicativo_msn (
    cd_indicativo int  NOT NULL,
    tp_indicativo int  NOT NULL,
    CONSTRAINT indicativo_msn_pk PRIMARY KEY (cd_indicativo)
);

-- Table: mensagem
CREATE TABLE mensagem (
    cd_msn int  NOT NULL,
    text_msn varchar(600)  NOT NULL,
    dt_msn date  NOT NULL,
    hr_msn time  NOT NULL,
    cd_indicativo int  NOT NULL,
    cd_usuario int  NOT NULL,
    CONSTRAINT mensagem_pk PRIMARY KEY (cd_msn)
);

-- Table: qntd_foto_anuncio
CREATE TABLE qntd_foto_anuncio (
    cd_foto int  NOT NULL,
    cd_classificacao int  NOT NULL,
    CONSTRAINT qntd_foto_anuncio_pk PRIMARY KEY (cd_foto)
);

-- Table: razao_exclusao
CREATE TABLE razao_exclusao (
    cd_razao int  NOT NULL,
    tp_esclusao varchar(50)  NOT NULL,
    CONSTRAINT razao_exclusao_pk PRIMARY KEY (cd_razao)
);

-- Table: regiao
CREATE TABLE regiao (
    cd_regiao int  NOT NULL,
    nm_regiao varchar(30)  NOT NULL,
    CONSTRAINT regiao_pk PRIMARY KEY (cd_regiao)
);

-- Table: resposta_msn
CREATE TABLE resposta_msn (
    cd_resposta int  NOT NULL,
    ds_resposta varchar(600)  NOT NULL,
    cd_msn int  NOT NULL,
    CONSTRAINT resposta_msn_pk PRIMARY KEY (cd_resposta)
);

-- Table: situacao_anuncio
CREATE TABLE situacao_anuncio (
    cd_situacao int  NOT NULL,
    tp_situacao varchar(30)  NOT NULL,
    CONSTRAINT situacao_anuncio_pk PRIMARY KEY (cd_situacao)
);

-- Table: tipo_anuncio
CREATE TABLE tipo_anuncio (
    cd_tipo int  NOT NULL,
    tp_tipo_anuncio varchar(30)  NOT NULL,
    CONSTRAINT tipo_anuncio_pk PRIMARY KEY (cd_tipo)
);

-- Table: tipo_categoria
CREATE TABLE tipo_categoria (
    cd_categoria int  NOT NULL,
    cd_tipo int  NOT NULL,
    CONSTRAINT tipo_categoria_pk PRIMARY KEY (cd_categoria,cd_tipo)
);

-- Table: tipo_de_usuario
CREATE TABLE tipo_de_usuario (
    cd_tipo_usuario int  NOT NULL,
    tp_usuario varchar(15)  NOT NULL,
    CONSTRAINT tipo_de_usuario_pk PRIMARY KEY (cd_tipo_usuario)
);

-- Table: usuario_anuncio
CREATE TABLE usuario_anuncio (
    cd_anuncio int  NOT NULL,
    cd_usuario int  NOT NULL,
    CONSTRAINT usuario_anuncio_pk PRIMARY KEY (cd_anuncio,cd_usuario)
);

-- foreign keys
-- Reference: anuncio_cep_regiao (table: anuncio)
ALTER TABLE anuncio ADD CONSTRAINT anuncio_cep_regiao
    FOREIGN KEY (cd_cep)
    REFERENCES cep_regiao (cd_cep)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: anuncio_classificacao_anuncio (table: anuncio)
ALTER TABLE anuncio ADD CONSTRAINT anuncio_classificacao_anuncio
    FOREIGN KEY (cd_classificacao)
    REFERENCES classificacao_anuncio (cd_classificacao)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: anuncio_qntd_foto_anuncio (table: anuncio)
ALTER TABLE anuncio ADD CONSTRAINT anuncio_qntd_foto_anuncio
    FOREIGN KEY (cd_foto)
    REFERENCES qntd_foto_anuncio (cd_foto)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: anuncio_situacao_anuncio (table: anuncio)
ALTER TABLE anuncio ADD CONSTRAINT anuncio_situacao_anuncio
    FOREIGN KEY (cd_situacao)
    REFERENCES situacao_anuncio (cd_situacao)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: anuncio_tipo_categoria (table: anuncio)
ALTER TABLE anuncio ADD CONSTRAINT anuncio_tipo_categoria
    FOREIGN KEY (cd_categoria, cd_tipo)
    REFERENCES tipo_categoria (cd_categoria, cd_tipo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: cadastro_usuario_endereco (table: cadastro_usuario)
ALTER TABLE cadastro_usuario ADD CONSTRAINT cadastro_usuario_endereco
    FOREIGN KEY (nr_endereco)
    REFERENCES endereco (nr_endereco)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: cadastro_usuario_tipo_de_usuario (table: cadastro_usuario)
ALTER TABLE cadastro_usuario ADD CONSTRAINT cadastro_usuario_tipo_de_usuario
    FOREIGN KEY (cd_tipo_usuario)
    REFERENCES tipo_de_usuario (cd_tipo_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: cep_regiao_regiao (table: cep_regiao)
ALTER TABLE cep_regiao ADD CONSTRAINT cep_regiao_regiao
    FOREIGN KEY (regiao_cd_regiao)
    REFERENCES regiao (cd_regiao)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: excluir_anuncio_anuncio (table: excluir_anuncio)
ALTER TABLE excluir_anuncio ADD CONSTRAINT excluir_anuncio_anuncio
    FOREIGN KEY (cd_anuncio)
    REFERENCES anuncio (cd_anuncio)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: excluir_anuncio_razao_exclusao (table: excluir_anuncio)
ALTER TABLE excluir_anuncio ADD CONSTRAINT excluir_anuncio_razao_exclusao
    FOREIGN KEY (cd_razao)
    REFERENCES razao_exclusao (cd_razao)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: foto_anuncio_classificacao_anuncio (table: qntd_foto_anuncio)
ALTER TABLE qntd_foto_anuncio ADD CONSTRAINT foto_anuncio_classificacao_anuncio
    FOREIGN KEY (cd_classificacao)
    REFERENCES classificacao_anuncio (cd_classificacao)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: mensagem_cadastro_usuario (table: mensagem)
ALTER TABLE mensagem ADD CONSTRAINT mensagem_cadastro_usuario
    FOREIGN KEY (cd_usuario)
    REFERENCES cadastro_usuario (cd_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: mensagem_indicativo_msn (table: mensagem)
ALTER TABLE mensagem ADD CONSTRAINT mensagem_indicativo_msn
    FOREIGN KEY (cd_indicativo)
    REFERENCES indicativo_msn (cd_indicativo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: resposta_msn_mensagem (table: resposta_msn)
ALTER TABLE resposta_msn ADD CONSTRAINT resposta_msn_mensagem
    FOREIGN KEY (cd_msn)
    REFERENCES mensagem (cd_msn)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: tipo_categoria_categoria_anuncio (table: tipo_categoria)
ALTER TABLE tipo_categoria ADD CONSTRAINT tipo_categoria_categoria_anuncio
    FOREIGN KEY (cd_categoria)
    REFERENCES categoria_anuncio (cd_categoria)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: tipo_categoria_tipo_anuncio (table: tipo_categoria)
ALTER TABLE tipo_categoria ADD CONSTRAINT tipo_categoria_tipo_anuncio
    FOREIGN KEY (cd_tipo)
    REFERENCES tipo_anuncio (cd_tipo)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: usuario_anuncio_anuncio (table: usuario_anuncio)
ALTER TABLE usuario_anuncio ADD CONSTRAINT usuario_anuncio_anuncio
    FOREIGN KEY (cd_anuncio)
    REFERENCES anuncio (cd_anuncio)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: usuario_anuncio_cadastro_usuario (table: usuario_anuncio)
ALTER TABLE usuario_anuncio ADD CONSTRAINT usuario_anuncio_cadastro_usuario
    FOREIGN KEY (cd_usuario)
    REFERENCES cadastro_usuario (cd_usuario)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

