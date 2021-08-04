create database teste;
use teste;

create table estudante (
	id int primary key auto_increment,
    cpf varchar(11) unique,
    nome varchar(40) not null,
    sexo char(1) check (sexo = 'M' or sexo = 'F'),
    data_nascimento date
);
