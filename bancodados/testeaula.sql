###criando database cadastro
create database cadastro
default character set utf8
default collate utf8_general_ci;

######tabela pessoas

create table pessoas(
id int not null auto_increment,
nome varchar(30) not null,
nascimento date,
sexo enum ('M','F'),
peso decimal(5,2),
altura decimal(3,2),
nacionalidade varchar(20) default 'Brasil',
primary key(id)
)default charset = utf8;

######Inserindo na tabela pessoas
insert into pessoas values
#(nome,nascimento,sexo,peso,altura,nacionalidade)
(default,'lara','1983-05-26','F','73.5','1.80',default),
(default,'pedro','1983-05-26','F','73.5','1.80',default),
(default,'sofia','1983-05-26','F','73.5','1.80',default),
(default,'pimba','1983-05-26','F','73.5','1.80',default),
(default,'nilce','1983-05-26','F','73.5','1.80',default);


##adicionando profissao depois de nome coluna na tabela
alter table pessoas
add column profissao varchar(10) after nome;

#apagar coluna
alter table pessoas
drop column profissao;

select * from pessoas;


create table if not exists cursos(
idcursos int primary key,
nome varchar(30) not null unique,
descricao text,
carga int unsigned,
totaulas int unsigned,
ano year default '2018'
)default charset=utf8;

#apagar coluna de uma tabela
ALTER TABLE cursos 
DROP COLUMN idcurso;

#adicionando uma coluna idcursos na primeira posicao ou usa after para depois
alter table cursos
add column idcursos int first;

#altera idcursos para chave primaria
alter table cursos
add primary key(idcursos);

#apagar a tabela cursos
drop table cursos;

#inserir nas valores nos campos do curso
insert into cursos values
('1','HTML4','curso de HTML5','40','37','2014'), # errado mudar o nome
('2','algoritmos','logica de programacao','40','37','2014'),
('3','photoshop','dicas de photoshop CC','40','37','2014'),
('4','pgp','curso de pgp para iniciantes','40','37','2018'),# errado mudar o nome
('5','jarva','introducao a linguagem java','40','37','2010'),# errado mudar o nome
('6','mysql','banco de dados mysql','40','37','2010'),
('7','word','Curso completo de word','40','37','2016'),
('8','sapateado','dancas ritmicas','40','37','2016'),
('9','cozinha arabe','aprenda a fazer kibe','40','37','2018'),
('10','Youyuber','Gerar Polemica e ganhar inscritos','5','2','2018');

#seleciona tabela cursos
select * from cursos;

#muda o nome dos valores
update cursos
set nome = 'html5'
where idcursos = '1'
limit 1;

#muda o nome dos valores
update cursos
set nome = 'php'
where idcursos = '4';

#muda o nome dos valores
update cursos
set nome = 'java'
where idcursos = '5';

#muda o nome dos valores
update cursos
set nome = 'Giovanni',descricao = 'Carol',carga = '10', totaulas = '5',ano = '1999'
where idcursos = '1';

#comandos para apagar as linhas
delete from cursos
where idcursos = '8';

delete from cursos
where idcursos = '9';

delete from cursos 
where idcursos = '10';
#fim dos comandos para apagar as linhas

#apagar todas as tabelas de cursos
#truncate table cursos;
