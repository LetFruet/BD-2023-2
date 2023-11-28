-- COPIANDO UMA TABELA 
CREATE TABLE proprietario2 
AS 
SELECT * FROM proprietario 
WHERE 1 = 0; -- PARA NÃO RECEBER AS LINHAS DA TABELA PROPRIETARIO 

INSERT INTO proprietario2
SELECT * 
FROM proprietario 

-- ALTERANDO O VALOR DE TODAS AS LINHAS DE E-MAIL DA TABELA
-- UPDATE proprietario 
-- SET ds_email = 'leticia.com';

-- ALTERANDO O VALOR DE DETERMINADA LINHA
UPDATE proprietario 
SET ds_email = 'leticia.com';
WHERE cd_pessoa = 2;

-- FAZENDO COM QUE NENHUM NÚMERO DE TELEFONE SEJA NULO
ALTER TABLE proprietario 
MODIFY COLUMN nr_telefone VARCHAR(15) NOT NULL 

-- EXCLUINDO UMA LINHA DA TABELA 
DELETE FROM proprietario 
WHERE cd_proprietario = 1;

-- ALTERANDO A TABELA PARA QUE A PK SEJA AUTO-INCREMENTÁVEL
ALTER TABLE proprietario 
MODIFY COLUMN cd_proprietario INTEGER NOT NULL AUTO_INCREMENT;

INSERT INTO proprietario (cd_localidade, nm_proprietario, ds_logradouro, ds_complemento, ds_bairro, nr_telefone, ds_email, sg_uf)
				VALUES (1, 'Leticia', 'Rua Barão do Rio Branco', 'Casa', 'Centro', '(47) 99999-9999', 'leticia.com', 'SC');

CREATE TABLE pessoa (
	nm_pessoa VARCHAR(50),
	ds_email VARCHAR(50),
	dt_nascimento DATE
);
	
-- INSERINDO DADOS NA TABELA ESPECIFICANDO AS COLUNAS
INSERT INTO pessoa (nm_pessoa, ds_email, dt_nascimento)
				VALUES ('Leticia', 'leticia.com', '2004/09/28');
INSERT INTO pessoa (nm_pessoa, ds_email, dt_nascimento)
				VALUES ('Ana Silva', 'ana.com', '1997/03/15');
INSERT INTO pessoa (nm_pessoa, ds_email, dt_nascimento)
				VALUES ('Clara', 'clara.com', '2010/10/10');
INSERT INTO pessoa (nm_pessoa, ds_email, dt_nascimento)
				VALUES ('Alice', 'alice.com', '1965/12/01');
INSERT INTO pessoa (nm_pessoa, ds_email, dt_nascimento)
				VALUES ('Jessica', 'jessica.com', '1976/05/30');

-- SELECIONANDO DADOS PARA SEREM APRESENTADOS 
SELECT * 
FROM modelo 
ORDER BY ds_modelo

SELECT ds_marca
FROM marca 
ORDER BY cd_marca

SELECT nm_proprietario AS "Nome" -- AS para a tabela ser apresnetada como "NOME"
FROM proprietario 
WHERE sg_uf in ('SC', 'PR')

SELECT nm_proprietario
FROM Proprietario
WHERE ds_email is null AND nr_telefone is NOT NULL

SELECT nm_proprietario
FROM proprietario 
WHERE nm_proprietario LIKE "%Silva%"

SELECT *
FROM veiculo 
WHERE nr_ano_fab <> nr_ano_mod

SELECT nr_placa,
		nr_ano_mod, 
		qt_km_rodado,
		qt_portas
FROM veiculo 
WHERE nr_ano_fab >= 2000

SELECT nr_placa
FROM Veiculo
WHERE ds_observacao = ''

SELECT *
FROM veiculo 
WHERE qt_portas >= 4
ORDER BY nr_ano_mod DESC

SELECT *
FROM acessorio 
ORDER BY ds_acessorio

SELECT nr_placa, 
		 nr_ano_fab, 
		 cd_modelo
FROM veiculo 
WHERE nr_ano_fab >= 2015 AND qt_km_rodado < 50000 AND qt_portas >= 4 AND ds_observacao = ''

SELECT nm_proprietario
FROM proprietario 
WHERE ds_bairro LIKE '%Nov_%' AND sg_uf = 'SC'