create database mecanicaAutomoveis_2;
use mecanicaAutomoveis_2;

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
    especialidade varchar(100) not null, 
    constraint mecanico_pk primary key (codigo_mecanico),
    constraint mecanico_codigoPessoa_fk foreign key (codigo_mecanico) references pessoa(codigo)
);

create table veiculo(
	codigo_veiculo int not null, 
	descricao varchar(255), 
	placa varchar(7) not null, 
	codigo_proprietario int, 
    constraint veiculo_pk primary key (codigo_veiculo),
    constraint veiculo_placa_uk unique (placa),
    constraint veiculo_codigoProprietario_fk foreign key (codigo_proprietario) references proprietario(codigo_proprietario)
);

create table peca(
    id int not null,
    nome varchar(60) not null,
    marca varchar(60) not null,
    tamanho char(1), 
    preco decimal(8,2) not null,
    constraint dependente_pk primary key (id),
    constraint peca_tamanho_ck check (tamanho in ('P','p','M','m', 'G','g')),
    constraint peca_preco_ck check (preco > 0)
);

create table ordem_servico (
	numero_OS int not null, 
	data_emissao date not null, 
	data_conclusao date, 
	valor decimal(8,2)not null, 
    descricao varchar(255) not null,
    codigo_mecanico int,
    codigo_veiculo int,
    constraint ordem_servico_pk primary key (numero_OS),
    constraint ordemServico_ck check (valor > 0),
    constraint os_mecanico_fk foreign key (codigo_mecanico) references mecanico(codigo_mecanico),
    constraint os_veiculo_fk foreign key (codigo_veiculo) references veiculo(codigo_veiculo)
);

create table requer(
    numero_OS int not null,
    id_peca int not null,
    quantidade int,
    constraint requer_pk primary key (numero_OS,id_peca),
    constraint requer_numeroOS_fk foreign key (numero_OS) references ordem_servico(numero_OS),
    constraint requer_idPeca_fk foreign key (id_peca) references peca(id)
);

insert into pessoa (codigo, nome , cpf , endereco) values (0000001, 'Ricardo Felisberto', '111.655.758-15', 'Rua Sibila Luna Natanael, 15, Jardim Embaré, São Carlos, 13568-258');
insert into pessoa (codigo, nome , cpf , endereco) values (0000002, 'Marcia Zavanella', '632.620.748-15', 'Rua das Rosas, 12, Cidade Jardim, São Carlos, SP, 13565-200');
insert into pessoa (codigo, nome , cpf , endereco) values (0000003, 'Luciana Carmen Zanin', '727.117.748-18', 'Alameda dos Crisântemos, 91, Cidade Jardim, São Carlos, 13566-780');
insert into pessoa (codigo, nome , cpf , endereco) values (0000004, 'Ibrain Gavassi', '390.326.878-34', 'Rua São Paulo, 994, Vila Monteiro, São Carlos, SP, 13569-882');
insert into pessoa (codigo, nome , cpf , endereco) values (0000005, 'Michael Daglia', '856.352.218-59', 'Av. São Carlos, 741, Centro, São Carlos, 13563-125');
insert into pessoa (codigo, nome , cpf , endereco) values (0000006, 'Silvana Silva', '741.454.338-02', 'Av. Araraquara, 89, Vila São Jose, São Carlos, SP, 13567-452');
insert into pessoa (codigo, nome , cpf , endereco) values (0000007, 'Otto Zimmond', '113.356.968-99', ' Rua Sebastião Conte, 40, Parque Fehr, São Carlos, SP, 13560-000');
insert into pessoa (codigo, nome , cpf , endereco) values (0000008, 'Neusa Oliveira Zimmond', '125.856.638-63', 'Sebastião Conte, 40, Parque Fehr, São Carlos, SP, 13560-000');
insert into pessoa (codigo, nome , cpf , endereco) values (0000009, 'Jasmeen Teles Chousa', '112.355.758-03', 'Av. Araraquara, 12, Vila São Jose, São Carlos, 13560-340');
insert into pessoa (codigo, nome , cpf , endereco) values (0000010, 'Joaquim Thiago', '852.852.558-34', 'Av. São Carlos, 33, apto. 65, Centro, São Carlos, SP, 13565-757');
insert into pessoa (codigo, nome , cpf , endereco) values (0000011, 'Frederico Otávio Rodrigues', '352.111.788-11', 'Rua Benedito Soares, 753, Vila Celina, São Carlos, 13564-852');
insert into pessoa (codigo, nome , cpf , endereco) values (0000012, 'Otávio Serafim', '025.987.118-18', 'Avenida São Carlos, 1000, Centro, São Carlos, 13565-757');
insert into pessoa (codigo, nome , cpf , endereco) values (0000013, 'Breno Bruno Brandão', '321.856.778-17', 'Rua Padre Teixeira, 3386, Vila São Jose, São Carlos, SP, 13563-452');
insert into pessoa (codigo, nome , cpf , endereco) values (0000014, 'Bianca Padro', '672.385.978-22', 'Travessa Professor Elias Gumercindo, 325, Centro, São Carlos, 13562-951');
insert into pessoa (codigo, nome , cpf , endereco) values (0000015, 'Moacir Iracema Quinzé', '211.444.418-14', 'Rua Bispo Gioberto Torres, 520, Vila Celina, São Carlos, SP, 13566-785');
insert into pessoa (codigo, nome , cpf , endereco) values (0000016, 'Josias Souza', '173.775.128-78', 'Rua Oracílio Motta, 114, Vila Isabel, São Carlos, 13561-741');
insert into pessoa (codigo, nome , cpf , endereco) values (0000017, 'João Silva Santos', '541.855.308-01', 'Rua Célia Maia, 963, Paulistano, São Carlos, 13567-963');
insert into pessoa (codigo, nome , cpf , endereco) values (0000018, 'Márcio Suzano', '001.999.158-63', 'Travessa Professor Elias Gumercindo, 325, Centro, São Carlos, 13562-951');
insert into pessoa (codigo, nome , cpf , endereco) values (0000019, 'Zuleica Serafim', '852.963.369-52', 'Avenida São Carlos, 1000, Centro, São Carlos, 13565-757');

