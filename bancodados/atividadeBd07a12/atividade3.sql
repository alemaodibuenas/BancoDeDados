#\c empresadb; 
SET search_path  = 'empresaschema';

ALTER TABLE empresaschema.funcionario DISABLE TRIGGER ALL;
ALTER TABLE empresaschema.departamento DISABLE TRIGGER ALL;
ALTER TABLE empresaschema.dependente DISABLE TRIGGER ALL;
ALTER TABLE empresaschema.depto_localizacoes DISABLE TRIGGER ALL;
ALTER TABLE empresaschema.projeto DISABLE TRIGGER ALL;
ALTER TABLE empresaschema.trabalha_em DISABLE TRIGGER ALL;

TRUNCATE TABLE empresaschema.funcionario CASCADE;
TRUNCATE TABLE empresaschema.departamento CASCADE;
TRUNCATE TABLE empresaschema.dependente CASCADE;
TRUNCATE TABLE empresaschema.depto_localizacoes CASCADE;
TRUNCATE TABLE empresaschema.projeto CASCADE;
TRUNCATE TABLE empresaschema.trabalha_em CASCADE;

-- funcionario
INSERT INTO empresaschema.funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('James', 'E', 'Borg', 888665555, '1937-11-10', '450 Stone, Houston, TX', 'M' , 55000, 12345678, 1);
INSERT INTO empresaschema.funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('Jennifer', 'S', 'Wallace', 987654321, '1941-06-20', '291 Berry, Bellaire, TX', 'F' , 43000, 888665555, 4);
INSERT INTO empresaschema.funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('Franklin', 'T', 'Wong', 333445555, '1955-12-08', '638 Voss, Housto, TX', 'M' , 40000, 888665555, 5);
INSERT INTO empresaschema.funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('John', 'B', 'Smith', 123456789, '1965-01-09', '731 Fondren, Houston, TX', 'M' , 30000, 333445555, 5);
INSERT INTO empresaschema.funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('Ramesh', 'K', 'Narayan', 666884444, '1962-09-15', '975 Fire, Oak Humble, TX', 'M' , 38000, 333445555, 5);
INSERT INTO empresaschema.funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('Joyce', 'A', 'English', 453453453, '1972-07-31', '5631 Rice, Houston, TX', 'F' , 25000, 333445555, 5);
INSERT INTO empresaschema.funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('Ahmad', 'V', 'Jabbar', 987987987, '1969-03-29', '980 Dallas, Houston, TX', 'M' , 25000, 987654321, 4);
INSERT INTO empresaschema.funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('Robert', 'F', 'Scott', 943775543, '2042-06-21', '2365 Newcastle Rd, Bellaire, TX', 'M' , 58000, 888665555, 1);
INSERT INTO empresaschema.funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('Alicia', 'J', 'Zelaya', 999887777, '1968-01-19', '3321 Castle, Spring, TX', 'F' , 25000, 943775543, 4);
INSERT INTO empresaschema.funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('Vanessa', 'B', 'Borg', 911887776, '1965-01-17', '3321 Castle, Spring, TX', NULL , 10000, 943775543, 4);
INSERT INTO empresaschema.funcionario (pnome, minicial, unome, cpf, datanasc, endereco, sexo, salario, cpf_supervisor, dnr) VALUES ('Asdrubal', 'B', 'Asd', 91188711, '1965-01-18', '3321 Castle, Spring, TX', 'M' , 5000, NULL, 4);
-- departamento
INSERT INTO empresaschema.departamento (dnome, dnumero, cpf_gerente, data_inicio_gerente) VALUES ('Pesquisa', 3, 333445555,'1988-05-22');
INSERT INTO empresaschema.departamento (dnome, dnumero, cpf_gerente, data_inicio_gerente) VALUES ('Administracao',4, 987654321,'1995-01-01');
INSERT INTO empresaschema.departamento (dnome, dnumero, cpf_gerente, data_inicio_gerente) VALUES ('Sede_administrativa',1, 888665555,'1981-06-19');
INSERT INTO empresaschema.departamento (dnome, dnumero, cpf_gerente, data_inicio_gerente) VALUES ('Inovacao',7, 333445555, '1980-06-30');
INSERT INTO empresaschema.departamento (dnome, dnumero, cpf_gerente, data_inicio_gerente) VALUES ('Computacao',5, 333445555, '1990-06-30');

