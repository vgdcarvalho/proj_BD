/*
SCRIPT PARA CRIAÇÃO DO BANCO DE DADOS

Disciplina: SCC-240 - Base de Dados (2019/2)
Projeto: Game XP
Foco: Gerenciamento de competição de cosplay
Alunos:
	Luiz Guilherme Martins Adorno - 10392171
	Murilo Kazumi de Freitas - 10818988
	Vinícius Gonçalves de Carvalho - 8517157
*/

CREATE TABLE PALCO(
    NUMERO NUMBER(3) NOT NULL,
    SETOR VARCHAR2(3),
    CONSTRAINT PK_PALCO PRIMARY KEY (NUMERO)
);

/* 
Criação da tabela para competidor:
	Note que um competidor precisa necessariamente ter um tipo, seja ele Solo ou Grupo.
	Constraints:
		CK_TIPO_COMP: É realizada uma verificação do tipo inserido e o valor padrão para tipo é o de competidor Solo.
		FK_COMPETIDOR: É o número do Palco que vem da tabela PALCO.
*/ 
CREATE TABLE COMPETIDOR(
    INSCRICAO NUMBER(5) NOT NULL,
    TIPO VARCHAR2(5) DEFAULT 'SOLO',
    NRO_PONTOS NUMBER(3),
    PALCO NUMBER(3),
    CONSTRAINT CK_TIPO_COMP CHECK(TIPO IN('SOLO', 'GRUPO')),
    CONSTRAINT FK_COMPETIDOR FOREIGN KEY (PALCO) 
		REFERENCES PALCO (NUMERO) ON DELETE CASCADE,
    CONSTRAINT PK_COMPETIDOR PRIMARY KEY (INSCRICAO)
);

/* 
Criação da tabela para armazenar informação dos grupos que irão ser apresentar.
	Constraints:
		FK_GRUPO: É o número de inscrição de Competidor, pois competidores podem ser indivíduos (na categora Solo) ou grupos.
*/ 
CREATE TABLE GRUPO(
    INSCRICAO NUMBER(5) NOT NULL,
    QTD_PESSOAS NUMBER(2),
    CONSTRAINT FK_GRUPO FOREIGN KEY (INSCRICAO) 
		REFERENCES COMPETIDOR (INSCRICAO) ON DELETE CASCADE,
    CONSTRAINT PK_GRUPO PRIMARY KEY (INSCRICAO)
);

/* 
Criação da tabela para armazenar informação dos cosplayers que irão ser apresentar.
	Constraints:
		FK_COSPLAYER: É uma referência ao grupo ao qual o cosplayer faz parte, se fizer parte de algum grupo.
*/
CREATE TABLE COSPLAYER(
    CPF NUMBER(14) NOT NULL,
    NOME VARCHAR2(50),
    NOME_PERSONAGEM VARCHAR2(50),
    ORIGEM_PERSONAGEM VARCHAR2(50),
    TELEFONE VARCHAR2(20),
    NRO_VOTOS NUMBER(3),
    ENDERECO VARCHAR2(50),
    GRUPO NUMBER(3),
    CONSTRAINT FK_COSPLAYER FOREIGN KEY (GRUPO) 
		REFERENCES GRUPO (INSCRICAO) ON DELETE CASCADE,
    CONSTRAINT PK_COSPLAYER PRIMARY KEY (CPF)
);

/* 
Criação da tabela para armazenar informação daqueles que irão votar em cosplayers para que estes possam se tornar competidores.
	Constraints:
		FK_VOTANTE: É uma referência ao cosplayer que recebe o voto.
*/
CREATE TABLE VOTANTE(
    CPF NUMBER(14) NOT NULL,
    EMAIL VARCHAR2(40),
    COSPLAYER NUMBER(14) NOT NULL,
    CONSTRAINT FK_VOTANTE FOREIGN KEY (COSPLAYER) 
		REFERENCES COSPLAYER (CPF) ON DELETE CASCADE,
    CONSTRAINT PK_VOTANTE PRIMARY KEY (CPF)
);

