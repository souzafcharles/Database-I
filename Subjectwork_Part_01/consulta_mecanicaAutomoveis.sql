/*
Class title: Database-I
Lecturer: Prof. Dr. Fábio Roberto Octaviano
Example adapted by: Charles Fernandes de Souza
Date: December 15, 2020
*/

use mecanicaAutomoveis;

-- Retorna peças de tamanho P em ordem decrescente do numero da OS
select * from peca
	where tamanho ='P'
	order by numero_OS desc;
    
-- Retorna peças de valor entre 25.00 a 130.00 em ordem crescente do numero da OS
select * from peca
	where preco between 25 and 130
	order by numero_OS;
    
-- Retorna peças de tamanho G em ordem crescente do numero da OS
select * from peca
	where tamanho ='G'
	order by numero_OS;

-- Retorna placas de iniciais A  
select * from veiculo 
	where placa like 'A%';

-- Retorna a quantidade de caracteres das descrições dos serviços das OS
select descricao, 
	length(descricao) 
    as tamanhoDescricao 
from ordem_servico;

-- Retorna a junção das tabelas veículo e OS apresentando a descrição do veículo e valor a ser cobrado pelo serviço. 
select  veiculo.descricao, veiculo.codigo_veiculo, ordem_servico.numero_OS, ordem_servico.valor
	from veiculo inner join ordem_servico
    on veiculo.numero_OS = ordem_servico.numero_OS;
    
-- Retorna a junção das tabelas Mecanico e OS apresentando a especialidade do mecanico, número da ordem de serviço(OS), a descrição do serviço feita e o valor cobrado.
select m.especialidade as especialidade_Mecânic, os.numero_OS, os.descricao as Descricao_Serviço, os.valor as Valor_Cobrado
	from mecanico as m inner join ordem_servico as os
    on m.numero_OS = os.numero_OS;

-- Retorna a junção anterior com filtro na especialidade do mecânico apresentando também o número da ordem de serviço(OS), a descrição do serviço feita e o valor cobrado.
 select m.especialidade as especialidade_Mecânico, os.numero_OS, os.descricao as Descricao_Serviço, os.valor as Valor_Cobrado
	from mecanico as m inner join ordem_servico as os
    on m.numero_OS = os.numero_OS
    where m.especialidade in ('Preparador e customizador', 'Especialista em motor');

-- Retorna a junção das tabelas Mecanico e OS apresentando dados nullos com reultados para coluna da esquerda
select  veiculo.descricao, veiculo.codigo_veiculo, ordem_servico.numero_OS, ordem_servico.data_conclusao, ordem_servico.valor
	from veiculo left outer join ordem_servico
    on veiculo.numero_OS = ordem_servico.numero_OS;
    
-- Retorna a junção das tabelas Mecanico e OS apresentando dados nullos com reultados para coluna da direita 
select  veiculo.descricao, veiculo.codigo_veiculo, ordem_servico.numero_OS, ordem_servico.data_conclusao, ordem_servico.valor
	from veiculo right outer join ordem_servico
    on veiculo.numero_OS = ordem_servico.numero_OS;

-- Retorna a junção de várias tabelas como veículo ordenado de forma crescente, ordem de serviço, peça e mecânico. 
select veiculo.descricao as Descrição_Veículo, veiculo.codigo_veiculo, veiculo.placa, ordem_servico.numero_OS, ordem_servico.descricao as Descricao_Serviço, peca.id as id_Peça, peca.tamanho as Tamanho_Peça, ordem_servico.valor as Valor_Total_OS, especialidade as especialidade_Mecânico 
	from veiculo inner join ordem_servico on veiculo.numero_OS = ordem_servico.numero_OS
    inner join mecanico on mecanico.numero_OS = ordem_servico.numero_OS
    inner join peca on peca.numero_OS = ordem_servico.numero_OS
    order by veiculo.descricao;
    
-- Retorna o agrapamento do tamanho da peça mostrando a soma, média, valor maximo e mínimo do preço da peca pelo tamanho descrescente
select tamanho, sum(preco) as somaPeca, round(avg(preco),2) as mediaPeca, max(preco) as maximoPreco, min(preco) as maximoPreco
	from peca
    group by tamanho
    order by tamanho desc;
   
-- Retorna o agrapamento da quandidade de repetição das datas de conclusões não nulas 
select data_conclusao, count(*)
	from ordem_servico
    where data_conclusao is not NULL
    group by data_conclusao
    order by count(*) desc;
    
-- Retorna o agrapamento das peças com valores acima de 25.00 em ordem descrescente e seu id 
select id, sum(preco) as somaPeca
	from peca
    group by id
    having sum(preco) >= 25
    order by sum(preco) desc;

-- Retorna o agrapamento dos valores das OS acima de 1000.00 em ordem descrescente e seu número de OS
select numero_OS, sum(valor) as somaValor
	from ordem_servico
    group by numero_OS
    having sum(valor) >= 1000
    order by sum(valor) desc;
 
-- Retorno o codigo de quem é mecânico e sua especilidade dentro da tabela pessoa
select codigo_mecanico, especialidade from mecanico
	where codigo_mecanico in (select codigo from pessoa);  

-- Retornar lista com número da OS junto com algum id, tamanho e preço da tabela peca    
select numero_OS, id, tamanho, preco from peca
	where numero_OS in (select numero_OS from ordem_servico); 

-- Retornar lista   de peças de ID maior e igual 0951 com all
select numero_OS, id, tamanho, preco 
	from peca
	where preco >= all (select preco from peca where id = 0951);
    
 -- Retornar lista   de peças de ID maior e igual 0951 com any   
select numero_OS, id, tamanho, preco 
	from peca
	where preco >= any (select preco from peca where id = 0951);
    
-- Retornar uma lista existentes verificando os numeros da ordem de servio como válidos em consulta correlacionada 
select numero_OS, id_peca from requer
	where exists (select * from ordem_servico
		where requer.numero_OS = requer.numero_OS);
        
select id, tamanho from peca
	where exists (select * from requer 
		where requer.id_peca = peca.id);
		  
-- Retornar uma lista ordenada de operadores de conjunto de todos os identificadores dos veículos, ordens de serviços, mecanicos e peças
select codigo_veiculo as identificadores from veiculo
union
select numero_OS from ordem_servico
union 
select codigo_mecanico from mecanico
union 
select id from peca
order by identificadores;
