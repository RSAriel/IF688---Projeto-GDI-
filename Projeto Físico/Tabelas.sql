-- Criação da tabela Casa
-- Relacionamento "Lidera" com tabela Professor através do CPF_Prof como chave estrangeira (1 para 1), 
-- Possui um atributo multivalorado Cores, que é uma tabela separada
CREATE TABLE Casa (
    ID INT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Brasao VARCHAR(100),
    Nome_Fundador VARCHAR(100),
    Nascimento_Fundador DATE,
    CPF_Prof CHAR(11),
    FOREIGN KEY (CPF_Prof) REFERENCES Professor(CPF)
);

--Criação da tabela Cores (Atributo Multivalorado), está associado a Casa pela chave estrangeira ID
CREATE TABLE Cores (
    ID INT,
    Cor VARCHAR(50),
    PRIMARY KEY (ID, Cor),
    FOREIGN KEY (ID) REFERENCES Casa(ID)
);

-- Criação da tabela Fantasma
CREATE TABLE Fantasma (
    CPM CHAR(11) PRIMARY KEY,
    Nome VARCHAR(100),
    Data_Obito DATE
);

-- Criação da tabela Assombra, relacionamento M:N entre Casa e Fantasma)
CREATE TABLE Assombra (
    ID INT,
    CPM CHAR(11),
    PRIMARY KEY (ID, CPM),
    FOREIGN KEY (ID) REFERENCES Casa(ID),
    FOREIGN KEY (CPM) REFERENCES Fantasma(CPM)
);

-- Criação da tabela Professor
-- Relacionamento "Lidera" com tabela Casa através do CPF_Prof (1 para 1), 
CREATE TABLE Professor (
    CPF CHAR(11) PRIMARY KEY,
    Nome VARCHAR(100),
    Materia VARCHAR(100),
    Data_Ingresso DATE
);

-- Criação da tabela Sala
CREATE TABLE Sala (
    ID INT PRIMARY KEY,
    Numero_Cadeiras INT
);

-- Criação da tabela Estudante
-- Está relacionada com a tabela Casa através da chave estrangeira ID_Casa (1 para N)
-- E com a tabela Estudante(Monitor) através da chave estrangeira CPF_Monitor (Auto relacionamento 1 para N)
CREATE TABLE Estudante (
    CPF CHAR(11) PRIMARY KEY,
    Nome VARCHAR(100),
    Sangue VARCHAR(20),
    Ano_Ingresso INT,
    CPF_Monitor CHAR(11),
    QI INT,
    Companheirismo INT,
    Ambicao INT,
    Heroismo INT,
    ID_Casa INT NOT NULL,
    FOREIGN KEY (CPF_Monitor) REFERENCES Estudante(CPF),
    FOREIGN KEY (ID_Casa) REFERENCES Casa(ID)
);

--Criação da tabela Varinha (1 para N)
-- Está relacionada com a tabela Estudante através da chave estrangeira CPF, entidade fraca com chave primária composta.
CREATE TABLE Varinha (
    CPF CHAR(11),
    Nome VARCHAR(100),
    Poder INT,
    PRIMARY KEY (CPF, Nome),
    FOREIGN KEY (CPF) REFERENCES Estudante(CPF)
);

--Criação da tabela Ensina (3-ário )
-- Está relacionada com as tabelas Professor, Estudante e Sala através das respectivas chaves estrangeiras
-- A chave primária é composta por CPF_Professor, CPF_Aluno e Hora_Aula
-- Como ID_sala é o lado 1, não precisa ser parte da chave primária mas tem que ser não nulo.
-- Possui Hora_aula como atributo discriminador do relacionamento
CREATE TABLE Ensina (
    CPF_Professor CHAR(11),
    CPF_Aluno CHAR(11),
    Hora_Aula TIME,
    ID_Sala INT NOT NULL,
    PRIMARY KEY (CPF_Professor, CPF_Aluno, Hora_Aula),
    FOREIGN KEY (CPF_Professor) REFERENCES Professor(CPF),
    FOREIGN KEY (CPF_Aluno) REFERENCES Estudante(CPF),
    FOREIGN KEY (ID_Sala) REFERENCES Sala(ID)
);

-- Tabela: Torneio
-- Superentidade com Herança para Quadribol e Corrida_Vassouras
CREATE TABLE Torneio (
    ID INT PRIMARY KEY,
    Titulo VARCHAR(100),
    Inicio DATE,
    Fim DATE
);

-- Tabela: Participa (M:N)
-- Entidade associativa entre  Estudante e Torneio, com atributos adicionais
-- CPF_Participante e ID_Torneio como chave primária composta
CREATE TABLE Participa (
    CPF_Participante CHAR(11),
    ID_Torneio INT,
    Data_Inscricao DATE,
    Pontuacao INT,
    Infracao BOOLEAN,
    Forma_Selecao VARCHAR(100),
    PRIMARY KEY (CPF_Participante, ID_Torneio),
    FOREIGN KEY (CPF_Participante) REFERENCES Estudante(CPF),
    FOREIGN KEY (ID_Torneio) REFERENCES Torneio(ID)
);

-- Tabela: Quadribol
-- Subentidade de Torneio
CREATE TABLE Quadribol (
    ID INT PRIMARY KEY,
    Casa_Vencedora VARCHAR(100),
    Pomo_de_Ouro BOOLEAN,
    FOREIGN KEY (ID) REFERENCES Torneio(ID)
);


-- Corrida: Vassouras
-- Subentidade de Torneio
CREATE TABLE Corrida_Vassouras (
    ID INT PRIMARY KEY,
    Vencedor INT,
    Distancia FLOAT,
    Tipo_Trajeto VARCHAR(100),
    Nivel_Perigo INT,
    FOREIGN KEY (ID) REFERENCES Torneio(ID)
);


