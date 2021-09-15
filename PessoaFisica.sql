USE [CapacitacaoPSG2021H3]
GO

/****** Object:  Table [dbo].[PessoaFisica]    Script Date: 15/09/2021 17:16:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PessoaFisica](
	[Codigo] [int] NOT NULL,
	[Nome] [varchar](255) NOT NULL,
	[Endereco] [varchar](255) NOT NULL,
	[Cidade] [varchar](255) NOT NULL,
	[Estado] [char](255) NOT NULL,
	[RG] [varchar](12) NULL,
	[CPF] [varchar](11) NULL,
	[DataNascimento] [datetime] NOT NULL,
	[Telefone] [varchar](20) NULL,
	[Celular] [varchar](20) NULL,
	[Email] [varchar](255) NULL,
	[NomePai] [varchar](255) NULL,
	[NomeMae] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


