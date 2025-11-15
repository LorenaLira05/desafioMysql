USE clinica;

SELECT 
    nome, cpf
FROM
    medicos
WHERE
    idade < 40
        OR especialidade != 'traumatologia';


SELECT 
    *
FROM
    consultas
WHERE
    hora BETWEEN '12:01' AND '18:00'
        AND data > '2006-06-19';


SELECT 
    nome, idade
FROM
    pacientes
WHERE
    cidade != 'Florianopolis';


SELECT 
    hora
FROM
    consultas
WHERE
    data BETWEEN '2006-06-14' AND '2006-06-20';


SELECT 
    nome, (idade * 12) AS idade_meses
FROM
    pacientes;


SELECT 
    nome, cidade
FROM
    funcionarios;


SELECT 
    MIN(salario), MAX(salario)
FROM
    funcionarios
WHERE
    cidade = 'Florianopolis';


SELECT 
    MAX(hora)
FROM
    consultas
WHERE
    data = '2006-06-13';


SELECT 
    AVG(idade) AS media_idade_medicos,
    COUNT(DISTINCT nroa) AS total_ambulatorios_atendidos
FROM
    Medicos;
  
-- 12) Buscar o código, o nome e o salário líquido dos funcionários. O salário líquido é obtido
-- pela diferença entre o salário cadastrado menos 20% deste mesmo salário  
    
