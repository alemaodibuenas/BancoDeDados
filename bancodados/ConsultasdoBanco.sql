########################################
#Consulta dos pacientes e das pessoas
select a.nra_pront,b.nome,a.pcpf
from paciente a inner join pessoa b on (a.pcpf = b.cpf and b.nome = 'Giovanni Pratto')
group by a.pcpf;

select a.nra_pront,b.nome,a.pcpf
from paciente a inner join pessoa b on (a.pcpf = b.cpf and b.nome = 'Carol Pratto')
group by a.pcpf;

select a.nra_pront,b.nome,a.pcpf
from paciente a inner join pessoa b on (a.pcpf = b.cpf and b.nome = 'Pedro Lima')
group by a.pcpf;

select a.nra_pront,b.nome,a.pcpf
from paciente a inner join pessoa b on (a.pcpf = b.cpf and b.nome = 'Giovanna ferrari')
group by a.pcpf;

select a.nra_pront,b.nome,a.pcpf
from paciente a inner join pessoa b on (a.pcpf = b.cpf and b.nome = 'Lautreamont F.')
group by a.pcpf;

select a.nra_pront,b.nome,a.pcpf
from paciente a inner join pessoa b on (a.pcpf = b.cpf)
group by a.pcpf;

###############################################
#consulta os atendimento e funcionario
select a.nra_pront,b.nro_atendimento,c.nome,b.data_consulta, b.hora , f.nome_funcionario, d.idioma, d.tipo,a.pcpf  
from paciente a inner join atendimento b on (b.nro_pront = a.nra_pront ) inner join pessoa c on(a.pcpf = c.cpf and c.nome = 'Giovanni Pratto') inner join secretaria d on (b.cod_func = d.cod_func)
 inner join funcionario f on(d.cod_func = f.cod_func)
 group by b.nro_pront ;
 
 select a.nra_pront,b.nro_atendimento,c.nome,b.data_consulta, b.hora , f.nome_funcionario, d.idioma, d.tipo,a.pcpf 
from paciente a inner join atendimento b on (b.nro_pront = a.nra_pront ) inner join pessoa c on(a.pcpf = c.cpf and c.nome = 'Carol Pratto') inner join secretaria d on (b.cod_func = d.cod_func)
 inner join funcionario f on(d.cod_func = f.cod_func)
 group by b.nro_pront ;
 
 select a.nra_pront,b.nro_atendimento,c.nome,b.data_consulta, b.hora , f.nome_funcionario, d.idioma, d.tipo,a.pcpf  
from paciente a inner join atendimento b on (b.nro_pront = a.nra_pront ) inner join pessoa c on(a.pcpf = c.cpf and c.nome = 'Pedro Lima') inner join secretaria d on (b.cod_func = d.cod_func)
 inner join funcionario f on(d.cod_func = f.cod_func)
 group by b.nro_pront ; 
 
  select a.nra_pront,b.nro_atendimento,c.nome,b.data_consulta, b.hora , f.nome_funcionario, d.idioma, d.tipo,a.pcpf  
from paciente a inner join atendimento b on (b.nro_pront = a.nra_pront ) inner join pessoa c on(a.pcpf = c.cpf and c.nome = 'Giovanna ferrari') inner join secretaria d on (b.cod_func = d.cod_func)
 inner join funcionario f on(d.cod_func = f.cod_func)
 group by b.nro_pront ; 
 
  select a.nra_pront,b.nro_atendimento,c.nome,b.data_consulta, b.hora , f.nome_funcionario, d.idioma, d.tipo,a.pcpf  
from paciente a inner join atendimento b on (b.nro_pront = a.nra_pront ) inner join pessoa c on(a.pcpf = c.cpf and c.nome = 'Lautreamont F.') inner join secretaria d on (b.cod_func = d.cod_func)
 inner join funcionario f on(d.cod_func = f.cod_func)
 group by b.nro_pront ; 
 
 #consulta os atendimento e funcionario
select a.nra_pront,b.nro_atendimento,c.nome,b.data_consulta, b.hora , f.nome_funcionario, d.idioma, d.tipo,a.pcpf 
from paciente a inner join atendimento b on (b.nro_pront = a.nra_pront ) inner join pessoa c on(a.pcpf = c.cpf ) inner join secretaria d on (b.cod_func = d.cod_func)
 inner join funcionario f on(d.cod_func = f.cod_func)
 group by b.nro_pront ;


### Relatorios
##############################################################################################################
#consulta os procedimento e funcionario 
select a.nro_procedimento, p.nome, a.cod_func, r.nome_funcionario,t.procedimento,y.medicamento, u.descricao
from  procedimento a inner join atendimento b on (a.nro_pront = b.nro_pront) inner join paciente c on(b.nro_pront = c.nra_pront) inner join pessoa p on (p.cpf = c.pcpf and p.nome = 'Giovanni Pratto' ) inner join dentista g on (a.cod_func = g.cod_func)
inner join funcionario r on (r.cod_func = g.cod_func) inner join cirurgia t on (a.nro_procedimento = t.nro_procedimento) inner join consulta y on (a.nro_procedimento = y.nro_procedimento) inner join atestado u on (a.nro_procedimento = u.nro_procedimento)
group by p.nome  order by a.nro_procedimento ;

