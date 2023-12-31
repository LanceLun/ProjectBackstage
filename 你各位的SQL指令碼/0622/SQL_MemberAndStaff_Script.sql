USE [master]
GO
/****** Object:  Database [FlexStore]    Script Date: 2023/6/20 下午 09:08:27 ******/
CREATE DATABASE [FlexStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FlexStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FlexStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FlexStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FlexStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FlexStore] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FlexStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FlexStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FlexStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FlexStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FlexStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FlexStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [FlexStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FlexStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FlexStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FlexStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FlexStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FlexStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FlexStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FlexStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FlexStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FlexStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FlexStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FlexStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FlexStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FlexStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FlexStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FlexStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FlexStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FlexStore] SET RECOVERY FULL 
GO
ALTER DATABASE [FlexStore] SET  MULTI_USER 
GO
ALTER DATABASE [FlexStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FlexStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FlexStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FlexStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FlexStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FlexStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FlexStore', N'ON'
GO
ALTER DATABASE [FlexStore] SET QUERY_STORE = OFF
GO
USE [FlexStore]
GO
/****** Object:  User [flex]    Script Date: 2023/6/20 下午 09:08:27 ******/
CREATE USER [flex] FOR LOGIN [flex] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [flex]
GO
/****** Object:  Table [dbo].[AlternateAddresses]    Script Date: 2023/6/20 下午 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlternateAddresses](
	[AddressId] [int] IDENTITY(501,1) NOT NULL,
	[AlternateAddress1] [nvarchar](300) NULL,
	[AlternateAddress2] [nvarchar](300) NULL,
	[fk_MemberId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlackList]    Script Date: 2023/6/20 下午 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlackList](
	[BlackListId] [int] IDENTITY(101,1) NOT NULL,
	[Behavior] [nvarchar](30) NOT NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK__BlackLis__B54E3C740D440FFD] PRIMARY KEY CLUSTERED 
(
	[BlackListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 2023/6/20 下午 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(4001,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTitles]    Script Date: 2023/6/20 下午 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTitles](
	[TitleId] [int] IDENTITY(3001,1) NOT NULL,
	[TitleName] [nvarchar](50) NULL,
	[fk_StaffPermissions] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TitleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberPoints]    Script Date: 2023/6/20 下午 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberPoints](
	[MemberPointsId] [int] IDENTITY(801,1) NOT NULL,
	[PointSubtotal] [int] NOT NULL,
	[fk_PointHistoryId] [int] NOT NULL,
	[fk_MemberId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberPointsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2023/6/20 下午 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[MemberId] [int] IDENTITY(401,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Age] [tinyint] NULL,
	[Gender] [bit] NULL,
	[Mobile] [varchar](10) NOT NULL,
	[Email] [nvarchar](300) NOT NULL,
	[Birthday] [date] NULL,
	[CommonAddress] [nvarchar](100) NOT NULL,
	[Account] [varchar](30) NOT NULL,
	[EncryptedPassword] [varchar](70) NOT NULL,
	[Registration] [datetime] NULL,
	[IsConfirmed] [bit] NULL,
	[Confirmed] [varchar](50) NULL,
	[fk_LevelId] [int] NOT NULL,
	[fk_BlackListId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MembershipLevel]    Script Date: 2023/6/20 下午 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipLevel](
	[LevelId] [int] IDENTITY(201,1) NOT NULL,
	[LevelName] [nvarchar](10) NOT NULL,
	[MinSpending] [varchar](30) NOT NULL,
	[Discount] [decimal](2, 1) NULL,
	[Description] [nvarchar](300) NULL,
 CONSTRAINT [PK__Membersh__09F03C26F7CA5148] PRIMARY KEY CLUSTERED 
(
	[LevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MembershipLevelPrivileges]    Script Date: 2023/6/20 下午 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipLevelPrivileges](
	[fk_LevelId] [int] NOT NULL,
	[fk_PrivilegeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[fk_LevelId] ASC,
	[fk_PrivilegeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointCategories]    Script Date: 2023/6/20 下午 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointCategories](
	[PointCategoryId] [int] IDENTITY(801,1) NOT NULL,
	[PointCategoryName] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PointCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointHistory]    Script Date: 2023/6/20 下午 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointHistory](
	[PointHistoryId] [int] IDENTITY(701,1) NOT NULL,
	[GetOrDeduct] [bit] NOT NULL,
	[UsageAmount] [int] NOT NULL,
	[EffectiveDate] [datetime] NULL,
	[fk_MemberId] [int] NULL,
	[fk_OrderId] [int] NULL,
	[OrderName] [nvarchar](50) NULL,
	[fk_PointCategoryId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PointHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Privilege]    Script Date: 2023/6/20 下午 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Privilege](
	[PrivilegeId] [int] IDENTITY(301,1) NOT NULL,
	[PrivilegeName] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[PrivilegeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 2023/6/20 下午 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[staffId] [int] IDENTITY(2001,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Age] [tinyint] NULL,
	[Gender] [bit] NULL,
	[Mobile] [varchar](10) NOT NULL,
	[Email] [nvarchar](300) NOT NULL,
	[Birthday] [date] NULL,
	[Account] [varchar](30) NOT NULL,
	[Password] [varchar](70) NOT NULL,
	[dueDate] [date] NULL,
	[fk_PermissionsId] [int] NOT NULL,
	[fk_TitleId] [int] NOT NULL,
	[fk_DepartmentId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffPermissions]    Script Date: 2023/6/20 下午 09:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffPermissions](
	[PermissionsId] [int] IDENTITY(1001,1) NOT NULL,
	[LevelName] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[PermissionsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AlternateAddresses] ON 

INSERT [dbo].[AlternateAddresses] ([AddressId], [AlternateAddress1], [AlternateAddress2], [fk_MemberId]) VALUES (501, N'Alternate Address 1', NULL, 401)
INSERT [dbo].[AlternateAddresses] ([AddressId], [AlternateAddress1], [AlternateAddress2], [fk_MemberId]) VALUES (502, N'Alternate Address 3', N'Alternate Address 4', 402)
INSERT [dbo].[AlternateAddresses] ([AddressId], [AlternateAddress1], [AlternateAddress2], [fk_MemberId]) VALUES (503, N'Alternate Address 5', NULL, 403)
INSERT [dbo].[AlternateAddresses] ([AddressId], [AlternateAddress1], [AlternateAddress2], [fk_MemberId]) VALUES (504, N'Alternate Address 7', N'Alternate Address 8', 404)
INSERT [dbo].[AlternateAddresses] ([AddressId], [AlternateAddress1], [AlternateAddress2], [fk_MemberId]) VALUES (505, N'Alternate Address 9', NULL, 405)
SET IDENTITY_INSERT [dbo].[AlternateAddresses] OFF
GO
SET IDENTITY_INSERT [dbo].[BlackList] ON 

INSERT [dbo].[BlackList] ([BlackListId], [Behavior], [CreatedAt]) VALUES (101, N'詐欺行為', CAST(N'2023-06-17T08:54:17.723' AS DateTime))
INSERT [dbo].[BlackList] ([BlackListId], [Behavior], [CreatedAt]) VALUES (102, N'未經授權的行為', CAST(N'2023-06-17T08:54:17.723' AS DateTime))
INSERT [dbo].[BlackList] ([BlackListId], [Behavior], [CreatedAt]) VALUES (103, N'違反使用條款', CAST(N'2023-06-17T08:54:17.723' AS DateTime))
SET IDENTITY_INSERT [dbo].[BlackList] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (4001, N'行銷部門')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (4002, N'技術部門')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (4003, N'銷售部門')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (4004, N'商品部門')
INSERT [dbo].[Departments] ([DepartmentId], [DepartmentName]) VALUES (4005, N'客服部門')
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[JobTitles] ON 

INSERT [dbo].[JobTitles] ([TitleId], [TitleName], [fk_StaffPermissions]) VALUES (3001, N'經理', 1003)
INSERT [dbo].[JobTitles] ([TitleId], [TitleName], [fk_StaffPermissions]) VALUES (3002, N'主管', 1003)
INSERT [dbo].[JobTitles] ([TitleId], [TitleName], [fk_StaffPermissions]) VALUES (3003, N'專員', 1002)
INSERT [dbo].[JobTitles] ([TitleId], [TitleName], [fk_StaffPermissions]) VALUES (3004, N'助理', 1001)
INSERT [dbo].[JobTitles] ([TitleId], [TitleName], [fk_StaffPermissions]) VALUES (3005, N'工讀生', 1001)
SET IDENTITY_INSERT [dbo].[JobTitles] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberPoints] ON 

INSERT [dbo].[MemberPoints] ([MemberPointsId], [PointSubtotal], [fk_PointHistoryId], [fk_MemberId]) VALUES (801, 130, 701, 401)
INSERT [dbo].[MemberPoints] ([MemberPointsId], [PointSubtotal], [fk_PointHistoryId], [fk_MemberId]) VALUES (802, 75, 702, 403)
INSERT [dbo].[MemberPoints] ([MemberPointsId], [PointSubtotal], [fk_PointHistoryId], [fk_MemberId]) VALUES (803, 33, 705, 404)
INSERT [dbo].[MemberPoints] ([MemberPointsId], [PointSubtotal], [fk_PointHistoryId], [fk_MemberId]) VALUES (804, 1556, 703, 402)
INSERT [dbo].[MemberPoints] ([MemberPointsId], [PointSubtotal], [fk_PointHistoryId], [fk_MemberId]) VALUES (805, 63, 704, 405)
SET IDENTITY_INSERT [dbo].[MemberPoints] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [Confirmed], [fk_LevelId], [fk_BlackListId]) VALUES (401, N'John Doe', 25, 1, N'0934567890', N'johndoe@example.com', CAST(N'1997-05-10' AS Date), N'新北市土城區學府路9號', N'johndoe123', N'123', CAST(N'2023-06-20T17:15:07.790' AS DateTime), 1, N'Confirmed', 201, NULL)
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [Confirmed], [fk_LevelId], [fk_BlackListId]) VALUES (402, N'Jane Smith', 30, 0, N'0976543210', N'janesmith@example.com', CAST(N'1992-08-15' AS Date), N'新竹市東區元化路11號', N'janesmith456', N'456', CAST(N'2023-06-20T17:15:07.790' AS DateTime), 1, N'Confirmed', 202, 101)
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [Confirmed], [fk_LevelId], [fk_BlackListId]) VALUES (403, N'Michael Johnson', 35, 1, N'0958889999', N'michaeljohnson@example.com', CAST(N'1987-03-20' AS Date), N'臺東市正氣路56號', N'mjohnson789', N'789', CAST(N'2023-06-20T17:15:07.790' AS DateTime), 1, N'Pending', 202, NULL)
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [Confirmed], [fk_LevelId], [fk_BlackListId]) VALUES (404, N'Emily Davis', 28, 0, N'0972221111', N'emilydavis@example.com', CAST(N'1993-11-05' AS Date), N'臺中市太平區中山路一段6號', N'emilyd321', N'741', CAST(N'2023-06-20T17:15:07.790' AS DateTime), 1, N'Confirmed', 201, NULL)
INSERT [dbo].[Members] ([MemberId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [CommonAddress], [Account], [EncryptedPassword], [Registration], [IsConfirmed], [Confirmed], [fk_LevelId], [fk_BlackListId]) VALUES (405, N'David Wilson', 32, 1, N'0947778888', N'davidwilson@example.com', CAST(N'1989-07-12' AS Date), N'臺北市大安區忠孝東路三段299號', N'dwilson567', N'852', CAST(N'2023-06-20T17:15:07.790' AS DateTime), 1, N'Confirmed', 201, NULL)
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[MembershipLevel] ON 

INSERT [dbo].[MembershipLevel] ([LevelId], [LevelName], [MinSpending], [Discount], [Description]) VALUES (201, N'一般會員', N'0', CAST(0.0 AS Decimal(2, 1)), N'新註冊的會員自動成為基本級別會員')
INSERT [dbo].[MembershipLevel] ([LevelId], [LevelName], [MinSpending], [Discount], [Description]) VALUES (202, N'VIP', N'8888', CAST(0.9 AS Decimal(2, 1)), N'消費門檻達8,888即可升級')
INSERT [dbo].[MembershipLevel] ([LevelId], [LevelName], [MinSpending], [Discount], [Description]) VALUES (203, N'VVIP', N'12000', CAST(0.8 AS Decimal(2, 1)), N'消費門檻達12,000即可升級')
SET IDENTITY_INSERT [dbo].[MembershipLevel] OFF
GO
INSERT [dbo].[MembershipLevelPrivileges] ([fk_LevelId], [fk_PrivilegeId]) VALUES (201, 301)
INSERT [dbo].[MembershipLevelPrivileges] ([fk_LevelId], [fk_PrivilegeId]) VALUES (202, 301)
INSERT [dbo].[MembershipLevelPrivileges] ([fk_LevelId], [fk_PrivilegeId]) VALUES (202, 302)
INSERT [dbo].[MembershipLevelPrivileges] ([fk_LevelId], [fk_PrivilegeId]) VALUES (203, 301)
INSERT [dbo].[MembershipLevelPrivileges] ([fk_LevelId], [fk_PrivilegeId]) VALUES (203, 302)
INSERT [dbo].[MembershipLevelPrivileges] ([fk_LevelId], [fk_PrivilegeId]) VALUES (203, 303)
INSERT [dbo].[MembershipLevelPrivileges] ([fk_LevelId], [fk_PrivilegeId]) VALUES (203, 304)
GO
SET IDENTITY_INSERT [dbo].[PointCategories] ON 

INSERT [dbo].[PointCategories] ([PointCategoryId], [PointCategoryName]) VALUES (802, N'活動')
INSERT [dbo].[PointCategories] ([PointCategoryId], [PointCategoryName]) VALUES (801, N'購物')
SET IDENTITY_INSERT [dbo].[PointCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[PointHistory] ON 

INSERT [dbo].[PointHistory] ([PointHistoryId], [GetOrDeduct], [UsageAmount], [EffectiveDate], [fk_MemberId], [fk_OrderId], [OrderName], [fk_PointCategoryId]) VALUES (701, 1, 300, CAST(N'2023-06-20T17:17:02.860' AS DateTime), 401, NULL, NULL, 801)
INSERT [dbo].[PointHistory] ([PointHistoryId], [GetOrDeduct], [UsageAmount], [EffectiveDate], [fk_MemberId], [fk_OrderId], [OrderName], [fk_PointCategoryId]) VALUES (702, 0, 11, CAST(N'2023-06-20T17:17:02.860' AS DateTime), 403, NULL, NULL, 801)
INSERT [dbo].[PointHistory] ([PointHistoryId], [GetOrDeduct], [UsageAmount], [EffectiveDate], [fk_MemberId], [fk_OrderId], [OrderName], [fk_PointCategoryId]) VALUES (703, 1, 2, CAST(N'2023-06-20T17:17:02.860' AS DateTime), 403, NULL, NULL, 802)
INSERT [dbo].[PointHistory] ([PointHistoryId], [GetOrDeduct], [UsageAmount], [EffectiveDate], [fk_MemberId], [fk_OrderId], [OrderName], [fk_PointCategoryId]) VALUES (704, 1, 56, CAST(N'2023-06-20T17:17:02.860' AS DateTime), 405, NULL, NULL, 802)
INSERT [dbo].[PointHistory] ([PointHistoryId], [GetOrDeduct], [UsageAmount], [EffectiveDate], [fk_MemberId], [fk_OrderId], [OrderName], [fk_PointCategoryId]) VALUES (705, 1, 44, CAST(N'2023-06-20T17:17:02.860' AS DateTime), 405, NULL, NULL, 801)
SET IDENTITY_INSERT [dbo].[PointHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Privilege] ON 

INSERT [dbo].[Privilege] ([PrivilegeId], [PrivilegeName], [Description]) VALUES (301, N'生日優惠', N'根據會員的生日提供獨家優惠和禮物')
INSERT [dbo].[Privilege] ([PrivilegeId], [PrivilegeName], [Description]) VALUES (302, N'專屬活動', N'邀請特定等級的會員參加線上或線下的活動')
INSERT [dbo].[Privilege] ([PrivilegeId], [PrivilegeName], [Description]) VALUES (303, N'訪問新品', N'新品推出優先讓VVIP會員購買')
INSERT [dbo].[Privilege] ([PrivilegeId], [PrivilegeName], [Description]) VALUES (304, N'限量商品', N'限量商品僅限VVIP會員購買')
SET IDENTITY_INSERT [dbo].[Privilege] OFF
GO
SET IDENTITY_INSERT [dbo].[Staff] ON 

INSERT [dbo].[Staff] ([staffId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [Account], [Password], [dueDate], [fk_PermissionsId], [fk_TitleId], [fk_DepartmentId]) VALUES (2001, N'John Doe', 25, 1, N'0912345678', N'john.doe@example.com', CAST(N'1998-05-15' AS Date), N'johndoe', N'123', CAST(N'2023-06-18' AS Date), 1001, 3001, 4001)
INSERT [dbo].[Staff] ([staffId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [Account], [Password], [dueDate], [fk_PermissionsId], [fk_TitleId], [fk_DepartmentId]) VALUES (2002, N'Jane Smith', 30, 0, N'0987654321', N'jane.smith@example.com', CAST(N'1991-09-20' AS Date), N'janesmith', N'456', CAST(N'2023-06-18' AS Date), 1001, 3003, 4002)
INSERT [dbo].[Staff] ([staffId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [Account], [Password], [dueDate], [fk_PermissionsId], [fk_TitleId], [fk_DepartmentId]) VALUES (2003, N'David Lee', 35, 1, N'0922334455', N'david.lee@example.com', CAST(N'1988-12-10' AS Date), N'davidlee', N'789', CAST(N'2023-06-18' AS Date), 1002, 3001, 4002)
INSERT [dbo].[Staff] ([staffId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [Account], [Password], [dueDate], [fk_PermissionsId], [fk_TitleId], [fk_DepartmentId]) VALUES (2004, N'Sarah Wang', 28, 0, N'0933445566', N'sarah.wang@example.com', CAST(N'1993-06-25' AS Date), N'sarahwang', N'abc', CAST(N'2023-06-18' AS Date), 1003, 3005, 4004)
INSERT [dbo].[Staff] ([staffId], [Name], [Age], [Gender], [Mobile], [Email], [Birthday], [Account], [Password], [dueDate], [fk_PermissionsId], [fk_TitleId], [fk_DepartmentId]) VALUES (2005, N'Michael Chen', 32, 1, N'0977888999', N'michael.chen@example.com', CAST(N'1989-04-05' AS Date), N'michaelchen', N'xyz', CAST(N'2023-06-18' AS Date), 1001, 3004, 4003)
SET IDENTITY_INSERT [dbo].[Staff] OFF
GO
SET IDENTITY_INSERT [dbo].[StaffPermissions] ON 

INSERT [dbo].[StaffPermissions] ([PermissionsId], [LevelName]) VALUES (1001, N'一般權限')
INSERT [dbo].[StaffPermissions] ([PermissionsId], [LevelName]) VALUES (1002, N'中級權限')
INSERT [dbo].[StaffPermissions] ([PermissionsId], [LevelName]) VALUES (1003, N'高級權限')
SET IDENTITY_INSERT [dbo].[StaffPermissions] OFF
GO
/****** Object:  Index [UQ__Alternat__3B54230C9D839EA2]    Script Date: 2023/6/20 下午 09:08:27 ******/
ALTER TABLE [dbo].[AlternateAddresses] ADD UNIQUE NONCLUSTERED 
(
	[fk_MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__JobTitle__252BE89C81551395]    Script Date: 2023/6/20 下午 09:08:27 ******/
ALTER TABLE [dbo].[JobTitles] ADD UNIQUE NONCLUSTERED 
(
	[TitleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__MemberPo__3B54230CB7D73C83]    Script Date: 2023/6/20 下午 09:08:27 ******/
ALTER TABLE [dbo].[MemberPoints] ADD UNIQUE NONCLUSTERED 
(
	[fk_MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__MemberPo__70594D45F6BA3947]    Script Date: 2023/6/20 下午 09:08:27 ******/
ALTER TABLE [dbo].[MemberPoints] ADD UNIQUE NONCLUSTERED 
(
	[fk_PointHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Members__6FAE0782C7C126B6]    Script Date: 2023/6/20 下午 09:08:27 ******/
ALTER TABLE [dbo].[Members] ADD UNIQUE NONCLUSTERED 
(
	[Mobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Members__A9D1053407E4985D]    Script Date: 2023/6/20 下午 09:08:27 ******/
ALTER TABLE [dbo].[Members] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Members__B0C3AC46D3E7AA48]    Script Date: 2023/6/20 下午 09:08:27 ******/
ALTER TABLE [dbo].[Members] ADD UNIQUE NONCLUSTERED 
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__PointCat__8210158CCF7F02FB]    Script Date: 2023/6/20 下午 09:08:27 ******/
ALTER TABLE [dbo].[PointCategories] ADD UNIQUE NONCLUSTERED 
(
	[PointCategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Staff__6FAE078251B73A56]    Script Date: 2023/6/20 下午 09:08:27 ******/
ALTER TABLE [dbo].[Staff] ADD UNIQUE NONCLUSTERED 
(
	[Mobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Staff__A9D10534E4387632]    Script Date: 2023/6/20 下午 09:08:27 ******/
ALTER TABLE [dbo].[Staff] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Staff__B0C3AC462845E669]    Script Date: 2023/6/20 下午 09:08:27 ******/
ALTER TABLE [dbo].[Staff] ADD UNIQUE NONCLUSTERED 
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__StaffPer__9EF3BE7B7918B445]    Script Date: 2023/6/20 下午 09:08:27 ******/
ALTER TABLE [dbo].[StaffPermissions] ADD UNIQUE NONCLUSTERED 
(
	[LevelName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BlackList] ADD  CONSTRAINT [DF__BlackList__Creat__403A8C7D]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Members] ADD  DEFAULT (getdate()) FOR [Registration]
GO
ALTER TABLE [dbo].[PointHistory] ADD  DEFAULT (getdate()) FOR [EffectiveDate]
GO
ALTER TABLE [dbo].[Staff] ADD  DEFAULT (getdate()) FOR [dueDate]
GO
ALTER TABLE [dbo].[AlternateAddresses]  WITH CHECK ADD FOREIGN KEY([fk_MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[MemberPoints]  WITH CHECK ADD FOREIGN KEY([fk_MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[MemberPoints]  WITH CHECK ADD FOREIGN KEY([fk_PointHistoryId])
REFERENCES [dbo].[PointHistory] ([PointHistoryId])
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD FOREIGN KEY([fk_BlackListId])
REFERENCES [dbo].[BlackList] ([BlackListId])
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD FOREIGN KEY([fk_LevelId])
REFERENCES [dbo].[MembershipLevel] ([LevelId])
GO
ALTER TABLE [dbo].[MembershipLevelPrivileges]  WITH CHECK ADD FOREIGN KEY([fk_LevelId])
REFERENCES [dbo].[MembershipLevel] ([LevelId])
GO
ALTER TABLE [dbo].[MembershipLevelPrivileges]  WITH CHECK ADD FOREIGN KEY([fk_PrivilegeId])
REFERENCES [dbo].[Privilege] ([PrivilegeId])
GO
ALTER TABLE [dbo].[PointHistory]  WITH CHECK ADD FOREIGN KEY([fk_MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[PointHistory]  WITH CHECK ADD FOREIGN KEY([fk_PointCategoryId])
REFERENCES [dbo].[PointCategories] ([PointCategoryId])
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([fk_DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([fk_PermissionsId])
REFERENCES [dbo].[StaffPermissions] ([PermissionsId])
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([fk_TitleId])
REFERENCES [dbo].[JobTitles] ([TitleId])
GO
USE [master]
GO
ALTER DATABASE [FlexStore] SET  READ_WRITE 
GO
