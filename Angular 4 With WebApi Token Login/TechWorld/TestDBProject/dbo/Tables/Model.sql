CREATE TABLE [dbo].[Model] (
    [ModelId]     INT            IDENTITY (1, 1) NOT NULL,
    [CategoryId]  INT            NOT NULL,
    [BrandId]     INT            NOT NULL,
    [Name]        NVARCHAR (50)  NULL,
    [PictureName] NVARCHAR (250) NULL,
    [IsActive]    BIT            NULL,
    [SortOrder]   INT            NOT NULL,
    CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED ([ModelId] ASC),
    CONSTRAINT [FK_Model_Brand] FOREIGN KEY ([BrandId]) REFERENCES [dbo].[Brand] ([BrandId]),
    CONSTRAINT [FK_Model_Category] FOREIGN KEY ([CategoryId]) REFERENCES [dbo].[Category] ([CategoryId])
);

