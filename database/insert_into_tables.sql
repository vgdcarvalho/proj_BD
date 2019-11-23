/*
SCRIPT PARA INSERÇÂO DE TUPLAS AO BANCO DE DADOS

Disciplina: SCC-240 - Base de Dados (2019/2)
Projeto: Game XP
Foco: Gerenciamento de competição de cosplay
Alunos:
	Luiz Guilherme Martins Adorno - 10392171
	Murilo Kazumi de Freitas - 10818988
	Vinícius Gonçalves de Carvalho - 8517157
*/

-- Tabela PALCO 
-- Adicionando palcos, sendo dois no mesmo setor, outro em um setor diferente e o último sem setor definido
INSERT INTO PALCO (NUMERO, SETOR)
VALUES (1, 'A-1');

INSERT INTO PALCO (NUMERO, SETOR)
VALUES (2, 'A-1');

INSERT INTO PALCO (NUMERO, SETOR)
VALUES (3, 'A-2');

INSERT INTO PALCO (NUMERO)
VALUES (4);

-- Tabela COMPETIDOR
-- 	Adicionando competidores dos dois tipos e um sem tipo, para que o valor default seja utilizado (SOLO)
INSERT INTO COMPETIDOR (INSCRICAO, TIPO, NRO_PONTOS, PALCO)
VALUES (1, 'SOLO', 0, 3);

INSERT INTO COMPETIDOR (INSCRICAO, TIPO, NRO_PONTOS, PALCO)
VALUES (2, 'GRUPO', 0, 2);

INSERT INTO COMPETIDOR (INSCRICAO, NRO_PONTOS, PALCO)
VALUES (3, 10, 4);

INSERT INTO COMPETIDOR (INSCRICAO, TIPO, NRO_PONTOS, PALCO)
VALUES (4, 'GRUPO', 10, 2);

-- Tabela GRUPO
-- 	Dois grupos inseridos, um com 5 e outro com 6 pessoas
INSERT INTO GRUPO (INSCRICAO, QTD_PESSOAS)
VALUES (2, 5);

INSERT INTO GRUPO (INSCRICAO, QTD_PESSOAS)
VALUES (4, 6);

-- Tabela COSPLAYER 
-- 	Inseridos cosplayers para os dois grupos existentes e dois cosplayers solo. Além disso há um cosplayer inserido aqui que não se torna um competidor.
INSERT INTO COSPLAYER (CPF, NOME, NOME_PERSONAGEM, ORIGEM_PERSONAGEM, TELEFONE, NRO_VOTOS, ENDERECO, GRUPO)
VALUES (123456, 'Alberto Caeiro', 'Naruto', 'Aldeia da Folha', '(11)3356-9844', 10, 'Rua dos Cosplayers, 42', 2);

INSERT INTO COSPLAYER (CPF, NOME, NOME_PERSONAGEM, ORIGEM_PERSONAGEM, TELEFONE, NRO_VOTOS, ENDERECO, GRUPO)
VALUES (123457, 'Alvaro Campos', 'Sakura', 'Aldeia da Folha', '(11)3356-9845', 10, 'Rua da Flor de Cerejeira, 13', 2);

INSERT INTO COSPLAYER (CPF, NOME, NOME_PERSONAGEM, ORIGEM_PERSONAGEM, TELEFONE, NRO_VOTOS, ENDERECO)
VALUES (123458, 'Ricardo Reis', 'Goku', 'Planeta Vegeta', '(11)3356-9846', 49, 'Avenida Vegeta, 10');

INSERT INTO COSPLAYER (CPF, NOME, NOME_PERSONAGEM, ORIGEM_PERSONAGEM, TELEFONE, NRO_VOTOS, ENDERECO, GRUPO)
VALUES (123459, 'Bernardo de Campos', 'Sasuke', 'Aldeia da Folha', '(11)3356-9830', 10, 'Rua dos Uchiha, 01', 2);

INSERT INTO COSPLAYER (CPF, NOME, NOME_PERSONAGEM, ORIGEM_PERSONAGEM, TELEFONE, NRO_VOTOS, ENDERECO, GRUPO)
VALUES (123460, 'Fernando Pessoa', 'Gaara', 'Aldeia da Areia', '(11)3356-9831', 10, 'Rua da Areia, 45', 2);

INSERT INTO COSPLAYER (CPF, NOME, NOME_PERSONAGEM, ORIGEM_PERSONAGEM, TELEFONE, NRO_VOTOS, ENDERECO, GRUPO)
VALUES (123461, 'Bruce Lee', 'Rock Lee', 'Aldeia da Folha', '(11)3356-9832', 10, 'Rua dos Lutadores, 70', 2);

