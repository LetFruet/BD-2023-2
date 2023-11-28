-- criando a tabela pessoa
CREATE TABLE pessoa 
(cd_pessoa INTEGER,
nm_pessoa VARCHAR(10),
ds_email VARCHAR(50)
);

-- alterando o estrutura de uma tabela para adicionar o valor default
ALTER TABLE pessoa 
MODIFY COLUMN nm_pessoa VARCHAR(50) DEFAULT 'sem nome';

-- inserindo valores nos campos código e data nasc
INSERT INTO pessoa (cd_pessoa, dt_nascimento) VALUES (2, '2004/09/28');

-- adicionando uma nova coluna 
ALTER TABLE pessoa
ADD COLUMN dt_nascimento DATE;

-- removendo uma coluna da tabela pessoa
ALTER TABLE pessoa
DROP COLUMN ds_email;

DESCRIBE pessoa; -- DESC = DESCRIBRE 

-- alterando o tamanho de uma coluna 
ALTER TABLE pessoa
MODIFY COLUMN nm_pessoa VARCHAR(20);

-- descrevendo / mostrando a estrutura de uma tabela 
DESC pessoa;

-- inserindo um registro na tabela pessoa
INSERT INTO pessoa VALUES (3, 'pessoa 3', 'p3@email.com.br', '2023/10/16');

-- realizando uma busca completa (todos os registros/campos) de pessoa
SELECT * FROM pessoa 