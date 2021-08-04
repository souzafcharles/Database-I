use empresa;
select * from empregado;
select * from departamento;

desc empregado;

select codigo, nome, cpf from empregado;

select 
	nome, 
    salario as salarioBase, 
    salario*12 as salarioAnual, 
	salario*1.1 as salarioReajustado 
from empregado;

select
	nome, codigo_emp, sexo
from dependente where sexo = 'M';

select * from dependente
where codigo_emp = 12
   or codigo_emp = 13  
   or codigo_emp = 18;

select * from dependente
	where codigo_emp in (12, 13, 18);
    
select * from empregado
	order by salario;
    
select * from empregado
	where sexo ='M'
	order by salario;

select * from empregado
	where sexo ='M'
	order by salario desc;
    
select * from empregado
	order by sexo, salario desc;

select * from empregado where datanasc < '2000-01-01';

select * from empregado where salario >= 3000 and salario <= 7000;

select 
	nome, salario from empregado 
    where salario 
    between 3000 and 7000 
    order by salario;
    
select 
	nome, datanasc from empregado 
    where datanasc
    between '1981-01-01' and '1990-12-31'
    order by datanasc;

select * from empregado 
	where nome like 'n%';

select * from empregado 
	where nome like '%n';

select * from empregado 
	where nome like '%h%';

select * from empregado 
	where nome like '_h%';

select * from empregado 
	where nome like '%n_';
    
select 
	codigo, nome, codigo_ger 
    from empregado 
	where codigo_ger is null;

select 
	codigo, nome, codigo_ger 
    from empregado 
	where codigo_ger is not null;
    
select 
	cpf, nome, codigo_ger 
    from empregado
    where upper(nome) = 'xuxa';

select 
	cpf, nome, codigo_ger 
    from empregado
    where lower(nome) = 'Xuxa';
    
select nome, length(nome) as tamanhoNome from empregado;

select logradouro, substr(logradouro, 3, 4) from empregado;

select logradouro, nro, concat(logradouro, ', ', nro) as endereço from empregado;

select salario, round(salario, 2) from empregado;

select salario, truncate(salario, 1) from empregado;

select nome, salario, mod(salario, 100) as restoDivisão from empregado;

select nome, coalesce(codigo_ger, 0) from empregado;

select nome, coalesce(codigo_ger, depto_num, -1) from empregado;

select nome, 
    case sexo
		when 'M' then 'Masculino'
        when 'F' then 'Feminino'
        else 'Não informado'
        end as sexo_desc
from empregado;

select nome, salario,
	case 
		when salario >= 1000 then salario*1.1
        when salario >= 5000 then salario*1.5
        when salario <= 999  then salario*1.05
		else salario
	end as reajusteSalario
from empregado;

select nome, 
	coalesce(replace(replace(sexo, 'M', 'Masc.'), 'F', 'Fem.'),'N/I') as sexo
from empregado;

select depto_num,
	sum(salario), 
	round(avg(salario),2), 
	max(salario), 
	min(salario), 
	count(*) 
from empregado
where depto_num = 10;

select depto_num, sexo, sum(salario), round(avg(salario),2)
	from empregado
    group by depto_num, sexo
    order by depto_num, sexo desc;

select codigo_ger, count(*)
	from empregado
    where codigo_ger is not NULL
    group by codigo_ger
    having count(*) >= 2
    order by count(*) desc;
    
select codigo, nome
	from empregado
    where exists (select 1 from departamento
				where departamento.codigo_ger = empregado.codigo);