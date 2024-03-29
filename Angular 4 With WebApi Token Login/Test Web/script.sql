USE [master]
GO
/****** Object:  Database [TestWeb]    Script Date: 11/30/2017 4:42:36 PM ******/
CREATE DATABASE [TestWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TestWeb.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TestWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TestWeb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TestWeb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestWeb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TestWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestWeb] SET RECOVERY FULL 
GO
ALTER DATABASE [TestWeb] SET  MULTI_USER 
GO
ALTER DATABASE [TestWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestWeb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestWeb', N'ON'
GO
USE [TestWeb]
GO
/****** Object:  StoredProcedure [dbo].[usp_Brand_Get]    Script Date: 11/30/2017 4:42:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[usp_Brand_Get]
as
begin

select B.*,C.Name CategoryName
from Brand B
Inner join Category C on B.CategoryId=C.CategoryId

end

GO
/****** Object:  StoredProcedure [dbo].[usp_BrandDelete]    Script Date: 11/30/2017 4:42:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_BrandDelete]
@BrandId int
as
begin

delete from Brand where BrandId=@BrandId

end
GO
/****** Object:  StoredProcedure [dbo].[usp_CategoryDelete]    Script Date: 11/30/2017 4:42:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[usp_CategoryDelete]
@CategoryId int
as
begin

delete from Category where CategoryId=@CategoryId

end
GO
/****** Object:  StoredProcedure [dbo].[usp_Product_Get]    Script Date: 11/30/2017 4:42:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[usp_Product_Get]

@BrandId  int=null,
@CategoryId int=null,
@Name varchar(70)=null

as
begin

select P.*, B.Name BrandName,C.Name CategoryName
from Product P
Inner join Brand B on B.BrandId=P.BrandId
Inner join Category C on B.CategoryId=C.CategoryId
where 

(@BrandId is null or B.BrandId=@BrandId) and
(@CategoryId is null  or B.CategoryId=@CategoryId) and
(@Name is null or P.Name like '%'+@Name+'%') 


end



GO
/****** Object:  StoredProcedure [dbo].[usp_ProductDelete]    Script Date: 11/30/2017 4:42:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[usp_ProductDelete]
@ProductId int
as
begin

delete from Product where ProductId=@ProductId

end
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 11/30/2017 4:42:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/30/2017 4:42:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[News]    Script Date: 11/30/2017 4:42:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[News](
	[NewsId] [int] NOT NULL,
	[Title] [varchar](1000) NULL,
	[Detail] [varchar](8000) NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/30/2017 4:42:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[BrandId] [int] NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [text] NULL,
	[TentMaterial] [nvarchar](250) NULL,
	[TentManufacturing] [nvarchar](250) NULL,
	[Usages] [nvarchar](250) NULL,
	[LengthAndHeight] [nvarchar](250) NULL,
	[PictureName] [nvarchar](250) NULL,
	[IsDisplayHome] [bit] NULL,
	[SortOrder] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/30/2017 4:42:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (131, 79, N'All Weather family Tent', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (132, 79, N'Double Fly Double Fold Ridge Tent 4X4', 1, 2)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (134, 80, N'School Tent', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (135, 81, N'Dispensary Tent', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (136, 81, N'Family  Tent', 1, 2)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (137, 81, N'Multipurpose Tent', 1, 3)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (138, 84, N'Double Fly Double Fold Ridge Tent 6x4', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (139, 85, N'Single Fly Single Fold Family Ridge Tent', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (140, 85, N'Single Fly Double Fold Family Ridge Tent', 1, 2)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (141, 85, N'Double Fly Single Fold Family Ridge Tent', 1, 3)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (142, 85, N'Double Fly Double Fold Family Ridge Tent', 1, 4)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (143, 85, N'Winterized Three Fold Family  Ridge Tent', 1, 5)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (144, 85, N'Single Fly Single Fold Family Wall Tent', 1, 6)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (147, 100, N'IFRC  wool medium thermal Blanket', 1, 2)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (150, 101, N'UNHCR Type B ', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (151, 101, N'IFRC Type', 1, 2)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (152, 101, N'IOM Type ', 1, 3)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (153, 102, N'UNHCR Semi Collapsible Jerry Can', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (154, 102, N'IOM Jerry Can', 1, 2)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (158, 103, N'UNICEF Bucket', 1, 2)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (160, 104, N'UN-HABITAT Hygiene Kits', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (161, 104, N'RSPN Hygiene Kits', 1, 2)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (163, 111, N'UNHCR Soap', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (164, 97, N'IFRC Kit', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (165, 95, N'Light Weight Family Tent', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (166, 82, N'Double Fly Single Fold', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (167, 85, N'Single Fly Double Fold Family Wall Tent', 1, 7)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (168, 83, N'UNDP Hospital/School/Store Tent', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (169, 89, N'Army Officers Tent', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (170, 89, N'Single Fly Single Fold', 1, 2)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (171, 89, N'Saudi Army Tent', 1, 3)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (172, 89, N'Military Two Soldier Tent', 1, 4)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (173, 90, N'Marquee Frame Tent', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (174, 90, N'Marquee Khaki Tent', 1, 2)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (175, 90, N'Marquee Three Fold Tent', 1, 3)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (176, 82, N'PVC Hospital/School/Warehouse Tent', 1, 2)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (180, 102, N'UNHCR Non Collapsible', 1, 5)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (181, 102, N'IMC Type Non Collapsible', 1, 6)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (182, 113, N'UNHCR Type Quilts', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (185, 89, N'Military Frame Tent', 1, 5)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (186, 91, N'Family Frame Tent', 1, 2)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (187, 92, N'White with Black Strips Deluxe Tent', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (188, 92, N'Supreme Round Deluxe Tent', 1, 3)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (189, 92, N'Super Deluxe Tent', 1, 4)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (190, 93, N'Safari Frame Tent', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (191, 80, N'Shelter Tent ', 1, 2)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (193, 94, N'Deluxe Shelter Tent', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (194, 87, N'All Weather FamilyTent', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (196, 98, N'Bath Tent', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (197, 100, N'UNHCR BLANKET High Thermal', 1, 5)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (198, 100, N'UNHCR BLANKET Medium Thermal', 1, 6)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (201, 103, N'UNHCR Bucket 10 L', 1, 4)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (202, 103, N'UNHCR BUCKET 15 L', 1, 5)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (203, 103, N'UNHCR Bucket 20 L', 1, 6)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (204, 114, N'UNHCR Synthetic Sleeping Mats', 1, 2)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (205, 100, N'IFRC  wool high thermal blanket', 1, 7)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (206, 100, N'IFRC synthetic  high thermal blanket', 1, 8)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (208, 107, N'Canvas & Fabric', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (209, 99, N'Canvas Sheet', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (210, 86, N'Hospital tent', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (212, 88, N'ware house tent', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (214, 108, N'Cotton Ropes', 1, 2)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (215, 81, N'Double Fly Single Fold Tent', 1, 4)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (216, 87, N'Double Fly Single Fold Tent', 1, 3)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (218, 80, N'Single Fly Double Fold Tent', 1, 3)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (219, 106, N'Sleeping bags', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (220, 85, N'Family Round Tent', 1, 8)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (221, 85, N'PVC Releif Tent', 1, 9)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (223, 112, N'UNHCR Mosquito Net Polyester', 1, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (224, 95, N'Double fold light weight family tent', 1, 2)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (226, 79, N'3 Fold Tunnel Tent', 1, 4)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (227, 79, N'Single fold Tunnel tent', 1, 5)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (228, 85, N'UNFPA', 1, 10)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (230, 105, N'UNHCR Sanitary Napkins', 1, 120)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (231, 108, N'Braided Ropes', 1, 2)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (232, 108, N'Twisted Ropes', 1, 3)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (233, 99, N'Plastic Sheets LDPE', 1, 120)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (234, 99, N'Plastic Sheets HDPE', 1, 120)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (235, 101, N'UNHCR New Type B', 1, 120)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (236, 109, N'Coking Stove', 1, 120)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (239, 107, N'Canvas', 1, 2)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (240, 107, N'Fabric', 1, 3)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (242, 92, N'Kuwaiti Deluxe Tent', 1, 120)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (243, 94, N'Kuwaiti Shelter tent', 1, 120)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (244, 92, N'Khaki Delux tent', 1, 120)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (245, 92, N'Luxury Tent', 1, 120)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (246, 92, N'Zahra Deluxe Tent', 1, 120)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (247, 94, N'Zahra Shelter Tent', 1, 120)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (249, 81, N'New Family Frame Tent (HSHETENTF19F) LAB APPROVED', 1, 120)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (250, 81, N'All Weather Family Tent (HSHETENTF16C)', 1, 120)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (251, 79, N'New Family Frame Tent (LAB APPROVED)', 1, 120)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (252, 91, N'Relief Frame Tent', 1, 120)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (253, 89, N'Military Frame Tent 2', 1, 6)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (254, 110, N'Lantern', 1, 120)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (255, 104, N'ACTED', 1, 3)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (256, 104, N'Islamic Relief Pakistan', 1, 120)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (257, 101, N'RDF', 1, 120)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (258, 101, N'Help Age International', 1, 120)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (260, 98, N'Desert Bath Tent', 1, 120)
GO
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (261, 116, N'Kuwaiti Shelter ', 1, 120)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (262, 116, N'Black Shelter Tent with White strips', 1, 120)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (264, 118, N'Nokia', NULL, 1)
INSERT [dbo].[Brand] ([BrandId], [CategoryId], [Name], [IsActive], [SortOrder]) VALUES (265, 118, N'Sumsung', NULL, 2)
SET IDENTITY_INSERT [dbo].[Brand] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (79, N'UNHCR Tents', 1, 1)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (80, N'UNICEF Tents', 1, 2)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (81, N'IFRC Tent', 1, 3)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (82, N'IOM Tents', NULL, 6)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (83, N'UNDP Tents', 1, 5)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (84, N'WFP Tents', 1, 6)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (85, N'Relief Tents', 1, 7)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (86, N'Hospital Tent', 1, 8)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (87, N'Turkish Red Crescent tent', 1, 9)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (88, N'Warehouse Tent', 1, 10)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (89, N'Military Tents', 1, 11)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (90, N'Marquee Tents', 1, 12)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (91, N'Frame Tents', 1, 13)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (92, N'Deluxe Tents', 1, 14)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (93, N'Safari Tents', 1, 15)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (94, N'Shelter Tents', 1, 16)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (95, N'Light Weight Tents', 1, 17)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (96, N'Camping Tents', 1, 18)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (97, N'Shelter kit', 1, 19)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (98, N'Bath Tent', 1, 20)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (99, N'Tarpaulins', 1, 99)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (100, N'Blankets', 1, 22)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (101, N'Kitchen Sets', 1, 23)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (102, N'Jerry Cans', 1, 24)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (103, N'Buckets', 1, 25)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (104, N'Hygiene Kits', 1, 26)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (105, N'Sanitary Napkin', 1, 27)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (106, N'Sleeping Bags', 1, 28)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (107, N'Canvas And Fabric', 1, 29)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (108, N'Ropes', 1, 30)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (109, N'Cooking Stove', 1, 31)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (110, N'Lantern', 1, 32)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (111, N'Soap', 1, 33)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (112, N'Mosquito Nets', 1, 34)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (113, N'Quilts', 1, 35)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (114, N'Sleeping Mats', 1, 36)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (116, N'Kuwaiti Tents', 1, 21)
INSERT [dbo].[Category] ([CategoryId], [Name], [IsActive], [SortOrder]) VALUES (118, N'Mobiles', NULL, 0)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (273, 79, 132, N'Technical Specification and Side View', NULL, NULL, NULL, NULL, NULL, N'IMAG2090.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (287, 95, 165, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'IMG_0195.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (290, 104, 160, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'DSC00139.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (291, 82, 166, N'Technical Specification and Upper View', NULL, NULL, NULL, NULL, NULL, N'IMAG0326.jpg', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (295, 81, 136, N'Technical Specification and Side View', NULL, NULL, NULL, NULL, NULL, N'IMAG1975.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (298, 85, 167, N'Technical Specification and Outer View', N'Single Fly Double Fold Family Wall Tent<br>', NULL, NULL, NULL, NULL, N'tents 010.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (301, 89, 170, N'Technical Specification', N'Single Fly Single Fold<br>', NULL, NULL, NULL, NULL, N'SNC00190.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (303, 89, 172, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'IMAG0175.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (304, 90, 173, NULL, NULL, NULL, NULL, NULL, NULL, N'nopic.gif', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (305, 90, 173, N'Technical Specification and Outer View', NULL, NULL, NULL, NULL, NULL, N'IMAG0360.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (307, 90, 174, N'Technical Specification and Outer View', NULL, NULL, NULL, NULL, NULL, N'IMAG0341.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (308, 90, 175, N'Technical Specification and Outer View', NULL, NULL, NULL, NULL, NULL, N'28082007039.jpg', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (315, 92, NULL, N'Technical Specification and Outer View', NULL, NULL, NULL, NULL, NULL, N'P1010016.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (317, 101, 151, N'SPECIFICATIONS', NULL, NULL, NULL, NULL, NULL, N'20120714_155902.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (319, 101, 152, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'IMAG0808.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (321, 102, 180, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'sdadasd.jpg', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (322, 102, 181, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'20120324_134938.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (323, 102, 154, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'2222.jpg', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (324, 100, NULL, N'SPECIFICATIONS', NULL, NULL, NULL, NULL, NULL, N'iom_359x600.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (325, 113, 182, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'unhcr quilt_565x600.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (329, 79, 131, N'Technical Specification and Upper Side View', NULL, NULL, NULL, NULL, NULL, N'1_1600x1004.jpg', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (336, 83, 168, N'Technical Specification ', NULL, NULL, NULL, NULL, NULL, N'P1010071.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (337, 89, NULL, N'SPECIFICATIONS', NULL, NULL, NULL, NULL, NULL, N'20120326_135015_800x600.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (338, 89, 171, N'Technical Specification and Outer View', NULL, NULL, NULL, NULL, NULL, N'07112007016.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (339, 89, 185, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'SNC00162.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (340, 81, 137, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'3 (2).jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (341, 91, 186, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'P1010055.jpg', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (342, 92, 187, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'BlackStripes.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (343, 92, 188, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'DSC01761.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (344, 92, 189, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'IMAG0113.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (345, 93, 190, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'SNC00346.jpg', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (348, 80, 134, N'Technical Specification with Back View', NULL, NULL, NULL, NULL, NULL, N'DSC00416.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (349, 94, 193, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'P1010021.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (350, 81, 135, N'Technical Specification and Side View', NULL, NULL, NULL, NULL, NULL, N'26032008155.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (352, 82, 176, N'Technical Specification and Upper View', NULL, NULL, NULL, NULL, NULL, N'9.jpg', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (353, 84, 138, N'Technical Specification and Back View', NULL, NULL, NULL, NULL, NULL, N'IMAG0547.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (354, 85, 139, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'IMAG0072.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (356, 85, 141, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'IMAG0122.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (357, 85, 142, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'IMAG0112.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (358, 85, 143, N'Technical Specification and Front View', NULL, NULL, NULL, NULL, NULL, N'image005.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (361, 85, 140, N'Technical Specification and Front View', NULL, NULL, NULL, NULL, NULL, N'UNICEF_Refugee1.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (362, 85, 144, N'Technical Specification and Front View', NULL, NULL, NULL, NULL, NULL, N'26062008365.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (366, 104, 161, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'20120324_234628.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (367, 98, 196, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'TentLaterine.gif', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (368, 97, 164, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'ki.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (369, 100, 197, N'SPECIFICATION', NULL, NULL, NULL, NULL, NULL, N'unhcr high thermal_646x600.jpg', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (370, 100, 198, N'SPECIFICATION', NULL, NULL, NULL, NULL, NULL, N'unhcr med_646x600.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (372, 101, 150, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'DSC00614_800x600.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (375, 103, 201, N'SPECIFICATION', NULL, NULL, NULL, NULL, NULL, N'balti.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (376, 103, 202, N'SPECIFICATION', NULL, NULL, NULL, NULL, NULL, N'balti.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (377, 102, 153, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'20120524_194704.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (378, 111, 163, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'DSC05722_600x450.JPG', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (379, 103, 203, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'IMAG0076.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (380, 114, 204, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'sfsfs.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (381, 100, 147, N'SPECIFICATIONS', NULL, NULL, NULL, NULL, NULL, N'20120326_134934_800x600.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (387, 99, NULL, N'TARPAULIN SHEETS', NULL, NULL, NULL, NULL, NULL, N'20120326_134802_800x600.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (388, 107, 239, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'IMAG0002.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (390, 88, 212, N'Technical Specification and Outer View', NULL, NULL, NULL, NULL, NULL, N'IMAG0360.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (401, 79, 132, N'Front View', NULL, NULL, NULL, NULL, NULL, N'IMAG2086.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (409, 79, 131, N'Upper Front View', NULL, NULL, NULL, NULL, NULL, N'DSC01925_1600x1200.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (410, 79, 131, N'Front View', NULL, NULL, NULL, NULL, NULL, N'DSC01846.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (411, 79, 131, N'Back View', NULL, NULL, NULL, NULL, NULL, N'DSC01834_1600x895.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (412, 79, 131, N'Side View', NULL, NULL, NULL, NULL, NULL, N'DSC01899_1600x750.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (413, 79, 131, N'Inner View With Partition', NULL, NULL, NULL, NULL, NULL, N'DSC01871_1600x1200.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (414, 80, 134, N'Front View -1', NULL, NULL, NULL, NULL, NULL, N'DSC00390.jpg', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (415, 80, 134, N'Front View - 2', NULL, NULL, NULL, NULL, NULL, N'DSC00393.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (416, 80, 134, N'Side View', NULL, NULL, NULL, NULL, NULL, N'DSC00405.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (418, 80, 134, N'Inner View (Without Winterization Kit)', NULL, NULL, NULL, NULL, NULL, N'DSC00447.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (419, 80, 134, N'Inner View (With Winterization Kit)', NULL, NULL, NULL, NULL, NULL, N'DSC00436.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (420, 80, 191, N'Technical Specification and Side View', NULL, NULL, NULL, NULL, NULL, N'IMAG0385.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (421, 108, 214, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'white-cotton-rope_lg.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (422, 80, 191, N'Front view', NULL, NULL, NULL, NULL, NULL, N'IMAG0383.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (423, 80, 191, N'Inner View', NULL, NULL, NULL, NULL, NULL, N'IMAG0387.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (424, 82, 166, N'Front View', NULL, NULL, NULL, NULL, NULL, N'IMAG0300.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (426, 82, 166, N'Front Side View - 2', NULL, NULL, NULL, NULL, NULL, N'IMAG0312.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (427, 82, 166, N'Side View - 1', NULL, NULL, NULL, NULL, NULL, N'IMAG0306.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (428, 82, 166, N'Side View - 2', NULL, NULL, NULL, NULL, NULL, N'IMAG0314.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (429, 82, 166, N'Inner View', NULL, NULL, NULL, NULL, NULL, N'IMAG0321.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (435, 82, 176, N'Inner View', NULL, NULL, NULL, NULL, NULL, N'8.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (436, 81, 215, N'SPECIFICATIONS', NULL, NULL, NULL, NULL, NULL, N'ifrcc.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (437, 87, 194, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'DSC00097.jpg', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (438, 87, 194, N'Back View', NULL, NULL, NULL, NULL, NULL, N'DSC00101.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (439, 87, 194, N'Side View', NULL, NULL, NULL, NULL, NULL, N'DSC00094.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (440, 87, 194, N'Inner View', NULL, NULL, NULL, NULL, NULL, N'DSC00076.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (444, 81, 137, N'Front View', NULL, NULL, NULL, NULL, NULL, N'4.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (445, 81, 137, N'Back View', NULL, NULL, NULL, NULL, NULL, N'2 (2).jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (446, 81, 137, N'Inner View', NULL, NULL, NULL, NULL, NULL, N'5 (2).jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (447, 81, 137, N'Inner View With Partitions', NULL, NULL, NULL, NULL, NULL, N'6 (2).jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (448, 81, 137, N'View With Optional Upper Fly', NULL, NULL, NULL, NULL, NULL, N'1 (2).jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (449, 81, 135, N'Front View', NULL, NULL, NULL, NULL, NULL, N'26032008156.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (450, 81, 135, N'Inner View', NULL, NULL, NULL, NULL, NULL, N'26032008153.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (454, 93, 190, N'Front View', NULL, NULL, NULL, NULL, NULL, N'SNC00337.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (455, 93, 190, N'Back View', NULL, NULL, NULL, NULL, NULL, N'SNC00352.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (456, 93, 190, N'Side View', NULL, NULL, NULL, NULL, NULL, N'SNC00350.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (457, 93, 190, N'Inner View - 1', NULL, NULL, NULL, NULL, NULL, N'SNC00368.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (458, 93, 190, N'Inner View - 2', NULL, NULL, NULL, NULL, NULL, N'SNC00370.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (459, 80, 218, N'Technical Specification ', NULL, NULL, NULL, NULL, NULL, N'UNICEF_Refugee1.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (460, 84, 138, N'Front View', NULL, NULL, NULL, NULL, NULL, N'IMAG0534.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (462, 84, 138, N'Inner View', NULL, NULL, NULL, NULL, NULL, N'sss.jpg', 0, 1, 1)
GO
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (463, 85, 139, N'Front View', NULL, NULL, NULL, NULL, NULL, N'IMAG0064.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (464, 85, 139, N'Back View', NULL, NULL, NULL, NULL, NULL, N'IMAG0075.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (465, 85, 139, N'Side View', NULL, NULL, NULL, NULL, NULL, N'IMAG0061.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (466, 85, 141, N'Front View of 4 M x 4 M', NULL, NULL, NULL, NULL, NULL, N'IMAG0121.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (468, 85, 142, N'Front View', NULL, NULL, NULL, NULL, NULL, N'IMAG0109.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (469, 85, 141, N'Inner View', NULL, NULL, NULL, NULL, NULL, N'IMAG0321.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (470, 85, 142, N'Inner View', NULL, NULL, NULL, NULL, NULL, N'sss.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (471, 87, 215, N'Technical Specification and Side View', NULL, NULL, NULL, NULL, NULL, N'DSC00053.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (473, 106, 219, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'vcm_s_kf_repr_500x501.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (474, 85, 220, N'Technical Specification and Side View ', NULL, NULL, NULL, NULL, NULL, N'P1010253.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (475, 85, 221, N'Technical Specification and Upper View ', NULL, NULL, NULL, NULL, NULL, N'IMAG0847.jpg', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (476, 86, 210, N'Technical Specification & Front View', NULL, NULL, NULL, NULL, NULL, N'IMAG0268.jpg', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (477, 86, 210, N'Open Doors View', NULL, NULL, NULL, NULL, NULL, N'IMAG0270.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (479, 86, 210, N'Wooden Box for Frame and Accessories', NULL, NULL, NULL, NULL, NULL, N'IMAG0254.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (480, 87, 215, N'Front View', NULL, NULL, NULL, NULL, NULL, N'DSC00048.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (481, 87, 215, N'Back View', NULL, NULL, NULL, NULL, NULL, N'DSC00051.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (482, 89, 169, N'Technical Specification and Front View', NULL, NULL, NULL, NULL, NULL, N'IMAG0163.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (483, 89, 169, N'Side View', NULL, NULL, NULL, NULL, NULL, N'IMAG0166.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (484, 89, 169, N'Inner View', NULL, NULL, NULL, NULL, NULL, N'IMAG0154.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (485, 89, 170, N'Front View', NULL, NULL, NULL, NULL, NULL, N'SNC00181.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (486, 89, 170, N'Back View', NULL, NULL, NULL, NULL, NULL, N'SNC00188.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (487, 89, 170, N'Side View', NULL, NULL, NULL, NULL, NULL, N'SNC00187.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (488, 89, 170, N'Inner View', NULL, NULL, NULL, NULL, NULL, N'SNC00202.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (489, 89, 172, N'Front Closed View', NULL, NULL, NULL, NULL, NULL, N'IMAG0057.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (490, 89, 172, N'Front Open View ', NULL, NULL, NULL, NULL, NULL, N'IMAG0049.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (491, 89, 172, N'Side View', NULL, NULL, NULL, NULL, NULL, N'IMAG0040.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (492, 89, 171, N'Inner View', NULL, NULL, NULL, NULL, NULL, N'07112007014.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (493, 89, 185, N'Side View', NULL, NULL, NULL, NULL, NULL, N'SNC00160.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (494, 89, 185, N'Open Front View', NULL, NULL, NULL, NULL, NULL, N'SNC00177.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (495, 90, 173, N'Inner View', NULL, NULL, NULL, NULL, NULL, N'IMAG0353.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (496, 90, 174, N'Inner View', NULL, NULL, NULL, NULL, NULL, N'IMAG0357.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (497, 90, 175, N'Back View', NULL, NULL, NULL, NULL, NULL, N'28082007026.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (498, 90, 175, N'Inner View', NULL, NULL, NULL, NULL, NULL, N'28082007037.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (499, 91, 186, N'Front View', NULL, NULL, NULL, NULL, NULL, N'P1010051.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (500, 91, 186, N'Back View', NULL, NULL, NULL, NULL, NULL, N'P1010057.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (501, 91, 186, N'Side View', NULL, NULL, NULL, NULL, NULL, N'P1010052.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (502, 92, 187, N'Front View', NULL, NULL, NULL, NULL, NULL, N'P1010029.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (503, 92, 188, N'Outer View', NULL, NULL, NULL, NULL, NULL, N'DSC01768.jpg', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (504, 92, 188, N'Inner View', NULL, NULL, NULL, NULL, NULL, N'DSC01770.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (506, 92, 189, N'Side View', NULL, NULL, NULL, NULL, NULL, N'2011-07-05 15.10.46.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (507, 92, 189, N'Inner View', NULL, NULL, NULL, NULL, NULL, N'2011-07-05 15.11.26.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (508, 94, 193, N'View Without Side Walls', NULL, NULL, NULL, NULL, NULL, N'P1010025.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (509, 94, 193, N'Side View', NULL, NULL, NULL, NULL, NULL, N'Tents 026.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (510, 94, 193, N'Inner View', NULL, NULL, NULL, NULL, NULL, N'Tents 033.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (512, 95, 165, N'Front View', NULL, NULL, NULL, NULL, NULL, N'IMG_0193.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (513, 95, 165, N'Packing Bag ', NULL, NULL, NULL, NULL, NULL, N'12 (2).jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (514, 85, 220, N'Front View', NULL, NULL, NULL, NULL, NULL, N'P1010252.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (515, 85, 220, N'Back View', NULL, NULL, NULL, NULL, NULL, N'P1010254.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (516, 112, 223, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'16829926.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (517, 95, 224, N'Technical Specification and Front View', NULL, NULL, NULL, NULL, NULL, N'25032008143.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (518, 85, 221, N'Front View', NULL, NULL, NULL, NULL, NULL, N'IMAG0836.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (519, 85, 221, N'Back View', NULL, NULL, NULL, NULL, NULL, N'IMAG0826.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (520, 85, 221, N'Side View', NULL, NULL, NULL, NULL, NULL, N'IMAG0828.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (521, 85, 221, N'Inner View', NULL, NULL, NULL, NULL, NULL, N'IMAG0844.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (523, 95, 224, N'Joinning of Sticks', NULL, NULL, NULL, NULL, NULL, N'25032008142.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (524, 95, 224, NULL, NULL, NULL, NULL, NULL, NULL, N'12 (2).jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (527, 85, 143, N'Front Side View', NULL, NULL, NULL, NULL, NULL, N'15.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (528, 85, 143, N'Full Side View', NULL, NULL, NULL, NULL, NULL, N'16.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (529, 112, 223, N'Front View of Packing Bag', NULL, NULL, NULL, NULL, NULL, N'Front.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (530, 112, 223, N'Back View of Packing Bag', NULL, NULL, NULL, NULL, NULL, N'Back.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (531, NULL, NULL, N'4700', N'<p><font color="#0000ff"><strong><u>Double Fly Single Fold Tent - Family Ridge Tent</u></strong></font></p>
<p>For complete technical details please find it attached in Relief Tents.</p>
<font color="#ff0000"><strong><p><font color="#ff0000"><strong>Stock is updated on 02 - July - 2012</strong></font></p></strong></font>', NULL, NULL, NULL, NULL, N'IMAG0122.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (532, NULL, NULL, N'6800', N'<p>Single Fly Single Fold - Family Ridge Tent
For complete techincal details please find it in Relief Tents.
</p><p><font color="#ff0000"><strong>Stock is updated on 02 - July - 2012</strong></font></p>', NULL, NULL, NULL, NULL, N'IMAG0124.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (533, NULL, NULL, N'35000', N'<p><font color="#0000ff"><strong><u>UNHCR MOSQUITO NETS</u></strong></font></p>
<p><font color="#000000">For complete Technical Details please find it in Mosquito Nets on our website.</font></p>
<p><font color="#ff0000"><strong>Stock is updated on 02 -&nbsp;July - 2012</strong></font></p>', NULL, NULL, NULL, NULL, N'16829926.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (536, 79, 226, N'Technical Specifiaton', NULL, NULL, NULL, NULL, NULL, N'UNHCR tunnel tent.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (537, 79, 227, N'Technical Specifiaton', NULL, NULL, NULL, NULL, NULL, N'UNHCR tunnel tent.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (538, 85, 228, N'Technical Specifiaton', NULL, NULL, NULL, NULL, NULL, N'Picture1....jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (539, 85, 228, N'Inner view', NULL, NULL, NULL, NULL, NULL, N'dfgd.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (540, 85, 228, N'Front View', NULL, NULL, NULL, NULL, NULL, N'325.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (541, 114, 204, N'Packed Bales of Mats', NULL, NULL, NULL, NULL, NULL, N'DSC09208_800x600.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (542, 112, 223, N'Packed Bales of Nets', NULL, NULL, NULL, NULL, NULL, N'!cid___2@Foxmail.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (543, 112, 223, N'Packing of Mosquito Nets', NULL, NULL, NULL, NULL, NULL, N'packing5.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (546, 104, 160, N'Packing of Hygiene Kits', NULL, NULL, NULL, NULL, NULL, N'DSC00160.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (547, 102, 180, N'UNHCR Jerry cans Stocks', NULL, NULL, NULL, NULL, NULL, N'DSC00230_800x600.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (548, 102, 154, N'Collapsed View', NULL, NULL, NULL, NULL, NULL, N'4444.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (550, 102, 154, N'Packed Carton Boxes of IOM', NULL, NULL, NULL, NULL, NULL, N'DSC08049.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (551, 102, 154, NULL, NULL, NULL, NULL, NULL, NULL, N'DSC08043.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (553, 105, 230, N'Technical Specification', N'<font color="#006400" size="4"><b></b></font>', NULL, NULL, NULL, NULL, N'IMAG0002.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (568, 105, 230, N'Inside Packing of Bale', NULL, NULL, NULL, NULL, NULL, N'DSC02446_600x450.JPG', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (569, 105, 230, N'Stock Picture of Bales', NULL, NULL, NULL, NULL, NULL, N'DSC02385_600x450.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (572, 95, 165, N'back view', NULL, NULL, NULL, NULL, NULL, N'IMG_0209.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (573, 95, 224, N'front view', NULL, NULL, NULL, NULL, NULL, N'IMG_0116.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (579, 108, 231, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'braided-ropes-large5.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (580, 108, 232, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'20070808021903.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (581, 106, 219, N'Packing', NULL, NULL, NULL, NULL, NULL, N'Sleeping_bags_s.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (584, 100, 147, NULL, NULL, NULL, NULL, NULL, NULL, N'ifrc med thermal.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (585, 100, 205, N'specification', NULL, NULL, NULL, NULL, NULL, N'ifrc wool high thermal.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (586, 100, 206, N'Specification', NULL, NULL, NULL, NULL, NULL, N'ifrc.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (587, 103, 158, N'specification', NULL, NULL, NULL, NULL, NULL, N'unicef bucket.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (588, 99, 209, N'SPECIFICATIONS', NULL, NULL, NULL, NULL, NULL, N'031.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (589, 99, 209, NULL, NULL, NULL, NULL, NULL, NULL, N'Plain_Flock_Fabric.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (590, 99, 233, NULL, NULL, NULL, NULL, NULL, NULL, N'prod_pe_untarps.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (591, 99, 234, N'Specification', NULL, NULL, NULL, NULL, NULL, N'IMAG2631.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (592, 99, 234, NULL, NULL, NULL, NULL, NULL, NULL, N'prod_pe_untarps.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (593, 101, 235, N'Specifications', NULL, NULL, NULL, NULL, NULL, N'k set_1600x1200.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (595, 109, 236, N'Specification', NULL, NULL, NULL, NULL, NULL, N'stoove.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (599, 107, 208, N'Fabric', NULL, NULL, NULL, NULL, NULL, N'Fabric.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (600, 107, 239, N'Canvas', NULL, NULL, NULL, NULL, NULL, N'canvas.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (601, 107, 240, N'Fabric', NULL, NULL, NULL, NULL, NULL, N'Fabric.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (602, 103, 158, NULL, NULL, NULL, NULL, NULL, NULL, N'unicef bucket.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (604, 92, 242, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'5x8 Meters Khaki.jpg', 1, 1, 1)
GO
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (605, 94, 243, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'P1010021.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (607, 92, 244, N'Specification', NULL, NULL, NULL, NULL, NULL, N'cooler.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (608, 92, 242, N'Side View', NULL, NULL, NULL, NULL, NULL, N'P1010021 (2)_1600x973.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (609, 92, 245, N'Specification', NULL, NULL, NULL, NULL, NULL, N'front side view.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (610, 92, 246, N'Specification', NULL, NULL, NULL, NULL, NULL, N'front side view (2).jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (620, 81, 249, N'Technical Specification and Picture of Front Side View with Opening Front Door', NULL, NULL, NULL, NULL, NULL, N'f Front Side View with Opening Front Door.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (621, 81, 249, N'Back Side View', NULL, NULL, NULL, NULL, NULL, N'Back Side View.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (622, 81, 249, N'Back view', NULL, NULL, NULL, NULL, NULL, N'Back View.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (623, 81, 249, N'Front Side View with Closed Front Door.', NULL, NULL, NULL, NULL, NULL, N'Front Side View with Closed Front Door.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (624, 81, 249, N'Front View with Open Door', NULL, NULL, NULL, NULL, NULL, N'Front View with Open Door.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (625, 81, 249, N'Front View', NULL, NULL, NULL, NULL, NULL, N'Front View.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (626, 81, 249, N'Inside View 1', NULL, NULL, NULL, NULL, NULL, N'Inside View 1.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (628, 81, 250, N'Technical Specification and Upper Side View', NULL, NULL, NULL, NULL, NULL, N'1_1600x1004.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (640, 81, 250, N'Front View with Open Door', NULL, NULL, NULL, NULL, NULL, N'DSC01834_1600x895.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (641, 81, 250, N'Back view', NULL, NULL, NULL, NULL, NULL, N'DSC01846_1600x1200.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (642, 81, 250, N'chimney', NULL, NULL, NULL, NULL, NULL, N'DSC01853_900x1200.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (643, 81, 250, N'Inner View With Partition.', NULL, NULL, NULL, NULL, NULL, N'DSC01871_1600x1200.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (644, 81, 250, N'side view', NULL, NULL, NULL, NULL, NULL, N'DSC01899_1600x750.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (646, 79, 251, N'Technical specification andFront Side View with Opening Front Door', NULL, NULL, NULL, NULL, NULL, N'f Front Side View with Opening Front Door.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (647, 79, 251, N'Back Side View', NULL, NULL, NULL, NULL, NULL, N'Back Side View.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (648, 79, 251, N'back view', NULL, NULL, NULL, NULL, NULL, N'Back View.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (649, 79, 251, N'Front View with Open Door', NULL, NULL, NULL, NULL, NULL, N'Front Side View with Closed Front Door.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (650, 79, 251, N'Front Side View with Opening Front Door', NULL, NULL, NULL, NULL, NULL, N'Front View with Open Door.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (651, 79, 251, N'Front View', NULL, NULL, NULL, NULL, NULL, N'Front View.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (652, 79, 251, N'inner view', NULL, NULL, NULL, NULL, NULL, N'Inside View 1.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (653, 79, 251, N'Inside View 2', NULL, NULL, NULL, NULL, NULL, N'Inside View 2.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (654, 91, 252, N'Technical Specification ', NULL, NULL, NULL, NULL, NULL, N'20130403_120744_1600x1200.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (661, 91, 252, N'Front View with Open Door', NULL, NULL, NULL, NULL, NULL, N'20130403_120244_1600x1200.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (662, 91, 252, N'back view', NULL, NULL, NULL, NULL, NULL, N'20130403_120422_1600x1200.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (663, 91, 252, N'Inside View 1', NULL, NULL, NULL, NULL, NULL, N'20130403_120442_1600x1200.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (664, 91, 252, N'Inside View 2', NULL, NULL, NULL, NULL, NULL, N'20130403_120503_1600x1200.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (666, 91, 252, N'Front Side View with closed Front Door', NULL, NULL, NULL, NULL, NULL, N'20130403_120811_1600x1200.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (667, 91, 252, N'side view', NULL, NULL, NULL, NULL, NULL, N'20130403_120354_1600x1200.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (668, 92, 245, N'Front Side View with closed  Door', NULL, NULL, NULL, NULL, NULL, N'front open door (1).jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (669, 92, 245, N'Front View with Open Door', NULL, NULL, NULL, NULL, NULL, N'front open door (2).jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (670, 92, 245, N'side view', NULL, NULL, NULL, NULL, NULL, N'side view.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (671, 92, 246, NULL, NULL, NULL, NULL, NULL, NULL, N'P1010021 (2).jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (672, 92, 246, NULL, NULL, NULL, NULL, NULL, NULL, N'P1010016.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (673, 89, 253, N'Technical Specification and Front Side View', NULL, NULL, NULL, NULL, NULL, N'20130514_115444_1600x1200.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (674, 89, 253, N'Side view', NULL, NULL, NULL, NULL, NULL, N'20130514_115640(0)_1600x1200.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (675, 89, 253, N'Inside View 1', NULL, NULL, NULL, NULL, NULL, N'20130514_115730_800x600.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (676, 89, 253, N'Inside View 2', NULL, NULL, NULL, NULL, NULL, N'20130514_115743_640x480.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (681, 110, 254, NULL, NULL, NULL, NULL, NULL, NULL, N'l1.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (682, 110, 254, NULL, NULL, NULL, NULL, NULL, NULL, N'L2.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (683, 110, 254, NULL, NULL, NULL, NULL, NULL, NULL, N'L3.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (684, 110, 254, NULL, NULL, NULL, NULL, NULL, NULL, N'L4.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (685, 104, 255, N'Specification', NULL, NULL, NULL, NULL, NULL, N'20130719_144343.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (686, 104, 256, NULL, NULL, NULL, NULL, NULL, NULL, N'logo-01.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (689, 101, 257, N'Specification', NULL, NULL, NULL, NULL, NULL, N'rdf1.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (690, 101, 258, N'Specification', NULL, NULL, NULL, NULL, NULL, N'290320131142_800x600.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (691, 98, 260, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'front side view.jpg', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (692, 98, 260, N'back view', NULL, NULL, NULL, NULL, NULL, N'back side.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (693, 98, 260, N'Front View', NULL, NULL, NULL, NULL, NULL, N'front side.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (694, 98, 260, N'inner view', NULL, NULL, NULL, NULL, NULL, N'inner view.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (695, 116, 261, N'Technical Specification', NULL, NULL, NULL, NULL, NULL, N'kt.jpg', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (697, 116, 261, N'Inside View 1', NULL, NULL, NULL, NULL, NULL, N'20130525_121310.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (698, 116, 261, N'Inside View 2', NULL, NULL, NULL, NULL, NULL, N'20130525_121049.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (699, 116, 262, N'Technical Specification and Front  View', NULL, NULL, NULL, NULL, NULL, N'bst.jpg', 1, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (700, 116, 262, NULL, NULL, NULL, NULL, NULL, NULL, N'nopic.gif', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (701, 116, 262, N'Back Side View', NULL, NULL, NULL, NULL, NULL, N'20130601_172702.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (703, 116, 262, N'inner view', NULL, NULL, NULL, NULL, NULL, N'20130601_172857.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (704, NULL, NULL, NULL, N'ttttttt 12345<br>', NULL, NULL, NULL, NULL, N'speedboat03.jpg', 0, 1, 1)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (709, NULL, NULL, N's', N's', N's', N's', N'ss', NULL, N'DAT=90736 copy 2 B3.jpg', NULL, 0, NULL)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (710, 82, 134, N's', N's', N's', N's', N'ss', NULL, N'DAT=90736 copy 2 B4.jpg', NULL, 0, NULL)
INSERT [dbo].[Product] ([ProductId], [CategoryId], [BrandId], [Name], [Description], [TentMaterial], [TentManufacturing], [Usages], [LengthAndHeight], [PictureName], [IsDisplayHome], [SortOrder], [IsActive]) VALUES (711, 118, 265, N'S8', N'S8', N'S8', N'S8', N'S8', N'S8', N'DAT=90736 copy 2 B5.jpg', NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
INSERT [dbo].[Users] ([UserId], [UserName], [Password]) VALUES (1, N'admin', N'1234')
ALTER TABLE [dbo].[Brand]  WITH CHECK ADD  CONSTRAINT [FK_Brand_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Brand] CHECK CONSTRAINT [FK_Brand_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brand] ([BrandId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
USE [master]
GO
ALTER DATABASE [TestWeb] SET  READ_WRITE 
GO