-- dependente
INSERT INTO empresaschema.dependente (fcpf, nome_dependente, sexo, datanasc, parentesco) VALUES (333445555,'Alice','F','1986-04-05','FILHA');
INSERT INTO empresaschema.dependente (fcpf, nome_dependente, sexo, datanasc, parentesco) VALUES (333445555,'Theodore','M','1983-10-25','FILHO');
INSERT INTO empresaschema.dependente (fcpf, nome_dependente, sexo, datanasc, parentesco) VALUES (333445555,'Joy','F','1958-05-03','CONJUGE');
INSERT INTO empresaschema.dependente (fcpf, nome_dependente, sexo, datanasc, parentesco) VALUES (123456789,'Michael','M','1988-01-04','FILHO');
INSERT INTO empresaschema.dependente (fcpf, nome_dependente, sexo, datanasc, parentesco) VALUES (123456789,'Alice','F','1988-12-30','FILHA');
INSERT INTO empresaschema.dependente (fcpf, nome_dependente, sexo, datanasc, parentesco) VALUES (123456789,'Elizabeth','F','1967-05-05','CONJUGE');
INSERT INTO empresaschema.dependente (fcpf, nome_dependente, sexo, datanasc, parentesco) VALUES (453453453,'John','M','2060-12-12','CONJUGE');

-- depto_localizacoes
INSERT INTO empresaschema.depto_localizacoes (dnumero, dlocal) VALUES (1, 'Houston');
INSERT INTO empresaschema.depto_localizacoes (dnumero, dlocal) VALUES (4, 'Stanfford');
INSERT INTO empresaschema.depto_localizacoes (dnumero, dlocal) VALUES (5, 'Bellaire');
INSERT INTO empresaschema.depto_localizacoes (dnumero, dlocal) VALUES (5, 'Sugarland');
INSERT INTO empresaschema.depto_localizacoes (dnumero, dlocal) VALUES (5, 'Houston');


-- projeto
INSERT INTO empresaschema.projeto (projnome, projnumero, projlocal, dnum) VALUES ('ProdutoX', 1, 'Bellaire', 5);
INSERT INTO empresaschema.projeto (projnome, projnumero, projlocal, dnum) VALUES ('ProdutoY', 2, 'Sugarland', 5);
INSERT INTO empresaschema.projeto (projnome, projnumero, projlocal, dnum) VALUES ('ProdutoZ', 3, 'Houston', 5);
INSERT INTO empresaschema.projeto (projnome, projnumero, projlocal, dnum) VALUES ('Automatizacao', 10, 'Stanfford', 4);
INSERT INTO empresaschema.projeto (projnome, projnumero, projlocal, dnum) VALUES ('Reorganizacao', 20, 'Houston', 1);
INSERT INTO empresaschema.projeto (projnome, projnumero, projlocal, dnum) VALUES ('Novos_Beneficios', 30, 'Stanfford', 4);


-- trabalha_em
INSERT INTO empresaschema.trabalha_em (fcpf, pnr, horas) VALUES (123456789, 1, 32.5);
INSERT INTO empresaschema.trabalha_em (fcpf, pnr, horas) VALUES (123456789, 2, 7.5);
INSERT INTO empresaschema.trabalha_em (fcpf, pnr, horas) VALUES (666884444, 3, 40);
INSERT INTO empresaschema.trabalha_em (fcpf, pnr, horas) VALUES (453453453, 1, 20);
INSERT INTO empresaschema.trabalha_em (fcpf, pnr, horas) VALUES (453453453, 2, 20);
INSERT INTO empresaschema.trabalha_em (fcpf, pnr, horas) VALUES (999887777, 30, 30);
INSERT INTO empresaschema.trabalha_em (fcpf, pnr, horas) VALUES (987987987, 10, 35);
INSERT INTO empresaschema.trabalha_em (fcpf, pnr, horas) VALUES (987987987, 30, 5);
INSERT INTO empresaschema.trabalha_em (fcpf, pnr, horas) VALUES (987654321, 30, 20);
INSERT INTO empresaschema.trabalha_em (fcpf, pnr, horas) VALUES (987654321, 20, 15);
INSERT INTO empresaschema.trabalha_em (fcpf, pnr, horas) VALUES (888665555, 20, 5);
INSERT INTO empresaschema.trabalha_em (fcpf, pnr, horas) VALUES (999887777, 10, 5);


ALTER TABLE empresaschema.funcionario ENABLE TRIGGER ALL;
ALTER TABLE empresaschema.departamento ENABLE TRIGGER ALL;
ALTER TABLE empresaschema.dependente ENABLE TRIGGER ALL;
ALTER TABLE empresaschema.depto_localizacoes ENABLE TRIGGER ALL;
ALTER TABLE empresaschema.projeto ENABLE TRIGGER ALL;
ALTER TABLE empresaschema.trabalha_em ENABLE TRIGGER ALL;


select * from empresaschema.triggers
