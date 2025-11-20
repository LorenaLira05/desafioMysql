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
  
SELECT 
    codf, nome, salario - (salario * 0.20) AS salario_liquido
FROM
    funcionarios;
    
SELECT 
    nome
FROM
    funcionarios
WHERE
    nome LIKE '%a';


SELECT 
    nome, cpf
FROM
    funcionarios
WHERE
    cpf NOT LIKE '%00000%';

    
SELECT nome, especialidade
FROM medicos
WHERE nome LIKE '_O%O';

SELECT 
    codp, nome
FROM
    pacientes
WHERE
    idade > 25
        AND doenca IN ('tendinite' , 'fratura', 'gripe', 'sarampo'); 
    
