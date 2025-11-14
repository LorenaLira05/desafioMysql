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
codm int primary key,
codp int,
data date,
hora time,
foreign key (codp) references Pacientes (codp),
foreign key (codm) references Medicos(codm)
);

alter table Funcionarios add column (nroa int); 

create unique index idx_med_cpf on Medicos(CPF);

create index idx_pac_doenca on Pacientes(doenca);

drop index idx_pac_doenca on Pacientes;

alter table Funcionarios drop column cargo, drop column nroa;
