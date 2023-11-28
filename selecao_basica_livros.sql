
-- a) Criar as tabelas com as respectivas restrições de PK (chave primária) e FK (chave estrangeria);
-- b) Criar uma regra (restrição) para não permitir que seja cadastrado nomes de autores idênticos (dica: unique key)
-- c) Inserir registros das tabelas (mínimo): 10 autores, 03 tipos de obras, 05 editoras e 10 obras sendo que algumas das obras devem apresentar mais de um autor;
-- d) Listar os dados das obras (título, data de publicação, nome da editora e descrição do tipo da obra);
-- e) Listar o título da(s) obra(s) do tipo "livro" e que foram publicados no ano de 2022;
-- f) Listar o título da(s) obra(s), com o respectivo nome da editora, que não apresenta informação sobre a edição (ds_edicao).
			
CREATE TABLE autor (
	cd_autor INTEGER,
	nm_autor VARCHAR(100),
	PRIMARY KEY (cd_autor),
	UNIQUE KEY (nm_autor)
);

INSERT INTO autor VALUES (1, 'Machado de Assia');
INSERT INTO autor VALUES (2, 'Clarice Lispector');
INSERT INTO autor VALUES (3, 'Carlos Drummond de Andrade');
INSERT INTO autor VALUES (4, 'William Shakespeare');
INSERT INTO autor VALUES (5, 'Agatha Christie');
INSERT INTO autor VALUES (6, 'Dan Brown');
INSERT INTO autor VALUES (7, 'Jane Austen');
INSERT INTO autor VALUES (8, 'Olavo Bilac');
INSERT INTO autor VALUES (9, 'Monteiro Lobato');
INSERT INTO autor VALUES (10, 'Ziraldo');
			
CREATE TABLE obra (
	cd_obra INTEGER,
	nm_titulo VARCHAR(100),
	ds_edicao VARCHAR(20),
	dt_publicacao DATE,
	ds_sinopse VARCHAR(255),
	tp_obra INTEGER,
	cd_editora INTEGER,
	PRIMARY KEY (cd_obra),
	FOREIGN KEY (tp_obra)
	REFERENCES tipo_obra (tp_obra),
	FOREIGN KEY (cd_editora)
	REFERENCES editora (cd_editora)
);

