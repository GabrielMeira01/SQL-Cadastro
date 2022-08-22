CREATE DATABASE Cadastro
GO

USE Cadastro
GO

CREATE TABLE Cliente
(
	Codigo INT IDENTITY(1, 1) NOT NULL,
	Nome VARCHAR(150) NOT NULL
)
GO

CREATE TABLE Endereco
(
	Codigo BIGINT IDENTITY(1, 1) NOT NULL,
	Cep CHAR(8) NOT NULL,
	Logradouro VARCHAR(150) NOT NULL,
	Complemento VARCHAR(100) NOT NULL,
	Bairro VARCHAR(100) NOT NULL,
	Cidade VARCHAR(100) NOT NULL,
	Uf CHAR(2) NOT NULL,
	CodigoIbge BIGINT NOT NULL
)
GO

CREATE TABLE Produto
(
	Codigo  BIGINT IDENTITY(1, 1) NOT NULL,
	Descricao VARCHAR(150) NOT NULL,
	PesoLiquido FLOAT NOT NULL,
	PrecoUnitario FLOAT NOT NULL
)
GO

CREATE TABLE Pedido
(
	Id				BIGINT IDENTITY(1, 1) NOT NULL,
	DataEmissao		DATE NOT NULL,
	CodigoCliente	INT NOT NULL,
	CodigoProduto	INT NOT NULL,
	Quantidade		INT NOT NULL,
	PrecoTotal		FLOAT NOT NULL,
	PesoTotal		FLOAT NOT NULL
)
GO


SELECT
	 PE.[Id]
	,PE.[DataEmissao]
	,PE.[CodigoCliente]
	,C.[Nome]
	,PE.[Quantidade]	
	,PE.[PrecoTotal]
	,PE.[PesoTotal]	
FROM
[Cadastro].[dbo].[Pedido] PE
INNER JOIN [Cadastro].[dbo].[Produto] PR ON PE.[CodigoProduto] = PR.[Codigo]
INNER JOIN [Cadastro].[dbo].[Cliente] C ON PE.[CodigoCliente] = C.[Codigo]
INNER JOIN [Cadastro].[dbo].[Endereco] E ON C.[Codigo] = E.[Codigo]