INSERT INTO COSPLAYER (CPF, NOME, NOME_PERSONAGEM, ORIGEM_PERSONAGEM, TELEFONE, NRO_VOTOS, ENDERECO, GRUPO)
VALUES (123462, 'Albertina Ramos', 'Bulma', 'Planeta Terra', '(11)3356-9820', 15, 'Rua dos Cosplayers, 30', 4);

INSERT INTO COSPLAYER (CPF, NOME, NOME_PERSONAGEM, ORIGEM_PERSONAGEM, TELEFONE, NRO_VOTOS, ENDERECO, GRUPO)
VALUES (123463, 'Luiza da Silva', 'Chichi', 'Canadá', '(11)3356-9821', 15, 'Rua da Flor de Cerejeira, 19', 4);

INSERT INTO COSPLAYER (CPF, NOME, NOME_PERSONAGEM, ORIGEM_PERSONAGEM, TELEFONE, NRO_VOTOS, ENDERECO, GRUPO)
VALUES (123464, 'Júlia Almeida', 'Andoid 18', 'Garagem do Dr. Gero', '(11)3356-9818', 15, 'Rua do Kuririn, 18', 4);

INSERT INTO COSPLAYER (CPF, NOME, NOME_PERSONAGEM, ORIGEM_PERSONAGEM, TELEFONE, NRO_VOTOS, ENDERECO, GRUPO)
VALUES (123465, 'Vin Diesel', 'Kuririn', 'China', '(11)3356-9825', 15, 'Rua do do Kuririn, 18', 4);

INSERT INTO COSPLAYER (CPF, NOME, NOME_PERSONAGEM, ORIGEM_PERSONAGEM, TELEFONE, NRO_VOTOS, ENDERECO, GRUPO)
VALUES (123466, 'Jim Careey', 'Vegeta', 'Planeta Vegeta', '(11)3356-9811', 15, 'Rua da Casa Dele, 51', 4);

INSERT INTO COSPLAYER (CPF, NOME, NOME_PERSONAGEM, ORIGEM_PERSONAGEM, TELEFONE, NRO_VOTOS, ENDERECO, GRUPO)
VALUES (123467, 'José da Silva', 'Piccolo', 'Namekusei', '(11)3356-9815	', 15, 'Rua dos Lutadores, 71', 4);

INSERT INTO COSPLAYER (CPF, NOME, NOME_PERSONAGEM, ORIGEM_PERSONAGEM, TELEFONE, NRO_VOTOS, ENDERECO)
VALUES (123468, 'Marquito Marques', 'Saitama', 'Japão', '(11)3356-9806', 99, 'Avenida dos Monstros, 100');

INSERT INTO COSPLAYER (CPF, NOME, NOME_PERSONAGEM, ORIGEM_PERSONAGEM, TELEFONE, NRO_VOTOS, ENDERECO)
VALUES (123469, 'Gustavo Lima', 'Ichigo', 'Japão', '(11)3356-9807', 0, 'Avenida dos Espíritos, 12');

-- Tabela VOTANTE 
-- 	Inseridos votantes para cosplayers dos dois grupos e para os dois cosplayers solo
INSERT INTO VOTANTE (CPF, EMAIL, COSPLAYER)
VALUES (112233, 'lukinha_18463@hotmail.com', 123468); 

INSERT INTO VOTANTE (CPF, EMAIL, COSPLAYER)
VALUES (122331, 'dudinha_gatina_197361@yahoo.com.br', 123458); 

INSERT INTO VOTANTE (CPF, EMAIL, COSPLAYER)
VALUES (223311, 'naldinho_sk8_69@hotmail.com', 123461); 

INSERT INTO VOTANTE (CPF, EMAIL, COSPLAYER)
VALUES (233112, 'bill_gates@gmail.com', 123467); 

-- Tabela SOLO 
-- 	Inserindo os dois competidores solo
INSERT INTO SOLO (INSCRICAO, COSPLAYER)
VALUES (1, 123458);

INSERT INTO SOLO (INSCRICAO, COSPLAYER)
VALUES (3, 123468);

-- Tabela CAMARIM
-- 	Inserindo camarins
INSERT INTO CAMARIM (NUMERO, SETOR)
VALUES (1, 'A-1');

INSERT INTO CAMARIM (NUMERO, SETOR)
VALUES (2, 'A-1');

