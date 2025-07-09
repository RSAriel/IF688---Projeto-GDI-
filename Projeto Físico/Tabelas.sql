-- Criação da tabela Professor
-- Relacionamento "Lidera" com tabela Casa através do CPF_Prof (1 para 1), 
CREATE TABLE Professor (
    CPF VARCHAR2(11) PRIMARY KEY,
    Nome VARCHAR2(100),
    Materia VARCHAR2(100),
    Data_Ingresso DATE
);

-- Criação da tabela Casa
-- Relacionamento "Lidera" com tabela Professor através do CPF_Prof como chave estrangeira (1 para 1), 
-- Possui um atributo multivalorado Cores, que é uma tabela separada
CREATE TABLE Casa (
    ID INT PRIMARY KEY,
    Nome VARCHAR2(100) NOT NULL,
    Brasao VARCHAR2(100),
    Nome_Fundador VARCHAR2(100),
    Nascimento_Fundador DATE,
    CPF_Prof VARCHAR2(11),
    FOREIGN KEY (CPF_Prof) REFERENCES Professor(CPF)
);

--Criação da tabela Cores (Atributo Multivalorado), está associado a Casa pela chave estrangeira ID
CREATE TABLE Cores (
    ID INT,
    Cor VARCHAR2(50),
    PRIMARY KEY (ID, Cor),
    FOREIGN KEY (ID) REFERENCES Casa(ID)
);

-- Criação da tabela Fantasma
CREATE TABLE Fantasma (
    CPM VARCHAR2(11) PRIMARY KEY,
    Nome VARCHAR2(100),
    Data_Obito DATE
);

-- Criação da tabela Assombra, relacionamento M:N entre Casa e Fantasma)
CREATE TABLE Assombra (
    ID INT,
    CPM VARCHAR2(11),
    PRIMARY KEY (ID, CPM),
    FOREIGN KEY (ID) REFERENCES Casa(ID),
    FOREIGN KEY (CPM) REFERENCES Fantasma(CPM)
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
    CPF VARCHAR2(11) PRIMARY KEY,
    Nome VARCHAR2(100),
    Sangue VARCHAR2(20),
    Ano_Ingresso INT,
    CPF_Monitor VARCHAR2(11),
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
    CPF VARCHAR2(11),
    Nome VARCHAR2(100),
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
    CPF_Professor VARCHAR2(11),
    CPF_Aluno VARCHAR2(11),
    Hora_Aula TIMESTAMP,
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
    Titulo VARCHAR2(100),
    Inicio DATE,
    Fim DATE
);

-- Tabela: Participa (M:N)
-- Entidade associativa entre  Estudante e Torneio, com atributos adicionais
-- CPF_Participante e ID_Torneio como chave primária composta
CREATE TABLE Participa (
    CPF_Participante VARCHAR2(11),
    ID_Torneio INT,
    Data_Inscricao DATE,
    Pontuacao INT,
    Infracao NUMBER(1) CHECK (Infracao IN (0, 1)),
    Forma_Selecao VARCHAR2(100),
    PRIMARY KEY (CPF_Participante, ID_Torneio),
    FOREIGN KEY (CPF_Participante) REFERENCES Estudante(CPF),
    FOREIGN KEY (ID_Torneio) REFERENCES Torneio(ID)
);

-- Tabela: Quadribol
-- Subentidade de Torneio
CREATE TABLE Quadribol (
    ID INT PRIMARY KEY,
    Casa_Vencedora VARCHAR2(100),
    Pomo_de_Ouro CHAR(1) CHECK (Pomo_de_Ouro IN (0, 1)),
    FOREIGN KEY (ID) REFERENCES Torneio(ID)
);

-- Corrida: Vassouras
-- Subentidade de Torneio
CREATE TABLE Corrida_Vassouras (
    ID INT PRIMARY KEY,
    Vencedor INT,
    Distancia FLOAT,
    Tipo_Trajeto VARCHAR2(100),
    Nivel_Perigo INT,
    FOREIGN KEY (ID) REFERENCES Torneio(ID)
);
