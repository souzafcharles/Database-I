CREATE DATABASE aula08;  -- criação da BD
USE aula08;  -- conectar à BD teste

CREATE TABLE EMPREGADO (
codigo int NOT NULL,
nome varchar(60) NOT NULL,
cpf varchar(14) NOT NULL,
sexo char(1),
datanasc date,
logradouro varchar(50),
nro int,
salario decimal(8,2) NOT NULL,
depto_num int,
codigo_ger int,
CONSTRAINT empregado_pk PRIMARY KEY (codigo),
CONSTRAINT empregado_sexo_ck CHECK (sexo in ('M','F','m','f')),
CONSTRAINT empregado_salario_ck CHECK (salario > 0)
);

CREATE TABLE DEPARTAMENTO (
numero INT,
nome VARCHAR(20),
codigo_ger INT,
data_inicio_ger DATE,
CONSTRAINT depto_pk PRIMARY KEY (numero),
CONSTRAINT depto_nome_uk UNIQUE(nome),
CONSTRAINT depto_codger_fk FOREIGN KEY(codigo_ger) REFERENCES EMPREGADO(codigo)
);

desc DEPARTAMENTO;

insert into DEPARTAMENTO values (10, 'Vendas', null, null);
insert into DEPARTAMENTO values (20, 'Compras', null, null);
select * from DEPARTAMENTO;

desc EMPREGADO;

insert into EMPREGADO values (1, 'João Silva', '123456', 'M', '2001-08-13',
'Rua XV de Novembro', 214, 2750.85, 10, NULL);
insert into EMPREGADO values (2, 'Maria Joaquina', '897000', 'F', '2003-11-03',
NULL, NULL, 1988.5, 20, 1);

select * from EMPREGADO;

insert into departamento(nome, numero) values('Fiscal', 30);
insert into empregado(codigo, nome, cpf, salario) values (3, 'Joãozinho', '000111', 592);

update DEPARTAMENTO set CODIGO_GER = 2 where NUMERO = 30;
update DEPARTAMENTO set data_inicio_ger = '2020-02-18' where numero = 30;

