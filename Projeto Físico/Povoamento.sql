-- 1. PROFESSORES
INSERT ALL
  INTO Professor (CPF, Nome, Materia, Data_Ingresso) VALUES ('11111111111', 'Minerva McGonagall', 'Transfiguração', TO_DATE('01/09/1970', 'DD/MM/YYYY'))
  INTO Professor (CPF, Nome, Materia, Data_Ingresso) VALUES ('22222222222', 'Severo Snape', 'Poções', TO_DATE('10/01/1980', 'DD/MM/YYYY'))
  INTO Professor (CPF, Nome, Materia, Data_Ingresso) VALUES ('33333333333', 'Filius Flitwick', 'Feitiços', TO_DATE('15/02/1975', 'DD/MM/YYYY'))
  INTO Professor (CPF, Nome, Materia, Data_Ingresso) VALUES ('44444444444', 'Pomona Sprout', 'Herbologia', TO_DATE('20/03/1978', 'DD/MM/YYYY'))
SELECT * FROM dual;

-- 2. SALAS
INSERT ALL
  INTO Sala (ID, Numero_Cadeiras) VALUES (101, 30)
  INTO Sala (ID, Numero_Cadeiras) VALUES (102, 25)
  INTO Sala (ID, Numero_Cadeiras) VALUES (103, 40)
  INTO Sala (ID, Numero_Cadeiras) VALUES (104, 20)
SELECT * FROM dual;

-- 3. TORNEIOS
INSERT ALL
  INTO Torneio (ID, Titulo, Inicio, Fim) VALUES (1, 'Mundial de Corrida de Vassouras', TO_DATE('01/10/1994', 'DD/MM/YYYY'), TO_DATE('24/06/1997', 'DD/MM/YYYY'))
  INTO Torneio (ID, Titulo, Inicio, Fim) VALUES (2, 'Copa de Quadribol Escolar', TO_DATE('01/09/1993', 'DD/MM/YYYY'), TO_DATE('30/06/1994', 'DD/MM/YYYY'))
  INTO Torneio (ID, Titulo, Inicio, Fim) VALUES (3, 'Corrida de Vassouras Anual', TO_DATE('05/05/1995', 'DD/MM/YYYY'), TO_DATE('10/05/1995', 'DD/MM/YYYY'))
SELECT * FROM dual;

-- 4. FANTASMAS
INSERT ALL
  INTO Fantasma (CPM, Nome, Data_Obito) VALUES ('90000000001', 'Nick Quase Sem Cabeça', TO_DATE('31/10/1492', 'DD/MM/YYYY'))
  INTO Fantasma (CPM, Nome, Data_Obito) VALUES ('90000000002', 'Barão Sangrento', TO_DATE('20/11/1600', 'DD/MM/YYYY'))
  INTO Fantasma (CPM, Nome, Data_Obito) VALUES ('90000000003', 'Dama Cinzenta', TO_DATE('14/09/1400', 'DD/MM/YYYY'))
  INTO Fantasma (CPM, Nome, Data_Obito) VALUES ('90000000004', 'Frei Gorducho', TO_DATE('22/04/1300', 'DD/MM/YYYY'))
SELECT * FROM dual;

-- 5. CASAS
INSERT ALL
  INTO Casa (ID, Nome, Brasao, Nome_Fundador, Nascimento_Fundador, CPF_Prof) VALUES (1, 'Grifinória', 'Leão', 'Godric Gryffindor', TO_DATE('01/01/1000', 'DD/MM/YYYY'), '11111111111')
  INTO Casa (ID, Nome, Brasao, Nome_Fundador, Nascimento_Fundador, CPF_Prof) VALUES (2, 'Sonserina', 'Serpente', 'Salazar Slytherin', TO_DATE('15/06/0995', 'DD/MM/YYYY'), '22222222222')
  INTO Casa (ID, Nome, Brasao, Nome_Fundador, Nascimento_Fundador, CPF_Prof) VALUES (3, 'Corvinal', 'Águia', 'Rowena Ravenclaw', TO_DATE('10/03/0990', 'DD/MM/YYYY'), '33333333333')
  INTO Casa (ID, Nome, Brasao, Nome_Fundador, Nascimento_Fundador, CPF_Prof) VALUES (4, 'Lufa-Lufa', 'Texugo', 'Helga Hufflepuff', TO_DATE('05/08/0985', 'DD/MM/YYYY'), '44444444444')
SELECT * FROM dual;

-- 6. CORES
INSERT ALL
  INTO Cores (ID, Cor) VALUES (1, 'Vermelho')
  INTO Cores (ID, Cor) VALUES (1, 'Dourado')
  INTO Cores (ID, Cor) VALUES (2, 'Verde')
  INTO Cores (ID, Cor) VALUES (2, 'Prata')
  INTO Cores (ID, Cor) VALUES (3, 'Azul')
  INTO Cores (ID, Cor) VALUES (3, 'Bronze')
  INTO Cores (ID, Cor) VALUES (4, 'Amarelo')
  INTO Cores (ID, Cor) VALUES (4, 'Preto')
