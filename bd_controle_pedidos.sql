-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-02 14:04:27.328

-- tables
-- Table: Categoria
CREATE TABLE Categoria (
    cd_categoria int  NOT NULL,
    nm_categoria varchar(50)  NOT NULL,
    CONSTRAINT Categoria_pk PRIMARY KEY (cd_categoria)
);

-- Table: Cliente
CREATE TABLE Cliente (
    cd_cliente int  NOT NULL,
    nm_cliente varchar(50)  NOT NULL,
    tel_cliente varchar(50)  NOT NULL,
    email_cliente varchar(50)  NOT NULL,
    lmt_credito_cliente decimal(8,2)  NOT NULL,
    CONSTRAINT Cliente_pk PRIMARY KEY (cd_cliente)
);

-- Table: Endereco
CREATE TABLE Endereco (
    nr_endereco int  NOT NULL,
    nr_cep int  NOT NULL,
    ds_complemento varchar(50)  NOT NULL,
    nm_bairro varchar(50)  NOT NULL,
    nr_localidade int  NOT NULL,
    tp_logradouro varchar(30)  NOT NULL,
    cd_cliente int  NOT NULL,
    CONSTRAINT Endereco_pk PRIMARY KEY (nr_endereco)
);

-- Table: Item_Pedido
CREATE TABLE Item_Pedido (
    Pedido_nr_pedido int  NOT NULL,
    Produto_cd_produto int  NOT NULL,
    qt_vendida int  NOT NULL,
    vl_produto decimal(8,2)  NOT NULL,
    CONSTRAINT Item_Pedido_pk PRIMARY KEY (Pedido_nr_pedido,Produto_cd_produto)
);

-- Table: Localidade
CREATE TABLE Localidade (
    nr_localidade int  NOT NULL,
    nm_localidade varchar(50)  NOT NULL,
    uf_localidade char(2)  NOT NULL,
    CONSTRAINT Localidade_pk PRIMARY KEY (nr_localidade)
);

-- Table: Pedido
CREATE TABLE Pedido (
    nr_pedido int  NOT NULL,
    dt_emissao date  NOT NULL,
    vlr_total_pedido decimal(8,2)  NOT NULL,
    cd_cliente int  NOT NULL,
    CONSTRAINT Pedido_pk PRIMARY KEY (nr_pedido)
);

-- Table: Produto
CREATE TABLE Produto (
    cd_produto int  NOT NULL,
    ds_produto varchar(50)  NOT NULL,
    qt_estoque int  NOT NULL,
    vlr_produto decimal(8,2)  NOT NULL,
    cd_categoria int  NOT NULL,
    CONSTRAINT Produto_pk PRIMARY KEY (cd_produto)
);

-- foreign keys
-- Reference: Endereco_Cliente_Cliente (table: Endereco)
ALTER TABLE Endereco ADD CONSTRAINT Endereco_Cliente_Cliente FOREIGN KEY Endereco_Cliente_Cliente (cd_cliente)
    REFERENCES Cliente (cd_cliente);

-- Reference: Endereco_Cliente_Localidade (table: Endereco)
ALTER TABLE Endereco ADD CONSTRAINT Endereco_Cliente_Localidade FOREIGN KEY Endereco_Cliente_Localidade (nr_localidade)
    REFERENCES Localidade (nr_localidade);

-- Reference: Item_Pedido_Pedido (table: Item_Pedido)
ALTER TABLE Item_Pedido ADD CONSTRAINT Item_Pedido_Pedido FOREIGN KEY Item_Pedido_Pedido (Pedido_nr_pedido)
    REFERENCES Pedido (nr_pedido);

-- Reference: Item_Pedido_Produto (table: Item_Pedido)
ALTER TABLE Item_Pedido ADD CONSTRAINT Item_Pedido_Produto FOREIGN KEY Item_Pedido_Produto (Produto_cd_produto)
    REFERENCES Produto (cd_produto);

-- Reference: Pedido_Cliente (table: Pedido)
ALTER TABLE Pedido ADD CONSTRAINT Pedido_Cliente FOREIGN KEY Pedido_Cliente (cd_cliente)
    REFERENCES Cliente (cd_cliente);

-- Reference: Produto_Categoria (table: Produto)
ALTER TABLE Produto ADD CONSTRAINT Produto_Categoria FOREIGN KEY Produto_Categoria (cd_categoria)
    REFERENCES Categoria (cd_categoria);

-- End of file.

