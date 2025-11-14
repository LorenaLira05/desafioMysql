CREATE DATABASE Clinica;

USE Clinica;

CREATE TABLE Ambulatorios (
nroa int primary key ,
andar numeric(3) not null,
capacidade smallint
);

CREATE TABLE Medicos (
codm int primary key ,
nome varchar(40) not null,
idade smallint not null,
especialidade char(20),
CPF numeric(11) unique,
cidade varchar(30),
nroa int,
foreign key (nroa) references Ambulatorios (nroa)
);

CREATE TABLE Pacientes (
codp int primary key,
nome varchar(40) not null,
idade smallint not null,
cidade char(30),
CPF numeric (11) unique,
doenca varchar(40) not null
);

CREATE TABLE Funcionarios(
codf int primary key,
nome varchar(40) not null,
idade smallint,
CPF numeric (11) unique,
cidade char(30),
salario numeric(10),
cargo varchar(20)
);

CREATE TABLE Consultas(
    codm int,
    codp int,
    data date,
    hora time,
    PRIMARY KEY (codm, codp, data),
    foreign key (codp) references Pacientes (codp),
    foreign key (codm) references Medicos(codm)
);

alter table Funcionarios add column (nroa int); 

create unique index idx_med_cpf on Medicos(CPF);

create index idx_pac_doenca on Pacientes(doenca);

drop index idx_pac_doenca on Pacientes;

alter table Funcionarios drop column cargo, drop column nroa;

-- adicionando registros

INSERT INTO Ambulatorios (nroa, andar, capacidade) VALUES
(1, 1, 30),
(2, 1, 50),
(3, 2, 40),
(4, 2, 25),
(5, 2, 55);

INSERT INTO Medicos (codm, nome, idade, especialidade, CPF, cidade, nroa) VALUES
(1, 'Joao', 40, 'ortopedia', '10000100000', 'Florianopolis', 1),
(2, 'Maria', 42, 'traumatologia', '10000110000', 'Blumenau', 2),
(3, 'Pedro', 51, 'pediatria', '11000100000', 'São José', 2),
(4, 'Carlos', 28, 'ortopedia', '11000110000', 'Joinville', null),
(5, 'Marcia', 33, 'neurologia', '11000111000', 'Biguaçu', 3);

INSERT INTO Pacientes (codp, nome, idade, cidade, CPF, doenca) VALUES
(1, 'Ana',   20, 'Florianopolis', '20000200000', 'gripe'),
(2, 'Paulo', 24, 'Palhoca','20000220000', 'fratura'),
(3, 'Lucia', 30, 'Biguaçu', '22000200000', 'tendinite'),
(4, 'Carlos',28, 'Joinville', '11000110000', 'sarampo');

INSERT INTO Funcionarios (codf, nome, idade, cidade, salario, CPF) VALUES
(1, 'Rita',  32, 'Sao Jose', 1200, '20000100000'),
(2, 'Maria', 55, 'Palhoca',  1220, '30000110000'),
(3, 'Caio',45, 'Florianopolis', 1100, '41000100000'),
(4, 'Carlos', 44, 'Florianopolis',  1200, '51000110000'),
(5, 'Paula', 33, 'Florianopolis', 2500, '61000111000');

INSERT INTO Consultas (codm, codp, data, hora) VALUES
(1, 1, '2006-06-12', '14:00'),
(1, 4, '2006-06-13', '10:00'),
(2, 1, '2006-06-13', '09:00'),
(2, 2, '2006-06-13', '11:00'),
(2, 3, '2006-06-14', '14:00'),
(2, 4, '2006-06-14', '17:00'),
(3, 1, '2006-06-19', '18:00'),
(3, 3, '2006-06-12', '10:00'),
(3, 4, '2006-06-19', '13:00'),
(4, 4, '2006-06-20', '13:00'),
(4, 4, '2006-06-22', '19:30');