SELECT * FROM dual;

-- 7. ASSOMBRA
INSERT ALL
  INTO Assombra (ID, CPM) VALUES (1, '90000000001')
  INTO Assombra (ID, CPM) VALUES (2, '90000000002')
  INTO Assombra (ID, CPM) VALUES (3, '90000000003')
  INTO Assombra (ID, CPM) VALUES (4, '90000000004')
SELECT * FROM dual;

-- 8. ESTUDANTES
INSERT ALL
  INTO Estudante (CPF, Nome, Sangue, Ano_Ingresso, CPF_Monitor, QI, Companheirismo, Ambicao, Heroismo, ID_Casa) VALUES ('55555555555', 'Harry Potter', 'Mestiço', 1991, NULL, 120, 85, 50, 95, 1)
  INTO Estudante (CPF, Nome, Sangue, Ano_Ingresso, CPF_Monitor, QI, Companheirismo, Ambicao, Heroismo, ID_Casa) VALUES ('66666666666', 'Hermione Granger', 'Nascida Trouxa', 1991, '55555555555', 150, 90, 60, 80, 1)
  INTO Estudante (CPF, Nome, Sangue, Ano_Ingresso, CPF_Monitor, QI, Companheirismo, Ambicao, Heroismo, ID_Casa) VALUES ('77777777777', 'Draco Malfoy', 'Puro', 1991, NULL, 110, 40, 95, 30, 2)
  INTO Estudante (CPF, Nome, Sangue, Ano_Ingresso, CPF_Monitor, QI, Companheirismo, Ambicao, Heroismo, ID_Casa) VALUES ('88888888888', 'Luna Lovegood', 'Puro', 1992, NULL, 140, 95, 50, 75, 3)
  INTO Estudante (CPF, Nome, Sangue, Ano_Ingresso, CPF_Monitor, QI, Companheirismo, Ambicao, Heroismo, ID_Casa) VALUES ('99999999999', 'Cedrico Diggory', 'Puro', 1990, NULL, 125, 80, 70, 85, 4)
  INTO Estudante (CPF, Nome, Sangue, Ano_Ingresso, CPF_Monitor, QI, Companheirismo, Ambicao, Heroismo, ID_Casa) VALUES ('10101010101', 'Cho Chang', 'Mestiço', 1990, '88888888888', 130, 70, 55, 60, 3)
  INTO Estudante (CPF, Nome, Sangue, Ano_Ingresso, CPF_Monitor, QI, Companheirismo, Ambicao, Heroismo, ID_Casa) VALUES ('12121212121', 'Millicent Bulstrode', 'Puro', 1991, '77777777777', 105, 50, 85, 40, 2)
  INTO Estudante (CPF, Nome, Sangue, Ano_Ingresso, CPF_Monitor, QI, Companheirismo, Ambicao, Heroismo, ID_Casa) VALUES ('13131313131', 'Susan Bones', 'Mestiço', 1991, '99999999999', 115, 75, 65, 60, 4)
  INTO Estudante (CPF, Nome, Sangue, Ano_Ingresso, CPF_Monitor, QI, Companheirismo, Ambicao, Heroismo, ID_Casa) VALUES ('14141414141', 'Neville Longbottom', 'Puro', 1991, NULL, 95, 80, 40, 70, 4)
  INTO Estudante (CPF, Nome, Sangue, Ano_Ingresso, CPF_Monitor, QI, Companheirismo, Ambicao, Heroismo, ID_Casa) VALUES ('15151515151', 'Fred Weasley', 'Puro', 1990, NULL, 115, 85, 70, 85, 1)
  INTO Estudante (CPF, Nome, Sangue, Ano_Ingresso, CPF_Monitor, QI, Companheirismo, Ambicao, Heroismo, ID_Casa) VALUES ('16161616161', 'George Weasley', 'Puro', 1990, NULL, 113, 80, 75, 85, 1)
  INTO Estudante (CPF, Nome, Sangue, Ano_Ingresso, CPF_Monitor, QI, Companheirismo, Ambicao, Heroismo, ID_Casa) VALUES ('17171717171', 'Pansy Parkinson', 'Puro', 1992, NULL, 100, 40, 90, 30, 2)
SELECT * FROM dual;

-- 9. VARINHAS
INSERT ALL
  INTO Varinha (CPF, Nome, Poder) VALUES ('55555555555', 'Azevinho e Pena de Fênix', 95)
  INTO Varinha (CPF, Nome, Poder) VALUES ('66666666666', 'Videira e Fibra de Coração de Dragão', 90)
  INTO Varinha (CPF, Nome, Poder) VALUES ('77777777777', 'Espinheiro e Corda de Veela', 88)
  INTO Varinha (CPF, Nome, Poder) VALUES ('88888888888', 'Cerejeira e Pêlo de Unicórnio', 87)
  INTO Varinha (CPF, Nome, Poder) VALUES ('99999999999', 'Freixo e Pena de Hipogrifo', 89)
  INTO Varinha (CPF, Nome, Poder) VALUES ('10101010101', 'Ébano e Corda de Veela', 86)
  INTO Varinha (CPF, Nome, Poder) VALUES ('12121212121', 'Teixo e Escama de Basilisco', 84)
  INTO Varinha (CPF, Nome, Poder) VALUES ('13131313131', 'Carvalho e Pêlo de Trasgo', 82)
