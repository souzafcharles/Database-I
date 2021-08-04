use mecanicaAutomoveis_2;

-- Retorna peças de tamanho P em ordem decrescente 
select * from peca
	where tamanho ='P'
	order by id desc;

-- Retorna peças de valor entre 25.00 a 130.00 em ordem crescente por preço
select * from peca
	where preco between 25 and 130
	order by preco;

-- Retorna peças com quantidade maior que 2 em ordem crescente por ordem de serviço
select * from requer
	where quantidade > 2
	order by quantidade;
    
-- Retorna placas de iniciais A  
select * from veiculo 
	where placa like 'A%';
    
-- Retorna a quantidade de caracteres das descrições dos serviços das OS
select descricao as dercriçãoServiço, 
	length(descricao) 
    as tamanhoDescricao 
from ordem_servico;

-- Retorna a junção de várias tabelas como veículo ordenado de forma crescente, ordem de serviço e peça utilizada e sua quantidade. Ordenação por placa.
select ordem_servico.numero_OS, ordem_servico.valor, veiculo.placa, veiculo.descricao as DescricaoVeiculo, requer.id_peca, requer.quantidade
	from ordem_servico inner join veiculo
    on ordem_servico.codigo_veiculo = veiculo.codigo_veiculo
    inner join requer on requer.numero_OS = ordem_servico.numero_OS
    order by veiculo.placa;
    
-- Retorna a junção das tabelas OS e mecânico apresentando as ordens de serviços na qual a especialidade do mecânico está vínculada ordenada pela descrição da OS      
select ordem_servico.numero_OS, ordem_servico.descricao as descricaoServico, mecanico.especialidade as especialidadeMecanico
	from ordem_servico inner join mecanico
    on ordem_servico.codigo_mecanico = mecanico.codigo_mecanico
    where mecanico.especialidade in ('Preparador e customizador', 'Especialista em motor')
    order by ordem_servico.descricao;
    
-- Retorna a junção das tabelas OS e mecânicos, apresentando todos os mecânicos incluindo os que não emitiram ordem de serviço
select ordem_servico.numero_OS, ordem_servico.descricao as descricaoServico, mecanico.codigo_mecanico, mecanico.especialidade as especialidadeMecanico
	from ordem_servico right outer join mecanico
    on ordem_servico.codigo_mecanico = mecanico.codigo_mecanico
    order by ordem_servico.descricao;
    
-- Retorna a junção das tabelas veícolo e proprietario, apresentando todos os proprietário(clientes) incluindo os que não possuem mais um veículo, porém estão cadastrados no sistema
select veiculo.codigo_veiculo, veiculo.descricao as descricaoVeiculo, veiculo. placa, proprietario.codigo_proprietario, proprietario.email
	from veiculo right outer join proprietario
    on veiculo.codigo_proprietario = proprietario.codigo_proprietario
    order by veiculo.descricao;

-- Retorna o agrapamento do tamanho da peça mostrando a soma, média, valor maximo e mínimo do preço da peca pelo tamanho descrescente
select tamanho, sum(preco) as somaPeca, round(avg(preco),2) as mediaPeca, max(preco) as maximoPreco, min(preco) as maximoPreco
	from peca
    group by tamanho
    order by tamanho desc;
    
-- Retorna o agrupamento da quandidade de Ordens de Serviço concluídas pela data de conclusão não nulas 
select data_conclusao, count(*) as quandidadeOSDia
	from ordem_servico
    where data_conclusao is not NULL
    group by data_conclusao
    order by count(*) desc;    
    
 -- Após saber qual dia se concluiu mais Oordem de Serviço, é possível saber a soma do valor destas ordens de serviço. 
select data_conclusao, sum(valor) as valorOrdemServico
	from ordem_servico
    where data_conclusao = '2020-03-14'
    group by data_conclusao;
 
-- Retorna o agrapamento das peças por nome com valores acima de 30.00 em ordem descrescente 
select nome, sum(preco) as somaPrecoPeca
	from peca
    group by nome
    having sum(preco) >= 30
    order by sum(preco) desc;

-- Retorna a quantidade de peças utilizadas acima de 2    
select id_peca, sum(quantidade) as quantidadePeca
	from requer
    group by  id_peca
    having sum(quantidade > 2)
    order by sum(quantidade) desc;

select * from ordem_servico
	where numero_OS in 
    (select codigo_mecanico from mecanico 
		where especialidade = 'Especialista em motor');

-- Retorna as ordens de serviço em que o valor  do conserto sejam maior ou igual ao do veículo 0000105
select ordem_servico.numero_OS, ordem_servico.descricao as descricaoServico, ordem_servico.valor from ordem_servico
	where valor >= all 
    (select valor from ordem_servico 
		where codigo_veiculo = 0000105);

-- Retorna as ordens de serviço em que o valor do conserto sejam maior que qualquer mínimo.      
select ordem_servico.numero_OS, ordem_servico.descricao as descricaoServico, ordem_servico.valor from ordem_servico
	where valor > any 
    (select valor from ordem_servico 
		where codigo_veiculo = 0000105);
    
-- Retornar uma lista de operadores de conjunto de todos os identificadores  das ordens de serviços e  mecanicos.
select numero_OS as identificadores from ordem_servico
union 
select codigo_mecanico from mecanico
order by identificadores desc;

-- Retornar uma lista existentes verificando os numeros da ordem de servio como válidos em consulta correlacionada
select id, nome, tamanho from peca
	where exists (select * from requer 
		where requer.id_peca = peca.id)
        order by nome;