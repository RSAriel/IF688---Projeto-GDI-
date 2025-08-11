import sqlite3

conn = sqlite3.connect('hogwarts.db')
cursor = conn.cursor()

cursor.execute('''
CREATE TABLE professor (
    cpf VARCHAR(11) PRIMARY KEY,
    nome TEXT,
    materia TEXT,
    data_ingresso DATE
)
''')

cursor.execute('''
CREATE TABLE fantasma (
    cpm VARCHAR(11) PRIMARY KEY,
    nome TEXT,
    data_obito DATE
)
''')

cursor.execute('''
CREATE TABLE sala (
    id INTEGER PRIMARY KEY,
    capacidade INTEGER
)
''')

cursor.execute('''
CREATE TABLE conduta (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    tipo TEXT,
    descricao TEXT
)
''')

cursor.execute('''
CREATE TABLE torneio (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT,
    inicio DATE,
    fim DATE
)
''')

cursor.execute('''
CREATE TABLE casa (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    brasao TEXT,
    fund_nome TEXT,
    fund_nascimento DATE,
    cor_1 TEXT,
    cor_2 TEXT,
    cpf_prof VARCHAR(11) UNIQUE,
    FOREIGN KEY (cpf_prof) REFERENCES professor(cpf)
)
''')

cursor.execute('''
CREATE TABLE estudante (
    cpf VARCHAR(11) PRIMARY KEY,
    id_casa INTEGER NOT NULL,
    cpf_monitor VARCHAR(11),
    nome TEXT,
    virtude TEXT,
    data_ingresso DATE,
    sangue TEXT,
    FOREIGN KEY (id_casa) REFERENCES casa(id),
    FOREIGN KEY (cpf_monitor) REFERENCES estudante(cpf)
)
''')

cursor.execute('''
CREATE TABLE assombra (
    id_casa INTEGER,
    cpm_fantasma VARCHAR(11),
    PRIMARY KEY (id_casa, cpm_fantasma),
    FOREIGN KEY (id_casa) REFERENCES casa(id),
    FOREIGN KEY (cpm_fantasma) REFERENCES fantasma(cpm)
)
''')

cursor.execute('''
CREATE TABLE ensina (
    cpf_prof VARCHAR(11),
    cpf_estudante VARCHAR(11),
    hora_aula TIMESTAMP,
    id_sala INTEGER UNIQUE NOT NULL,
    PRIMARY KEY (cpf_prof, cpf_estudante, hora_aula),
    FOREIGN KEY (cpf_prof) REFERENCES professor(cpf),
    FOREIGN KEY (cpf_estudante) REFERENCES estudante(cpf),
    FOREIGN KEY (id_sala) REFERENCES sala(id)
)
''')

cursor.execute('''
CREATE TABLE varinha (
    cpf_estudante VARCHAR(11) PRIMARY KEY,
    nucleo TEXT,
    FOREIGN KEY (cpf_estudante) REFERENCES estudante(cpf)
)
''')

cursor.execute('''
CREATE TABLE quadribol (
    id INTEGER PRIMARY KEY,
    placar TEXT,
    casa_vencedora TEXT,
    pomo_de_ouro TEXT,
    FOREIGN KEY (id) REFERENCES torneio(id)
)
''')

cursor.execute('''
CREATE TABLE corrida_de_vassouras (
    id INTEGER PRIMARY KEY,
    vencedor TEXT,
    distancia INTEGER,
    tipo_trajeto TEXT,
    nivel_perigo INTEGER,
    FOREIGN KEY (id) REFERENCES torneio(id)
)
''')

cursor.execute('''
CREATE TABLE participa (
    cpf_estudante VARCHAR(11),
    id_torneio INTEGER,
    data_inscricao DATE,
    forma_selecao TEXT,
    PRIMARY KEY (cpf_estudante, id_torneio),
    FOREIGN KEY (cpf_estudante) REFERENCES estudante(cpf),
    FOREIGN KEY (id_torneio) REFERENCES torneio(id)
)
''')

cursor.execute('''
CREATE TABLE tem (
    cpf_estudante VARCHAR(11),
    id_conduta INTEGER,
    id_torneio INTEGER,
    PRIMARY KEY (cpf_estudante, id_conduta, id_torneio),
    FOREIGN KEY (cpf_estudante, id_torneio) REFERENCES participa(cpf_estudante, id_torneio),
    FOREIGN KEY (id_conduta) REFERENCES conduta(id)
)
''')


conn.commit()
print("All tables created successfully!")
conn.close()