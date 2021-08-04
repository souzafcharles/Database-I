use empresa;

-- Respostas dos Exercícios sobre Funções de Agrupamento
-- 1
select sum(horas)
  from trabalha_em
 where projeto_num = 100;

-- 2
select projeto_num, avg(horas) as media_horas_trab
  from trabalha_em
 where projeto_num in (100, 200, 500)
 group by projeto_num;

-- 3
select round(sum(horas),2) Total_Horas, round(avg(horas),2) as Media_Horas
  from trabalha_em;
  
-- 4
select depto_num, count(*)
  from empregado
 group by depto_num;

-- 5
select depto_num, max(salario), min(salario)
  from empregado
 group by depto_num;

-- 6
select depto_num, count(*)
  from empregado
 group by depto_num
having count(*) > 3;

-- 7
select depto_num, sexo, avg(salario)
  from empregado
 group by depto_num, sexo
 order by depto_num;
 
-- 8
desc dependente;
select parentesco, sexo, count(*)
  from dependente
 group by parentesco, sexo;
 
-- 9
select codigo_ger, round(avg(salario),2) Media_Sal
	from empregado
	where codigo_ger is not null
	group by codigo_ger	
    having avg(salario) > 4000
    order by avg(salario) desc;