select a.nro_procedimento, p.nome, a.cod_func, r.nome_funcionario,t.procedimento,y.medicamento, u.descricao
from  procedimento a inner join atendimento b on (a.nro_pront = b.nro_pront) inner join paciente c on(b.nro_pront = c.nra_pront) inner join pessoa p on (p.cpf = c.pcpf and p.nome = 'Carol Pratto' ) inner join dentista g on (a.cod_func = g.cod_func)
inner join funcionario r on (r.cod_func = g.cod_func) inner join cirurgia t on (a.nro_procedimento = t.nro_procedimento) inner join consulta y on (a.nro_procedimento = y.nro_procedimento) inner join atestado u on (a.nro_procedimento = u.nro_procedimento)
group by p.nome  order by a.nro_procedimento ;

select a.nro_procedimento, p.nome, a.cod_func, r.nome_funcionario,t.procedimento,y.medicamento, u.descricao
from  procedimento a inner join atendimento b on (a.nro_pront = b.nro_pront) inner join paciente c on(b.nro_pront = c.nra_pront) inner join pessoa p on (p.cpf = c.pcpf and p.nome = 'Pedro Lima' ) inner join dentista g on (a.cod_func = g.cod_func)
inner join funcionario r on (r.cod_func = g.cod_func) inner join cirurgia t on (a.nro_procedimento = t.nro_procedimento) inner join consulta y on (a.nro_procedimento = y.nro_procedimento) inner join atestado u on (a.nro_procedimento = u.nro_procedimento)
group by p.nome  order by a.nro_procedimento ;

select a.nro_procedimento, p.nome, a.cod_func, r.nome_funcionario,t.procedimento,y.medicamento, u.descricao
from  procedimento a inner join atendimento b on (a.nro_pront = b.nro_pront) inner join paciente c on(b.nro_pront = c.nra_pront) inner join pessoa p on (p.cpf = c.pcpf and p.nome = 'Giovanna ferrari' ) inner join dentista g on (a.cod_func = g.cod_func)
inner join funcionario r on (r.cod_func = g.cod_func) inner join cirurgia t on (a.nro_procedimento = t.nro_procedimento) inner join consulta y on (a.nro_procedimento = y.nro_procedimento) inner join atestado u on (a.nro_procedimento = u.nro_procedimento)
group by p.nome  order by a.nro_procedimento ;

select a.nro_procedimento, p.nome, a.cod_func, r.nome_funcionario,t.procedimento,y.medicamento, u.descricao
from  procedimento a inner join atendimento b on (a.nro_pront = b.nro_pront) inner join paciente c on(b.nro_pront = c.nra_pront) inner join pessoa p on (p.cpf = c.pcpf and p.nome = 'Lautreamont F.' ) inner join dentista g on (a.cod_func = g.cod_func)
inner join funcionario r on (r.cod_func = g.cod_func) inner join cirurgia t on (a.nro_procedimento = t.nro_procedimento) inner join consulta y on (a.nro_procedimento = y.nro_procedimento) inner join atestado u on (a.nro_procedimento = u.nro_procedimento)
group by p.nome  order by a.nro_procedimento ;

select a.nro_procedimento, p.nome, a.cod_func, r.nome_funcionario,t.procedimento,y.medicamento, u.descricao
from  procedimento a inner join atendimento b on (a.nro_pront = b.nro_pront) inner join paciente c on(b.nro_pront = c.nra_pront) inner join pessoa p on (p.cpf = c.pcpf ) inner join dentista g on (a.cod_func = g.cod_func)
inner join funcionario r on (r.cod_func = g.cod_func) inner join cirurgia t on (a.nro_procedimento = t.nro_procedimento) inner join consulta y on (a.nro_procedimento = y.nro_procedimento) inner join atestado u on (a.nro_procedimento = u.nro_procedimento)
group by p.nome  order by a.nro_procedimento ;

##############################################
#nome das secretarias
select a.cod_func,a.idioma,a.tipo,b.nome_funcionario
from secretaria a inner join funcionario b on (a.cod_func = b.cod_func);

select a.cod_func,a.idioma,a.tipo,b.nome_funcionario
from secretaria a inner join funcionario b on (a.cod_func = b.cod_func and b.nome_funcionario = 'Paulo Roberto')
group by b.nome_funcionario;

select a.cod_func,a.idioma,a.tipo,b.nome_funcionario
from secretaria a inner join funcionario b on (a.cod_func = b.cod_func and b.nome_funcionario = 'Vania Gabinete')
group by b.nome_funcionario;


####################################
#nome dos dentintas
select a.cod_func,a.crm,a.especializacao,b.nome_funcionario
from dentista a inner join funcionario b on (a.cod_func = b.cod_func );

select a.cod_func,a.crm,a.especializacao,b.nome_funcionario
from dentista a inner join funcionario b on (a.cod_func = b.cod_func and b.nome_funcionario = 'Lario Larica')
group by b.nome_funcionario;


select a.cod_func,a.crm,a.especializacao,b.nome_funcionario
from dentista a inner join funcionario b on (a.cod_func = b.cod_func and b.nome_funcionario = 'Betania Furacao')
group by b.nome_funcionario;
