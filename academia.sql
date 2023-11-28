-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-02 14:04:44.669

-- tables
-- Table: aluno
CREATE TABLE aluno (
    cd_aluno int  NOT NULL,
    nm_aluno varchar(50)  NOT NULL,
    genero_aluno varchar(15)  NOT NULL,
    peso_aluno decimal(8,2)  NOT NULL,
    altura_aluno decimal(8,2)  NOT NULL,
    tel_aluno varchar(15)  NOT NULL,
    email_aluno varchar(50)  NOT NULL,
    nr_endereco int  NOT NULL,
    plano_cd_plano int  NOT NULL,
    cd_graduacao int  NOT NULL,
    cd_atividade int  NOT NULL,
    CONSTRAINT aluno_pk PRIMARY KEY (cd_aluno)
);

-- Table: atividade_profissional
CREATE TABLE atividade_profissional (
    cd_atividade int  NOT NULL,
    nm_atividade varchar(30)  NOT NULL,
    ds_atividade varchar(100)  NOT NULL,
    CONSTRAINT atividade_profissional_pk PRIMARY KEY (cd_atividade)
);

-- Table: endereco
CREATE TABLE endereco (
    nr_endereco int  NOT NULL,
    nr_cep int  NOT NULL,
    ds_complemento varchar(50)  NOT NULL,
    nm_bairro varchar(50)  NOT NULL,
    tp_logradouro varchar(30)  NOT NULL,
    cd_localidade int  NOT NULL,
    CONSTRAINT endereco_pk PRIMARY KEY (nr_endereco)
);

-- Table: graduacao
CREATE TABLE graduacao (
    cd_graduacao int  NOT NULL,
    nm_graduacao varchar(30)  NOT NULL,
    ds_graduacao varchar(100)  NOT NULL,
    CONSTRAINT graduacao_pk PRIMARY KEY (cd_graduacao)
);

-- Table: instrutor
CREATE TABLE instrutor (
    cd_instrutor int  NOT NULL,
    nm_instrutor varchar(50)  NOT NULL,
    nr_endereco int  NOT NULL,
    tel_instrutor varchar(15)  NOT NULL,
    email_instrutor varchar(30)  NOT NULL,
    CONSTRAINT instrutor_pk PRIMARY KEY (cd_instrutor)
);

-- Table: instrutor_modalidade
CREATE TABLE instrutor_modalidade (
    cd_instrutor int  NOT NULL,
    cd_modalidade int  NOT NULL,
    CONSTRAINT instrutor_modalidade_pk PRIMARY KEY (cd_instrutor,cd_modalidade)
);

-- Table: localidade
CREATE TABLE localidade (
    cd_localidade int  NOT NULL,
    nm_localidade varchar(50)  NOT NULL,
    uf_localidade char(2)  NOT NULL,
    CONSTRAINT localidade_pk PRIMARY KEY (cd_localidade)
);

-- Table: matricula
CREATE TABLE matricula (
    cd_turma int  NOT NULL,
    cd_aluno int  NOT NULL,
    CONSTRAINT matricula_pk PRIMARY KEY (cd_turma,cd_aluno)
);

-- Table: modalidade
CREATE TABLE modalidade (
    cd_modalidade int  NOT NULL,
    nm_modalidade varchar(20)  NOT NULL,
    ds_modalidade varchar(100)  NOT NULL,
    CONSTRAINT modalidade_pk PRIMARY KEY (cd_modalidade)
);

-- Table: plano
CREATE TABLE plano (
    cd_plano int  NOT NULL,
    nm_plano varchar(30)  NOT NULL,
    ds_plano varchar(100)  NOT NULL,
    vl_mensal decimal(8,2)  NOT NULL,
    vl_trimestral decimal(8,2)  NOT NULL,
    vl_semestral decimal(8,2)  NOT NULL,
    vl_anual decimal(8,2)  NOT NULL,
    qt_turma int  NOT NULL,
    CONSTRAINT plano_pk PRIMARY KEY (cd_plano)
);

