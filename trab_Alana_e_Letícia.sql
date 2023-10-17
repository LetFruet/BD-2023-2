-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-02 13:08:50.315

-- tables
-- Table: agendamento_bt
CREATE TABLE agendamento_bt (
    cd_agendamento int  NOT NULL,
    dt_agendamento date  NOT NULL,
    hr_entrada time  NOT NULL,
    hr_saida time  NOT NULL,
    vl_serico decimal(8,2)  NOT NULL,
    cd_prestador int  NOT NULL,
    cd_animal int  NOT NULL,
    CONSTRAINT agendamento_bt_pk PRIMARY KEbd_academiaY (cd_agendamento)
);

-- Table: animal
CREATE TABLE bd_academia (
    cd_animal int  NOT NULL,
    nm_animal varchar(30)  NOT NULL,
    ds_animal varchar(100)  NOT NULL,
    dt_nascimento date  NOT NULL,
    cd_porte int  NOT NULL,
    cd_raca int  NOT NULL,
    cd_especie int  NOT NULL,
    cd_cliente int  NOT NULL,
    CONSTRAINT animal_pk PRIMARY KEY (cd_animal)
);

-- Table: categoria_produto
CREATE TABLE categoria_produto (
    cd_categoria int  NOT NULL,
    tp_categoria varchar(30)  NOT NULL,
    CONSTRAINT categoria_produto_pk PRIMARY KEY (cd_categoria)
);

-- Table: cliente
CREATE TABLE cliente (
    cd_cliente int  NOT NULL,
    nm_cliente varchar(30)  NOT NULL,
    tel_cliente varchar(15)  NOT NULL,
    email_cliente varchar(50)  NOT NULL,
    dt_nascimento date  NOT NULL,
    cd_endereco int  NOT NULL,
    CONSTRAINT cliente_pk PRIMARY KEY (cd_cliente)
);

-- Table: endereco
CREATE TABLE endereco (
    cd_endereco int  NOT NULL,
    nr_cep int  NOT NULL,
    ds_complemento varchar(50)  NOT NULL,
    nm_bairro varchar(50)  NOT NULL,
    nm_logradouro varchar(30)  NOT NULL,
    cd_localidade int  NOT NULL,
    CONSTRAINT endereco_pk PRIMARY KEY (cd_endereco)
);

-- Table: especie_animal
CREATE TABLE especie_animal (
    cd_especie int  NOT NULL,
    tp_especie varchar(30)  NOT NULL,
    CONSTRAINT especie_animal_pk PRIMARY KEY (cd_especie)
);

-- Table: item_pedido_nf
CREATE TABLE item_pedido_nf (
    cd_produto int  NOT NULL,
    cd_nf int  NOT NULL,
    qt_produto int  NOT NULL,
    vl_produto decimal(8,2)  NOT NULL,
    CONSTRAINT item_pedido_nf_pk PRIMARY KEY (cd_produto,cd_nf)
);

-- Table: localidade
CREATE TABLE localidade (
    cd_localidade int  NOT NULL,
    nm_localidade varchar(50)  NOT NULL,
    uf_localidade char(2)  NOT NULL,
    CONSTRAINT localidade_pk PRIMARY KEY (cd_localidade)
);

-- Table: nota_fiscal
CREATE TABLE nota_fiscal (
    cd_nf int  NOT NULL,
    dt_emissao date  NOT NULL,
    vl_total decimal(8,2)  NOT NULL,
    cd_cliente int  NOT NULL,
    CONSTRAINT nota_fiscal_pk PRIMARY KEY (cd_nf)
);

-- Table: porte_animal
CREATE TABLE porte_animal (
    cd_porte int  NOT NULL,
    tp_porte varchar(30)  NOT NULL,
    CONSTRAINT porte_animal_pk PRIMARY KEY (cd_porte)
);

-- Table: prestador_servico
CREATE TABLE prestador_servico (
    cd_prestador int  NOT NULL,
    nm_prestador varchar(30)  NOT NULL,
    tel_prestador varchar(15)  NOT NULL,
    email_prestador varchar(50)  NOT NULL,
    dt_nascimento date  NOT NULL,
    cd_endereco int  NOT NULL,
    CONSTRAINT prestador_servico_pk PRIMARY KEY (cd_prestador)
);

