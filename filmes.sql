-- criação das tabelas

CREATE TABLE GENERO
(CD_GENERO INTEGER,
 DS_GENERO VARCHAR(30),
 PRIMARY KEY (CD_GENERO)
);

CREATE TABLE ATOR
(CD_ATOR INTEGER,
 NM_ATOR VARCHAR(50),
 PRIMARY KEY (CD_ATOR)
);

CREATE TABLE CENSURA
(CD_CENSURA INTEGER,
 DS_CENSURA VARCHAR(30),
 PRIMARY KEY(CD_CENSURA)
);

CREATE TABLE FILME
(CD_FILME INTEGER,
 CD_CENSURA INTEGER,
 CD_GENERO INTEGER,
 NM_FILME VARCHAR(50),
 DS_SINOPSE VARCHAR(250),
 NR_DURACAO VARCHAR(20),
 DT_LANCAMENTO DATE,
 FL_DUBLADO CHAR(1),
 PRIMARY KEY(CD_FILME)
);

CREATE TABLE FILME_ATOR
(CD_FILME INTEGER,
 CD_ATOR INTEGER,
 PRIMARY KEY(CD_FILME, CD_ATOR)
);

-- adicionando as FKs

ALTER TABLE FILME_ATOR
ADD FOREIGN KEY (CD_FILME) REFERENCES FILME (CD_FILME);

ALTER TABLE FILME_ATOR
ADD FOREIGN KEY (CD_ATOR) REFERENCES ATOR (CD_ATOR);

ALTER TABLE FILME
ADD FOREIGN KEY (CD_CENSURA) REFERENCES CENSURA (CD_CENSURA);

ALTER TABLE FILME
ADD FOREIGN KEY (CD_GENERO) REFERENCES GENERO (CD_GENERO);

-- adicionando regras de unicidade

ALTER TABLE FILME
MODIFY COLUMN NM_FILME VARCHAR(50) UNIQUE;

ALTER TABLE ATOR
ADD CONSTRAINT ATOR_NM_ATOR_UK UNIQUE(NM_ATOR);

-- povoamento das tabelas

INSERT INTO GENERO (CD_GENERO, DS_GENERO) VALUES (1, "Ação");
INSERT INTO GENERO VALUES (2, "Terror");
INSERT INTO GENERO VALUES (3, "Comédia");
INSERT INTO GENERO VALUES (4, "Policial");

INSERT INTO CENSURA (CD_CENSURA, DS_CENSURA) VALUES (1, "Livre");
INSERT INTO CENSURA VALUES (2, "12 anos");
INSERT INTO CENSURA VALUES (3, "18 anos");

INSERT INTO ATOR (CD_ATOR, NM_ATOR) VALUES (1, "Nicolas Cage");
INSERT INTO ATORVALUES (2, "Tom Cruise");
INSERT INTO ATOR VALUES (3, "Keanu Reeves");
INSERT INTO ATOR VALUES (4, "Jennifer Lopes");
INSERT INTO ATOR VALUES (5, "Sandra Bullock");
INSERT INTO ATOR VALUES (6, "Angelina Jolie");
INSERT INTO ATOR VALUES (7, "Antônio Banderas");
INSERT INTO ATOR VALUES (8, "Zoê Saldanã");

INSERT INTO FILME (CD_FILME,CD_CENSURA,CD_GENERO,NM_FILME,DS_SINOPSE,NR_DURACAO,DT_LANCAMENTO, FL_DUBLADO)
            VALUES(1,1,1,"Filme 1","Sinopse do Filme 1","2h 10min","2022/10/30","S");
INSERT INTO FILME VALUES(2,2,2,"Filme 2","Sinopse do Filme 2","1h 50min","2021/07/30","N");
INSERT INTO FILME VALUES(3,3,3,"Filme 3","Sinopse do Filme 3","1h 45min","2020/04/06","S");    
INSERT INTO FILME VALUES(4,2,2,"Filme 4","Sinopse do Filme 4","1h 37min","2021/08/27","S");
INSERT INTO FILME VALUES(5,2,4,"Filme 5","Sinopse do Filme 5","2h","2023/01/24","N");