insert into proprietario (codigo_proprietario, email , telefone) values (0000001, 'joaquimthiago@email.com', '+55 (16) 99212-1717');
insert into proprietario (codigo_proprietario, email , telefone) values (0000002, 'ibrain@email.com', '+55 (16) 98432-4231');
insert into proprietario (codigo_proprietario, email , telefone) values (0000003, 'suzanomarcio@email.com', '+55 (16) 98147-9512');
insert into proprietario (codigo_proprietario, email , telefone) values (0000004, 'ottozimmond@email.com', '+55 (16) 98289-5574');
insert into proprietario (codigo_proprietario, email , telefone) values (0000005, 'zimmondneusa@email.com', '+55 (16) 99131-1745');
insert into proprietario (codigo_proprietario, email , telefone) values (0000006, 'mzavanella@email.com', '+55 (16) 98177-0163');
insert into proprietario (codigo_proprietario, email , telefone) values (0000007, 'moacirquinze@email.com', '+55 (16) 99989-2289');
insert into proprietario (codigo_proprietario, email , telefone) values (0000008, 'silvanasilva@email.com', '+55 (16) 98123-1234');
insert into proprietario (codigo_proprietario, email , telefone) values (0000009, 'breno@email.com', '+55 (16) 98240-7777');
insert into proprietario (codigo_proprietario, email , telefone) values (0000010, 'jasmeenchousa@email.com', '+55 (16) 98239-8888');
insert into proprietario (codigo_proprietario, email , telefone) values (0000019, 'zuzuserafim@email.com', '+55 (16) 99138-8520');

insert into mecanico (codigo_mecanico, especialidade) values (0000011, 'Especialista em motor');
insert into mecanico (codigo_mecanico, especialidade) values (0000012, 'Especialista em motor');
insert into mecanico (codigo_mecanico, especialidade) values (0000013, 'Especialista em motor');
insert into mecanico (codigo_mecanico, especialidade) values (0000014, 'Especialista em alinhamento e balanceamento');
insert into mecanico (codigo_mecanico, especialidade) values (0000015, 'Preparador e customizador');
insert into mecanico (codigo_mecanico, especialidade) values (0000016, 'Especialista em lumbrificação');
insert into mecanico (codigo_mecanico, especialidade) values (0000017, 'Especialista em elétrica');
insert into mecanico (codigo_mecanico, especialidade) values (0000018, 'Especialista em embreagem alinhamento');
insert into mecanico (codigo_mecanico, especialidade) values (0000001, 'Especialista em freios');
insert into mecanico (codigo_mecanico, especialidade) values (0000002, 'Líder');

