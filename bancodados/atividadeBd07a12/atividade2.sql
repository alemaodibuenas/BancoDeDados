#criando o banco de dados empresadb
CREATE DATABASE empresadb;

#\c empresadb; 

#Recriando um schema
DROP SCHEMA IF EXISTS empresaschema cascade;
CREATE SCHEMA empresaschema;

SET search_path  = 'empresaschema';

CREATE TABLE empresaschema.departamento (
    dnome character varying(255) NOT NULL,
    dnumero integer NOT NULL,
    cpf_gerente integer DEFAULT 0,
    data_inicio_gerente date
);

select * from  empresaschema.departamento; 


CREATE TABLE empresaschema.dependente (
    fcpf integer NOT NULL,
    nome_dependente  varchar(255) NOT NULL,
    sexo enum('F','M'),
    datanasc date,
    parentesco  varchar(255)
);
select * from  empresaschema.dependente; 


CREATE TABLE empresaschema.depto_localizacoes (
    dnumero integer NOT NULL,
    dlocal character varying(255) NOT NULL
);

select * from  empresaschema.depto_localizacoes; 


CREATE TABLE empresaschema.funcionario (
    pnome  varchar(255) NOT NULL,
    minicial character(1),
    unome  varchar(255) NOT NULL,
    cpf integer NOT NULL,
    datanasc date,
    endereco  varchar(255),
    sexo enum('F','M'),
    salario numeric(10,2) DEFAULT 0.0,
    cpf_supervisor integer,
    dnr integer,
    CONSTRAINT funcionario_dnr_check check (dnr > 0),
    CONSTRAINT funcionario_salario_check CHECK (salario > (0))    
);

select * from  empresaschema.funcionario; 
drop table empresaschema.funcionario;

CREATE TABLE empresaschema.projeto (
    projnome character varying(255),
    projnumero integer NOT NULL,
    projlocal character varying(255),
    dnum integer
);

select * from  empresaschema.projeto; 

CREATE TABLE empresaschema.trabalha_em (
    fcpf integer NOT NULL,
    pnr integer NOT NULL,
    horas real
);

select * from  empresaschema.trabalha_em; 


ALTER TABLE  empresaschema.departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (dnumero);

ALTER TABLE  empresaschema.dependente
    ADD CONSTRAINT dependente_pkey PRIMARY KEY (fcpf, nome_dependente);

ALTER TABLE  empresaschema.depto_localizacoes
    ADD CONSTRAINT depto_localizacoes_pkey PRIMARY KEY (dnumero, dlocal);

ALTER TABLE  empresaschema.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (cpf);

ALTER TABLE  empresaschema.projeto
    ADD CONSTRAINT projeto_pkey PRIMARY KEY (projnumero);

ALTER TABLE  empresaschema.trabalha_em
    ADD CONSTRAINT trabalha_em_pkey PRIMARY KEY (fcpf, pnr);

ALTER TABLE  empresaschema.departamento
    ADD CONSTRAINT gerente FOREIGN KEY (cpf_gerente) REFERENCES empresaschema.funcionario(cpf);

ALTER TABLE  empresaschema.depto_localizacoes
    ADD CONSTRAINT numerodepartamento FOREIGN KEY (dnumero) REFERENCES empresaschema.departamento(dnumero);

ALTER TABLE  empresaschema.projeto
    ADD CONSTRAINT numerodepartamento FOREIGN KEY (dnum) REFERENCES empresaschema.departamento(dnumero);

ALTER TABLE  empresaschema.funcionario
    ADD CONSTRAINT numerodepto FOREIGN KEY (dnr) REFERENCES empresaschema.departamento(dnumero);

ALTER TABLE  empresaschema.trabalha_em
    ADD CONSTRAINT numeroprojeto FOREIGN KEY (pnr) REFERENCES empresaschema.projeto(projnumero);

ALTER TABLE  empresaschema.dependente
    ADD CONSTRAINT cpffuncionario FOREIGN KEY (fcpf) REFERENCES empresaschema.funcionario(cpf);

ALTER TABLE  empresaschema.funcionario
    ADD CONSTRAINT supervisor FOREIGN KEY (cpf_supervisor) REFERENCES empresaschema.funcionario(cpf);