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
where (P.CategoriaID = 10) and (P.SubCategoriaID = 65 )
go