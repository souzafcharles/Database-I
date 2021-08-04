use empresa;

-- Lista o codigo e o nome do empregado + o nome do departamento que está alocado
select empregado.codigo, empregado.nome, departamento.nome as nome_depto
	from empregado inner join departamento
    on empregado.depto_num = departamento.numero; 
    
-- Lista com inner join o nome do departamento e o nome do seu gerente
select departamento.numero, departamento.nome as dept_nome, empregado.nome as empregado_nome
	from departamento inner join empregado
    on departamento.codigo_ger = empregado.codigo;

-- Lista com inner join o nome do departamento e o nome do seu gerente com abreviação
select d.numero, d.nome as dept_nome, e.nome as empregado_nome
	from departamento d inner join empregado e
    on d.codigo_ger = e.codigo;
    
-- Lista com where o nome do departamento e o nome do seu gerente
select departamento.numero, departamento.nome as dept_nome, empregado.nome as empregado_nome
	from departamento, empregado
    where departamento.codigo_ger = empregado.codigo;

-- Lista com where o nome do departamento e o nome do seu gerente com abreviação
select d.numero, d.nome as dept_nome, e.nome as empregado_nome
	from departamento d, empregado e
    where d.codigo_ger = e.codigo;
    
-- Lista com inner join o nome do departamento e o nome do seu gerente com abreviação usando filtro para departamentos 30, 40, 50
select d.numero, d.nome as dept_nome, e.nome as empregado_nome
	from departamento d inner join empregado e
    on d.codigo_ger = e.codigo
    where d.numero in (30, 40, 50); 
    
-- Lista com where o nome do departamento e o nome do seu gerente com abreviação usando filtro para departamentos 30, 40, 50
select d.numero, d.nome as dept_nome, e.nome as empregado_nome
	from departamento d, empregado e
    where d.codigo_ger = e.codigo
    and d.numero in (30, 40, 50); 
    
-- Lista com left outer join o nome do departamento e o nome do seu gerente com abreviação
select d.numero, d.nome as dept_nome, e.nome as empregado_nome
	from departamento d left outer join empregado e
    on d.codigo_ger = e.codigo;
    
-- Lista com left outer join o nome do departamento e o nome do seu gerente com abreviação
select d.numero, d.nome as dept_nome, e.nome as empregado_nome
	from departamento d right outer join empregado e
    on d.codigo_ger = e.codigo;
    
-- Lista com inner join o nome do empregado, o nome do projeto e as horas trabalhadas
select e.nome as empregado, p.nome projeto, t.horas as "horas trabalhadas"
	from trabalha_em t inner join empregado e 
    on t.codigo_emp = e.codigo 
    inner join projeto p on t.projeto_num = p.numero;
    
-- Lista com where o nome do empregado, o nome do projeto e as horas trabalhadas
select e.nome as empregado, p.nome projeto, t.horas as "horas trabalhadas"
	from trabalha_em t, empregado e, projeto p
    where t.codigo_emp = e.codigo 
    and t.projeto_num = p.numero;
    
-- Lista com inner join o nome do empregado, o nome do projeto, as horas trabalhadas e nom do departamento resposável
select e.nome as empregado, p.nome projeto, t.horas as "horas trabalhadas", d.nome as departamento
	from trabalha_em t inner join empregado e 
    on t.codigo_emp = e.codigo 
    inner join projeto p on t.projeto_num = p.numero
    inner join departamento d on p.depto_num = d.numero;

-- Lista com where o nome do empregado, o nome do projeto, as horas trabalhadas e nom do departamento resposável
select e.nome as empregado, p.nome projeto, t.horas as "horas trabalhadas", d.nome as departamento
	from trabalha_em t, empregado e, projeto p, departamento d
    where t.codigo_emp = e.codigo 
    and t.projeto_num = p.numero
    and p.depto_num = d.numero;
    