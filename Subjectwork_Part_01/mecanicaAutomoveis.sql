/*
Class title: Database-I
Lecturer: Prof. Dr. Fábio Roberto Octaviano
Example adapted by: Charles Fernandes de Souza
Date: December 15, 2020
*/

create database mecanicaAutomoveis;
use mecanicaAutomoveis;

create table ordem_servico (
	numero_OS int not null, 
	data_emissao date not null, 
	data_conclusao date, 
	valor decimal(8,2)not null, 
    descricao varchar(255) not null,
    constraint ordem_servico_pk primary key (numero_OS),
    constraint ordemServico_ck check (valor > 0)
);

create table pessoa (
	codigo int not null, 
    nome varchar(60) not null,
    cpf varchar(14) not null,
    endereco varchar(255) not null,
    constraint pessoa_pk primary key (codigo)
);

create table proprietario(
	codigo_proprietario int not null, 
	email varchar(60), 
    telefone varchar(60) not null, 
    constraint proprietario_pk primary key (codigo_proprietario),
    constraint proprietario_codigoPessoa_fk foreign key (codigo_proprietario) references pessoa(codigo)
);

create table mecanico(
	codigo_mecanico int not null, 
    numero_OS int,
    especialidade varchar(60) not null, 
    constraint mecanico_pk primary key (codigo_mecanico),
    constraint mecanico_codigoPessoa_fk foreign key (codigo_mecanico) references pessoa(codigo),
    constraint mecanico_numeroOS_fk foreign key (numero_OS) references ordem_servico(numero_OS)
);

create table veiculo(
	codigo_veiculo int not null, 
	descricao varchar(255), 
	placa varchar(7) not null, 
	codigo_proprietario int, 
	numero_OS int,
    constraint veiculo_pk primary key (codigo_veiculo),
    constraint veiculo_placa_uk unique (placa),
    constraint veiculo_codigoProprietario_fk foreign key (codigo_proprietario) references proprietario(codigo_proprietario),
    constraint veiculo_numeroOS_fk foreign key (numero_OS) references ordem_servico(numero_OS)
);

create table peca(
	numero_OS int not null, 
    id int not null, 
    tamanho char(1), 
    preco decimal(8,2) not null,
    constraint dependente_pk primary key (numero_OS, id),
    constraint peca_tamanho_ck check (tamanho in ('P','p','M','m', 'G','g')),
    constraint peca_preco_ck check (preco > 0),
    constraint peca_numeroOS_fk foreign key (numero_OS) references ordem_servico(numero_OS)
);

create table requer(
    numero_OS int not null,
    id_peca int not null,
    constraint orca_pk primary key (numero_OS,id_peca),
    constraint orca_numeroOS_fk foreign key (numero_OS) references ordem_servico(numero_OS)
);

insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao) values (1110001, '2018-10-27', '2018-10-28', 400.00, 'Manutenção da embreagem');
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao) values (1118902, '2019-03-01', '2019-03-03', 800.00, 'Revisão dos componentes de Freio');
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao) values (1585253, '2020-01-30', null, 2500.00, 'Revisão no Sistema de Arrefecimento e Alinhamento e Balanceamento');
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao) values (1999654, '2019-11-03', '2019-11-04', 800.00, 'Troca de óleo do motor');
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao) values (1148705, '2017-04-17', null, 1700.00, 'Troca de filtros, troca de óleo do motor e manutenção da embreagem');
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao) values (1119607, '2019-07-01', '2019-07-03', 200.00, 'Troca de lâmpadas');
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao) values (1004786, '2017-07-22', '2017-07-25', 1100.00, 'Alinhamento e Balanceamento e troca de óleo do motor');
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao) values (1112356, '2019-06-12', '2019-06-15', 1300.00, 'Troca de óleo do motor e manutenção da embreagem');
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao) values (1001241, '2018-08-27', '2018-08-29', 500.00, 'Manutenção da embreagem');
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao) values (1112222, '2020-03-13', '2020-03-14', 1000.00, 'Checagem do motor');

