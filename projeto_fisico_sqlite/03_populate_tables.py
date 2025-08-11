import sqlite3
from datetime import datetime

conn = sqlite3.connect('hogwarts.db')
cursor = conn.cursor()

try:
    professores = [
        ('12345678901', 'Minerva McGonagall', 'Transfiguração', '1956-12-04'),
        ('12345678902', 'Severus Snape', 'Poções', '1981-09-01'),
        ('12345678903', 'Filius Flitwick', 'Feitiços', '1975-09-01'),
        ('12345678904', 'Pomona Sprout', 'Herbologia', '1974-09-01'),
        ('12345678905', 'Sybill Trelawney', 'Adivinhação', '1980-09-01'),
        ('12345678906', 'Remus Lupin', 'Defesa Contra as Artes das Trevas', '1993-09-01'),
        ('12345678907', 'Rubeus Hagrid', 'Cuidado de Criaturas Mágicas', '1993-09-01'),
        ('12345678908', 'Aurora Sinistra', 'Astronomia', '1985-09-01')
    ]
    
    cursor.executemany('''
        INSERT INTO professor (cpf, nome, materia, data_ingresso)
        VALUES (?, ?, ?, ?)
    ''', professores)


    fantasmas = [
        ('11111111111', 'Nick Quase-Sem-Cabeça', '1492-10-31'),
        ('22222222222', 'Barão Sangrento', '1000-12-15'),
        ('33333333333', 'Dama Cinzenta', '1000-10-20'),
        ('44444444444', 'Frade Gordo', '1400-08-12'),
        ('55555555555', 'Pirraça', '1800-01-01')
    ]
    
    cursor.executemany('''
        INSERT INTO fantasma (cpm, nome, data_obito)
        VALUES (?, ?, ?)
    ''', fantasmas)

    salas = [
        (1, 30),   # Sala de Transfiguração
        (2, 25),   # Laboratório de Poções
        (3, 35),   # Sala de Feitiços
        (4, 20),   # Estufa de Herbologia
        (5, 15),   # Torre de Adivinhação
        (6, 40),   # Grande Salão
        (7, 30),   # Sala de Defesa
        (8, 25),   # Torre de Astronomia
        (9, 50),   # Biblioteca
        (10, 100)  # Quadra de Quadribol
    ]
    
    cursor.executemany('''
        INSERT INTO sala (id, capacidade)
        VALUES (?, ?)
    ''', salas)

    condutas = [
        ('Positiva', 'Excelente trabalho em equipe durante o jogo'),
        ('Positiva', 'Demonstrou fair play excepcional'),
        ('Negativa', 'Uso de falta desleal contra adversário'),
        ('Negativa', 'Desrespeitou regras do torneio'),
        ('Positiva', 'Liderança exemplar como capitão'),
        ('Negativa', 'Comportamento antiesportivo'),
        ('Positiva', 'Performance excepcional na competição'),
        ('Negativa', 'Atrasou-se para competição sem justificativa')
    ]
    
    cursor.executemany('''
        INSERT INTO conduta (tipo, descricao)
        VALUES (?, ?)
    ''', condutas)

    torneios = [
        ('Copa de Quadribol das Casas 2024', '2024-03-15', '2024-06-20'),
        ('Corrida de Vassouras Anual', '2024-04-10', '2024-04-10'),
        ('Mundial de Corrida de Vassouras', '2025-05-01', '2025-05-15'),
        ('Copa de Quadribol das Casas 2025', '2025-03-15', '2025-06-20')
    ]
    
    cursor.executemany('''
        INSERT INTO torneio (titulo, inicio, fim)
        VALUES (?, ?, ?)
    ''', torneios)

    casas = [
        ('Grifinória', 'Leão dourado em campo vermelho', 'Godric Gryffindor', '900-07-15', 'Vermelho', 'Dourado', '12345678901'),
        ('Sonserina', 'Serpente prateada em campo verde', 'Salazar Slytherin', '900-06-20', 'Verde', 'Prata', '12345678902'),
        ('Corvinal', 'Águia de bronze em campo azul', 'Rowena Ravenclaw', '900-08-10', 'Azul', 'Bronze', '12345678903'),
        ('Lufa-Lufa', 'Texugo preto em campo amarelo', 'Helga Hufflepuff', '900-05-25', 'Amarelo', 'Preto', '12345678904')
    ]
    
    cursor.executemany('''
        INSERT INTO casa (nome, brasao, fund_nome, fund_nascimento, cor_1, cor_2, cpf_prof)
        VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', casas)

    estudantes = [
        ('98765432101', 1, None, 'Harry Potter', 'Coragem', '1991-09-01', 'Mestiço'),
        ('98765432111', 1, None, 'Alvo Tempest', 'Coragem', '1989-08-12', 'Mestiço'),
        ('98765432102', 1, None, 'Hermione Granger', 'Inteligência', '1991-09-01', 'Nascido-trouxa'),
        ('98765432103', 1, '98765432101', 'Ronald Weasley', 'Lealdade', '1991-09-01', 'Puro-sangue'),
        ('98765432104', 1, None, 'Neville Longbottom', 'Perseverança', '1991-09-01', 'Puro-sangue'),
        ('98765432105', 2, None, 'Draco Malfoy', 'Ambição', '1991-09-01', 'Puro-sangue'),
        ('98765432106', 2, '98765432105', 'Vincent Crabbe', 'Força', '1991-09-01', 'Puro-sangue'),
        ('98765432107', 3, None, 'Luna Lovegood', 'Criatividade', '1992-09-01', 'Puro-sangue'),
        ('98765432108', 3, None, 'Cho Chang', 'Sabedoria', '1990-09-01', 'Mestiço'),
        ('98765432109', 4, None, 'Cedric Diggory', 'Justiça', '1989-09-01', 'Puro-sangue'),
        ('98765432110', 4, '98765432109', 'Hannah Abbott', 'Dedicação', '1991-09-01', 'Mestiço')
    ]
    
    cursor.executemany('''
        INSERT INTO estudante (cpf, id_casa, cpf_monitor, nome, virtude, data_ingresso, sangue)
        VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', estudantes)

    assombracoes = [
        (1, '11111111111'),  # Nick Quase-Sem-Cabeça assombra Grifinória
        (2, '11111111112'),  # Barão Sangrento assombra Sonserina
        (3, '11111111113'),  # Dama Cinzenta assombra Corvinal
        (4, '11111111114'),  # Frade Gordo assombra Lufa-Lufa
    ]
    
    cursor.executemany('''
        INSERT INTO assombra (id_casa, cpm_fantasma)
        VALUES (?, ?)
    ''', assombracoes)

    aulas = [
        ('12345678901', '98765432101', '2024-08-10 09:00:00', 1),
        ('12345678902', '98765432105', '2024-08-10 10:30:00', 2),
        ('12345678903', '98765432107', '2024-08-10 14:00:00', 3),
        ('12345678904', '98765432109', '2024-08-10 15:30:00', 4),
        ('12345678905', '98765432102', '2024-08-10 11:00:00', 5)
    ]
    
    cursor.executemany('''
        INSERT INTO ensina (cpf_prof, cpf_estudante, hora_aula, id_sala)
        VALUES (?, ?, ?, ?)
    ''', aulas)

    varinhas = [
        ('98765432101', 'Pena de fênix'),
        ('98765432102', 'Fibra de coração de dragão'),
        ('98765432103', 'Pelo de unicórnio'),
        ('98765432104', 'Pelo de unicórnio'),
        ('98765432105', 'Pelo de unicórnio'),
        ('98765432106', 'Fibra de coração de dragão'),
        ('98765432107', 'Pelo de unicórnio'),
        ('98765432108', 'Pena de fênix'),
        ('98765432109', 'Pelo de unicórnio'),
        ('98765432110', 'Fibra de coração de dragão')
    ]
    
    cursor.executemany('''
        INSERT INTO varinha (cpf_estudante, nucleo)
        VALUES (?, ?)
    ''', varinhas)

    quadribol_jogos = [
        (1, 'Grifinória 150 x 100 Sonserina', 'Grifinória', 'Capturado por Harry Potter'),
        (4, 'Corvinal 120 x 110 Lufa-Lufa', 'Corvinal', 'Capturado por Cho Chang')
    ]
    
    cursor.executemany('''
        INSERT INTO quadribol (id, placar, casa_vencedora, pomo_de_ouro)
        VALUES (?, ?, ?, ?)
    ''', quadribol_jogos)

    corridas = [
        (2, 'Luna Lovegood', 500, 'Floresta Proibida', 3),
        (3, 'Cedric Diggory', 300, 'Campos de Quadribol', 1)
    ]
    
    cursor.executemany('''
        INSERT INTO corrida_de_vassouras (id, vencedor, distancia, tipo_trajeto, nivel_perigo)
        VALUES (?, ?, ?, ?, ?)
    ''', corridas)

    participacoes = [
        ('98765432101', 1, '2024-03-01', 'Apanhador'),
        ('98765432105', 1, '2024-03-01', 'Apanhador'),
        ('98765432107', 2, '2024-04-01', 'Inscrição voluntária'),
        ('98765432108', 3, '2024-08-15', 'Apanhador'),
        ('98765432109', 2, '2024-04-01', 'Inscrição voluntária'),
        ('98765432109', 3, '2024-08-15', 'Capitão da equipe'),
        ('98765432110', 4, '2025-05-01', 'Inscrição voluntária')
    ]
    
    cursor.executemany('''
        INSERT INTO participa (cpf_estudante, id_torneio, data_inscricao, forma_selecao)
        VALUES (?, ?, ?, ?)
    ''', participacoes)

    condutas_estudantes = [
        ('98765432101', 1, 1),  # Harry - trabalho em equipe no quadribol
        ('98765432101', 2, 1),  # Harry - fair play no quadribol
        ('98765432105', 3, 1),  # Draco - falta desleal no quadribol
        ('98765432107', 7, 2),  # Luna - performance excepcional na corrida
        ('98765432109', 5, 3),  # Cedric - liderança como capitão no quadribol
        ('98765432110', 8, 4)   # Hannah - atraso na corrida
    ]
    
    cursor.executemany('''
        INSERT INTO tem (cpf_estudante, id_conduta, id_torneio)
        VALUES (?, ?, ?)
    ''', condutas_estudantes)

    conn.commit()
    print("Todas as tabelas foram populadas com sucesso!")
    
    print("\n📊 Resumo dos dados inseridos:")
    
    tabelas = [
        'professor', 'fantasma', 'sala', 'conduta', 'torneio', 
        'casa', 'estudante', 'assombra', 'ensina', 'varinha',
        'quadribol', 'corrida_de_vassouras', 'participa', 'tem'
    ]
    
    for tabela in tabelas:
        cursor.execute(f'SELECT COUNT(*) FROM {tabela}')
        count = cursor.fetchone()[0]
        print(f"  • {tabela}: {count} registros")

except sqlite3.Error as e:
    print(f"Erro ao inserir dados: {e}")
    conn.rollback()

finally:
    conn.close()

print("\n Banco de dados Hogwarts populado corretamente")
