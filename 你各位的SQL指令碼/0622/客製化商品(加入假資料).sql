USE [Customized_Shoes]
GO
/****** Object:  Table [dbo].[Customized_materials]    Script Date: 2023/6/21 下午 12:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customized_materials](
	[Shoesmaterial_Id] [int] IDENTITY(1,1) NOT NULL,
	[material_Name] [nvarchar](50) NOT NULL,
	[material_ColorId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Shoesmaterial_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customized_Shoes]    Script Date: 2023/6/21 下午 12:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customized_Shoes](
	[ShoesProductId] [int] IDENTITY(1,1) NOT NULL,
	[ShoesName] [nvarchar](254) NOT NULL,
	[ShoesDescription] [nvarchar](254) NULL,
	[ShoesOrigin] [nvarchar](50) NULL,
	[ShoesUnitPrice] [int] NOT NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[fk_ShoesCategoryId] [int] NULL,
	[fk_ShoesColorId] [int] NULL,
	[DataCreateTime] [datetime] NULL,
	[DataEditTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ShoesProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomizedOrders]    Script Date: 2023/6/21 下午 12:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomizedOrders](
	[Customized_Id] [int] IDENTITY(1,1) NOT NULL,
	[Customized_number] [varchar](6000) NOT NULL,
	[Customized_Shoes_Id] [int] NULL,
	[Fk_ForMemberCustomized_Id] [int] NULL,
	[Customized_Eyelet] [int] NULL,
	[Customized_EdgeProtection] [int] NULL,
	[Customized_Rear] [int] NULL,
	[Customized_Tongue] [int] NULL,
	[Customized_Toe] [int] NULL,
	[Remark] [nvarchar](254) NULL,
	[OrderCreateTime] [datetime] NULL,
	[OrderEditTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Customized_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoesCategories]    Script Date: 2023/6/21 下午 12:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoesCategories](
	[ShoesCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ShoesCategoryName] [nvarchar](254) NOT NULL,
	[CategoryCreateTime] [datetime] NULL,
	[CategoryEditTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ShoesCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoesColorCategories]    Script Date: 2023/6/21 下午 12:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoesColorCategories](
	[ShoesColorId] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](50) NOT NULL,
	[ColorCode] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShoesColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoesPictures]    Script Date: 2023/6/21 下午 12:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoesPictures](
	[ShoesPicture_Id] [int] IDENTITY(1,1) NOT NULL,
	[ShoesPictureUrl] [nvarchar](4000) NULL,
	[fk_ShoesPictureProduct_Id] [int] NULL,
	[fk_ShoesProductOrder_Id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ShoesPicture_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 2023/6/21 下午 12:43:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierCompanyName] [nvarchar](50) NOT NULL,
	[HasCertificate] [bit] NULL,
	[Supply_Material] [nvarchar](50) NULL,
	[SupplierCompanyPhone] [int] NULL,
	[SupplierCompanyEmail] [nvarchar](250) NULL,
	[SupplierCompanyAddress] [nvarchar](250) NULL,
	[SupplierCompanyNumber] [int] NULL,
	[SupplierStartDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customized_materials] ON 
GO
INSERT [dbo].[Customized_materials] ([Shoesmaterial_Id], [material_Name], [material_ColorId]) VALUES (1, N'帆布', 7)
GO
INSERT [dbo].[Customized_materials] ([Shoesmaterial_Id], [material_Name], [material_ColorId]) VALUES (2, N'皮革', 4)
GO
INSERT [dbo].[Customized_materials] ([Shoesmaterial_Id], [material_Name], [material_ColorId]) VALUES (3, N'緞紋皮革', 9)
GO
INSERT [dbo].[Customized_materials] ([Shoesmaterial_Id], [material_Name], [material_ColorId]) VALUES (4, N'牛皮', 5)
GO
SET IDENTITY_INSERT [dbo].[Customized_materials] OFF
GO
SET IDENTITY_INSERT [dbo].[Customized_Shoes] ON 
GO
INSERT [dbo].[Customized_Shoes] ([ShoesProductId], [ShoesName], [ShoesDescription], [ShoesOrigin], [ShoesUnitPrice], [StartTime], [EndTime], [fk_ShoesCategoryId], [fk_ShoesColorId], [DataCreateTime], [DataEditTime]) VALUES (1, N'BS00101', N'專為您訂製最舒適的籃球鞋，於籃球場上揮灑您的青春汗水', N'台灣', 5000, CAST(N'2023-06-21T12:41:48.237' AS DateTime), NULL, 3, 2, CAST(N'2023-06-21T12:41:48.237' AS DateTime), CAST(N'2023-06-21T12:41:48.237' AS DateTime))
GO
INSERT [dbo].[Customized_Shoes] ([ShoesProductId], [ShoesName], [ShoesDescription], [ShoesOrigin], [ShoesUnitPrice], [StartTime], [EndTime], [fk_ShoesCategoryId], [fk_ShoesColorId], [DataCreateTime], [DataEditTime]) VALUES (2, N'LF00101', N'適用於多種場合，為您訂製屬於自己的都市風格', N'台灣', 4000, CAST(N'2023-06-21T12:41:48.237' AS DateTime), NULL, 1, 5, CAST(N'2023-06-21T12:41:48.237' AS DateTime), CAST(N'2023-06-21T12:41:48.237' AS DateTime))
GO
INSERT [dbo].[Customized_Shoes] ([ShoesProductId], [ShoesName], [ShoesDescription], [ShoesOrigin], [ShoesUnitPrice], [StartTime], [EndTime], [fk_ShoesCategoryId], [fk_ShoesColorId], [DataCreateTime], [DataEditTime]) VALUES (3, N'RN00101', N'訂製專屬於您的跑步鞋，用力奔跑，繼續於前進的道路上發揚夢想', N'台灣', 4500, CAST(N'2023-06-21T12:41:48.237' AS DateTime), NULL, 2, 1, CAST(N'2023-06-21T12:41:48.237' AS DateTime), CAST(N'2023-06-21T12:41:48.237' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Customized_Shoes] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomizedOrders] ON 
GO
INSERT [dbo].[CustomizedOrders] ([Customized_Id], [Customized_number], [Customized_Shoes_Id], [Fk_ForMemberCustomized_Id], [Customized_Eyelet], [Customized_EdgeProtection], [Customized_Rear], [Customized_Tongue], [Customized_Toe], [Remark], [OrderCreateTime], [OrderEditTime]) VALUES (1, N'SHOESMADE-2023-001', 1, NULL, 1, 2, 1, 2, 1, N'Size請幫我做成男生台灣尺寸75吋', CAST(N'2023-06-21T12:42:28.720' AS DateTime), CAST(N'2023-06-21T12:42:28.720' AS DateTime))
GO
INSERT [dbo].[CustomizedOrders] ([Customized_Id], [Customized_number], [Customized_Shoes_Id], [Fk_ForMemberCustomized_Id], [Customized_Eyelet], [Customized_EdgeProtection], [Customized_Rear], [Customized_Tongue], [Customized_Toe], [Remark], [OrderCreateTime], [OrderEditTime]) VALUES (2, N'SHOESMADE-2023-002', 2, NULL, 2, 3, 2, 3, 1, N'Size請幫我做成女生美國尺寸5.5吋', CAST(N'2023-06-21T12:42:28.720' AS DateTime), CAST(N'2023-06-21T12:42:28.720' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[CustomizedOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[ShoesCategories] ON 
GO
INSERT [dbo].[ShoesCategories] ([ShoesCategoryId], [ShoesCategoryName], [CategoryCreateTime], [CategoryEditTime]) VALUES (1, N'運動生活', CAST(N'2023-06-21T12:41:19.870' AS DateTime), CAST(N'2023-06-21T12:41:19.870' AS DateTime))
GO
INSERT [dbo].[ShoesCategories] ([ShoesCategoryId], [ShoesCategoryName], [CategoryCreateTime], [CategoryEditTime]) VALUES (2, N'跑步', CAST(N'2023-06-21T12:41:19.870' AS DateTime), CAST(N'2023-06-21T12:41:19.870' AS DateTime))
GO
INSERT [dbo].[ShoesCategories] ([ShoesCategoryId], [ShoesCategoryName], [CategoryCreateTime], [CategoryEditTime]) VALUES (3, N'籃球', CAST(N'2023-06-21T12:41:19.870' AS DateTime), CAST(N'2023-06-21T12:41:19.870' AS DateTime))
GO
INSERT [dbo].[ShoesCategories] ([ShoesCategoryId], [ShoesCategoryName], [CategoryCreateTime], [CategoryEditTime]) VALUES (4, N'英式足球', CAST(N'2023-06-21T12:41:19.870' AS DateTime), CAST(N'2023-06-21T12:41:19.870' AS DateTime))
GO
INSERT [dbo].[ShoesCategories] ([ShoesCategoryId], [ShoesCategoryName], [CategoryCreateTime], [CategoryEditTime]) VALUES (5, N'訓練與健身', CAST(N'2023-06-21T12:41:19.870' AS DateTime), CAST(N'2023-06-21T12:41:19.870' AS DateTime))
GO
INSERT [dbo].[ShoesCategories] ([ShoesCategoryId], [ShoesCategoryName], [CategoryCreateTime], [CategoryEditTime]) VALUES (6, N'田徑', CAST(N'2023-06-21T12:41:19.870' AS DateTime), CAST(N'2023-06-21T12:41:19.870' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ShoesCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[ShoesColorCategories] ON 
GO
INSERT [dbo].[ShoesColorCategories] ([ShoesColorId], [ColorName], [ColorCode]) VALUES (1, N'黑色', N'#000000')
GO
INSERT [dbo].[ShoesColorCategories] ([ShoesColorId], [ColorName], [ColorCode]) VALUES (2, N'白色', N'#FFFFFF')
GO
INSERT [dbo].[ShoesColorCategories] ([ShoesColorId], [ColorName], [ColorCode]) VALUES (3, N'番茄紅', N'#FF6347')
GO
INSERT [dbo].[ShoesColorCategories] ([ShoesColorId], [ColorName], [ColorCode]) VALUES (4, N'淺灰色', N'#D3D3D3')
GO
INSERT [dbo].[ShoesColorCategories] ([ShoesColorId], [ColorName], [ColorCode]) VALUES (5, N'灰土色', N'#CCB38C')
GO
INSERT [dbo].[ShoesColorCategories] ([ShoesColorId], [ColorName], [ColorCode]) VALUES (6, N'淺綠', N'#90EE90')
GO
INSERT [dbo].[ShoesColorCategories] ([ShoesColorId], [ColorName], [ColorCode]) VALUES (7, N'綠松石綠', N'#4DE680')
GO
INSERT [dbo].[ShoesColorCategories] ([ShoesColorId], [ColorName], [ColorCode]) VALUES (8, N'天藍', N'#87CEEB')
GO
INSERT [dbo].[ShoesColorCategories] ([ShoesColorId], [ColorName], [ColorCode]) VALUES (9, N'韋奇伍德瓷藍', N'#5686BF')
GO
INSERT [dbo].[ShoesColorCategories] ([ShoesColorId], [ColorName], [ColorCode]) VALUES (10, N'李紫', N'#DDA0DD')
GO
SET IDENTITY_INSERT [dbo].[ShoesColorCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 
GO
INSERT [dbo].[Suppliers] ([SupplierId], [SupplierCompanyName], [HasCertificate], [Supply_Material], [SupplierCompanyPhone], [SupplierCompanyEmail], [SupplierCompanyAddress], [SupplierCompanyNumber], [SupplierStartDate]) VALUES (1, N'政斌紡織有限公司', 1, N'帆布', 33817499, N'Valcloth@gmail.com', N'桃園市大園區中正路1段1號', 77778888, CAST(N'2023-06-21T12:41:15.170' AS DateTime))
GO
INSERT [dbo].[Suppliers] ([SupplierId], [SupplierCompanyName], [HasCertificate], [Supply_Material], [SupplierCompanyPhone], [SupplierCompanyEmail], [SupplierCompanyAddress], [SupplierCompanyNumber], [SupplierStartDate]) VALUES (2, N'易暖織布有限公司', 1, N'皮革', 45217898, N'a_pants@gmail.com', N'新竹市東區中央路200號', 87871234, CAST(N'2023-06-21T12:41:15.170' AS DateTime))
GO
INSERT [dbo].[Suppliers] ([SupplierId], [SupplierCompanyName], [HasCertificate], [Supply_Material], [SupplierCompanyPhone], [SupplierCompanyEmail], [SupplierCompanyAddress], [SupplierCompanyNumber], [SupplierStartDate]) VALUES (3, N'建綸紡織廠', 1, N'牛皮', 34725656, N'Rowscloses@gmail.com', N'桃園市中壢區金陵路100號', 12345678, CAST(N'2023-06-21T12:41:15.170' AS DateTime))
GO
INSERT [dbo].[Suppliers] ([SupplierId], [SupplierCompanyName], [HasCertificate], [Supply_Material], [SupplierCompanyPhone], [SupplierCompanyEmail], [SupplierCompanyAddress], [SupplierCompanyNumber], [SupplierStartDate]) VALUES (4, N'祥豪製布', 1, N'緞紋皮革', 65107777, N'ShowHowCloth@gmail.com', N'台南市北安路300號', 85857878, CAST(N'2023-06-21T12:41:15.170' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
/****** Object:  Index [UQ__Supplier__AE8E9B41C48B34EB]    Script Date: 2023/6/21 下午 12:43:28 ******/
ALTER TABLE [dbo].[Suppliers] ADD UNIQUE NONCLUSTERED 
(
	[SupplierCompanyNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customized_materials]  WITH CHECK ADD FOREIGN KEY([material_ColorId])
REFERENCES [dbo].[ShoesColorCategories] ([ShoesColorId])
GO
ALTER TABLE [dbo].[Customized_Shoes]  WITH CHECK ADD FOREIGN KEY([fk_ShoesCategoryId])
REFERENCES [dbo].[ShoesCategories] ([ShoesCategoryId])
GO
ALTER TABLE [dbo].[Customized_Shoes]  WITH CHECK ADD FOREIGN KEY([fk_ShoesColorId])
REFERENCES [dbo].[ShoesColorCategories] ([ShoesColorId])
GO
ALTER TABLE [dbo].[CustomizedOrders]  WITH CHECK ADD FOREIGN KEY([Customized_Shoes_Id])
REFERENCES [dbo].[Customized_Shoes] ([ShoesProductId])
GO
ALTER TABLE [dbo].[CustomizedOrders]  WITH CHECK ADD FOREIGN KEY([Customized_Eyelet])
REFERENCES [dbo].[Customized_materials] ([Shoesmaterial_Id])
GO
ALTER TABLE [dbo].[CustomizedOrders]  WITH CHECK ADD FOREIGN KEY([Customized_EdgeProtection])
REFERENCES [dbo].[Customized_materials] ([Shoesmaterial_Id])
GO
ALTER TABLE [dbo].[CustomizedOrders]  WITH CHECK ADD FOREIGN KEY([Customized_Rear])
REFERENCES [dbo].[Customized_materials] ([Shoesmaterial_Id])
GO
ALTER TABLE [dbo].[CustomizedOrders]  WITH CHECK ADD FOREIGN KEY([Customized_Tongue])
REFERENCES [dbo].[Customized_materials] ([Shoesmaterial_Id])
GO
ALTER TABLE [dbo].[CustomizedOrders]  WITH CHECK ADD FOREIGN KEY([Customized_Toe])
REFERENCES [dbo].[Customized_materials] ([Shoesmaterial_Id])
GO
ALTER TABLE [dbo].[ShoesPictures]  WITH CHECK ADD FOREIGN KEY([fk_ShoesPictureProduct_Id])
REFERENCES [dbo].[Customized_Shoes] ([ShoesProductId])
GO
ALTER TABLE [dbo].[ShoesPictures]  WITH CHECK ADD FOREIGN KEY([fk_ShoesProductOrder_Id])
REFERENCES [dbo].[CustomizedOrders] ([Customized_Id])
GO
