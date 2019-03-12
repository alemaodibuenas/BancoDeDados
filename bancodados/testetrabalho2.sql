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
endereco varchar(30) not null,
telefone int(10) not null
)default charset = utf8;

insert into pessoa values
('1234567890','Giovanni Pratto','C','1984-05-26','Rua:Paradise n.12','99123'),
('1234567891','Carol Pratto','C','1984-05-26','Rua:cecilio alves correa n.07','991234'),
('1234567892','Pedro Lima','S','1984-05-26','Rua:Pampinas n.123','991235'),
('1234567893','Giovanna ferrari','S','1984-05-26','Rua:Brilhante n.329','991236'),
('1234567894','Lautreamont F.','C','1984-05-26','Rua:Poneia n.05','991237');

drop table pessoa;

select *from pessoa;

#consulta os pacientes e prontuario
select distinct *from pessoa p,paciente f
where p.cpf = f.pcpf;


#Tabela paciente
create table  if not exists paciente(
nra_pront int(5) not null primary key,
pcpf int(11) not null unique,
foreign key (pcpf) REFERENCES pessoa(cpf) ON UPDATE NO ACTION ON DELETE NO ACTION
)default charset = utf8;

insert into paciente values
('12341','1234567890'),
('12342','1234567891'),
('12343','1234567892'),
('12344','1234567893'),
('12345','1234567894');
 
 select *from paciente;

#tabela funcionario
create table if not exists funcionario(
cod_func int(5) not null primary key,
nome_funcionario varchar(30) not null 
)default charset = utf8;

insert into funcionario values
('33333','Paulo Roberto'),
('44444','Vania Gabinete'),
('55555','Lario Larica'),
('66666','Betania Furacao');

select *from funcionario;

#consulta os funcionario e codigo funcionario
select distinct *from pessoa p,funcionario f
where p.cpf = f.fcpf;

#tabela atendimento
create table if not exists atendimento(
nro_atendimento int(5) not null primary key ,
nro_pront int(5) not null unique,
cod_func int(5) not null ,
data_consulta date not null,
hora varchar(10) not null,
data_atual date not null,    
foreign key (nro_pront) REFERENCES paciente(nra_pront) ON UPDATE NO ACTION ON DELETE NO ACTION,
foreign key (cod_func) REFERENCES secretaria(cod_func) ON UPDATE NO ACTION ON DELETE NO ACTION
)default charset = utf8;

insert into atendimento values
('01','12341' ,'33333','2018-05-26','18:50','2018-05-20'),
('02','12342' ,'44444','2018-04-16','12:30','2018-04-10'),
('03','12343' ,'33333','2018-07-06','11:30','2018-06-04'),
('04','12344' ,'44444','2018-06-29','14:25','2018-06-20'),
('05','12345' ,'33333','2018-03-13','07:30','2018-03-01');

drop table atendimento;

#consulta os atendimento e funcionario
select b.nro_atendimento,c.nome,b.data_consulta, b.hora , f.nome_funcionario, d.idioma, d.tipo 
from paciente a inner join atendimento b on (b.nro_pront = a.nra_pront ) inner join pessoa c on(a.pcpf = c.cpf and c.nome = 'Lautreamont F.') inner join secretaria d on (b.cod_func = d.cod_func)
 inner join funcionario f on(d.cod_func = f.cod_func)
 group by b.nro_pront ;
 
 
 #consulta os atendimento e funcionario
select b.nro_atendimento,c.nome,b.data_consulta, b.hora , f.nome_funcionario, d.idioma, d.tipo 
from paciente a inner join atendimento b on (b.nro_pront = a.nra_pront ) inner join pessoa c on(a.pcpf = c.cpf ) inner join secretaria d on (b.cod_func = d.cod_func)
 inner join funcionario f on(d.cod_func = f.cod_func)
 group by b.nro_pront ;


select *from atendimento;

#tabela secretaria
create table if not exists secretaria(
cod_func int(5) not null primary key,
idioma enum ('ingles','portugues','espanhol') not null,
tipo enum ('chefe','auxiliar') not null,
foreign key (cod_func) REFERENCES funcionario(cod_func) ON UPDATE NO ACTION ON DELETE NO ACTION
)default charset = utf8;

insert into secretaria values
('33333','ingles','auxiliar'),
('44444','espanhol','chefe');

drop table secretaria;

select *from secretaria;

#tabela dentista
create table if not exists dentista(
cod_func int(5) not null primary key,
crm int(5) not null,
especializacao enum ('ortodontia','implantodontia') not null,
foreign key (cod_func) REFERENCES funcionario(cod_func) ON UPDATE NO ACTION ON DELETE NO ACTION
)default charset = utf8;

insert into dentista values
('55555','567','ortodontia'),
('66666','568','implantodontia');

select *from dentista;

#tabela procedimento
create table if not exists procedimento(
nro_procedimento int(5) not null primary key,
cod_func int(5) not null ,
nro_pront int(5) not null ,
data_consulta date not null,
foreign key (nro_procedimento) REFERENCES atendimento(nro_atendimento) ON UPDATE NO ACTION ON DELETE NO ACTION,
foreign key (cod_func) REFERENCES dentista(cod_func) ON UPDATE NO ACTION ON DELETE NO ACTION,
foreign key (nro_pront) REFERENCES atendimento(nro_pront) ON UPDATE NO ACTION ON DELETE NO ACTION
)default charset = utf8;

insert into procedimento values
('01' ,'55555','12341','2018-05-26'),
('02' ,'66666','12342','2018-04-16'),
('03' ,'55555','12343','2018-07-06'),
('04' ,'66666','12344','2018-06-29'),
('05' ,'55555','12345','2018-03-13');

drop table procedimento;

#consulta os procedimento e funcionario
select distinct e.nome_funcionario , d.nome
from atendimento a, dentista b, paciente c, pessoa d, funcionario e, procedimento f
where f.nro_procedimento = a.nro_atendimento and b.cod_func = e.cod_func and f.cod_func = b.cod_func and b.cod_func = e.cod_func;


#tabela cirurgia
create table if not exists cirurgia(
nro_procedimento int(5) not null primary key,
procedimento enum ('implante','aparelho') not null,
foreign key (nro_procedimento) REFERENCES procedimento(nro_procedimento) ON UPDATE NO ACTION ON DELETE NO ACTION
)default charset = utf8;

insert into cirurgia values
('01','aparelho'),
('02','implante'),
('03','aparelho'),
('04','implante'),
('05','aparelho');

select *from cirurgia;

#tabela consulta
create table if not exists consulta(
nro_procedimento int(5) not null primary key,
medicamento varchar(20) not null,
foreign key (nro_procedimento) REFERENCES procedimento(nro_procedimento) ON UPDATE NO ACTION ON DELETE NO ACTION
)default charset = utf8;

insert into consulta values
('01','dipirona'),
('02','antibiotico'),
('03','antialergico'),
('04','Pasta de dente'),
('05','fio de dental ');

select a.nome 
from pessoa a,consulta b;


#tabela atestado
create table if not exists atestado(
nro_procedimento int(5) not null primary key,
descricao varchar(50) not null,
foreign key (nro_procedimento) REFERENCES procedimento(nro_procedimento) ON UPDATE NO ACTION ON DELETE NO ACTION
)default charset = utf8;

insert into atestado values
('01','dor de dente'),
('02','cirguria implante'),
('03','manutencao'),
('04','cirguria implante'),
('05','troca de borracha');

select *from atestado;