INSERT INTO obra VALUES (1, 'Dom Casmurro', 'Primeira edição', '1899/12/05', 'Conta a história de Bentinho, apelidado de Dom Casmurro por ser calado e
							 		  	introvertido. Na adolescência, apaixona-se por Capítu, abandonando o seminário e, os desígnios traçados por sua mãe, para
									 	que se tornasse padre', 1, 1);
INSERT INTO obra VALUES (2, 'Laços de Família', 'Primeira edição', '1960/01/01', 'Após passar um longo período no Afeganistão, uma médica do exército 
										dos Estados Unidos se esforça para reconstruir o relacionamento com seu filho', 4, 2);
INSERT INTO obra VALUES (3, 'Alguma Poesia', 'Primeira edição', '1930/01/01', '49 poemas que falam da sua relação com o espaço, seja o espaço provinciano,
										do interior de Minas, do Brasil como um todo. O amor é um tema frequente a metalinguagem, a reflexão sobre o próprio fazer
										poético, sobre a escrita', 5, 3);
INSERT INTO obra VALUES (4, 'Romeu e Julieta', 'Primeira edição', '1597/01/01', 'Há muito tempo duas famílias ensanguentam as ruas de Verona. Enquanto
										isso, Romeu, filho dos Montéquio, e Julieta, herdeira dos Capuleto, desafiam a familia e sonham com um futuro longe da
										violência e da loucura', 1, 4);
INSERT INTO obra VALUES (5, 'E Não Sobrou Nenhum', 'Primeira edição', '1939/01/01', 'Na ilha do Soldado, antiga propriedade de um milionário norte-
										americano, dez pessoas sem nenhuma ligação aparente são confrontadas por uma voz misteriosa com fatos marcantes de seus 
										passados', 1, 5);
INSERT INTO obra VALUES (6, 'A Origem', 'Segunda edição', '2017/10/03', 'Percorrendo os corredores de história e religião oculta, Langdon e Vidal têm de 
							 			fugir de um inimigo que parece tudo saber e de alguma forma relacionado com o Palácio Real de Espanha... e que fará de tudo  
										para silenciar Kirsch', 2, 1);
INSERT INTO obra VALUES (7, 'Orgulho e Preconceito', 'Primeira edição', '1813/01/28', 'Elizabeth é uma das filhas da família Bennet. Sem nenhum homem
										como herdeiro, a perspectiva da família é ver a propriedade herdada pwlo primo clérigo, o que, para os padrões, significava 
										que as moças precisavam se casar', 1, 2);				
INSERT INTO obra (cd_obra, nm_titulo,dt_publicacao, ds_sinopse, tp_obra, cd_editora)
			 	VALUES (8, 'Antologia Poética', '1962/01/01', 'Reúne cerca de 30 poemas de Olavo Bilac. A ideia é mostrar Bilac parnasiano na forma, embora 
							 			romântico  no conteúdo. Podemos destacar, neste contexto, “Via Láctea”, poema composto por 35 sonetos', 5, 3);
INSERT INTO obra VALUES (9, 'O Picapau Amarelo', 'Primeira edição', '1939/01/01', 'Os personagens decidem se mudar para o sítio e Dona Benta precisa
										de um plano para que todo mundo tenha o seu espaço. E para comprar as terras vizinhas, conta com a astúcia de Emília e a 
									 engenhosidade do Visconde', 3, 4);
INSERT INTO obra (cd_obra, nm_titulo,dt_publicacao, ds_sinopse, tp_obra, cd_editora)
				VALUES (10, 'O Menino Mauquinho', '1980/01/01', 'No final dos anos 1960, o Menino Maluquinho é um garoto normal, feliz e bem cuidado por 
							 			sua família que, enquanto aproveita a infância brincando na rua com a turma, observa o mundo que o cerca e aprende a lidar 
										com a vida', 2, 5);

CREATE TABLE obra_autor (
	cd_autor INTEGER,
	cd_obra INTEGER,
	PRIMARY KEY (cd_autor, cd_obra),
	FOREIGN KEY (cd_autor)
	REFERENCES autor (cd_autor),
	FOREIGN KEY (cd_obra)
	REFERENCES obra (cd_obra)
);

INSERT INTO obra_autor VALUES (1, 1);
INSERT INTO obra_autor VALUES (2, 2);
INSERT INTO obra_autor VALUES (3, 3);
INSERT INTO obra_autor VALUES (4, 4);
INSERT INTO obra_autor VALUES (5, 5);
INSERT INTO obra_autor VALUES (6, 6);
INSERT INTO obra_autor VALUES (7, 7);
INSERT INTO obra_autor VALUES (8, 8);
INSERT INTO obra_autor VALUES (9, 9);
INSERT INTO obra_autor VALUES (10, 10);

CREATE TABLE editora (
	cd_editora INTEGER,
	nm_editora VARCHAR(100),
	PRIMARY KEY (cd_editora)
);

INSERT INTO editora VALUES (1, 'Editora Arqueiro');
INSERT INTO editora VALUES (2, 'Editora Rocco');
INSERT INTO editora VALUES (3, 'Editora Sextante');
INSERT INTO editora VALUES (4, 'Companhia da Letras');
INSERT INTO editora VALUES (5, 'Oxford University Press');
INSERT INTO editora VALUES (6, 'Editora FTD');
INSERT INTO editora VALUES (7, 'Editora  Bloomsbury');
INSERT INTO editora VALUES (8, 'Editora Sextante');
INSERT INTO editora VALUES (9, 'Editora Aleph');
INSERT INTO editora VALUES (10, 'Editora Intrinseca');

CREATE TABLE tipo_obra (
	tp_obra INTEGER,
	ds_tipo VARCHAR(30),
	PRIMARY KEY (tp_obra)
);

INSERT INTO tipo_obra VALUES (1, 'Livro');
INSERT INTO tipo_obra VALUES (2, 'Gibi');
INSERT INTO tipo_obra VALUES (3, 'Filme');
INSERT INTO tipo_obra VALUES (4, 'Coleção');
INSERT INTO tipo_obra VALUES (5, 'Revista');

SELECT o.nm_titulo, o.dt_publicacao, o.cd_editora, o.tp_obra
FROM obra o

SELECT o.nm_titulo
FROM obra o 
WHERE o.tp_obra = 'livro' AND dt_publicacao = 2022

SELECT nm_titulo, cd_editora
FROM obra o
WHERE ds_edicao IS NULL 