/* 
Criação da tabela para armazenar informação dos competidores Solo.
	Constraints:
		FK_SOLO_INSC: Refere-se ao número de inscrição como Competidor, pois competidores podem ser Solo ou Grupos.
		FK_SOLO_COSP: Referência ao cosplayer que tornou-se competidor, utilizando o número de CPF
*/
CREATE TABLE SOLO(
    INSCRICAO NUMBER(5) NOT NULL,
    COSPLAYER NUMBER(14) NOT NULL,
    CONSTRAINT FK_SOLO_INSC FOREIGN KEY (INSCRICAO) 
		REFERENCES COMPETIDOR (INSCRICAO) ON DELETE CASCADE,
    CONSTRAINT FK_SOLO_COSP FOREIGN KEY (COSPLAYER) 
		REFERENCES COSPLAYER (CPF) ON DELETE CASCADE,
    CONSTRAINT PK_SOLO PRIMARY KEY (INSCRICAO)
);
/* 
Criação da tabela para armazenar informação dos camarins.
*/
CREATE TABLE CAMARIM(
    NUMERO NUMBER(4) NOT NULL,
    SETOR VARCHAR2(3),
    CONSTRAINT PK_CAMARIM PRIMARY KEY (NUMERO)
);

/* 
Criação da tabela para armazenar informação sobre a utilização dos camarins, como que competidor está alocado a qual camarim e quantas pessoas utilizam.
	Constraints:
		FK_UTILIZA_COMP: Refere-se ao competidor alocado ao camarim em questão.
		FK_UTILIZA_CAMA: Referência ao camarim sendo utilizado.
*/
CREATE TABLE UTILIZA(
    COMPETIDOR NUMBER(5) NOT NULL,
    CAMARIM NUMBER(4) NOT NULL,
    QTD_PESSOAS NUMBER (2),
    CONSTRAINT FK_UTILIZA_COMP FOREIGN KEY (COMPETIDOR) 
		REFERENCES COMPETIDOR (INSCRICAO) ON DELETE CASCADE,
    CONSTRAINT FK_UTILIZA_CAMA FOREIGN KEY (CAMARIM) 
		REFERENCES CAMARIM (NUMERO) ON DELETE CASCADE,
    CONSTRAINT PK_UTILIZA PRIMARY KEY (COMPETIDOR, CAMARIM)
);

/* 
Criação da tabela para armazenar informação sobre os hoteis utilizados para alocar competidores no campeonato.
*/
CREATE TABLE HOTEL(
    CNPJ NUMBER(20) NOT NULL,
    NOME VARCHAR2(50),
    ENDERECO VARCHAR2(50),
    TELEFONE VARCHAR2(20),
    CONSTRAINT PK_HOTEL PRIMARY KEY (CNPJ)
);

/* 
Criação da tabela para armazenar informação sobre a alocação de competidores nos hoteis utilizados durante o campeonato.
	Constraints:
		FK_HOSPEDA_COMP: Refere-se ao competidor alocado ao hotel em questão.
		FK_HOSPEDA_HOT: Refere-se ao hotel que hospeda o competidor.
*/
CREATE TABLE HOSPEDA(
    COMPETIDOR NUMBER(5) NOT NULL,
    HOTEL NUMBER(20),
    QUARTO NUMBER(4),
    QTD_HOSPEDES NUMBER(2),
    CONSTRAINT FK_HOSPEDA_HOT FOREIGN KEY (HOTEL) 
		REFERENCES HOTEL (CNPJ) ON DELETE CASCADE,
	CONSTRAINT FK_HOSPEDA_COMP FOREIGN KEY (COMPETIDOR) 
		REFERENCES COMPETIDOR (INSCRICAO) ON DELETE CASCADE,
    CONSTRAINT PK_HOSPEDA PRIMARY KEY (COMPETIDOR)
);

/*
Criação de tablea para as fotos:
    Note que há um único arquivo armazenado. Este arquivo é uma pasta compactada contendo todas as fotos do competidor e copslayer.
    Outras informações sobre as fotos se encontram nos outros atributos, como tamanho total, quantidade de fotos e nome do fotógrafo responsável.
	Contraints:
		FK_FOTOS: Refere-se ao cosplayer ao qual pertencem as fotos armazenadas
*/
CREATE TABLE FOTOS(
    COSPLAYER NUMBER(14) NOT NULL,
    ARQUIVO BLOB,
    QTD_FOTOS NUMBER(3),
    TAM_FOTOS NUMBER(10),
    NOME_FOTOGRAFO VARCHAR2(50),
    CONSTRAINT FK_FOTOS FOREIGN KEY (COSPLAYER) 
		REFERENCES COSPLAYER (CPF) ON DELETE CASCADE,
    CONSTRAINT PK_FOTOS PRIMARY KEY (COSPLAYER)
);

