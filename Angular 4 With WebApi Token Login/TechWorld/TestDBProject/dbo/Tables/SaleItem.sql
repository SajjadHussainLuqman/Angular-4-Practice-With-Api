CREATE TABLE [dbo].[SaleItem] (
    [ItemId] INT           IDENTITY (1, 1) NOT NULL,
    [Name]   NVARCHAR (50) NULL,
    [SaleId] INT           NOT NULL,
    CONSTRAINT [PK_SaleItem] PRIMARY KEY CLUSTERED ([ItemId] ASC),
    CONSTRAINT [FK_SaleItem_SaleOrder] FOREIGN KEY ([SaleId]) REFERENCES [dbo].[SaleOrder] ([SaleId])
);