-- Table: presenca
CREATE TABLE presenca (
    cd_presenca int  NOT NULL,
    dt_presenca date  NOT NULL,
    hr_presenca time  NOT NULL,
    cd_turma int  NOT NULL,
    cd_aluno int  NOT NULL,
    CONSTRAINT presenca_pk PRIMARY KEY (cd_presenca)
);

-- Table: turma
CREATE TABLE turma (
    cd_turma int  NOT NULL,
    hr_inicio_aula time  NOT NULL,
    duracao_aula time  NOT NULL,
    lmt_vagas int  NOT NULL,
    ds_aula varchar(100)  NOT NULL,
    cd_instrutor int  NOT NULL,
    cd_modalidade int  NOT NULL,
    CONSTRAINT turma_pk PRIMARY KEY (cd_turma)
);

-- foreign keys
-- Reference: Endereco_Localidade (table: endereco)
ALTER TABLE endereco ADD CONSTRAINT Endereco_Localidade
    FOREIGN KEY (cd_localidade)
    REFERENCES localidade (cd_localidade)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: aluno_atividade_profissional (table: aluno)
ALTER TABLE aluno ADD CONSTRAINT aluno_atividade_profissional
    FOREIGN KEY (cd_atividade)
    REFERENCES atividade_profissional (cd_atividade)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: aluno_endereco (table: aluno)
ALTER TABLE aluno ADD CONSTRAINT aluno_endereco
    FOREIGN KEY (nr_endereco)
    REFERENCES endereco (nr_endereco)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: aluno_graduacao (table: aluno)
ALTER TABLE aluno ADD CONSTRAINT aluno_graduacao
    FOREIGN KEY (cd_graduacao)
    REFERENCES graduacao (cd_graduacao)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: aluno_plano (table: aluno)
ALTER TABLE aluno ADD CONSTRAINT aluno_plano
    FOREIGN KEY (plano_cd_plano)
    REFERENCES plano (cd_plano)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: instrutor_endereco (table: instrutor)
ALTER TABLE instrutor ADD CONSTRAINT instrutor_endereco
    FOREIGN KEY (nr_endereco)
    REFERENCES endereco (nr_endereco)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: instrutor_modalidade_instrutor (table: instrutor_modalidade)
ALTER TABLE instrutor_modalidade ADD CONSTRAINT instrutor_modalidade_instrutor
    FOREIGN KEY (cd_instrutor)
    REFERENCES instrutor (cd_instrutor)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: instrutor_modalidade_modalidade (table: instrutor_modalidade)
ALTER TABLE instrutor_modalidade ADD CONSTRAINT instrutor_modalidade_modalidade
    FOREIGN KEY (cd_modalidade)
    REFERENCES modalidade (cd_modalidade)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: matricula_aluno (table: matricula)
ALTER TABLE matricula ADD CONSTRAINT matricula_aluno
    FOREIGN KEY (cd_aluno)
    REFERENCES aluno (cd_aluno)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: matricula_turma (table: matricula)
ALTER TABLE matricula ADD CONSTRAINT matricula_turma
    FOREIGN KEY (cd_turma)
    REFERENCES turma (cd_turma)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: presenca_matricula (table: presenca)
ALTER TABLE presenca ADD CONSTRAINT presenca_matricula
    FOREIGN KEY (cd_turma, cd_aluno)
    REFERENCES matricula (cd_turma, cd_aluno)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- Reference: turma_instrutor_modalidade (table: turma)
ALTER TABLE turma ADD CONSTRAINT turma_instrutor_modalidade
    FOREIGN KEY (cd_instrutor, cd_modalidade)
    REFERENCES instrutor_modalidade (cd_instrutor, cd_modalidade)  
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE
;

-- End of file.

bd_script