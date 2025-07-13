
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

-- procedimento com SQL embutida e parâmetro
CREATE OR REPLACE PROCEDURE estatisticas_casa (
    p_id_casa IN NUMBER,
    p_total_estudantes OUT NUMBER,
    p_media_qi OUT NUMBER,
    p_heroismo_max OUT NUMBER
)
AS
BEGIN
    -- SQL para contar estudantes
    SELECT COUNT(*) INTO p_total_estudantes
    FROM Estudante
    WHERE ID_Casa = p_id_casa;
    
    -- SQL para calcular média de QI
    SELECT AVG(QI) INTO p_media_qi
    FROM Estudante
    WHERE ID_Casa = p_id_casa;
    
    -- SQL para encontrar máximo heroismo
    SELECT MAX(Heroismo) INTO p_heroismo_max
    FROM Estudante
    WHERE ID_Casa = p_id_casa;
END estatisticas_casa;
/

DECLARE
    v_total NUMBER;
    v_media_qi NUMBER;
    v_max_heroismo NUMBER;
BEGIN
    estatisticas_casa(1, v_total, v_media_qi, v_max_heroismo);
    
    DBMS_OUTPUT.PUT_LINE('Total estudantes: ' || v_total);
    DBMS_OUTPUT.PUT_LINE('Média QI: ' || v_media_qi);
    DBMS_OUTPUT.PUT_LINE('Máximo heroismo: ' || v_max_heroismo);
END;
/

--função que calcula a pontuação média de uma casa em torneios
CREATE OR REPLACE FUNCTION calcular_media_pontuacao_casa (
    p_id_casa IN NUMBER
) RETURN NUMBER
AS
    v_media_pontuacao NUMBER;
BEGIN
    -- SQL embutida na função
    SELECT AVG(p.Pontuacao) INTO v_media_pontuacao
    FROM Participa p
    JOIN Estudante e ON p.CPF_Participante = e.CPF
    WHERE e.ID_Casa = p_id_casa;
    
    -- Retorna o valor calculado
    RETURN NVL(v_media_pontuacao, 0); 
END calcular_media_pontuacao_casa;
/

-- Chamando a função em uma consulta SQL
SELECT 
    c.Nome AS Casa,
    calcular_media_pontuacao_casa(c.ID) AS Media_Pontuacao
FROM Casa c;

-- Trigger que valida o ano de ingresso antes de inserir
CREATE OR REPLACE TRIGGER trg_valida_ano_ingresso
BEFORE INSERT OR UPDATE OF Ano_Ingresso ON Estudante
FOR EACH ROW
BEGIN
    -- Valida que o ano de ingresso não é futuro
    IF :NEW.Ano_Ingresso > EXTRACT(YEAR FROM SYSDATE) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Ano de ingresso não pode ser no futuro');
    END IF;
    
    -- Valida que o ano de ingresso é razoável (após 1900)
    IF :NEW.Ano_Ingresso < 1900 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Ano de ingresso deve ser após 1900');
    END IF;
END;
/