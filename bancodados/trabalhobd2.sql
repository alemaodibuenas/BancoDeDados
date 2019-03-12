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
('1234567890','Giovanni Pratto','C','1984-05-26','Rua:Paradise 12 7900654','99123'), 
('1234567891','Carol Pratto','C','1984-05-26','Rua:cecilio alves correa 07 7900654','991234'),
('1234567892','Pedro Lima','S','1984-05-26','Rua:Pampinas 123 7900654','991235'),
('1234567893','Giovanna ferrari','S','1984-05-26','Rua:Brilhante 329 7900654','991236'),
('1234567894','Lautreamont F.','C','1984-05-26','Rua:Poneia 05 7900654','991237'),
('1234567895','Zaratrusta Nipon','S','1984-05-26','Rua:Brilhante 1297900654','991238'),
('1234567896','Link - crust','C','1984-05-26','Rua:Pompas funebre 23 7900654','991231'),
('1234567897','Predador P.','S','1984-05-26','Rua:Luz 3 7900654','9912233'),
('1234567898','Curadente T.','C','1984-05-26','Rua:Vida nova 231 7900654','991232');

select *from pessoa;
select nome
from pessoa p, paciente a
where p.cpf = a.pcpf;

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
fcpf int(11) not null unique,
funcao enum ('dentista','auxiliar','limpeza','atendente','gerente') not null, 
foreign key (fcpf) REFERENCES pessoa(cpf) ON UPDATE NO ACTION ON DELETE NO ACTION
)default charset = utf8;

insert into funcionario values
('33333','1234567895','atendente'),
('44444','1234567896','gerente'),
('55555','1234567897','dentista'),
('66666','1234567898','dentista');

select *from funcionario;

#tabela atendimento
create table if not exists atendimento(
nro_atendimento int(5) not null primary key ,
nro_pront int(5) not null unique,
cod_sec int(5) not null unique,
data_consulta date not null,
data_atual date not null,	
foreign key (nro_pront) REFERENCES paciente(nra_pront) ON UPDATE NO ACTION ON DELETE NO ACTION,
foreign key (cod_sec) REFERENCES secretaria(cod_sec) ON UPDATE NO ACTION ON DELETE NO ACTION
)default charset = utf8;

insert into atendimento values
('01','12341' ,'123','2018-05-26','2018-05-20'), 
('02','12342' ,'231','2018-04-16','2018-04-10'),
('03','12343' ,'123','2018-07-06','2018-06-04'),
('04','12344' ,'231','2018-06-29','2018-06-20'),
('05','12345' ,'123','2018-03-13','2018-03-01');

select *from atendimento;

#tabela secretaria
create table if not exists secretaria(
cod_sec int(5) not null primary key,
cod_func int(5) not null unique,
idioma enum ('ingles','portugues','espanhol') not null,
tipo enum ('chefe','auxiliar') not null,
foreign key (cod_func) REFERENCES funcionario(fcpf) ON UPDATE NO ACTION ON DELETE NO ACTION
)default charset = utf8;

insert into secretaria values
('123' ,'33333','ingles','auxiliar'), 
('231' ,'44444','espanhol','chefe');

select *from secretaria;

#tabela dentista
create table if not exists dentista(
cod_den int(5) not null primary key,
cod_func int(5) not null unique,
crm int(5) not null,
especializacao enum ('ortodontia','implantodontia') not null,
foreign key (cod_func) REFERENCES funcionario(cod_func) ON UPDATE NO ACTION ON DELETE NO ACTION
)default charset = utf8;

insert into dentista values
('111' ,'55555','567','ortodontia'),
('222' ,'66666','568','implantodontia'); 

select *from dentista;

#tabela procedimento
create table if not exists procedimento(
nro_procedimento int(5) not null primary key,
cod_den int(5) not null unique,
nro_pront int(5) not null unique,
data_consulta date not null,
foreign key (nro_procedimento) REFERENCES atendimento(nro_atendimento) ON UPDATE NO ACTION ON DELETE NO ACTION,
foreign key (cod_den) REFERENCES dentista(cod_den) ON UPDATE NO ACTION ON DELETE NO ACTION,
foreign key (nro_pront) REFERENCES paciente(nro_pront) ON UPDATE NO ACTION ON DELETE NO ACTION
)default charset = utf8;

insert into procedimento values
('01' ,'111','12341','2018-05-26'), 
('02' ,'222','12342','2018-04-16'),
('03' ,'111','12343','2018-07-06'),
('04' ,'222','12344','2018-06-29'),
('05' ,'111','12345','2018-03-13');

select distinct d.nome,c.fcpf,b.crm,b.especializacao,e.medicamento
from procedimento a ,dentista b,funcionario c ,pessoa d,consulta e
where a.cod_den = b.cod_den and b.cod_func = c.cod_func and c.fcpf = d.cpf
and a.nro_procedimento = e.nro_procedimento;

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

select *from consulta;

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
