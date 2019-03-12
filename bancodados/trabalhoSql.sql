#criando um database clinica
create database  if not exists Clinica
default character set utf8
default collate utf8_general_ci;

#Tabela pessoa
create table  if not exists pessoa(
cpf int(11) not null primary key,
nome varchar(30) not null,
estado_civil enum ('S','C') not null,
nascimento date not null,
rua varchar(30) not null,
numero int(4) not null, 
cep int(10) not null,
telefone int(10) not null
)default charset = utf8;

#Tabela paciente
create table  if not exists paciente(
nro_pront int(5) not null primary key
)default charset = utf8;

#tabela funcionario
create table if not exists funcionario(
cod_func int(5) not null primary key,
funcao enum ('dentista','auxiliar','limpeza','atendente','gerente') not null 
)default charset = utf8;

#tabela atendimento
create table if not exists atendimento(
nro_atendimento int(5) not null primary key,
hora_consulta date not null,
data_consulta date not null,
data_atual date not null	
)default charset = utf8;

#tabela secretaria
create table if not exists secretaria(
idioma enum ('ingles','portugues','espanhol'),
tipo enum ('chefe','auxiliar')
)default charset = utf8;

create table if not exists dentista(
crm int(5),
especializazao enum ('ortodontia','implantodontia')
)default charset = utf8;

create table if not exists procedimento(
nro_procedimento int(5),
hora date,
data_consulta date
)default charset = utf8;

create table if not exists cirurgia(
procedimento enum ('implante','aparelho') not null 
)default charset = utf8;

create table if not exists consulta(
medicamento varchar(20) null
)default charset = utf8;

create table if not exists atestado(
descricao varchar(50) null
)default charset = utf8;

insert into pessoa values
('1234567890','Giovanni Pratto','C','1983-05-26','Rua:Paradise','329', '7900654','9912'), 
('1234567891','Carol','C','1983-05-26','Rua:cecilio alves correa','329','7900654','9923'),
('1234567892','Pedro','S','1983-05-26','Rua:Pampinas','329','7900654','9943'),
('1234567893','Giovanna','S','1983-05-26','Rua:Brilhante','329','7900654','9965'),
('1234567894','Luan','C','1983-05-26','Rua:Poneia','329','7900654','9987');

insert into paciente values
(12345),
(12346),
(12347),
(12348),
(12349);

insert into funcionario values
(123,'dentista'),
(124,'auxiliar'),
(125,'limpeza'),
(126,'atendente'),
(127,'gerente');

insert into atendimento values
(01, '13:30', '26/05/12', '20/05/12'),
(02, '15:20', '20/04/11', '15/04/11'),
(03, '09:45', '15/03/12', '21/04/13'),
(04, '07:00', '07/09/16', '28/09/17'),
(05, '19:20', '01/03/18', '10/02/19');

alter table paciente
add constraint fk_cpf foreign key (nro_pront)
references pessoa (cpf);

alter table funcionario
add constraint fk_cpf foreign key (cod_func)
references pessoa (cpf);

CREATE TABLE aluno (
Matricula INTEGER PRIMARY KEY,
NomeAluno VARCHAR(50) NOT NULL,
DataNascimento DATE,
CodigoCurso INTEGER,
CONSTRAINT fk_nropront
FOREIGN KEY(CodigoCurso)REFERENCES curso(nro_pront)ON UPDATE NO ACTION 
ON DELETE NO ACTION)




alter table pessoa  
add primary key(cpf);

drop table pessoa;

drop table funcionario;

drop table atendente;


select * from pessoa;

alter table paciente;


select 'Approved: ' ,nro_pront
 from paciente ;




