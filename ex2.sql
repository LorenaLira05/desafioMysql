-- ex 2 (atualizações)

UPDATE Pacientes SET cidade = 'ilhota' WHERE nome = 'Paulo';

UPDATE consultas SET data = '2006-07-04' , hora ='12:00' WHERE codm = 1 AND codp = 4;

UPDATE pacientes SET idade = 21 AND doenca ='cancer' WHERE nome ='Ana';

UPDATE consultas SET data = '2006-06-19' , hora ='14:30' WHERE codm = 3 AND codp = 4;

DELETE FROM consultas WHERE hora = '19:30';

SELECT CONSTRAINT_NAME 
FROM information_schema.TABLE_CONSTRAINTS 
WHERE TABLE_NAME = 'Consultas' 
AND CONSTRAINT_TYPE = 'FOREIGN KEY';

ALTER TABLE Consultas DROP FOREIGN KEY consultas_ibfk_2;

ALTER TABLE Consultas 
ADD FOREIGN KEY (codp) REFERENCES Pacientes(codp) 
ON DELETE CASCADE;

DELETE FROM Pacientes WHERE idade < 10 or doenca = 'cancer';

DELETE FROM medicos WHERE cidade = 'Biguaçu' OR cidade = 'Palhoca';
-- mesmo não havendo problemas para deletar o registro nesse caso, decidimos por alterar a tabela e adicionar
-- um DELETE CASCADE na fk para manter a integridade referencial.

SELECT CONSTRAINT_NAME 
FROM information_schema.TABLE_CONSTRAINTS 
WHERE TABLE_NAME = 'Medicos' 
AND CONSTRAINT_TYPE = 'FOREIGN KEY';

ALTER TABLE Medicos DROP FOREIGN KEY medicos_ibfk_1;

ALTER TABLE Medicos 
ADD FOREIGN KEY (nroa) references Ambulatorios (nroa)
ON DELETE CASCADE;
