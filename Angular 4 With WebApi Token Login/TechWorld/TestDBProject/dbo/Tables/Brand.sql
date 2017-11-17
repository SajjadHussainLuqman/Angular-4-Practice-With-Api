CREATE TABLE [dbo].[Brand] (
    [BrandId]    INT           IDENTITY (1, 1) NOT NULL,
    [CategoryId] INT           NOT NULL,
    [Name]       NVARCHAR (50) NULL,
    [IsActive]   BIT           NULL,
    [SortOrder]  INT           NOT NULL,
    [CreatedBy]  INT           NULL,
    [CreateDate] DATE          NULL,
    [ModifiedBy] INT           NULL,
    CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED ([BrandId] ASC),
    CONSTRAINT [FK_Brand_Category] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Category] ([CategoryId])
);