SELECT * FROM dual;

-- 10. ENSINA
INSERT ALL
  INTO Ensina (CPF_Professor, CPF_Aluno, Hora_Aula, ID_Sala) VALUES ('11111111111', '55555555555', TO_TIMESTAMP('08:00', 'HH24:MI'), 101)
  INTO Ensina (CPF_Professor, CPF_Aluno, Hora_Aula, ID_Sala) VALUES ('11111111111', '66666666666', TO_TIMESTAMP('08:00', 'HH24:MI'), 101)
  INTO Ensina (CPF_Professor, CPF_Aluno, Hora_Aula, ID_Sala) VALUES ('22222222222', '77777777777', TO_TIMESTAMP('09:00', 'HH24:MI'), 102)
  INTO Ensina (CPF_Professor, CPF_Aluno, Hora_Aula, ID_Sala) VALUES ('22222222222', '12121212121', TO_TIMESTAMP('09:00', 'HH24:MI'), 102)
  INTO Ensina (CPF_Professor, CPF_Aluno, Hora_Aula, ID_Sala) VALUES ('33333333333', '88888888888', TO_TIMESTAMP('10:00', 'HH24:MI'), 103)
  INTO Ensina (CPF_Professor, CPF_Aluno, Hora_Aula, ID_Sala) VALUES ('33333333333', '10101010101', TO_TIMESTAMP('10:00', 'HH24:MI'), 103)
  INTO Ensina (CPF_Professor, CPF_Aluno, Hora_Aula, ID_Sala) VALUES ('44444444444', '99999999999', TO_TIMESTAMP('11:00', 'HH24:MI'), 104)
  INTO Ensina (CPF_Professor, CPF_Aluno, Hora_Aula, ID_Sala) VALUES ('44444444444', '13131313131', TO_TIMESTAMP('11:00', 'HH24:MI'), 104)
SELECT * FROM dual;

-- 11. PARTICIPA
INSERT ALL
  INTO Participa (CPF_Participante, ID_Torneio, Data_Inscricao, Pontuacao, Infracao, Forma_Selecao) VALUES ('55555555555', 1, TO_DATE('15/09/1994', 'DD/MM/YYYY'), 85, 0, 'Indicação')
  INTO Participa (CPF_Participante, ID_Torneio, Data_Inscricao, Pontuacao, Infracao, Forma_Selecao) VALUES ('99999999999', 1, TO_DATE('16/09/1994', 'DD/MM/YYYY'), 90, 0, 'Seleção da Taça')
  INTO Participa (CPF_Participante, ID_Torneio, Data_Inscricao, Pontuacao, Infracao, Forma_Selecao) VALUES ('77777777777', 2, TO_DATE('10/08/1993', 'DD/MM/YYYY'), 95, 0, 'Capitão')
  INTO Participa (CPF_Participante, ID_Torneio, Data_Inscricao, Pontuacao, Infracao, Forma_Selecao) VALUES ('88888888888', 2, TO_DATE('10/08/1993', 'DD/MM/YYYY'), 87, 0, 'Treinamento')
  INTO Participa (CPF_Participante, ID_Torneio, Data_Inscricao, Pontuacao, Infracao, Forma_Selecao) VALUES ('13131313131', 3, TO_DATE('01/05/1995', 'DD/MM/YYYY'), 80, 0, 'Provas Internas')
  INTO Participa (CPF_Participante, ID_Torneio, Data_Inscricao, Pontuacao, Infracao, Forma_Selecao) VALUES ('10101010101', 3, TO_DATE('01/05/1995', 'DD/MM/YYYY'), 78, 1, 'Sorteio')
SELECT * FROM dual;

-- 12. QUADRIBOL
INSERT ALL
  INTO Quadribol (ID, Casa_Vencedora, Pomo_de_Ouro) VALUES (2, 'Grifinória', 1)
SELECT * FROM dual;

-- 13. CORRIDA DE VASSOURAS
INSERT ALL
  INTO Corrida_Vassouras (ID, Vencedor, Distancia, Tipo_Trajeto, Nivel_Perigo) VALUES (1, '99999999999', 5.2, 'Montanhas da Noruega', 2)
  INTO Corrida_Vassouras (ID, Vencedor, Distancia, Tipo_Trajeto, Nivel_Perigo) VALUES (3, '13131313131', 3.5, 'Floresta Proibida', 5)
SELECT * FROM dual;