insert into pessoa (codigo, nome , cpf , endereco) values (0000965, 'Jasmeen Teles Chousa', '112.355.758-03', 'Av. Araraquara, 12, Vila São Jose, São Carlos, 13560-340');
insert into pessoa (codigo, nome , cpf , endereco) values (0000155, 'Joaquim Thiago', '852.852.558-34', 'Av. São Carlos, 33, apto. 65, Centro, São Carlos, SP, 13565-757');
insert into pessoa (codigo, nome , cpf , endereco) values (0000245, 'Marcia Zavanella', '632.620.748-15', 'Rua das Rosas, 12, Cidade Jardim, São Carlos, SP, 13565-200');
insert into pessoa (codigo, nome , cpf , endereco) values (0000712, 'Otto Zimmond', '113.356.968-99', ' Rua Sebastião Conte, 40, Parque Fehr, São Carlos, SP, 13560-000');
insert into pessoa (codigo, nome , cpf , endereco) values (0000775, 'Moacir Iracema Quinzé', '211.444.418-14', 'Rua Bispo Gioberto Torres, 520, Vila Celina, São Carlos, SP, 13566-785');
insert into pessoa (codigo, nome , cpf , endereco) values (0000098, 'Neusa Oliveira Zimmond', '125.856.638-63', 'Sebastião Conte, 40, Parque Fehr, São Carlos, SP, 13560-000');
insert into pessoa (codigo, nome , cpf , endereco) values (0000055, 'Ibrain Gavassi', '390.326.878-34', 'Rua São Paulo, 994, Vila Monteiro, São Carlos, SP, 13569-882');
insert into pessoa (codigo, nome , cpf , endereco) values (0000010, 'Patrícia Patrício', '752.156.577-28', 'Rua Delfino Martins Camargo Penteado , 100, Vila Paulita, São Carlos, SP, 13568-963');
insert into pessoa (codigo, nome , cpf , endereco) values (0000523, 'Silvana Silva', '741.454.338-02', 'Av. Araraquara, 89, Vila São Jose, São Carlos, SP, 13567-452');
insert into pessoa (codigo, nome , cpf , endereco) values (0000632, 'Breno Bruno Brandão', '321.856.778-17', 'Rua Padre Teixeira, 3386, Vila São Jose, São Carlos, SP, 13563-452');
insert into pessoa (codigo, nome , cpf , endereco) values (0000111, 'Ricardo Felisberto', '111.655.758-15', 'Rua Sibila Luna Natanael, 15, Jardim Embaré, São Carlos, 13568-258');
insert into pessoa (codigo, nome , cpf , endereco) values (0000963, 'Bianca Padro', '672.385.978-22', 'Travessa Professor Elias Gumercindo, 325, Centro, São Carlos, 13562-951');
insert into pessoa (codigo, nome , cpf , endereco) values (0000966, 'Josias Souza', '173.775.128-78', 'Rua Oracílio Motta, 114, Vila Isabel, São Carlos, 13561-741');
insert into pessoa (codigo, nome , cpf , endereco) values (0000065, 'Michael Daglia', '856.352.218-59', 'Av. São Carlos, 741, Centro, São Carlos, 13563-125');
insert into pessoa (codigo, nome , cpf , endereco) values (0000995, 'João Silva Santos', '541.855.308-01', 'Rua Célia Maia, 963, Paulistano, São Carlos, 13567-963');
insert into pessoa (codigo, nome , cpf , endereco) values (0000514, 'Frederico Otávio Rodrigues', '352.111.788-11', 'Rua Benedito Soares, 753, Vila Celina, São Carlos, 13564-852');

insert into proprietario (codigo_proprietario, email , telefone) values (0000965, 'jasmeenchousa@email.com', '+55 (16) 98239-8888');
insert into proprietario (codigo_proprietario, email , telefone) values (0000155, 'joaquimthiago@email.com', '+55 (16) 99212-1717');
insert into proprietario (codigo_proprietario, email , telefone) values (0000245, 'mzavanella@email.com', '+55 (16) 98177-0163');
insert into proprietario (codigo_proprietario, email , telefone) values (0000712, 'ottozimmond@email.com', '+55 (16) 98289-5574');
insert into proprietario (codigo_proprietario, email , telefone) values (0000775, 'moacirquinze@email.com', '+55 (16) 99989-2289');
insert into proprietario (codigo_proprietario, email , telefone) values (0000098, 'zimmondneusa@email.com', '+55 (16) 99131-1745');
insert into proprietario (codigo_proprietario, email , telefone) values (0000055, 'ibrain@email.com', '+55 (16) 98432-4231');
insert into proprietario (codigo_proprietario, email , telefone) values (0000523, 'silvanasilva@email.com', '+55 (16) 98123-1234');
insert into proprietario (codigo_proprietario, email , telefone) values (0000632, 'breno@email.com', '+55 (16) 98240-7777');
insert into proprietario (codigo_proprietario, email , telefone) values (0000010, 'patriciapatricio@email.com', '+55 (16) 98147-9512');


