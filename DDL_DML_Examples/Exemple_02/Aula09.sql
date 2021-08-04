CREATE DATABASE aula09;  -- criação da BD
USE aula09;  -- conectar à BD teste

 

CREATE TABLE TABELA01 (
	ID int,
    nome varchar(40) not null,
    datanasc date,
	equipe varchar(38) default 'Santos',
    constraint TAB01_TK primary key(ID),
    constraint TAB01_CPF_UK unique(CPF),
    constraint TAB01_NASCIMENTO_CK check (dataNascimento >= '1900-01-01')
);

CREATE TABLE TABELA02 (
	ID int primary key,
    descricao varchar(20),
    id_tab01 int,
    constraint tab02_IDTAB01_FK foreign key(ID_TAB01) references TABELA01(id)
);

desc TABELA01;

alter table  TABELA01 add sexo char(1);
alter table  TABELA01 modify equipe char(40);
alter table  TABELA01 change datanasc data_nasc date;
alter table  TABELA01 drop sexo;
alter table  TABELA02 drop foreign key TAB02_IDTAB1_FK;