INSERT INTO FILME_ATOR (CD_FILME, CD_ATOR) VALUES (1,1);
INSERT INTO FILME_ATOR VALUES (1,2);
INSERT INTO FILME_ATOR VALUES (1,3);
INSERT INTO FILME_ATOR VALUES (2,4);
INSERT INTO FILME_ATOR VALUES (2,5);
INSERT INTO FILME_ATOR VALUES (3,1);
INSERT INTO FILME_ATOR VALUES (3,3);
INSERT INTO FILME_ATOR VALUES (4,6);
INSERT INTO FILME_ATOR VALUES (5,2);
INSERT INTO FILME_ATOR VALUES (5,4);
INSERT INTO FILME_ATOR VALUES (5,6);

-- listando todos os filmes da base 
-- SELECT COUNT(*)
-- OU --
SELECT COUNT(cd_filme)
FROM filme 

-- quando passamos como parametro uma coluna, ele nao contabiliza o que é null, mas contabiliza campos em branco
SELECT COUNT(*) AS "Total", COUNT(fl_dublado) AS "Dublados"
FROM filme 

-- listando a quantidade de atores de cada filme 
SELECT f.nm_filme, COUNT(*) AS "Quantidade de atores"
FROM filme_ator fa JOIN filme f ON (f.CD_FILME = fa.CD_FILME)
-- FROM filme_ator fa, filme f
-- WHERE f.CD_FILME = fa.CD_FILME 
GROUP BY f.NM_FILME 

-- listando os filmes que possuem 3 ou mais atores
SELECT f.nm_filme, COUNT(*) AS "Quantidade de atores"
FROM filme_ator fa JOIN filme f ON (f.CD_FILME = fa.CD_FILME)
GROUP BY f.NM_FILME 
HAVING COUNT(*) >= 3

-- exemplo utilizando COUNT, SUM e AVG
SELECT COUNT(CD_FILME) "qtde filmes",
		 SUM(CD_FILME) "soma dos códigos dos filmes",
		 AVG(CD_FILME) "média dos códigos somados"
FROM filme 

-- exemplo utilizando MIN e MAX
SELECT MIN(DT_LANCAMENTO), MAX(DT_LANCAMENTO),
		 MIN(NM_FILME), MAX(CD_GENERO)
FROM filme

-- listando a descrição da sensura com a quantidade de filmes de cada uma
SELECT c.DS_CENSURA AS "censura", COUNT(*) AS "qtde filmes"
FROM filme f JOIN censura c ON (f.CD_CENSURA = c.CD_CENSURA)
GROUP BY DS_CENSURA

-- listando a descrição do genero com a quantidade de filmes de cada um
SELECT g.DS_GENERO AS "genero", COUNT(*) AS "qtde filmes"
FROM filme f JOIN genero g ON (f.CD_GENERO = g.CD_GENERO)
GROUP BY DS_GENERO




-- =========== EXEMPLOS DE SUBCONSULTAS =========== 

-- listando atores que não estão dentro (in) do segundo select
SELECT a.NM_ATOR
FROM ator a 
WHERE a.CD_ATOR NOT IN (SELECT fa.CD_ATOR
								FROM filme_ator fa)
								
SELECT nm_filme, dt_lancamento
FROM filme 
WHERE dt_lancamento > (SELECT dt_lancamento FROM filme 
							  WHERE cd_filme =2)               -- retorna apenas 1 valor
							  
SELECT nm_filme, dt_lancamento
FROM filme 
WHERE dt_lancamento ANY (SELECT dt_lancamento FROM filme 
							  WHERE nm_filme LIKE "Filme%")    -- retorna uma lista de valores
							  
SELECT *
FROM filme 
ORDER BY dt_lancamento DESC -- rertorna apenas 1 filme mais atual

SELECT * 
FROM filme            -- subconsulta
WHERE dt_lancamento = (SELECT MAX(dt_lancamento) 
							  FROM filme)

