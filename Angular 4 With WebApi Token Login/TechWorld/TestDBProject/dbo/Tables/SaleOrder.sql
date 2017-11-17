CREATE TABLE [dbo].[SaleOrder] (
    [SaleId]   INT           IDENTITY (1, 1) NOT NULL,
    [SaleName] NVARCHAR (50) NULL,
    CONSTRAINT [PK_SaleOrder] PRIMARY KEY CLUSTERED ([SaleId] ASC)
);