INSERT INTO CAMARIM (NUMERO, SETOR)
VALUES (3, 'A-2');

INSERT INTO CAMARIM (NUMERO, SETOR)
VALUES (4, 'C-4');

-- Tabela UTILIZA 
-- 	Inserindo alocações de camarins para competidores
INSERT INTO UTILIZA (COMPETIDOR, CAMARIM, QTD_PESSOAS)
VALUES (1, 3, 1);

INSERT INTO UTILIZA (COMPETIDOR, CAMARIM, QTD_PESSOAS)
VALUES (2, 1, 5);

INSERT INTO UTILIZA (COMPETIDOR, CAMARIM, QTD_PESSOAS)
VALUES (3, 4, 1);

INSERT INTO UTILIZA (COMPETIDOR, CAMARIM, QTD_PESSOAS)
VALUES (4, 2, 6);

-- Tabela HOTEL 
-- 	Inserindo hoteis que serão usados durante o evento para os competidores
INSERT INTO HOTEL (CNPJ, NOME, ENDERECO, TELEFONE)
VALUES (11897897, 'Plaza Inn', 'Rua dos Hoteis Fancy, 455', '(11)3358-8968');

INSERT INTO HOTEL (CNPJ, NOME, ENDERECO, TELEFONE)
VALUES (10123456, 'Pousada do Zé', 'Rua da Boca de Fumo', '(11)3358-8969');

-- Tabela HOSPEDA 
-- 	Inserindo alocações dos competidores que utilizarão a hospedagem nos hoteis registrados
INSERT INTO HOSPEDA (COMPETIDOR, HOTEL, QUARTO, QTD_HOSPEDES)
VALUES (1, 11897897, 201, 1);

INSERT INTO HOSPEDA (COMPETIDOR, HOTEL, QUARTO, QTD_HOSPEDES)
VALUES (2, 10123456, 2, 5); 

-- Tabela FOTOS 
-- 	Inserindo dados na tabela de fotos. Neste caso o arquivo contendo as fotos não foi inserido mas deveria ser num caso real.
INSERT INTO FOTOS (COSPLAYER, QTD_FOTOS, TAM_FOTOS, NOME_FOTOGRAFO)
VALUES (123456, 20, 50, 'Pedro Estacionador');

INSERT INTO FOTOS (COSPLAYER, QTD_FOTOS, TAM_FOTOS, NOME_FOTOGRAFO)
VALUES (123468, 30, 60, 'Pedro Estacionador');

-- Tabela FUNCIONARIOS
-- 	Adicionando um funcionário de cada tipo, incluindo um sem tipo, em cada turno
INSERT INTO FUNCIONARIOS (CPF, NOME, TELEFONE, HORAS_TRAB, ENDERECO, TURNO)
VALUES (1111111, 'João Amâncio', '(11)3356-9841', 60, 'Rua dos Testes, 10', 'Noite');

INSERT INTO FUNCIONARIOS (CPF, NOME, TIPO, TELEFONE, HORAS_TRAB, ENDERECO, TURNO)
VALUES (2222222, 'José Barbosa', 'APRESENTADOR', '(11)3356-9842', 40, 'Rua dos Insetos, 20', 'Tarde');

INSERT INTO FUNCIONARIOS (CPF, NOME, TIPO, TELEFONE, HORAS_TRAB, ENDERECO, TURNO)
VALUES (3333333, 'Joel Carvalho', 'TÉCNICO', '(11)3356-9843', 50, 'Rua dos Tratores, 30', 'Manhã');

INSERT INTO FUNCIONARIOS (CPF, NOME, TIPO, TELEFONE, HORAS_TRAB, ENDERECO, TURNO)
VALUES (4444444, 'Jonas Carvalho', 'TÉCNICO', '(11)3356-9833', 55, 'Rua dos Tratores, 31', 'Manhã');

INSERT INTO FUNCIONARIOS (CPF, NOME, TIPO, TELEFONE, HORAS_TRAB, ENDERECO, TURNO)
VALUES (5555555, 'João Arriba', 'APRESENTADOR', '(11)3356-9832', 40, 'Rua dos Cachorros, 22', 'Noite');

-- Tabela POSSUI
-- 	Inserindo 3 funcionarios a um palco (palco 2) e um funcionário aos outros palcos 
INSERT INTO POSSUI (PALCO, FUNCIONARIO)
VALUES (2, 2222222);

INSERT INTO POSSUI (PALCO, FUNCIONARIO)
VALUES (3, 2222222);