/*
Criação de tabela para funcionários:
    Note que é possível que haja um funcionário sem tipo mas caso um tipo seja definido ele precisa ser Apresentador ou Técnico.
	Constraints:
		CK_TIPO_FUNC: Verificação do tipo de funcionário, que pode ser APRESENTADOR ou TÉCNICO
*/
CREATE TABLE FUNCIONARIOS(
    CPF NUMBER(14) NOT NULL,
    NOME VARCHAR2(50),
    TIPO VARCHAR2(12),
    TELEFONE VARCHAR2(20),
    HORAS_TRAB NUMBER(3),
    ENDERECO VARCHAR2(50),
    TURNO VARCHAR2(10),
    CONSTRAINT CK_TIPO_FUNC CHECK(TIPO IN('APRESENTADOR', 'TÉCNICO')),
    CONSTRAINT PK_FUNC PRIMARY KEY (CPF)
);

/*
Criação de tabela para atribuir funcionários a determinados palcos:
	Constraints:
		FK_POSSUI_PALCO: Palco em questão, vindo da tabela PALCO
		FK_POSSUI_FUNC: Funcionário alocado neste palco, vindo da tabela FUNCIONARIOS
*/
CREATE TABLE POSSUI(
    PALCO NUMBER(3) NOT NULL,
    FUNCIONARIO NUMBER(14) NOT NULL,
    CONSTRAINT FK_POSSUI_PALCO FOREIGN KEY (PALCO) 
		REFERENCES PALCO (NUMERO) ON DELETE CASCADE,
    CONSTRAINT FK_POSSUI_FUNC FOREIGN KEY (FUNCIONARIO) 
		REFERENCES FUNCIONARIOS (CPF) ON DELETE CASCADE,
    CONSTRAINT PK_POSSUI PRIMARY KEY (PALCO, FUNCIONARIO)
);

/*
Criação de tabela para detalhar especialização de um funcionário que é técnico:
	Constraints:
		FK_TECNICO: Funcionário em questão, vindo da tabela FUNCIONARIOS
*/
CREATE TABLE TECNICO(
    CPF NUMBER(14) NOT NULL,
    ESPECIALIZACAO VARCHAR2(30),
    CONSTRAINT FK_TECNICO FOREIGN KEY (CPF) 
		REFERENCES FUNCIONARIOS (CPF) ON DELETE CASCADE,
    CONSTRAINT PK_TECNICO PRIMARY KEY (CPF)
);

/*
Criação de tabela para detalhar especialização de um funcionário que é apresentador:
	Constraints:
		FK_APRESENTADOR: Funcionário em questão, vindo da tabela FUNCIONARIOS
*/
CREATE TABLE APRESENTADOR(
    CPF NUMBER(14) NOT NULL,
    TEMPO_PALCO NUMBER(3),
    CONSTRAINT FK_APRESENTADOR FOREIGN KEY (CPF) 
		REFERENCES FUNCIONARIOS (CPF) ON DELETE CASCADE,
    CONSTRAINT PK_APRESENTADOR PRIMARY KEY (CPF)
);

/*
Criação de tabela para armazenar informação sobre os jurados do campeonato
*/
CREATE TABLE JURADOS(
    CPF NUMBER(14) NOT NULL,
    NOME VARCHAR2(50),
    TELEFONE VARCHAR2(20),
    EMAIL VARCHAR2(40),
    CONSTRAINT PK_JURADOS PRIMARY KEY (CPF)
);

/*
Criação de tabela para armazenar detalhes sobre as apresentações
	Constraints:
		FK_APRESENTACAO: Referência ao competidor (solo ou grupo) de determinada aresentação, vindo da tabela COMPETIDOR
*/
CREATE TABLE APRESENTACAO(
    COMPETIDOR NUMBER(5) NOT NULL,
    DATA_HORA DATE NOT NULL,
    MATERIAL_APOIO VARCHAR2(20) NOT NULL UNIQUE,
    CONSTRAINT FK_APRESENTACAO FOREIGN KEY (COMPETIDOR) 
		REFERENCES COMPETIDOR (INSCRICAO) ON DELETE CASCADE,
    CONSTRAINT PK_APRESENTACAO PRIMARY KEY (COMPETIDOR, DATA_HORA)
);