insert into veiculo (codigo_veiculo, descricao, placa, codigo_proprietario) values (0000100, 'Moto CG Titan 250, Vermelha, Ano 2010, Usado', 'REW1266', 0000001);
insert into veiculo (codigo_veiculo, descricao, placa, codigo_proprietario) values (0000101, 'Chevrolet Tracker, Azul, Semi-novo, Ano 2019', 'RX91B37', 0000002);
insert into veiculo (codigo_veiculo, descricao, placa, codigo_proprietario) values (0000102, 'Prisma, Preto, Usado, Ano 2005', 'PVW1210', 0000003);
insert into veiculo (codigo_veiculo, descricao, placa, codigo_proprietario) values (0000103, 'Novo Uno, Verde Limão, Semi-novo, Ano 2015', 'CMU1282', 0000004); 
insert into veiculo (codigo_veiculo, descricao, placa, codigo_proprietario) values (0000104, 'Golf, Branco, Usado, Ano 2009', 'VVD1235', 0000005);
insert into veiculo (codigo_veiculo, descricao, placa, codigo_proprietario) values (0000105, 'Parati, Preto, Usado, Ano 1997', 'KJH1200', 0000006);
insert into veiculo (codigo_veiculo, descricao, placa, codigo_proprietario) values (0000106, 'Suzuki Jimny, Verde Musgo, Novo 0km, Ano 2020', 'WR51I55', 0000007);
insert into veiculo (codigo_veiculo, descricao, placa, codigo_proprietario) values (0000107, 'Gol, Preto, Semi-novo, Ano 2019','TY91L39', 0000008);
insert into veiculo (codigo_veiculo, descricao, placa, codigo_proprietario) values (0000108, 'Gol, Prata, Usado, Ano 2013', 'ADC1235', 0000009);
insert into veiculo (codigo_veiculo, descricao, placa, codigo_proprietario) values (0000109, 'Renault Kwid, Branco, Novo 0km, Ano 2020', 'AD51C14', 0000010); 

insert into peca (id, nome, marca, tamanho, preco) values (0009, 'Filtro de óleo', 'BOSCH','P', 20.00);
insert into peca (id, nome, marca, tamanho, preco) values (0012, 'Caixa de câmbio', 'BOSCH','M', 90.00);
insert into peca (id, nome, marca, tamanho, preco) values (0158, 'Vela de ignição', 'BOSCH','P', 10.00);
insert into peca (id, nome, marca, tamanho, preco) values (0089, 'Suspensão','TECFIL','G', 120.49);
insert into peca (id, nome, marca, tamanho, preco) values (0951, 'Caixa de câmbio', 'COFAP','M', 80.00);
insert into peca (id, nome, marca, tamanho, preco) values (0041, 'Filtro de óleo', 'COBREQ','P', 25.49);
insert into peca (id, nome, marca, tamanho, preco) values (0125, 'Vela de ignição', 'PHILIPS','P', 20.99);
insert into peca (id, nome, marca, tamanho, preco) values (0455, 'Pistão', 'BOSCH', 'M', 70.55);
insert into peca (id, nome, marca, tamanho, preco) values (0001, 'Suspensão','METAL LEVE','G', 220.00);
insert into peca (id, nome, marca, tamanho, preco) values (0099, 'Vela de ignição', 'COFAP','P', 20.18);

insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao, codigo_mecanico, codigo_veiculo) values (0000001, '2020-12-30', null, 2100.00, 'Troca de filtros, troca de óleo do motor e manutenção da embreagem', 0000011, 0000100);
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao, codigo_mecanico, codigo_veiculo) values (0000002, '2019-10-27', '2019-10-28', 400.00, 'Manutenção da embreagem', 0000012, 0000101);
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao, codigo_mecanico, codigo_veiculo) values (0000003, '2019-03-01', '2019-03-03', 800.00, 'Revisão dos componentes de Freio', 0000013, 0000102);
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao, codigo_mecanico, codigo_veiculo) values (0000004, '2020-12-30', null, 2500.00, 'Revisão no Sistema de Arrefecimento e Alinhamento e Balanceamento', 0000014, 0000103);
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao, codigo_mecanico, codigo_veiculo) values (0000005, '2019-10-27', '2019-10-28', 800.00, 'Troca de óleo do motor', 0000015, 0000104);
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao, codigo_mecanico, codigo_veiculo) values (0000006, '2020-12-17', null, 1700.00, 'Troca de filtros, troca de óleo do motor e manutenção da embreagem', 0000016, 0000105);
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao, codigo_mecanico, codigo_veiculo) values (0000007, '2020-12-13', '2020-12-13', 200.00, 'Troca de lâmpadas', 0000017, 0000106);
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao, codigo_mecanico, codigo_veiculo) values (0000008, '2020-12-13', '2020-12-16', 1300.00, 'Troca de óleo do motor e manutenção da embreagem', 0000018, 0000107);
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao, codigo_mecanico, codigo_veiculo) values (0000009, '2020-12-13', '2020-12-16', 500.00, 'Manutenção da embreagem', 0000011, 0000108);
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao, codigo_mecanico, codigo_veiculo) values (0000010, '2020-03-13', '2020-03-14', 1000.00, 'Checagem do motor', 0000012, 0000109);
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao, codigo_mecanico, codigo_veiculo) values (0000011, '2020-12-13', null, 2000.00, 'Checagem do motor, troca de filtros, troca de óleo do motor e manutenção da embreagem', 0000012, 0000100);
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao, codigo_mecanico, codigo_veiculo) values (0000012, '2020-03-29', '2020-03-14', 900.00, 'Checagem do motor', 0000013, 0000101);
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao, codigo_mecanico, codigo_veiculo) values (0000013, '2019-09-11', '2020-03-14', 1900.00, 'Revisão dos componentes de Freio', 0000014, 0000102);
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao, codigo_mecanico, codigo_veiculo) values (0000014, '2019-03-25', null, 1020.00, 'Troca de óleo do motor e checagem do motor', 0000015, 0000103);
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao, codigo_mecanico, codigo_veiculo) values (0000015, '2020-11-30', '2020-03-14', 1000.00, 'Troca de filtros e checagem do motor', 0000016, 0000104);
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao, codigo_mecanico, codigo_veiculo) values (0000016, '2020-07-22', '2020-07-25', 1100.00, 'Alinhamento e Balanceamento e troca de óleo do motor', 0000017, 0000105);
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao, codigo_mecanico, codigo_veiculo) values (0000017, '2020-07-22', '2020-07-25', 800.00, 'Revisão dos componentes de Freio', 0000014, 0000105);
insert into ordem_servico (numero_OS, data_emissao, data_conclusao, valor, descricao, codigo_mecanico, codigo_veiculo) values (0000018, '2020-07-22', '2020-07-25', 1700.00, 'Troca de filtros, troca de óleo do motor e manutenção da embreagem', 0000016, 0000103);

insert into requer (numero_OS, id_peca, quantidade) values (0000001, 0009, 3);
insert into requer (numero_OS, id_peca, quantidade) values (0000002, 0012, 2);
insert into requer (numero_OS, id_peca, quantidade) values (0000003, 0158, 3);
insert into requer (numero_OS, id_peca, quantidade) values (0000004, 0089, 1);
insert into requer (numero_OS, id_peca, quantidade) values (0000005, 0951, 2);
insert into requer (numero_OS, id_peca, quantidade) values (0000006, 0041, 3);
insert into requer (numero_OS, id_peca, quantidade) values (0000007, 0125, 2);
insert into requer (numero_OS, id_peca, quantidade) values (0000009, 0455, 3);
insert into requer (numero_OS, id_peca, quantidade) values (0000010, 0001, 1);
insert into requer (numero_OS, id_peca, quantidade) values (0000011, 0099, 4);
insert into requer (numero_OS, id_peca, quantidade) values (0000009, 0001, 2);
insert into requer (numero_OS, id_peca, quantidade) values (0000009, 0009, 2);
insert into requer (numero_OS, id_peca, quantidade) values (0000009, 0041, 3);
insert into requer (numero_OS, id_peca, quantidade) values (0000008, 0099, 5);
insert into requer (numero_OS, id_peca, quantidade) values (0000005, 0455, 1);