INSERT INTO POSSUI (PALCO, FUNCIONARIO)
VALUES (2, 3333333);

INSERT INTO POSSUI (PALCO, FUNCIONARIO)
VALUES (4, 1111111);

INSERT INTO POSSUI (PALCO, FUNCIONARIO)
VALUES (2, 1111111);

-- Tabela TECNICO 
-- 	Inserindo uma especialização aos funcionários que são técnicos
INSERT INTO TECNICO (CPF, ESPECIALIZACAO)
VALUES (3333333, 'Audiovisual');

INSERT INTO TECNICO (CPF, ESPECIALIZACAO)
VALUES (4444444, 'Elétrica');

-- Tabela APRESENTADOR
-- 	Inserindo um tempo de palco aos funcionários que são apresentadores
INSERT INTO APRESENTADOR (CPF, TEMPO_PALCO)
VALUES (2222222, 20);

INSERT INTO APRESENTADOR (CPF, TEMPO_PALCO)
VALUES (5555555, 5);

-- Tabela JURADOS
-- 	Adicionando Jurados que irão julgar os competidores nas diversas categorias. Um deles foi inserido sem um email.
INSERT INTO JURADOS (CPF, NOME, TELEFONE, EMAIL)
VALUES (102233, 'João Josephino', '(16)99896-8797', 'jojo@gmail.com');

INSERT INTO JURADOS (CPF, NOME, TELEFONE)
VALUES (102244, 'Carina Josephina', '(16)99896-8797');

-- Tabela APRESENTACAO 
-- 	Inserindo duas apresentações, uma solo e outra em grupo (Goku e Naruto)
INSERT INTO APRESENTACAO (COMPETIDOR, DATA_HORA, MATERIAL_APOIO)
VALUES (1, TO_DATE('07/12/2019 14:30:00', 'DD/MM/YYYY HH24:MI:SS'), 'DBZ Opening song');

INSERT INTO APRESENTACAO (COMPETIDOR, DATA_HORA, MATERIAL_APOIO)
VALUES (2, TO_DATE('07/12/2019 15:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'Naruto Opening song');

-- Tabela AVALIA 
-- 	Inserindo informação sobre quais jurados avalias determinada apresentação
INSERT INTO AVALIA (COMPETIDOR, DATA_HORA, JURADO)
VALUES (1, TO_DATE('07/12/2019 14:30:00', 'DD/MM/YYYY HH24:MI:SS'), 102233);

INSERT INTO AVALIA (COMPETIDOR, DATA_HORA, JURADO)
VALUES (2, TO_DATE('07/12/2019 15:00:00', 'DD/MM/YYYY HH24:MI:SS'), 102244);

-- Tabela AVALIACAO
-- 	 Especificando categoria avaliada pelo jurado e qual é a pontuação dada por ele para essa categoria
INSERT INTO AVALIACAO (COMPETIDOR, DATA_HORA, JURADO, TIPO, NRO_PONTOS)
VALUES (1, TO_DATE('07/12/2019 14:30:00', 'DD/MM/YYYY HH24:MI:SS'), 102233, 'PERFORMANCE', 22);

INSERT INTO AVALIACAO (COMPETIDOR, DATA_HORA, JURADO, TIPO, NRO_PONTOS)
VALUES (2, TO_DATE('07/12/2019 15:00:00', 'DD/MM/YYYY HH24:MI:SS'), 102244, 'COSPLAY', 15);

-- Tabela MATERIAL_APOIO
-- Inserindo informação sobre material de apoio usado em determinadas apresentações. Neste caso o arquivo não foi adicionado mas seria em um caso real.
INSERT INTO MATERIAL_APOIO (NOME, TIPO_ARQ)
VALUES ('DBZ Opening song', 'MP3');

INSERT INTO MATERIAL_APOIO (NOME, TIPO_ARQ)
VALUES ('Naruto Opening song', 'MP3');

-- Tabela PREMIOS 
-- Adicionando prêmios para competidores 1 e 2 (Goku e Naruto). Foram atribuídos dois prêmios ao competidor do Goku
INSERT INTO PREMIOS (COMPETIDOR, PREMIO)
VALUES (1, 'Medalha de Prata por Performance');

INSERT INTO PREMIOS (COMPETIDOR, PREMIO)
VALUES (1, 'Cookie por atitude');

INSERT INTO PREMIOS (COMPETIDOR, PREMIO)
VALUES (2, 'Medalha de bronze por Cosplay');