/*
Criação de tabela para ligar jurados e competidores, em determinada apresentação
	Constraints:
		FK_AVALIA_APR: Referência aos competidores em determinadas apresentações, vindo da tabela APRESENTAÇÂO 
		FK_AVALIA_JUR: Referência aos jurados que farão a avaliação da apresetação
*/
CREATE TABLE AVALIA(
    COMPETIDOR NUMBER(5) NOT NULL,
    DATA_HORA DATE NOT NULL,
    JURADO NUMBER(14) NOT NULL,
    CONSTRAINT FK_AVALIA_APR FOREIGN KEY (COMPETIDOR, DATA_HORA) 
		REFERENCES APRESENTACAO (COMPETIDOR, DATA_HORA) ON DELETE CASCADE,
    CONSTRAINT FK_AVALIA_JUR FOREIGN KEY (JURADO) 
		REFERENCES JURADOS (CPF) ON DELETE CASCADE,
    CONSTRAINT PK_AVALIA PRIMARY KEY (COMPETIDOR, DATA_HORA, JURADO)
);

/*
Criação de tabela para armazenar dados da avaliação de uma determinada apresentação em determinada categoria de avaliação
	Constraints:
		CK_TIPO_AVALIACAO: Verificação do tipo/categoria sendo avaliada que só pode ser 'PERFORMANCE', 'COSPLAY' ou 'CRIATIVIDADE'
		FK_AVALIACAO_APR: Referência aos competidores em determinadas apresentações, vindo da tabela APRESENTAÇÂO
		FK_AVALIACAO_JUR: Referência aos jurados que farão a avaliação da apresetação
*/
CREATE TABLE AVALIACAO(
    COMPETIDOR NUMBER(5) NOT NULL,
    DATA_HORA DATE NOT NULL,
    JURADO NUMBER(14) NOT NULL,
    TIPO VARCHAR2(15) NOT NULL,
    NRO_PONTOS NUMBER(3),
    CONSTRAINT CK_TIPO_AVALIACAO CHECK (TIPO IN('PERFORMANCE', 'COSPLAY', 'CRIATIVIDADE')),
    CONSTRAINT FK_AVALIACAO_APR FOREIGN KEY (COMPETIDOR, DATA_HORA) 
		REFERENCES APRESENTACAO (COMPETIDOR, DATA_HORA) ON DELETE CASCADE,
    CONSTRAINT FK_AVALIACAO_JUR FOREIGN KEY (JURADO) 
		REFERENCES JURADOS (CPF) ON DELETE CASCADE,
    CONSTRAINT PK_AVALIACAO PRIMARY KEY (COMPETIDOR, DATA_HORA, JURADO, TIPO)
);

/*
Criação de tabela para armazenar dados do material de apoio usado por um competidor em um apresentação
	Constraints:
		FK_MAT_APOIO: Nome/Identificação do material de apoio, vindo da tabela APRESENTAÇÂO
*/
CREATE TABLE MATERIAL_APOIO(
    NOME VARCHAR2(50) NOT NULL,
    TIPO_ARQ VARCHAR2(10),
    ARQUIVO BLOB,
    CONSTRAINT FK_MAT_APOIO FOREIGN KEY (NOME) 
		REFERENCES APRESENTACAO (MATERIAL_APOIO) ON DELETE CASCADE,
    CONSTRAINT PK_MAT_APOIO PRIMARY KEY (NOME)
);

/*
Criação de tabela para armazenar dados dos prêmios que um competidor recebeu
	Note que um mesmo copetidor pode receber vários prêmios
	Constraints:
		FK_PREMIOS_COMP: Referência ao competidor que recebeu o prêmio em questão
*/				  
CREATE TABLE PREMIOS(
    COMPETIDOR NUMBER(5),
    PREMIO VARCHAR2(100),
    CONSTRAINT FK_PREMIOS_COMP FOREIGN KEY (COMPETIDOR) 
		REFERENCES COMPETIDOR (INSCRICAO) ON DELETE CASCADE,
    CONSTRAINT PK_PREMIOS PRIMARY KEY (COMPETIDOR, PREMIO)
);
