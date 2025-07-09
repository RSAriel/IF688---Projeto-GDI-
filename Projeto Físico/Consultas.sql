
-- 1. Group By/Having:
-- Lista as casas que têm mais de 3 estudantes, mostrando o nome da casa e a quantidade de estudantes.
SELECT 
  c.Nome AS Casa,
  COUNT(e.CPF) AS Total_Estudantes
FROM Estudante e
JOIN Casa c ON e.ID_Casa = c.ID
GROUP BY c.Nome
HAVING COUNT(e.CPF) > 3;


-- 2. Junção Interna (INNER JOIN):
-- Lista o nome de cada estudante e o nome da casa à qual pertence.

SELECT E.Nome AS Nome_Estudante, C.Nome AS Nome_Casa
FROM Estudante E INNER JOIN  Casa C ON E.ID_Casa = C.ID;

-- 3. Junção Externa (LEFT JOIN):
-- Listar todos os estudantes com a pontuação que tiveram em torneios (se tiverem participado).
SELECT e.Nome AS Estudante, p.Pontuacao
FROM Estudante e
LEFT JOIN Participa p ON e.CPF = p.CPF_Participante
WHERE p.Pontuacao IS NOT NULL;


-- 4. Semi-junção (usando EXISTS):
-- Seleciona os estudantes que participaram de pelo menos um torneio.
SELECT e.CPF, e.Nome
FROM Estudante e
WHERE EXISTS (
    SELECT 1
    FROM Participa p
    WHERE p.CPF_Participante = e.CPF
);

-- 5. Anti-junção (usando NOT EXISTS):
-- Lista os nomes dos estudantes que NÃO participaram de nenhum torneio.
SELECT
    E.Nome AS Nome_Estudante
FROM
    Estudante E
WHERE
    NOT EXISTS (SELECT 1 FROM Participa P WHERE P.CPF_Participante = E.CPF);

-- 6. Subconsulta do Tipo Escalar:
-- Encontra o nome do estudante com o maior QI.
SELECT
    Nome AS Nome_Estudante_Maior_QI
FROM
    Estudante
WHERE
    QI = (SELECT MAX(QI) FROM Estudante);


-- 7. Subconsulta do Tipo Lina
-- Mostra a sala com o maior número de cadeiras e a média de cadeiras de todas as salas.

SELECT 
    ID,
    Numero_Cadeiras,
    (SELECT AVG(Numero_Cadeiras) FROM Sala) AS Media_Cadeiras
FROM Sala
WHERE Numero_Cadeiras = (
    SELECT MAX(Numero_Cadeiras) FROM Sala
);

-- 8. Subconsulta do Tipo Tabela
-- Retorna todos os fantasmas que morreram antes de 1500.
SELECT *
FROM Fantasma
WHERE Nome IN (
    SELECT Nome
    FROM Fantasma
    WHERE Data_Obito < TO_DATE('01/01/1500', 'DD/MM/YYYY')
);

-- 9. Subconsulta com  operação de conjunto UNION
-- Lista os nomes e cpfds de todos os estudantes e professores

SELECT CPF, Nome FROM Professor
UNION
SELECT CPF, Nome FROM Estudante;