-- Table: produto
CREATE TABLE produto (
    cd_produto int  NOT NULL,
    nm_produto varchar(30)  NOT NULL,
    ds_produto varchar(100)  NOT NULL,
    vl_custo decimal(8,2)  NOT NULL,
    vl_venda decimal(8,2)  NOT NULL,
    qt_estoque int  NOT NULL,
    cd_categoria int  NOT NULL,
    CONSTRAINT produto_pk PRIMARY KEY (cd_produto)
);

-- Table: raca_animal
CREATE TABLE raca_animal (
    cd_raca int  NOT NULL,
    tp_raca varchar(30)  NOT NULL,
    CONSTRAINT raca_animal_pk PRIMARY KEY (cd_raca)
);

-- foreign keys
-- Reference: agendamento_bt_animal (table: agendamento_bt)
ALTER TABLE agendamento_bt ADD CONSTRAINT agendamento_bt_animal FOREIGN KEY agendamento_bt_animal (cd_animal)
    REFERENCES animal (cd_animal);

-- Reference: agendamento_bt_prestador_servico (table: agendamento_bt)
ALTER TABLE agendamento_bt ADD CONSTRAINT agendamento_bt_prestador_servico FOREIGN KEY agendamento_bt_prestador_servico (cd_prestador)
    REFERENCES prestador_servico (cd_prestador);

-- Reference: animal_especie_animal (table: animal)
ALTER TABLE animal ADD CONSTRAINT animal_especie_animal FOREIGN KEY animal_especie_animal (cd_especie)
    REFERENCES especie_animal (cd_especie);

-- Reference: cadastro_animal_cliente (table: animal)
ALTER TABLE animal ADD CONSTRAINT cadastro_animal_cliente FOREIGN KEY cadastro_animal_cliente (cd_cliente)
    REFERENCES cliente (cd_cliente);

-- Reference: cadastro_animal_porte_animal (table: animal)
ALTER TABLE animal ADD CONSTRAINT cadastro_animal_porte_animal FOREIGN KEY cadastro_animal_porte_animal (cd_porte)
    REFERENCES porte_animal (cd_porte);

-- Reference: cadastro_animal_raca_animal (table: animal)
ALTER TABLE animal ADD CONSTRAINT cadastro_animal_raca_animal FOREIGN KEY cadastro_animal_raca_animal (cd_raca)
    REFERENCES raca_animal (cd_raca);

-- Reference: cadastro_produto_categoria_produto (table: produto)
ALTER TABLE produto ADD CONSTRAINT cadastro_produto_categoria_produto FOREIGN KEY cadastro_produto_categoria_produto (cd_categoria)
    REFERENCES categoria_produto (cd_categoria);

-- Reference: cliente_endereco (table: cliente)
ALTER TABLE cliente ADD CONSTRAINT cliente_endereco FOREIGN KEY cliente_endereco (cd_endereco)
    REFERENCES endereco (cd_endereco);

-- Reference: endereco_localidade (table: endereco)
ALTER TABLE endereco ADD CONSTRAINT endereco_localidade FOREIGN KEY endereco_localidade (cd_localidade)
    REFERENCES localidade (cd_localidade);

-- Reference: item_pedido_nf_nota_fiscal (table: item_pedido_nf)
ALTER TABLE item_pedido_nf ADD CONSTRAINT item_pedido_nf_nota_fiscal FOREIGN KEY item_pedido_nf_nota_fiscal (cd_nf)
    REFERENCES nota_fiscal (cd_nf);

-- Reference: item_pedido_nf_produto (table: item_pedido_nf)
ALTER TABLE item_pedido_nf ADD CONSTRAINT item_pedido_nf_produto FOREIGN KEY item_pedido_nf_produto (cd_produto)
    REFERENCES produto (cd_produto);

-- Reference: nota_fiscal_cliente (table: nota_fiscal)
ALTER TABLE nota_fiscal ADD CONSTRAINT nota_fiscal_cliente FOREIGN KEY nota_fiscal_cliente (cd_cliente)
    REFERENCES cliente (cd_cliente);

-- Reference: prestador_servico_endereco (table: prestador_servico)
ALTER TABLE prestador_servico ADD CONSTRAINT prestador_servico_endereco FOREIGN KEY prestador_servico_endereco (cd_endereco)
    REFERENCES endereco (cd_endereco);

-- End of file.

