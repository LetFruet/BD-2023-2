-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2023-10-02 14:03:57.271

-- tablessala
-- Table: Categoria
CREATE TABLE Categoria (
    cd_categoria int  NOT NULL,
    ds_categoria varchar(50)  NOT NULL,
    CONSTRAINT Categoria_pk PRIMARY KEY (cd_categoria)
);

-- Table: Equipamentos
CREATE TABLE Equipamentos (
    id_equipamentos char(8)  NOT NULL,
    nm_equipamentos varchar(50)  NOT NULL,
    ds_equipamentos varchar(50)  NOT NULL,
    dt_aquisicao date  NOT NULL,
    ds_configuracao varchar(100)  NOT NULL,
    Sala_nr_sala int  NOT NULL,
    cd_tipo_equipamento int  NOT NULL,
    CONSTRAINT Equipamentos_pk PRIMARY KEY (id_equipamentos)
);

-- Table: Equipamentos_Software
CREATE TABLE Equipamentos_Software (
    id_equipamentos char(8)  NOT NULL,
    cd_softwar int  NOT NULL,
    CONSTRAINT Equipamentos_Software_pk PRIMARY KEY (id_equipamentos,cd_softwar)
);

-- Table: Sala
CREATE TABLE Sala (
    nr_sala int  NOT NULL,
    nm_sala varchar(50)  NOT NULL,
    qt_pessoas int  NOT NULL,
    nr_metragem decimal(4,1)  NOT NULL,
    CONSTRAINT Sala_pk PRIMARY KEY (nr_sala)
);

-- Table: Software
CREATE TABLE Software (
    cd_softwar int  NOT NULL,
    nm_software varchar(50)  NOT NULL,
    ds_software varchar(50)  NOT NULL,
    cd_categoria int  NOT NULL,
    CONSTRAINT Software_pk PRIMARY KEY (cd_softwar)
);

-- Table: TipoEquipamento
CREATE TABLE TipoEquipamento (
    cd_tipo_equipamento int  NOT NULL,
    nm_tipo_equipamento varchar(50)  NOT NULL,
    CONSTRAINT TipoEquipamento_pk PRIMARY KEY (cd_tipo_equipamento)
);

-- foreign keys
-- Reference: Equipamentos_Sala (table: Equipamentos)
ALTER TABLE Equipamentos ADD CONSTRAINT Equipamentos_Sala FOREIGN KEY Equipamentos_Sala (Sala_nr_sala)
    REFERENCES Sala (nr_sala);

-- Reference: Equipamentos_Software_Equipamentos (table: Equipamentos_Software)
ALTER TABLE Equipamentos_Software ADD CONSTRAINT Equipamentos_Software_Equipamentos FOREIGN KEY Equipamentos_Software_Equipamentos (id_equipamentos)
    REFERENCES Equipamentos (id_equipamentos);

-- Reference: Equipamentos_Software_Software (table: Equipamentos_Software)
ALTER TABLE Equipamentos_Software ADD CONSTRAINT Equipamentos_Software_Software FOREIGN KEY Equipamentos_Software_Software (cd_softwar)
    REFERENCES Software (cd_softwar);

-- Reference: Equipamentos_TipoEquipamento (table: Equipamentos)
ALTER TABLE Equipamentos ADD CONSTRAINT Equipamentos_TipoEquipamento FOREIGN KEY Equipamentos_TipoEquipamento (cd_tipo_equipamento)
    REFERENCES TipoEquipamento (cd_tipo_equipamento);

-- Reference: Software_Categoria (table: Software)
ALTER TABLE Software ADD CONSTRAINT Software_Categoria FOREIGN KEY Software_Categoria (cd_categoria)
    REFERENCES Categoria (cd_categoria);

-- End of file.

