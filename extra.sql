-- 1. Criação das tabelas com as respectivas colunas e restrições (chave primária - PK e chave estrangeira - FK)

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

-- 2. Criação de sentenças SQL para garantir que unicidade (que seja único) a descrição do gênero e a descrição da censura;

-- ?????????????

-- 3. Inclusão de, no mínimo, 05 (cinco) filmes, 10 (dez) atores associados aos filmes, 03 (três) gêneros distintos e 03 (três) censuras distintas.

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

-- 4. Exibir os nomes de filmes, a descrição da censura, a descrição do gênero e o nome do(s) atores aaociado(s) a cada filme. 
-- O resultado desta questão poderá apresentar linhas repeditas caso apresente mais de um ator associado (diferenciando apenas o nome do ator).
SELECT f.NM_FILME, c.DS_CENSURA, g.DS_GENERO, a.NM_ATOR
FROM filme f JOIN censura c ON (f.CD_CENSURA = c.CD_CENSURA) JOIN genero g ON (f.CD_GENERO, g.CD_GENERO) JOIN FILME_ATOR fa ON (f.CD_FILME = fa.CD_FILME) JOIN ator a ON (fa.CD_ATOR = a.CD_ATOR)

-- 5. Listagem dos nomes dos filmes onde a descrição da censura for igual a “livre”, que sejam dublados, 
-- e a descrição do gênero seja “infantil”, ordenados pela data de lançamento decrescente;
SELECT f.NM_FILME
FROM filme f JOIN CENSURA c ON (f.CD_CENSURA = c.CD_CENSURA) JOIN genero g ON (f.CD_GENERO = g.CD_GENERO) JOIN FILME_ATOR fa ON (f.CD_FILME = fa.CD_FILME)
WHERE c.DS_CENSURA LIKE 'Livre' AND f.FL_DUBLADO LIKE 'S' AND g.DS_GENERO LIKE 'Infantil'
ORDER BY f.dt_lancamento

-- 6. Listagem dos filmes que apresentam (03) três ou mais atores associados;
SELECT f.nm_filme, COUNT(*) AS "Quantidade de atores"
FROM filme_ator fa JOIN filme f ON (f.CD_FILME = fa.CD_FILME)
GROUP BY f.NM_FILME 
HAVING COUNT(*) >= 3

-- 7. Recuperação da quantidade de filme agrupada por cada descrição de censura, ou seja, 
-- mostrar a descrição da censura e quantos filmes cada uma apresenta;
SELECT g.DS_GENERO AS "genero", COUNT(*) AS "qtde filmes"
FROM filme f JOIN genero g ON (f.CD_GENERO = g.CD_GENERO)
GROUP BY DS_GENERO