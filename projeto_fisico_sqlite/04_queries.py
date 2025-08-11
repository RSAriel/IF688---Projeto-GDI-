import sqlite3

conn = sqlite3.connect('hogwarts.db')
cursor = conn.cursor()

def execute_query(query, description):
    print(f"\n{'='*50}")
    print(f"QUERY: {description}")
    print(f"{'='*50}")
    try:
        cursor.execute(query)
        results = cursor.fetchall()
        
        columns = [description[0] for description in cursor.description]
        
        print(" | ".join(columns))
        print("-" * (len(" | ".join(columns))))
        
        for row in results:
            print(" | ".join(str(item) for item in row))
        
        print(f"\nTotal rows: {len(results)}")
        
    except sqlite3.Error as e:
        print(f"Error executing query: {e}")

# 1. GROUP BY / HAVING
query1 = '''
SELECT 
    c.nome as casa,
    COUNT(e.cpf) as total_estudantes
FROM casa c
LEFT JOIN estudante e ON c.id = e.id_casa
GROUP BY c.id, c.nome
HAVING COUNT(e.cpf) > 3;
'''
execute_query(query1, "1. GROUP BY / HAVING - Casas com mais de 3 estudantes")

# 2. JUNÇÃO INTERNA (INNER JOIN)
query2 = '''
SELECT 
    e.nome as estudante,
    c.nome as casa,
    p.nome as professor_responsavel
FROM estudante e
INNER JOIN casa c ON e.id_casa = c.id
INNER JOIN professor p ON c.cpf_prof = p.cpf;
'''
execute_query(query2, "2. INNER JOIN - Estudantes com casas e professores responsáveis")

# 3. JUNÇÃO EXTERNA (LEFT JOIN)
query3 = '''
SELECT 
    c.nome as casa,
    COUNT(e.cpf) as total_estudantes,
    COALESCE(p.nome, 'Sem professor') as professor
FROM casa c
LEFT JOIN estudante e ON c.id = e.id_casa
LEFT JOIN professor p ON c.cpf_prof = p.cpf
GROUP BY c.id, c.nome, p.nome;
'''
execute_query(query3, "3. LEFT JOIN - Todas as casas, mesmo sem estudantes")

# 4. SEMI JUNÇÃO (usando EXISTS)
query4 = '''
SELECT DISTINCT
    e.nome,
    e.cpf
FROM estudante e
WHERE EXISTS (
    SELECT 1 
    FROM participa p 
    WHERE p.cpf_estudante = e.cpf
);
'''
execute_query(query4, "4. SEMI JOIN - Estudantes que participam de torneios")

# 5. ANTI-JUNÇÃO (usando NOT EXISTS)
query5 = '''
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
'''
execute_query(query5, "5. ANTI JOIN - Estudantes que NÃO participam de torneios")

# 6. SUBCONSULTA DO TIPO ESCALAR
query6 = '''
SELECT 
    nome,
    data_ingresso
FROM estudante
WHERE data_ingresso = (
    SELECT MIN(data_ingresso) 
    FROM estudante
);
'''
execute_query(query6, "6. SCALAR SUBQUERY - Estudante mais antigo")

# 7. SUBCONSULTA DO TIPO LINHA
query7 = '''
SELECT nome
FROM estudante
WHERE (id_casa, sangue) = (
    SELECT id_casa, sangue
    FROM estudante
    WHERE nome = 'Harry Potter'
);
'''
execute_query(query7, "7. ROW SUBQUERY - Estudantes da mesma casa e sangue do Harry Potter ")

# 8. SUBCONSULTA DO TIPO TABELA
query8 = '''
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

'''
execute_query(query8, "8. SUBCONSULTA DO TIPO TABELA - Professores que ensinam alunos da casa que supervisionam")

# 9. OPERAÇÕES DE CONJUNTO - UNION
query9 = '''
SELECT nome, 'Professor' as tipo, cpf as identificador
FROM professor
UNION
SELECT nome, 'Estudante' as tipo, cpf as identificador
FROM estudante
ORDER BY nome;
'''
execute_query(query9, "9. SET OPERATIONS - UNION de professores e estudantes")


print("\n" + "="*50)
print("Todas as queries foram executadas!")
print("="*50)

# Close connection
conn.close()