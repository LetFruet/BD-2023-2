CREATE TABLE Combustivel (
	cd_combustivel INTEGER,
	ds_combustivel varchar(30)
);

-- cajo haja duplicidade no valor, ocorrerá um erro em combustivel_pk
ALTER TABLE Combustivel 
ADD CONSTRAINT combustivel_pk PRIMARY KEY (cd_combustivel); 

CREATE TABLE Veiculo_Combustivel (
	cd_combustivel INTEGER,
	nr_placa char(7)
);

ALTER TABLE Veiculo_Combustivel
ADD CONSTRAINT veiculo_combustivel_pk PRIMARY KEY (cd_combustivel, nr_placa); 

ALTER TABLE Veiculo_Combustivel
	ADD FOREIGN KEY (cd_combustivel)
	REFERENCES Combustivel (cd_combustivel),
	ADD FOREIGN KEY (nr_placa)
	REFERENCES Veiculo (nr_placa);
	
CREATE TABLE Marca (
	cd_marca INTEGER,
	ds_marca varchar(30)
);

ALTER TABLE Marca
ADD CONSTRAINT marca_pk PRIMARY KEY (cd_marca);

CREATE TABLE Veiculo (
	nr_placa char(7),
	cd_proprietario INTEGER,
	cd_modelo INTEGER,
	nr_ano_fab INTEGER,
	nr_ano_mod INTEGER,
	qt_km_rodado INTEGER,
	qt_portas INTEGER,
	ds_observacao varchar(100)
);

ALTER TABLE Veiculo
ADD CONSTRAINT veiculo_pk PRIMARY KEY (nr_placa);

ALTER TABLE veiculo
ADD COLUMN cd_cor INTEGER;

ALTER TABLE Veiculo
	ADD FOREIGN KEY (cd_proprietario)
	REFERENCES Proprietario (cd_proprietario),
	ADD FOREIGN KEY (cd_modelo)
	REFERENCES Modelo (cd_modelo),
	ADD FOREIGN KEY (cd_cor)
	REFERENCES Cor (cd_cor);

CREATE TABLE Localidade (
	cd_localidade INTEGER,
	nm_localidade varchar(50)
);

ALTER TABLE Localidade
ADD CONSTRAINT localidade_pk PRIMARY KEY (cd_localidade);

CREATE TABLE Modelo (
	cd_modelo INTEGER,
	cd_marca INTEGER,
	ds_modelo varchar(50)
);

ALTER TABLE Modelo
ADD CONSTRAINT modelo_pk PRIMARY KEY (cd_modelo);

ALTER TABLE Modelo
ADD CONSTRAINT modelo_marca_fk
	FOREIGN KEY (cd_marca)
	REFERENCES marca (cd_marca);

CREATE TABLE Proprietario (
	cd_proprietario INTEGER,
	cd_localidade INTEGER,
	nm_proprietario varchar(50),
	ds_logradouro varchar(50),
	ds_complemento varchar(50),
	ds_bairro varchar(50),
	nr_telefone varchar(15),
	ds_email varchar(50),
	sg_uf char(2)
);

ALTER TABLE Proprietario
ADD CONSTRAINT proprietario_pk PRIMARY KEY (cd_proprietario);

-- aponta para a coluna cd_localidade, na tabela localidade
ALTER TABLE Proprietario
ADD CONSTRAINT proprietario_localidade_fk -- nome da tabela e tabela referência
	FOREIGN KEY (cd_localidade)
	REFERENCES Localidade (cd_localidade);
	
CREATE TABLE Cor (
	cd_cor INTEGER,
	ds_cor VARCHAR(30),
	PRIMARY KEY (cd_cor) -- usa-se quando há mais de uma pk
);

CREATE TABLE Acessorio ( 
	cd_acessorio INTEGER PRIMARY KEY, -- usa-se quando há apenas uma pk
	ds_acessorio VARCHAR(50)
);

CREATE TABLE Veiculo_Acessorio (
	nr_placa CHAR(7),
	cd_acessorio INTEGER,
	PRIMARY KEY (nr_placa, cd_acessorio)
);

ALTER TABLE Veiculo_Acessorio
	ADD FOREIGN KEY (nr_placa)
	REFERENCES Veiculo (nr_placa),
	ADD FOREIGN KEY (cd_acessorio)
	REFERENCES Acessorio (cd_acessorio);	