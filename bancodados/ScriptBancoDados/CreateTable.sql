CREATE TABLE Categoria (
	CategoriaID INT NOT NULL IDENTITY(1,1),
	Descricao VARCHAR(MAX) NOT NULL,
	Datainsert DATETIME NOT NULL DEFAULT GETDATE(),
	CONSTRAINT PK_Categoria PRIMARY KEY (CategoriaID)
)
GO

CREATE TABLE Subcategoria (
	SubCategoriaID INT NOT NULL IDENTITY(1,1),
	CategoriaID INT NOT NULL,
	Descricao VARCHAR(MAX) NOT NULL,
	Datainsert DATETIME NOT NULL DEFAULT GETDATE(),
	CONSTRAINT PK_SubCategoria PRIMARY KEY (SubCategoriaID),
	CONSTRAINT FK_SubCategoria_Categoria FOREIGN KEY (CategoriaID) REFERENCES Categoria(CategoriaID)
)
GO

CREATE TABLE Produto (
	ProdutoID INT NOT NULL IDENTITY(1,1),
	SubCategoriaID INT NOT NULL,
	CategoriaID INT NOT NULL,
	Descricao VARCHAR(MAX) NOT NULL,
	CONSTRAINT PK_Produto PRIMARY KEY (ProdutoID),
	CONSTRAINT FK_Produto_SubCategoria FOREIGN KEY (SubCategoriaID) REFERENCES SubCategoria(SubCategoriaID)
)
GO
