
#--------------(A) CONSULTAS BÁSICAS --------------

#-- A1. Recupere o nome completo de todos os funcionários que não possuem supervisor
select pnome,minicial,unome from  empresaschema.funcionario
where cpf_supervisor is null; 


#-- A9. Para cada projeto localizado em 'Stanfford', relacione o número do projeto, o número do
#departamento responsável e o último nome do gerente do departamento, seu endereço e sua data de aniversário.
SELECT projnumero AS 'Numero do Projeto',dnumero AS 'Numero do Departamento',unome AS 'Sobrenome',endereco AS 'Endereço',datanasc AS 'Data de Nascimento'
FROM empresaschema.funcionario, empresaschema.departamento, empresaschema.projeto
WHERE dnum = dnumero AND projlocal = 'Stanfford' AND cpf_gerente = cpf;
 

-- A10. Para cada funcionario, recupere o primeiro e o último nome do funcionario e o primeiro e o último nome de seu superior imediato.
select distinct a.pnome  as'Nome do Funcionario',a.unome as 'Sobrenome do Funcionario',b.pnome  as'Nome Supervisor',b.unome  as'Sobrenome Supervisor'
from empresaschema.funcionario a, empresaschema.funcionario b
where a.cpf_supervisor = b.cpf;


-------------- (E) AGREGAÇÃO COUNT / MAX / MIN / SUM / AVG  - GROUP BY / HAVING --------------

-- E1. Qual a média dos salários dos funcionários? 
select avg(salario) as 'Media dos Salarios'
from empresaschema.funcionario;

-- E2. Qual a soma dos salários dos funcionários?
select sum(salario) as 'Soma dos Salarios'
from empresaschema.funcionario;

-- E3. Qual é o salário mais baixo dos salários dos funcionários?
select min(salario) as 'mais baixo dos Salarios'
from empresaschema.funcionario;

-- E4. Qual é o salário mais alto dos salários dos funcionários?
select max(salario) as 'mais alto dos Salarios'
from empresaschema.funcionario;

-- E5. Quantos registros de supervisores existem na relação funcionário?
select  count(a.cpf_supervisor) as 'Registro'
from empresaschema.funcionario a,empresaschema.departamento b
where a.cpf_supervisor = b.cpf_gerente
group by b.cpf_gerente,a.cpf_supervisor;

-- E8. Qual o maior salário, o menor salário e a média de salários na relação funcionário por supervisor, para médias salariais superiores a 30000?
select 	MAX(salario) AS 'Maior Salario',
		MIN(salario) AS 'Menor Salario',
		AVG(salario) AS 'Media dos Salarios'
from empresaschema.funcionario,empresaschema.departamento 
where cpf_supervisor = cpf_gerente and salario > 30000;


-- E10. Listar os nomes de todos os funcionários com dois ou mais dependentes
select pnome
from empresaschema.funcionario, empresaschema.dependente
where cpf = fcpf 
group by cpf,fcpf
having count(fcpf) > 2;

-- E11. Para cada departamento, recupere seu número, o número de funcionarios que nele trabalham e a média de seus salários.
select dnumero as 'Numero do Departamento',
		count(cpf) as 'Numero de empregados',
		AVG (salario) as 'Media de Salarios'
from empresaschema.departamento , empresaschema.funcionario
where dnumero = dnr
group by dnumero;


-------------- (F) CONSULTAS ANINHADAS IN | NOT IN --------------

-- F3: Para cada departamento que tenha mais de quatro funcionarios, recupere o número do departamento e o número dos funcionarios que recebem mais de 40 mil.
select
	d.dnumero AS 'Departamento',
	e.cpf AS 'Numero Empregado'
from empresaschema.departamento AS d, empresaschema.funcionario AS e
where e.dnr = d.dnumero AND e.salario > 40000 AND d.dnumero IN
(SELECT
	d.dnumero AS 'Numero Departamento'
from empresaschema.departamento AS d, empresaschema.funcionario AS e
WHERE e.dnr = d.dnumero
GROUP BY d.dnumero
HAVING count(*) > 4);


-------------- (I) CONJUNTOS UNION / INTERSECT / EXCEPT  --------------

-- I4. Liste o cpf dos funcionários que não possuem dependentes
select distinct cpf as 'cpf dos funcionários'
FROM empresaschema.funcionario, empresaschema.dependente 
WHERE cpf NOT IN (SELECT fcpf FROM empresaschema.dependente);


-------------- (J) JUNÇÃO  --------------

-- J3: Retorne  pnome do funcionário e de seu supervisor. Liste todos os funcionários, mesmo aqueles que não possuem supervisor.
select distinct e.pnome as 'funcionário'
from empresaschema.departamento d inner join empresaschema.funcionario e 
(select e.pnome AS 'supervisor'
from empresaschema.departamento  d, empresaschema.funcionario  e
WHERE d.cpf_gerente = e.cpf_supervisor
GROUP BY d.cpf_gerente,e.cpf_supervisor;


-- J5: Listar todos os departamentos (dnome, dnumero) combinados com todos os funcionários (pnome, unome, dnr). 
select distinct d.dnome, d.dnumero,e.pnome, e.unome, e.dnr
from empresaschema.departamento d inner join empresaschema.funcionario e on (e.dnr = d.dnumero );

-------------- (A) VIEW --------------

-- A1. Crie a visão vfuncionario_projeto, a qual recupera o primeiro nome e o sobrenome dos funcionários ,  o nome do projeto e as horas trabalhadas em cada projeto.
create view		vfuncionario_projeto
        as select 		pnome, unome, projnome, horas
		FROM			empresaschema.funcionario, empresaschema.projeto, empresaschema.trabalha_em
        WHERE 			cpf=fcpf AND pnr = projnumero;

-- A1.1. Na visão vfuncionario_projeto, consulte todos os usuários do projeto Automatização.
select	pnome, unome
		from	vfuncionario_projeto
        where	projnome = 'Automatizacao';

-- A2. Crie uma visão vfuncionario_administracao com o primeiro nome, sobrenome e endereço dos funcionários que trabalham no departamento Administração.
create  view		vfuncionario_administracao
        as select 		pnome, unome, endereco
		from			empresaschema.funcionario, empresaschema.departamento
        where 			dnome = 'Administracao';

-- A2.1 Na visão vfuncionario_administracao, consulte todos usuários cujo primeiro nome começa com a letra A.

	select	pnome
        from	empresaschema.funcionario
        where	pnome like 'a%';