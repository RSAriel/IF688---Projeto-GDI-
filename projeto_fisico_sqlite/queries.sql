
--Group by/Having
--Junção interna
--Junção externa
--Semi junção
--Anti-junção
--Subconsulta do tipo escalar
--Subconsulta do tipo linha
--Subconsulta do tipo tabela
--Operação de conjunto


-- 1. GROUP BY / HAVING
-- Encontra casas com mais de 3 estudantes
SELECT 
    c.nome as casa,
    COUNT(e.cpf) as total_estudantes
FROM casa c
LEFT JOIN estudante e ON c.id = e.id_casa
GROUP BY c.id, c.nome
HAVING COUNT(e.cpf) > 3;


-- ========================================
-- 2. JUNÇÃO INTERNA (INNER JOIN)
-- Lista estudantes com suas casas e professores responsáveis
SELECT 
    e.nome as estudante,
    c.nome as casa,
    p.nome as professor_responsavel
FROM estudante e
INNER JOIN casa c ON e.id_casa = c.id
INNER JOIN professor p ON c.cpf_prof = p.cpf;

-- ========================================
-- 3. JUNÇÃO EXTERNA (LEFT/RIGHT/FULL OUTER JOIN)
-- Lista todas as casas, mesmo as sem estudantes
SELECT 
    c.nome as casa,
    COUNT(e.cpf) as total_estudantes,
    COALESCE(p.nome, 'Sem professor') as professor
FROM casa c
LEFT JOIN estudante e ON c.id = e.id_casa
LEFT JOIN professor p ON c.cpf_prof = p.cpf
GROUP BY c.id, c.nome, p.nome;

-- Exemplo com RIGHT JOIN (simulado com LEFT JOIN):
-- Todos os professores, mesmo os sem casa atribuída
SELECT 
    p.nome as professor,
    p.materia,
    COALESCE(c.nome, 'Sem casa') as casa_responsavel
FROM professor p
LEFT JOIN casa c ON p.cpf = c.cpf_prof;

-- ========================================
-- 4. SEMI JUNÇÃO (usando EXISTS)
-- Estudantes que participam de pelo menos um torneio
SELECT DISTINCT
    e.nome,
    e.cpf
FROM estudante e
WHERE EXISTS (
    SELECT 1 
    FROM participa p 
    WHERE p.cpf_estudante = e.cpf
);


-- ========================================
-- 5. ANTI-JUNÇÃO (usando NOT EXISTS)
-- Estudantes que NÃO participam de nenhum torneio
SELECT 
    e.nome,
    e.cpf,
    c.nome as casa
FROM estudante e
INNER JOIN casa c ON e.id_casa = c.id
WHERE NOT EXISTS (
    SELECT 1 
    FROM participa p 
    WHERE p.cpf_estudante = e.cpf
);

-- ========================================
-- 6. SUBCONSULTA DO TIPO ESCALAR
-- Nome do estudante mais antigo da escola
SELECT 
    nome,
    data_ingresso
FROM estudante
WHERE data_ingresso = (
    SELECT MIN(data_ingresso) 
    FROM estudante
);


-- ========================================
-- 7. SUBCONSULTA DO TIPO LINHA
-- Estudantes da mesma casa e sangue do Harry Potter 
SELECT nome
FROM estudante
WHERE (id_casa, sangue) = (
    SELECT id_casa, sangue
    FROM estudante
    WHERE nome = 'Harry Potter'
);


-- ========================================
-- 8. SUBCONSULTA DO TIPO TABELA
-- Professores que ensinam alunos da casa que supervisionam
SELECT 
    p.nome as professor,
    c.nome as casa_supervisionada,
    COUNT(DISTINCT e.cpf) as estudantes_da_casa
FROM professor p
JOIN casa c ON p.cpf = c.cpf_prof
JOIN ensina en ON p.cpf = en.cpf_prof
JOIN estudante e ON en.cpf_estudante = e.cpf
WHERE e.id_casa = c.id
GROUP BY p.cpf, p.nome, c.nome;


-- ========================================
-- 9. OPERAÇÃO DE CONJUNTO

-- UNION: Todos os nomes (professores e estudantes)
SELECT nome, 'Professor' as tipo, cpf as identificador
FROM professor
UNION
SELECT nome, 'Estudante' as tipo, cpf as identificador
FROM estudante
ORDER BY nome;


