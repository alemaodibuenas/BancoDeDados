create table TempProduto(
CategoriaID int not null,
CategoriaDescrição varchar(MAX) not null,
SubCategoriaID int not null,
SubCategoriaDescrição varchar(MAX) not null,
ProdutoID int not null PRIMARY KEY,
ProdutoDescrição varchar(MAX) not null,
DataInsert datetime null default getdate()
)
go

insert into TempProduto(CategoriaID,CategoriaDescrição,SubCategoriaID,SubCategoriaDescrição,ProdutoID,ProdutoDescrição)
	select 
	P.CategoriaID,
	C.Descricao as CategoriaDescrição,
	P.SubCategoriaID,
	S.Descricao as SubCategoriaDescrição,
	P.ProdutoID,
	P.Descricao as ProdutoDescrição
	from Produto as P
	INNER JOIN Categoria as C ON P.CategoriaID =  C.CategoriaID
	INNER JOIN Subcategoria as S on P.SubCategoriaID = S.SubCategoriaID
go

select * from TempProduto
go