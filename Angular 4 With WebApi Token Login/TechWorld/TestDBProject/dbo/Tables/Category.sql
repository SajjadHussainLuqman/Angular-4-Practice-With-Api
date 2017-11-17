CREATE TABLE [dbo].[Category] (
    [CategoryId]  INT           IDENTITY (1, 1) NOT NULL,
    [Name]        NVARCHAR (50) NULL,
    [IsActive]    BIT           NULL,
    [SortOrder]   INT           NOT NULL,
    [CreatedBy]   INT           NULL,
    [CreatedDate] DATE          NULL,
    CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED ([CategoryId] ASC)
);

