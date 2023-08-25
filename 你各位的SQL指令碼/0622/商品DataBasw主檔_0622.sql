/****** Object:  Table [dbo].[ColorCategories]    Script Date: 2023/6/22 上午 02:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ColorCategories](
	[ColorId] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ColorCategory] PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 2023/6/22 上午 02:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[ProductCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategoryName] [nvarchar](50) NOT NULL,
	[fk_SalesCategoryId] [int] NOT NULL,
	[CategoryPath] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductGroups]    Script Date: 2023/6/22 上午 02:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductGroups](
	[ProductGroupId] [int] IDENTITY(1000,1) NOT NULL,
	[fk_ProductId] [varchar](254) NOT NULL,
	[fk_ColorId] [int] NOT NULL,
	[fk_SizeID] [int] NOT NULL,
	[Qty] [int] NOT NULL,
 CONSTRAINT [PK_ProductGroups] PRIMARY KEY CLUSTERED 
(
	[ProductGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImgs]    Script Date: 2023/6/22 上午 02:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImgs](
	[ProductImgId] [int] IDENTITY(1,1) NOT NULL,
	[fk_ProductId] [varchar](254) NOT NULL,
	[ImgPath] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ProductImg] PRIMARY KEY CLUSTERED 
(
	[ProductImgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2023/6/22 上午 02:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [varchar](254) NOT NULL,
	[ProductName] [nvarchar](254) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductMaterial] [nvarchar](50) NULL,
	[ProductOrigin] [nvarchar](50) NOT NULL,
	[UnitPrice] [int] NULL,
	[SalesPrice] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NULL,
	[LogOut] [bit] NOT NULL,
	[Tag] [nvarchar](100) NULL,
	[fk_ProductSubCategoryID] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[EditTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSubCategories]    Script Date: 2023/6/22 上午 02:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSubCategories](
	[ProductSubCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ProductSubCategoryName] [nvarchar](50) NOT NULL,
	[fk_ProductCategoryId] [int] NOT NULL,
	[SubCategoryPath] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_ProductSubCategory] PRIMARY KEY CLUSTERED 
(
	[ProductSubCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesCategories]    Script Date: 2023/6/22 上午 02:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesCategories](
	[SalesCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[SalesCategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SalesCategory] PRIMARY KEY CLUSTERED 
(
	[SalesCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SizeCategories]    Script Date: 2023/6/22 上午 02:04:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SizeCategories](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SizeCategories] PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ColorCategories] ON 
GO
INSERT [dbo].[ColorCategories] ([ColorId], [ColorName]) VALUES (1, N'黑')
GO
INSERT [dbo].[ColorCategories] ([ColorId], [ColorName]) VALUES (2, N'白')
GO
INSERT [dbo].[ColorCategories] ([ColorId], [ColorName]) VALUES (3, N'灰')
GO
INSERT [dbo].[ColorCategories] ([ColorId], [ColorName]) VALUES (4, N'紅')
GO
INSERT [dbo].[ColorCategories] ([ColorId], [ColorName]) VALUES (5, N'藍')
GO
INSERT [dbo].[ColorCategories] ([ColorId], [ColorName]) VALUES (6, N'黃')
GO
SET IDENTITY_INSERT [dbo].[ColorCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 
GO
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [fk_SalesCategoryId], [CategoryPath]) VALUES (1, N'上衣', 1, N'男裝/上衣')
GO
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [fk_SalesCategoryId], [CategoryPath]) VALUES (2, N'上衣', 2, N'女裝/上衣')
GO
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [fk_SalesCategoryId], [CategoryPath]) VALUES (3, N'上衣', 3, N'童裝/上衣')
GO
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [fk_SalesCategoryId], [CategoryPath]) VALUES (4, N'褲子', 1, N'男裝/褲子')
GO
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [fk_SalesCategoryId], [CategoryPath]) VALUES (5, N'褲子', 2, N'女裝/褲子')
GO
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [fk_SalesCategoryId], [CategoryPath]) VALUES (6, N'褲子', 3, N'童裝/褲子')
GO
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [fk_SalesCategoryId], [CategoryPath]) VALUES (7, N'鞋子', 1, N'男裝/鞋子')
GO
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [fk_SalesCategoryId], [CategoryPath]) VALUES (8, N'鞋子', 2, N'女裝/鞋子')
GO
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [fk_SalesCategoryId], [CategoryPath]) VALUES (9, N'鞋子', 3, N'童裝/鞋子')
GO
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [fk_SalesCategoryId], [CategoryPath]) VALUES (10, N'配件', 1, N'男裝/配件')
GO
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [fk_SalesCategoryId], [CategoryPath]) VALUES (11, N'配件', 2, N'女裝/配件')
GO
INSERT [dbo].[ProductCategories] ([ProductCategoryId], [ProductCategoryName], [fk_SalesCategoryId], [CategoryPath]) VALUES (12, N'配件', 3, N'童裝/配件')
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductGroups] ON 
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1000, N'M_CL_ST_0001', 1, 1, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1001, N'M_CL_ST_0001', 1, 2, 200)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1002, N'M_CL_ST_0001', 1, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1003, N'M_CL_ST_0001', 1, 4, 110)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1004, N'M_CL_ST_0001', 2, 1, 120)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1005, N'M_CL_ST_0001', 2, 2, 900)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1006, N'M_CL_ST_0001', 2, 3, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1007, N'M_CL_ST_0001', 2, 4, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1008, N'M_CL_ST_0002', 3, 1, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1009, N'M_CL_ST_0002', 3, 2, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1010, N'M_CL_ST_0002', 3, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1011, N'M_CL_ST_0002', 3, 4, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1012, N'M_CL_ST_0002', 4, 1, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1013, N'M_CL_ST_0002', 4, 2, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1014, N'M_CL_ST_0002', 4, 3, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1015, N'M_CL_ST_0002', 4, 4, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1016, N'F_CL_ST_0001', 2, 1, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1017, N'F_CL_ST_0001', 2, 2, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1018, N'F_CL_ST_0001', 2, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1019, N'F_CL_ST_0001', 2, 4, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1020, N'F_CL_ST_0001', 2, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1021, N'F_CL_ST_0001', 6, 1, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1022, N'F_CL_ST_0001', 6, 2, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1023, N'F_CL_ST_0001', 6, 3, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1024, N'F_CL_ST_0001', 6, 4, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1025, N'F_CL_ST_0001', 6, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1026, N'F_CL_ST_0002', 3, 1, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1027, N'F_CL_ST_0002', 3, 2, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1028, N'F_CL_ST_0002', 3, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1029, N'F_CL_ST_0002', 3, 4, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1030, N'F_CL_ST_0002', 3, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1031, N'F_CL_ST_0002', 5, 1, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1032, N'F_CL_ST_0002', 5, 2, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1033, N'F_CL_ST_0002', 5, 3, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1034, N'F_CL_ST_0002', 5, 4, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1035, N'F_CL_ST_0002', 5, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1036, N'C_CL_ST_0001', 1, 1, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1037, N'C_CL_ST_0001', 1, 2, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1038, N'C_CL_ST_0001', 1, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1039, N'C_CL_ST_0001', 1, 4, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1040, N'C_CL_ST_0001', 1, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1041, N'C_CL_ST_0001', 2, 1, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1042, N'C_CL_ST_0001', 2, 2, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1043, N'C_CL_ST_0001', 2, 3, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1044, N'C_CL_ST_0001', 2, 4, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1045, N'C_CL_ST_0001', 2, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1046, N'C_CL_ST_0002', 1, 1, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1047, N'C_CL_ST_0002', 1, 2, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1048, N'C_CL_ST_0002', 1, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1049, N'C_CL_ST_0002', 1, 4, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1050, N'C_CL_ST_0002', 1, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1051, N'C_CL_ST_0002', 3, 1, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1052, N'C_CL_ST_0002', 3, 2, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1053, N'C_CL_ST_0002', 3, 3, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1054, N'C_CL_ST_0002', 3, 4, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1055, N'M_CL_LG_0001', 2, 1, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1056, N'M_CL_LG_0001', 2, 2, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1057, N'M_CL_LG_0001', 2, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1058, N'M_CL_LG_0001', 2, 4, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1059, N'M_CL_LG_0001', 2, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1060, N'M_CL_LG_0001', 3, 1, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1061, N'M_CL_LG_0001', 3, 2, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1062, N'M_CL_LG_0001', 3, 3, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1063, N'M_CL_LG_0001', 3, 4, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1064, N'M_CL_LG_0002', 4, 1, 0)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1065, N'M_CL_LG_0002', 4, 2, 0)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1066, N'M_CL_LG_0002', 4, 3, 0)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1067, N'M_CL_LG_0002', 4, 4, 0)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1068, N'M_CL_LG_0002', 4, 5, 0)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1069, N'M_CL_LG_0002', 5, 1, 0)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1070, N'M_CL_LG_0002', 5, 2, 0)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1071, N'M_CL_LG_0002', 5, 3, 0)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1072, N'M_CL_LG_0002', 5, 4, 0)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1073, N'F_CL_LG_0001', 1, 1, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1074, N'F_CL_LG_0001', 1, 2, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1075, N'F_CL_LG_0001', 1, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1076, N'F_CL_LG_0001', 1, 4, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1077, N'F_CL_LG_0001', 1, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1078, N'F_CL_LG_0001', 2, 1, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1079, N'F_CL_LG_0001', 2, 2, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1080, N'F_CL_LG_0001', 2, 3, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1081, N'F_CL_LG_0001', 2, 4, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1082, N'F_CL_LG_0002', 1, 1, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1083, N'F_CL_LG_0002', 1, 2, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1084, N'F_CL_LG_0002', 1, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1085, N'F_CL_LG_0002', 1, 4, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1086, N'F_CL_LG_0002', 1, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1087, N'F_CL_LG_0002', 3, 1, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1088, N'F_CL_LG_0002', 3, 2, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1089, N'F_CL_LG_0002', 3, 3, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1090, N'F_CL_LG_0002', 3, 4, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1091, N'C_CL_LG_0001', 1, 1, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1092, N'C_CL_LG_0001', 1, 2, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1093, N'C_CL_LG_0001', 1, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1094, N'C_CL_LG_0001', 1, 4, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1095, N'C_CL_LG_0001', 1, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1096, N'C_CL_LG_0002', 1, 1, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1097, N'C_CL_LG_0002', 1, 2, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1098, N'C_CL_LG_0002', 1, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1099, N'C_CL_LG_0002', 1, 4, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1100, N'C_CL_LG_0002', 1, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1101, N'M_PA_ST_0001', 1, 1, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1102, N'M_PA_ST_0001', 1, 2, 200)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1103, N'M_PA_ST_0001', 1, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1104, N'M_PA_ST_0001', 1, 4, 110)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1105, N'M_PA_ST_0001', 2, 1, 120)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1106, N'M_PA_ST_0001', 2, 2, 900)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1107, N'M_PA_ST_0001', 2, 3, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1108, N'M_PA_ST_0001', 2, 4, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1109, N'M_PA_ST_0002', 3, 1, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1110, N'M_PA_ST_0002', 3, 2, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1111, N'M_PA_ST_0002', 3, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1112, N'M_PA_ST_0002', 3, 4, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1113, N'M_PA_ST_0002', 4, 1, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1114, N'M_PA_ST_0002', 4, 2, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1115, N'M_PA_ST_0002', 4, 3, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1116, N'M_PA_ST_0002', 4, 4, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1117, N'F_PA_ST_0001', 2, 1, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1118, N'F_PA_ST_0001', 2, 2, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1119, N'F_PA_ST_0001', 2, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1120, N'F_PA_ST_0001', 2, 4, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1121, N'F_PA_ST_0001', 2, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1122, N'F_PA_ST_0001', 6, 1, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1123, N'F_PA_ST_0001', 6, 2, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1124, N'F_PA_ST_0001', 6, 3, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1125, N'F_PA_ST_0001', 6, 4, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1126, N'F_PA_ST_0001', 6, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1127, N'F_PA_ST_0002', 3, 1, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1128, N'F_PA_ST_0002', 3, 2, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1129, N'F_PA_ST_0002', 3, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1130, N'F_PA_ST_0002', 3, 4, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1131, N'F_PA_ST_0002', 3, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1132, N'F_PA_ST_0002', 5, 1, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1133, N'F_PA_ST_0002', 5, 2, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1134, N'F_PA_ST_0002', 5, 3, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1135, N'F_PA_ST_0002', 5, 4, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1136, N'F_PA_ST_0002', 5, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1137, N'C_PA_ST_0001', 1, 1, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1138, N'C_PA_ST_0001', 1, 2, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1139, N'C_PA_ST_0001', 1, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1140, N'C_PA_ST_0001', 1, 4, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1141, N'C_PA_ST_0001', 1, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1142, N'C_PA_ST_0001', 2, 1, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1143, N'C_PA_ST_0001', 2, 2, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1144, N'C_PA_ST_0001', 2, 3, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1145, N'C_PA_ST_0001', 2, 4, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1146, N'C_PA_ST_0001', 2, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1147, N'C_PA_ST_0002', 1, 1, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1148, N'C_PA_ST_0002', 1, 2, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1149, N'C_PA_ST_0002', 1, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1150, N'C_PA_ST_0002', 1, 4, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1151, N'C_PA_ST_0002', 1, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1152, N'C_PA_ST_0002', 3, 1, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1153, N'C_PA_ST_0002', 3, 2, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1154, N'C_PA_ST_0002', 3, 3, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1155, N'C_PA_ST_0002', 3, 4, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1156, N'M_PA_LG_0001', 1, 1, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1157, N'M_PA_LG_0001', 1, 2, 200)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1158, N'M_PA_LG_0001', 1, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1159, N'M_PA_LG_0001', 1, 4, 110)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1160, N'M_PA_LG_0001', 2, 1, 120)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1161, N'M_PA_LG_0001', 2, 2, 900)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1162, N'M_PA_LG_0001', 2, 3, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1163, N'M_PA_LG_0001', 2, 4, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1164, N'M_PA_LG_0002', 3, 1, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1165, N'M_PA_LG_0002', 3, 2, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1166, N'M_PA_LG_0002', 3, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1167, N'M_PA_LG_0002', 3, 4, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1168, N'M_PA_LG_0002', 4, 1, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1169, N'M_PA_LG_0002', 4, 2, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1170, N'M_PA_LG_0002', 4, 3, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1171, N'M_PA_LG_0002', 4, 4, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1172, N'F_PA_LG_0001', 2, 1, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1173, N'F_PA_LG_0001', 2, 2, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1174, N'F_PA_LG_0001', 2, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1175, N'F_PA_LG_0001', 2, 4, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1176, N'F_PA_LG_0001', 2, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1177, N'F_PA_LG_0001', 6, 1, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1178, N'F_PA_LG_0001', 6, 2, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1179, N'F_PA_LG_0001', 6, 3, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1180, N'F_PA_LG_0001', 6, 4, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1181, N'F_PA_LG_0001', 6, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1182, N'F_PA_LG_0002', 3, 1, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1183, N'F_PA_LG_0002', 3, 2, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1184, N'F_PA_LG_0002', 3, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1185, N'F_PA_LG_0002', 3, 4, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1186, N'F_PA_LG_0002', 3, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1187, N'F_PA_LG_0002', 5, 1, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1188, N'F_PA_LG_0002', 5, 2, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1189, N'F_PA_LG_0002', 5, 3, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1190, N'F_PA_LG_0002', 5, 4, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1191, N'F_PA_LG_0002', 5, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1192, N'C_PA_LG_0001', 1, 1, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1193, N'C_PA_LG_0001', 1, 2, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1194, N'C_PA_LG_0001', 1, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1195, N'C_PA_LG_0001', 1, 4, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1196, N'C_PA_LG_0001', 1, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1197, N'C_PA_LG_0001', 2, 1, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1198, N'C_PA_LG_0001', 2, 2, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1199, N'C_PA_LG_0001', 2, 3, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1200, N'C_PA_LG_0001', 2, 4, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1201, N'C_PA_LG_0001', 2, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1202, N'C_PA_LG_0002', 1, 1, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1203, N'C_PA_LG_0002', 1, 2, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1204, N'C_PA_LG_0002', 1, 3, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1205, N'C_PA_LG_0002', 1, 4, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1206, N'C_PA_LG_0002', 1, 5, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1207, N'C_PA_LG_0002', 3, 1, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1208, N'C_PA_LG_0002', 3, 2, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1209, N'C_PA_LG_0002', 3, 3, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1210, N'C_PA_LG_0002', 3, 4, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1211, N'M_SH_CL_0001', 1, 28, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1212, N'M_SH_CL_0001', 1, 29, 200)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1213, N'M_SH_CL_0001', 1, 30, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1214, N'M_SH_CL_0001', 1, 31, 110)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1215, N'M_SH_CL_0001', 1, 32, 110)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1216, N'M_SH_CL_0001', 2, 28, 120)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1217, N'M_SH_CL_0001', 2, 29, 900)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1218, N'M_SH_CL_0001', 2, 30, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1219, N'M_SH_CL_0001', 2, 31, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1220, N'M_SH_CL_0001', 2, 32, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1221, N'M_SH_CL_0002', 3, 28, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1222, N'M_SH_CL_0002', 3, 29, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1223, N'M_SH_CL_0002', 3, 30, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1224, N'M_SH_CL_0002', 3, 31, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1225, N'M_SH_CL_0002', 4, 28, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1226, N'M_SH_CL_0002', 4, 29, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1227, N'M_SH_CL_0002', 4, 30, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1228, N'M_SH_CL_0002', 4, 31, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1229, N'F_SH_CL_0001', 2, 20, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1230, N'F_SH_CL_0001', 2, 21, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1231, N'F_SH_CL_0001', 2, 22, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1232, N'F_SH_CL_0001', 2, 23, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1233, N'F_SH_CL_0001', 2, 24, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1234, N'F_SH_CL_0001', 6, 20, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1235, N'F_SH_CL_0001', 6, 21, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1236, N'F_SH_CL_0001', 6, 22, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1237, N'F_SH_CL_0001', 6, 23, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1238, N'F_SH_CL_0001', 6, 24, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1239, N'F_SH_CL_0002', 1, 20, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1240, N'F_SH_CL_0002', 1, 21, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1241, N'F_SH_CL_0002', 1, 22, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1242, N'F_SH_CL_0002', 1, 23, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1243, N'F_SH_CL_0002', 1, 24, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1244, N'F_SH_CL_0002', 2, 20, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1245, N'F_SH_CL_0002', 2, 21, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1246, N'F_SH_CL_0002', 2, 22, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1247, N'F_SH_CL_0002', 2, 23, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1248, N'F_SH_CL_0002', 2, 24, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1249, N'C_SH_CL_0001', 1, 8, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1250, N'C_SH_CL_0001', 1, 9, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1251, N'C_SH_CL_0001', 1, 10, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1252, N'C_SH_CL_0001', 1, 11, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1253, N'C_SH_CL_0001', 1, 12, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1254, N'C_SH_CL_0001', 2, 8, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1255, N'C_SH_CL_0001', 2, 9, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1256, N'C_SH_CL_0001', 2, 10, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1257, N'C_SH_CL_0001', 2, 11, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1258, N'C_SH_CL_0001', 2, 12, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1259, N'C_SH_CL_0002', 1, 8, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1260, N'C_SH_CL_0002', 1, 9, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1261, N'C_SH_CL_0002', 1, 10, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1262, N'C_SH_CL_0002', 1, 11, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1263, N'C_SH_CL_0002', 1, 12, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1264, N'C_SH_CL_0002', 3, 8, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1265, N'C_SH_CL_0002', 3, 9, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1266, N'C_SH_CL_0002', 3, 10, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1267, N'C_SH_CL_0002', 3, 11, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1268, N'C_SH_CL_0002', 3, 12, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1269, N'M_SH_SP_0001', 1, 28, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1270, N'M_SH_SP_0001', 1, 29, 200)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1271, N'M_SH_SP_0001', 1, 30, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1272, N'M_SH_SP_0001', 1, 31, 110)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1273, N'M_SH_SP_0001', 1, 32, 110)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1274, N'M_SH_SP_0001', 2, 28, 120)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1275, N'M_SH_SP_0001', 2, 29, 900)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1276, N'M_SH_SP_0001', 2, 30, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1277, N'M_SH_SP_0001', 2, 31, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1278, N'M_SH_SP_0001', 2, 32, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1279, N'M_SH_SP_0002', 3, 28, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1280, N'M_SH_SP_0002', 3, 29, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1281, N'M_SH_SP_0002', 3, 30, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1282, N'M_SH_SP_0002', 3, 31, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1283, N'M_SH_SP_0002', 4, 28, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1284, N'M_SH_SP_0002', 4, 29, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1285, N'M_SH_SP_0002', 4, 30, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1286, N'M_SH_SP_0002', 4, 31, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1287, N'F_SH_SP_0001', 2, 20, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1288, N'F_SH_SP_0001', 2, 21, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1289, N'F_SH_SP_0001', 2, 22, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1290, N'F_SH_SP_0001', 2, 23, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1291, N'F_SH_SP_0001', 2, 24, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1292, N'F_SH_SP_0001', 6, 20, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1293, N'F_SH_SP_0001', 6, 21, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1294, N'F_SH_SP_0001', 6, 22, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1295, N'F_SH_SP_0001', 6, 23, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1296, N'F_SH_SP_0001', 6, 24, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1297, N'F_SH_SP_0002', 1, 20, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1298, N'F_SH_SP_0002', 1, 21, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1299, N'F_SH_SP_0002', 1, 22, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1300, N'F_SH_SP_0002', 1, 23, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1301, N'F_SH_SP_0002', 1, 24, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1302, N'F_SH_SP_0002', 2, 20, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1303, N'F_SH_SP_0002', 2, 21, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1304, N'F_SH_SP_0002', 2, 22, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1305, N'F_SH_SP_0002', 2, 23, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1306, N'F_SH_SP_0002', 2, 24, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1307, N'C_SH_SP_0001', 1, 8, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1308, N'C_SH_SP_0001', 1, 9, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1309, N'C_SH_SP_0001', 1, 10, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1310, N'C_SH_SP_0001', 1, 11, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1311, N'C_SH_SP_0001', 1, 12, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1312, N'C_SH_SP_0001', 2, 8, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1313, N'C_SH_SP_0001', 2, 9, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1314, N'C_SH_SP_0001', 2, 10, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1315, N'C_SH_SP_0001', 2, 11, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1316, N'C_SH_SP_0001', 2, 12, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1317, N'C_SH_SP_0002', 1, 8, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1318, N'C_SH_SP_0002', 1, 9, 100)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1319, N'C_SH_SP_0002', 1, 10, 80)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1320, N'C_SH_SP_0002', 1, 11, 130)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1321, N'C_SH_SP_0002', 1, 12, 30)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1322, N'C_SH_SP_0002', 3, 8, 190)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1323, N'C_SH_SP_0002', 3, 9, 300)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1324, N'C_SH_SP_0002', 3, 10, 220)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1325, N'C_SH_SP_0002', 3, 11, 50)
GO
INSERT [dbo].[ProductGroups] ([ProductGroupId], [fk_ProductId], [fk_ColorId], [fk_SizeID], [Qty]) VALUES (1326, N'C_SH_SP_0002', 3, 12, 50)
GO
SET IDENTITY_INSERT [dbo].[ProductGroups] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImgs] ON 
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (1, N'M_CL_ST_0001', N'Product_0011.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (2, N'M_CL_ST_0001', N'Product_0012.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (3, N'M_CL_ST_0001', N'Product_0013.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (4, N'M_CL_ST_0001', N'Product_0014.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (5, N'M_CL_ST_0001', N'Product_0015.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (6, N'M_CL_ST_0001', N'Product_0016.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (7, N'M_CL_ST_0002', N'Product_0021.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (8, N'M_CL_ST_0002', N'Product_0022.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (9, N'M_CL_ST_0002', N'Product_0023.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (10, N'M_CL_ST_0002', N'Product_0024.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (11, N'M_CL_ST_0002', N'Product_0025.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (12, N'M_CL_ST_0002', N'Product_0026.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (13, N'F_CL_ST_0001', N'Product_0031.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (14, N'F_CL_ST_0001', N'Product_0032.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (15, N'F_CL_ST_0001', N'Product_0033.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (16, N'F_CL_ST_0001', N'Product_0034.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (17, N'F_CL_ST_0001', N'Product_0035.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (18, N'F_CL_ST_0001', N'Product_0036.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (19, N'F_CL_ST_0002', N'Product_0041.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (20, N'F_CL_ST_0002', N'Product_0042.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (21, N'F_CL_ST_0002', N'Product_0043.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (22, N'F_CL_ST_0002', N'Product_0044.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (23, N'F_CL_ST_0002', N'Product_0045.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (24, N'F_CL_ST_0002', N'Product_0046.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (25, N'C_CL_ST_0001', N'Product_0051.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (26, N'C_CL_ST_0001', N'Product_0052.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (27, N'C_CL_ST_0001', N'Product_0053.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (28, N'C_CL_ST_0001', N'Product_0054.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (29, N'C_CL_ST_0001', N'Product_0055.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (30, N'C_CL_ST_0001', N'Product_0056.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (31, N'C_CL_ST_0002', N'Product_0061.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (32, N'C_CL_ST_0002', N'Product_0062.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (33, N'C_CL_ST_0002', N'Product_0063.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (34, N'C_CL_ST_0002', N'Product_0064.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (35, N'C_CL_ST_0002', N'Product_0065.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (36, N'C_CL_ST_0002', N'Product_0066.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (37, N'M_CL_LG_0001', N'Product_0071.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (38, N'M_CL_LG_0001', N'Product_0072.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (39, N'M_CL_LG_0001', N'Product_0073.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (40, N'M_CL_LG_0001', N'Product_0074.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (41, N'M_CL_LG_0001', N'Product_0075.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (42, N'M_CL_LG_0001', N'Product_0076.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (43, N'M_CL_LG_0002', N'Product_0081.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (44, N'M_CL_LG_0002', N'Product_0082.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (45, N'M_CL_LG_0002', N'Product_0083.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (46, N'M_CL_LG_0002', N'Product_0084.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (47, N'M_CL_LG_0002', N'Product_0085.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (48, N'M_CL_LG_0002', N'Product_0086.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (49, N'F_CL_LG_0001', N'Product_0091.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (50, N'F_CL_LG_0001', N'Product_0092.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (51, N'F_CL_LG_0001', N'Product_0093.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (52, N'F_CL_LG_0001', N'Product_0094.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (53, N'F_CL_LG_0001', N'Product_0095.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (54, N'F_CL_LG_0001', N'Product_0096.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (55, N'F_CL_LG_0002', N'Product_00101.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (56, N'F_CL_LG_0002', N'Product_00102.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (57, N'F_CL_LG_0002', N'Product_00103.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (58, N'F_CL_LG_0002', N'Product_00104.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (59, N'F_CL_LG_0002', N'Product_00105.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (60, N'F_CL_LG_0002', N'Product_00106.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (61, N'C_CL_LG_0001', N'Product_00111.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (62, N'C_CL_LG_0001', N'Product_00112.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (63, N'C_CL_LG_0001', N'Product_00113.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (64, N'C_CL_LG_0001', N'Product_00114.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (65, N'C_CL_LG_0001', N'Product_00115.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (66, N'C_CL_LG_0001', N'Product_00116.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (67, N'C_CL_LG_0002', N'Product_00121.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (68, N'C_CL_LG_0002', N'Product_00122.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (69, N'C_CL_LG_0002', N'Product_00123.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (70, N'C_CL_LG_0002', N'Product_00124.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (71, N'C_CL_LG_0002', N'Product_00125.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (72, N'C_CL_LG_0002', N'Product_00126.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (73, N'M_PA_ST_0001', N'Product_00131.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (74, N'M_PA_ST_0001', N'Product_00132.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (75, N'M_PA_ST_0002', N'Product_00141.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (76, N'M_PA_ST_0002', N'Product_00142.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (77, N'F_PA_ST_0001', N'Product_00151.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (78, N'F_PA_ST_0001', N'Product_00152.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (79, N'F_PA_ST_0002', N'Product_00161.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (80, N'F_PA_ST_0002', N'Product_00162.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (81, N'C_PA_ST_0001', N'Product_00161.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (82, N'C_PA_ST_0001', N'Product_00162.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (83, N'C_PA_ST_0001', N'Product_00163.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (84, N'C_PA_ST_0001', N'Product_00164.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (85, N'C_PA_ST_0002', N'Product_00171.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (86, N'C_PA_ST_0002', N'Product_00172.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (87, N'M_PA_LG_0001', N'Product_00181.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (88, N'M_PA_LG_0001', N'Product_00182.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (89, N'M_PA_LG_0002', N'Product_00191.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (90, N'M_PA_LG_0002', N'Product_00192.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (91, N'F_PA_LG_0001', N'Product_00201.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (92, N'F_PA_LG_0001', N'Product_00202.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (93, N'F_PA_LG_0002', N'Product_00211.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (94, N'F_PA_LG_0002', N'Product_00212.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (95, N'C_PA_LG_0001', N'Product_00221.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (96, N'C_PA_LG_0001', N'Product_00222.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (97, N'C_PA_LG_0001', N'Product_00223.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (98, N'C_PA_LG_0001', N'Product_00224.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (99, N'C_PA_LG_0002', N'Product_00231.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (100, N'C_PA_LG_0002', N'Product_00232.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (101, N'M_SH_CL_0001', N'Product_00241.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (102, N'M_SH_CL_0001', N'Product_00242.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (103, N'M_SH_CL_0001', N'Product_00243.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (104, N'M_SH_CL_0001', N'Product_00244.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (105, N'M_SH_CL_0001', N'Product_00245.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (106, N'M_SH_CL_0001', N'Product_00246.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (107, N'M_SH_CL_0002', N'Product_00251.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (108, N'M_SH_CL_0002', N'Product_00252.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (109, N'M_SH_CL_0002', N'Product_00253.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (110, N'M_SH_CL_0002', N'Product_00254.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (111, N'M_SH_CL_0002', N'Product_00255.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (112, N'M_SH_CL_0002', N'Product_00256.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (113, N'F_SH_CL_0001', N'Product_00261.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (114, N'F_SH_CL_0001', N'Product_00262.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (115, N'F_SH_CL_0001', N'Product_00263.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (116, N'F_SH_CL_0001', N'Product_00264.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (117, N'F_SH_CL_0001', N'Product_00265.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (118, N'F_SH_CL_0001', N'Product_00266.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (119, N'F_SH_CL_0002', N'Product_00271.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (120, N'F_SH_CL_0002', N'Product_00272.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (121, N'F_SH_CL_0002', N'Product_00273.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (122, N'F_SH_CL_0002', N'Product_00274.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (123, N'F_SH_CL_0002', N'Product_00275.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (124, N'F_SH_CL_0002', N'Product_00276.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (125, N'C_SH_CL_0001', N'Product_00281.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (126, N'C_SH_CL_0001', N'Product_00282.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (127, N'C_SH_CL_0001', N'Product_00283.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (128, N'C_SH_CL_0001', N'Product_00284.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (129, N'C_SH_CL_0001', N'Product_00285.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (130, N'C_SH_CL_0001', N'Product_00286.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (131, N'C_SH_CL_0002', N'Product_00291.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (132, N'C_SH_CL_0002', N'Product_00292.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (133, N'C_SH_CL_0002', N'Product_00293.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (134, N'C_SH_CL_0002', N'Product_00294.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (135, N'C_SH_CL_0002', N'Product_00295.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (136, N'C_SH_CL_0002', N'Product_00296.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (137, N'M_SH_SP_0001', N'Product_00301.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (138, N'M_SH_SP_0001', N'Product_00302.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (139, N'M_SH_SP_0001', N'Product_00303.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (140, N'M_SH_SP_0001', N'Product_00304.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (141, N'M_SH_SP_0001', N'Product_00305.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (142, N'M_SH_SP_0001', N'Product_00306.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (143, N'M_SH_SP_0002', N'Product_00311.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (144, N'M_SH_SP_0002', N'Product_00312.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (145, N'M_SH_SP_0002', N'Product_00313.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (146, N'M_SH_SP_0002', N'Product_00314.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (147, N'M_SH_SP_0002', N'Product_00315.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (148, N'M_SH_SP_0002', N'Product_00316.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (149, N'F_SH_SP_0001', N'Product_00321.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (150, N'F_SH_SP_0001', N'Product_00322.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (151, N'F_SH_SP_0001', N'Product_00323.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (152, N'F_SH_SP_0001', N'Product_00324.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (153, N'F_SH_SP_0001', N'Product_00325.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (154, N'F_SH_SP_0001', N'Product_00326.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (155, N'F_SH_SP_0002', N'Product_00331.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (156, N'F_SH_SP_0002', N'Product_00332.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (157, N'F_SH_SP_0002', N'Product_00333.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (158, N'F_SH_SP_0002', N'Product_00334.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (159, N'F_SH_SP_0002', N'Product_00335.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (160, N'F_SH_SP_0002', N'Product_00336.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (161, N'C_SH_SP_0001', N'Product_00341.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (162, N'C_SH_SP_0001', N'Product_00342.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (163, N'C_SH_SP_0001', N'Product_00343.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (164, N'C_SH_SP_0001', N'Product_00344.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (165, N'C_SH_SP_0001', N'Product_00345.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (166, N'C_SH_SP_0001', N'Product_00346.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (167, N'C_SH_SP_0002', N'Product_00351.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (168, N'C_SH_SP_0002', N'Product_00352.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (169, N'C_SH_SP_0002', N'Product_00353.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (170, N'C_SH_SP_0002', N'Product_00354.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (171, N'C_SH_SP_0002', N'Product_00355.jpg')
GO
INSERT [dbo].[ProductImgs] ([ProductImgId], [fk_ProductId], [ImgPath]) VALUES (172, N'C_SH_SP_0002', N'Product_00356.jpg')
GO
SET IDENTITY_INSERT [dbo].[ProductImgs] OFF
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'C_CL_LG_0001', N'上衣011', N'這是長袖上衣005', N'88% 聚酯纖維/12% 彈性纖維', N'台灣', NULL, 1300, CAST(N'2023-06-01T00:00:00.000' AS DateTime), NULL, 0, NULL, 6, CAST(N'2023-06-22T01:57:32.913' AS DateTime), CAST(N'2023-06-22T01:57:32.913' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'C_CL_LG_0002', N'上衣012', N'這是長袖上衣006', N'88% 聚酯纖維/12% 彈性纖維', N'台灣', NULL, 1000, CAST(N'2023-06-01T00:00:00.000' AS DateTime), NULL, 0, NULL, 6, CAST(N'2023-06-22T01:57:32.917' AS DateTime), CAST(N'2023-06-22T01:57:32.917' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'C_CL_ST_0001', N'上衣005', N'這是上衣005', N'純棉', N'台灣', 700, 600, CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL, 0, NULL, 3, CAST(N'2023-06-22T01:57:32.900' AS DateTime), CAST(N'2023-06-22T01:57:32.900' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'C_CL_ST_0002', N'上衣006', N'這是上衣006', N'純棉', N'台灣', 750, 650, CAST(N'2023-06-20T00:00:00.000' AS DateTime), CAST(N'2023-06-22T00:00:00.000' AS DateTime), 0, NULL, 3, CAST(N'2023-06-22T01:57:32.903' AS DateTime), CAST(N'2023-06-22T01:57:32.903' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'C_PA_LG_0001', N'長褲005', N'這是長褲005', N'純棉', N'台灣', 700, 600, CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL, 0, NULL, 12, CAST(N'2023-06-22T01:57:32.930' AS DateTime), CAST(N'2023-06-22T01:57:32.930' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'C_PA_LG_0002', N'長褲006', N'這是長褲006', N'純棉', N'台灣', 750, 650, CAST(N'2023-06-20T00:00:00.000' AS DateTime), CAST(N'2023-06-22T00:00:00.000' AS DateTime), 0, NULL, 12, CAST(N'2023-06-22T01:57:32.933' AS DateTime), CAST(N'2023-06-22T01:57:32.933' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'C_PA_ST_0001', N'短褲005', N'這是短褲005', N'純棉', N'台灣', 700, 600, CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL, 0, NULL, 9, CAST(N'2023-06-22T01:57:32.923' AS DateTime), CAST(N'2023-06-22T01:57:32.923' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'C_PA_ST_0002', N'短褲006', N'這是短褲006', N'純棉', N'台灣', 750, 650, CAST(N'2023-06-20T00:00:00.000' AS DateTime), CAST(N'2023-06-22T00:00:00.000' AS DateTime), 0, NULL, 9, CAST(N'2023-06-22T01:57:32.923' AS DateTime), CAST(N'2023-06-22T01:57:32.923' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'C_SH_CL_0001', N'休閒鞋005', N'這是休閒鞋005', NULL, N'台灣', NULL, 1500, CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL, 0, NULL, 15, CAST(N'2023-06-22T01:57:32.943' AS DateTime), CAST(N'2023-06-22T01:57:32.943' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'C_SH_CL_0002', N'休閒鞋006', N'這是休閒鞋006', NULL, N'台灣', 2000, 1650, CAST(N'2023-06-20T00:00:00.000' AS DateTime), CAST(N'2023-06-22T00:00:00.000' AS DateTime), 1, NULL, 15, CAST(N'2023-06-22T01:57:32.947' AS DateTime), CAST(N'2023-06-22T01:57:32.947' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'C_SH_SP_0001', N'運動鞋005', N'這是運動鞋005', NULL, N'台灣', NULL, 1500, CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL, 0, NULL, 18, CAST(N'2023-06-22T01:57:32.953' AS DateTime), CAST(N'2023-06-22T01:57:32.953' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'C_SH_SP_0002', N'運動鞋006', N'這是運動鞋006', NULL, N'台灣', 2000, 1650, CAST(N'2023-06-20T00:00:00.000' AS DateTime), CAST(N'2023-06-22T00:00:00.000' AS DateTime), 1, NULL, 18, CAST(N'2023-06-22T01:57:32.957' AS DateTime), CAST(N'2023-06-22T01:57:32.957' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'F_CL_LG_0001', N'上衣009', N'這是長袖上衣003', N'88% 聚酯纖維/12% 彈性纖維', N'台灣', 1500, 1300, CAST(N'2023-06-20T00:00:00.000' AS DateTime), CAST(N'2023-09-20T00:00:00.000' AS DateTime), 0, N'限量', 5, CAST(N'2023-06-22T01:57:32.910' AS DateTime), CAST(N'2023-06-22T01:57:32.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'F_CL_LG_0002', N'上衣010', N'這是長袖上衣004', N'78-79% 聚酯纖維/21-22% 彈性纖維', N'台灣', NULL, 1300, CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL, 0, NULL, 5, CAST(N'2023-06-22T01:57:32.910' AS DateTime), CAST(N'2023-06-22T01:57:32.910' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'F_CL_ST_0001', N'上衣003', N'這是上衣003', N'純棉', N'台灣', NULL, 800, CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL, 0, NULL, 2, CAST(N'2023-06-22T01:57:32.897' AS DateTime), CAST(N'2023-06-22T01:57:32.897' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'F_CL_ST_0002', N'上衣004', N'這是上衣004', N'純棉', N'台灣', NULL, 1000, CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL, 0, NULL, 2, CAST(N'2023-06-22T01:57:32.900' AS DateTime), CAST(N'2023-06-22T01:57:32.900' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'F_PA_LG_0001', N'長褲003', N'這是長褲003', N'純棉', N'台灣', NULL, 800, CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL, 0, NULL, 11, CAST(N'2023-06-22T01:57:32.930' AS DateTime), CAST(N'2023-06-22T01:57:32.930' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'F_PA_LG_0002', N'長褲004', N'這是長褲004', N'純棉', N'台灣', NULL, 1000, CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL, 0, NULL, 11, CAST(N'2023-06-22T01:57:32.930' AS DateTime), CAST(N'2023-06-22T01:57:32.930' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'F_PA_ST_0001', N'短褲003', N'這是短褲003', N'純棉', N'台灣', NULL, 800, CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL, 0, NULL, 8, CAST(N'2023-06-22T01:57:32.920' AS DateTime), CAST(N'2023-06-22T01:57:32.920' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'F_PA_ST_0002', N'短褲004', N'這是短褲004', N'純棉', N'台灣', NULL, 1000, CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL, 0, NULL, 8, CAST(N'2023-06-22T01:57:32.920' AS DateTime), CAST(N'2023-06-22T01:57:32.920' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'F_SH_CL_0001', N'休閒鞋003', N'這是休閒鞋003', NULL, N'台灣', 2300, 1890, CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL, 0, NULL, 14, CAST(N'2023-06-22T01:57:32.940' AS DateTime), CAST(N'2023-06-22T01:57:32.940' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'F_SH_CL_0002', N'休閒鞋004', N'這是休閒鞋004', N'純棉', N'台灣', NULL, 2200, CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL, 0, NULL, 14, CAST(N'2023-06-22T01:57:32.940' AS DateTime), CAST(N'2023-06-22T01:57:32.940' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'F_SH_SP_0001', N'運動鞋003', N'這是運動鞋003', NULL, N'台灣', 2300, 1890, CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL, 0, N'限量', 17, CAST(N'2023-06-22T01:57:32.950' AS DateTime), CAST(N'2023-06-22T01:57:32.950' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'F_SH_SP_0002', N'運動鞋004', N'這是運動鞋004', N'純棉', N'台灣', NULL, 2200, CAST(N'2023-06-20T00:00:00.000' AS DateTime), NULL, 0, NULL, 17, CAST(N'2023-06-22T01:57:32.953' AS DateTime), CAST(N'2023-06-22T01:57:32.953' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'M_CL_LG_0001', N'上衣007', N'這是長袖上衣001', N'88% 聚酯纖維/12% 彈性纖維', N'台灣', 1500, 1300, CAST(N'2023-06-20T00:00:00.000' AS DateTime), CAST(N'2023-09-20T00:00:00.000' AS DateTime), 0, NULL, 4, CAST(N'2023-06-22T01:57:32.907' AS DateTime), CAST(N'2023-06-22T01:57:32.907' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'M_CL_LG_0002', N'上衣008', N'這是長袖上衣002', N'88% 聚酯纖維/12% 彈性纖維', N'台灣', NULL, 1350, CAST(N'2023-06-20T00:00:00.000' AS DateTime), CAST(N'2023-06-20T00:00:00.000' AS DateTime), 1, NULL, 4, CAST(N'2023-06-22T01:57:32.907' AS DateTime), CAST(N'2023-06-22T01:57:32.907' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'M_CL_ST_0001', N'上衣001', N'這是上衣001', N'88% 聚酯纖維 12% 彈性纖維', N'台灣', 1200, 1000, CAST(N'2023-07-01T00:00:00.000' AS DateTime), NULL, 0, NULL, 1, CAST(N'2023-06-22T01:57:32.893' AS DateTime), CAST(N'2023-06-22T01:57:32.893' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'M_CL_ST_0002', N'上衣002', N'這是上衣002', N'純棉', N'台灣', 1300, 1100, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-09-01T00:00:00.000' AS DateTime), 0, N'限量', 1, CAST(N'2023-06-22T01:57:32.897' AS DateTime), CAST(N'2023-06-22T01:57:32.897' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'M_PA_LG_0001', N'褲子001', N'這是長褲001', N'88% 聚酯纖維 12% 彈性纖維', N'台灣', 1200, 1000, CAST(N'2023-07-01T00:00:00.000' AS DateTime), NULL, 0, NULL, 10, CAST(N'2023-06-22T01:57:32.927' AS DateTime), CAST(N'2023-06-22T01:57:32.927' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'M_PA_LG_0002', N'長褲002', N'這是長褲002', N'純棉', N'台灣', 1300, 1100, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-09-01T00:00:00.000' AS DateTime), 0, N'限量', 10, CAST(N'2023-06-22T01:57:32.927' AS DateTime), CAST(N'2023-06-22T01:57:32.927' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'M_PA_ST_0001', N'褲子001', N'這是短褲001', N'88% 聚酯纖維 12% 彈性纖維', N'台灣', 1200, 1000, CAST(N'2023-07-01T00:00:00.000' AS DateTime), NULL, 0, NULL, 7, CAST(N'2023-06-22T01:57:32.917' AS DateTime), CAST(N'2023-06-22T01:57:32.917' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'M_PA_ST_0002', N'短褲002', N'這是短褲002', N'純棉', N'台灣', 1300, 1100, CAST(N'2023-06-01T00:00:00.000' AS DateTime), CAST(N'2023-09-01T00:00:00.000' AS DateTime), 0, N'限量', 7, CAST(N'2023-06-22T01:57:32.920' AS DateTime), CAST(N'2023-06-22T01:57:32.920' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'M_SH_CL_0001', N'休閒鞋001', N'這是休閒鞋001', NULL, N'台灣', NULL, 3600, CAST(N'2023-07-01T00:00:00.000' AS DateTime), NULL, 0, NULL, 13, CAST(N'2023-06-22T01:57:32.937' AS DateTime), CAST(N'2023-06-22T01:57:32.937' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'M_SH_CL_0002', N'休閒鞋002', N'這是休閒鞋002', NULL, N'台灣', 2500, 2000, CAST(N'2023-06-01T00:00:00.000' AS DateTime), NULL, 0, N'限量', 13, CAST(N'2023-06-22T01:57:32.937' AS DateTime), CAST(N'2023-06-22T01:57:32.937' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'M_SH_SP_0001', N'運動鞋001', N'這是運動鞋001', NULL, N'台灣', NULL, 3600, CAST(N'2023-07-01T00:00:00.000' AS DateTime), NULL, 0, NULL, 16, CAST(N'2023-06-22T01:57:32.947' AS DateTime), CAST(N'2023-06-22T01:57:32.947' AS DateTime))
GO
INSERT [dbo].[Products] ([ProductId], [ProductName], [ProductDescription], [ProductMaterial], [ProductOrigin], [UnitPrice], [SalesPrice], [StartTime], [EndTime], [LogOut], [Tag], [fk_ProductSubCategoryID], [CreateTime], [EditTime]) VALUES (N'M_SH_SP_0002', N'運動鞋002', N'這是運動鞋002', NULL, N'台灣', 2500, 2000, CAST(N'2023-06-01T00:00:00.000' AS DateTime), NULL, 0, N'限量', 16, CAST(N'2023-06-22T01:57:32.950' AS DateTime), CAST(N'2023-06-22T01:57:32.950' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ProductSubCategories] ON 
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (1, N'短袖', 1, N'男裝/上衣/短袖')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (2, N'短袖', 2, N'女裝/上衣/短袖')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (3, N'短袖', 3, N'童裝/上衣/短袖')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (4, N'長袖', 1, N'男裝/上衣/長袖')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (5, N'長袖', 2, N'女裝/上衣/長袖')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (6, N'長袖', 3, N'童裝/上衣/長袖')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (7, N'短褲', 4, N'男裝/褲子/短褲')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (8, N'短褲', 5, N'女裝/褲子/短褲')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (9, N'短褲', 6, N'童裝/褲子/短褲')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (10, N'長褲', 4, N'男裝/褲子/長褲')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (11, N'長褲', 5, N'女裝/褲子/長褲')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (12, N'長褲', 6, N'童裝/褲子/長褲')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (13, N'休閒鞋', 7, N'男裝/鞋子/休閒鞋')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (14, N'休閒鞋', 8, N'女裝/鞋子/休閒鞋')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (15, N'休閒鞋', 9, N'童裝/鞋子/休閒鞋')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (16, N'運動鞋', 7, N'男裝/鞋子/運動鞋')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (17, N'運動鞋', 8, N'女裝/鞋子/運動鞋')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (18, N'運動鞋', 9, N'童裝/鞋子/運動鞋')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (19, N'包包', 10, N'男裝/配件/包包')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (20, N'包包', 11, N'女裝/配件/包包')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (21, N'包包', 12, N'童裝/配件/包包')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (22, N'帽子', 10, N'男裝/配件/帽子')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (23, N'帽子', 11, N'女裝/配件/帽子')
GO
INSERT [dbo].[ProductSubCategories] ([ProductSubCategoryId], [ProductSubCategoryName], [fk_ProductCategoryId], [SubCategoryPath]) VALUES (24, N'帽子', 12, N'童裝/配件/帽子')
GO
SET IDENTITY_INSERT [dbo].[ProductSubCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[SalesCategories] ON 
GO
INSERT [dbo].[SalesCategories] ([SalesCategoryId], [SalesCategoryName]) VALUES (1, N'男裝')
GO
INSERT [dbo].[SalesCategories] ([SalesCategoryId], [SalesCategoryName]) VALUES (2, N'女裝')
GO
INSERT [dbo].[SalesCategories] ([SalesCategoryId], [SalesCategoryName]) VALUES (3, N'童裝')
GO
SET IDENTITY_INSERT [dbo].[SalesCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[SizeCategories] ON 
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (1, N'S')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (2, N'M')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (3, N'L')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (4, N'XL')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (5, N'XXL')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (6, N'XXXL')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (7, N'XXXL')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (8, N'16')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (9, N'16.5')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (10, N'17')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (11, N'17.5')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (12, N'18')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (13, N'18.5')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (14, N'19')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (15, N'19.5')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (16, N'20')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (17, N'20.5')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (18, N'21')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (19, N'21.5')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (20, N'22')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (21, N'22.5')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (22, N'23')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (23, N'23.5')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (24, N'24')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (25, N'24.5')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (26, N'25')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (27, N'25.5')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (28, N'26')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (29, N'26.5')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (30, N'27')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (31, N'27.5')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (32, N'28')
GO
INSERT [dbo].[SizeCategories] ([SizeId], [SizeName]) VALUES (33, N'單一規格')
GO
SET IDENTITY_INSERT [dbo].[SizeCategories] OFF
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Product_ProductId]  DEFAULT ('unique') FOR [ProductId]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Product_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Product_EditTime]  DEFAULT (getdate()) FOR [EditTime]
GO
ALTER TABLE [dbo].[ProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategories_SalesCategories] FOREIGN KEY([fk_SalesCategoryId])
REFERENCES [dbo].[SalesCategories] ([SalesCategoryId])
GO
ALTER TABLE [dbo].[ProductCategories] CHECK CONSTRAINT [FK_ProductCategories_SalesCategories]
GO
ALTER TABLE [dbo].[ProductGroups]  WITH CHECK ADD  CONSTRAINT [FK_ProductGroups_ColorCategories] FOREIGN KEY([fk_ColorId])
REFERENCES [dbo].[ColorCategories] ([ColorId])
GO
ALTER TABLE [dbo].[ProductGroups] CHECK CONSTRAINT [FK_ProductGroups_ColorCategories]
GO
ALTER TABLE [dbo].[ProductGroups]  WITH CHECK ADD  CONSTRAINT [FK_ProductGroups_Products] FOREIGN KEY([fk_ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[ProductGroups] CHECK CONSTRAINT [FK_ProductGroups_Products]
GO
ALTER TABLE [dbo].[ProductGroups]  WITH CHECK ADD  CONSTRAINT [FK_ProductGroups_SizeCategories] FOREIGN KEY([fk_SizeID])
REFERENCES [dbo].[SizeCategories] ([SizeId])
GO
ALTER TABLE [dbo].[ProductGroups] CHECK CONSTRAINT [FK_ProductGroups_SizeCategories]
GO
ALTER TABLE [dbo].[ProductImgs]  WITH CHECK ADD  CONSTRAINT [FK_ProductImgs_Products] FOREIGN KEY([fk_ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImgs] CHECK CONSTRAINT [FK_ProductImgs_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductSubCategory] FOREIGN KEY([fk_ProductSubCategoryID])
REFERENCES [dbo].[ProductSubCategories] ([ProductSubCategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Product_ProductSubCategory]
GO
ALTER TABLE [dbo].[ProductSubCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductSubCategories_ProductCategories] FOREIGN KEY([fk_ProductCategoryId])
REFERENCES [dbo].[ProductCategories] ([ProductCategoryId])
GO
ALTER TABLE [dbo].[ProductSubCategories] CHECK CONSTRAINT [FK_ProductSubCategories_ProductCategories]
GO
