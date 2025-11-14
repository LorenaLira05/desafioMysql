-- ex 2 (atualizações)
update Pacientes set cidade = 'ilhota' where nome = 'Paulo';

update consultas set data = '2006-07-04' , hora ='12:00' where codm = 1 and codp = 4;

update pacientes set idade = 21 and doenca ='cancer' where nome ='Ana';

update consultas set data = '2006-06-19' , hora ='14:30' where codm = 3 and codp = 4;

delete from consultas where hora = '19:30';

SELECT CONSTRAINT_NAME 
FROM information_schema.TABLE_CONSTRAINTS 
WHERE TABLE_NAME = 'Consultas' 
AND CONSTRAINT_TYPE = 'FOREIGN KEY';

ALTER TABLE Consultas DROP FOREIGN KEY consultas_ibfk_2;

ALTER TABLE Consultas 
ADD FOREIGN KEY (codp) REFERENCES Pacientes(codp) 
ON DELETE CASCADE;

DELETE FROM Pacientes WHERE idade < 10 or doenca = 'cancer';

delete from medicos where cidade = 'Biguaçu' or cidade = 'Palhoca';
-- mesmo não havendo problemas para deletar o registro nesse caso, decidimos por alterar a tabela e adicionar
-- um DELETE CASCADE na fk para manter a integridade referencial.

SELECT CONSTRAINT_NAME 
FROM information_schema.TABLE_CONSTRAINTS 
WHERE TABLE_NAME = 'Medicos' 
AND CONSTRAINT_TYPE = 'FOREIGN KEY';

Alter table Medicos drop foreign key medicos_ibfk_1;

ALTER TABLE Medicos 
ADD FOREIGN KEY (nroa) references Ambulatorios (nroa)
ON DELETE CASCADE;