insert into mecanico (codigo_mecanico, numero_OS, especialidade) values (0000245, 1110001, 'Especialista em embreagem alinhamento');
insert into mecanico (codigo_mecanico, numero_OS, especialidade) values (0000098, 1118902, 'Especialista em freios');
insert into mecanico (codigo_mecanico, numero_OS, especialidade) values (0000055, 1585253, 'Especialista em alinhamento e balanceamento');
insert into mecanico (codigo_mecanico, numero_OS, especialidade) values (0000632, 1999654, 'Preparador e customizador');
insert into mecanico (codigo_mecanico, numero_OS, especialidade) values (0000111, 1148705, 'Líder');
insert into mecanico (codigo_mecanico, numero_OS, especialidade) values (0000963, 1119607, ' Especialista em elétrica');
insert into mecanico (codigo_mecanico, numero_OS, especialidade) values (0000966, 1004786, 'Preparador e customizador');
insert into mecanico (codigo_mecanico, numero_OS, especialidade) values (0000065, 1112356, 'Especialista em motor');
insert into mecanico (codigo_mecanico, numero_OS, especialidade) values (0000712, 1001241, 'Especialista em lumbrificação');
insert into mecanico (codigo_mecanico, numero_OS, especialidade) values (0000010, 1112222, 'Especialista em motor');

insert into veiculo (codigo_veiculo, descricao, placa, codigo_proprietario, numero_OS) values (0000123, 'Gol, Prata, Usado, Ano 2013', 'ADC1235', 0000965, 1110001);
insert into veiculo (codigo_veiculo, descricao, placa, codigo_proprietario, numero_OS) values (0000085, 'Parati, Preto, Usado, Ano 1997', 'KJH1200', 0000155, 1118902);
insert into veiculo (codigo_veiculo, descricao, placa, codigo_proprietario, numero_OS) values (0000074, 'Prisma, Preto, Usado, Ano 2005', 'PVW1210', 0000245, 1585253);
insert into veiculo (codigo_veiculo, descricao, placa, codigo_proprietario, numero_OS) values (0000062, 'Moto CG Titan 250, Vermelha, Ano 2010, Usado', 'REW1266', 0000712, 1999654);
insert into veiculo (codigo_veiculo, descricao, placa, codigo_proprietario, numero_OS) values (0000952, 'Renault Kwid, Branco, Novo 0km, Ano 2020', 'AD51C14', 0000775, 1148705); 
insert into veiculo (codigo_veiculo, descricao, placa, codigo_proprietario, numero_OS) values (0000758, 'Novo Uno, Verde Limão, Semi-novo, Ano 2015', 'CMU1282', 0000098, 1119607); 
insert into veiculo (codigo_veiculo, descricao, placa, codigo_proprietario, numero_OS) values (0000078, 'Golf, Branco, Usado, Ano 2009', 'VVD1235', 0000055, 1004786);
insert into veiculo (codigo_veiculo, descricao, placa, codigo_proprietario, numero_OS) values (0000958, 'Suzuki Jimny, Verde Musgo, Novo 0km, Ano 2020', 'WR51I55', 0000523, 1112356);
insert into veiculo (codigo_veiculo, descricao, placa, codigo_proprietario, numero_OS) values (0000897, 'Chevrolet Tracker, Azul, Semi-novo, Ano 2019', 'RX91B37', 0000632, 1001241);
insert into veiculo (codigo_veiculo, descricao, placa, codigo_proprietario, numero_OS) values (0000741, 'Gol, Preto, Semi-novo, Ano 2019','TY91L39', 0000010, 1112222);

insert into peca (numero_OS, id, tamanho, preco) values (1110001, 0009, 'P', 20.00);
insert into peca (numero_OS, id, tamanho, preco) values (1118902, 0012, 'M', 90.00);
insert into peca (numero_OS, id, tamanho, preco) values (1585253, 0158, 'P', 10.00);
insert into peca (numero_OS, id, tamanho, preco) values (1999654, 0089, 'P', 15.00);
insert into peca (numero_OS, id, tamanho, preco) values (1148705, 0951, 'M', 80.00);
insert into peca (numero_OS, id, tamanho, preco) values (1119607, 0041, 'G', 120.49);
insert into peca (numero_OS, id, tamanho, preco) values (1004786, 0125, 'P', 20.99);
insert into peca (numero_OS, id, tamanho, preco) values (1112356, 0455, 'M', 70.55);
insert into peca (numero_OS, id, tamanho, preco) values (1001241, 0001, 'G', 220.00);
insert into peca (numero_OS, id, tamanho, preco) values (1112222, 0099, 'P', 20.18);

insert into requer (numero_OS, id_peca) values (1110001, 0009);
insert into requer (numero_OS, id_peca) values (1118902, 0012);
insert into requer (numero_OS, id_peca) values (1585253, 0158);
insert into requer (numero_OS, id_peca) values (1999654, 0089);
insert into requer (numero_OS, id_peca) values (1148705, 0951);
insert into requer (numero_OS, id_peca) values (1119607, 0841);
insert into requer (numero_OS, id_peca) values (1004786, 0125);
insert into requer (numero_OS, id_peca) values (1112356, 0455);
insert into requer (numero_OS, id_peca) values (1001241, 0001);
insert into requer (numero_OS, id_peca) values (1112222, 0099);
