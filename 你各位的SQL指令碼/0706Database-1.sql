/****** Object:  Table [dbo].[Activities]    Script Date: 2023/7/6 上午 10:21:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activities](
	[ActivityId] [int] IDENTITY(1,1) NOT NULL,
	[ActivityName] [nvarchar](50) NOT NULL,
	[fk_ActivityCategoryId] [int] NOT NULL,
	[ActivityDate] [datetime] NOT NULL,
	[fk_SpeakerId] [int] NOT NULL,
	[ActivityPlace] [nvarchar](100) NOT NULL,
	[ActivityImage] [nvarchar](300) NOT NULL,
	[ActivityBookStartTime] [datetime] NOT NULL,
	[ActivityBookEndTime] [datetime] NOT NULL,
	[ActivityAge] [tinyint] NOT NULL,
	[ActivitySalePrice] [int] NOT NULL,
	[ActivityOriginalPrice] [int] NOT NULL,
	[ActivityDescription] [nvarchar](300) NULL,
	[fk_ActivityStatusId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityCategories]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityCategories](
	[ActivityCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ActivityCategoryName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivityCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityStatuses]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityStatuses](
	[ActivityStatusId] [int] IDENTITY(1,1) NOT NULL,
	[ActivityStatusDescription] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivityStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlternateAddresses]    Script Date: 2023/7/6 上午 10:21:51 ******/
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
/****** Object:  Table [dbo].[BlackLists]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlackLists](
	[BlackListId] [int] IDENTITY(1,1) NOT NULL,
	[Behavior] [nvarchar](30) NOT NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK__BlackLis__B54E3C740D440FFD] PRIMARY KEY CLUSTERED 
(
	[BlackListId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branches](
	[BranchId] [int] IDENTITY(1,1) NOT NULL,
	[BranchName] [nvarchar](50) NOT NULL,
	[BranchAddress] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[CartItemId] [int] IDENTITY(1,1) NOT NULL,
	[fk_CardId] [int] NOT NULL,
	[fk_Type] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Description] [nvarchar](700) NOT NULL,
	[Qty] [int] NOT NULL,
 CONSTRAINT [PK_CartItem] PRIMARY KEY CLUSTERED 
(
	[CartItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[closes]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[closes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[close] [bit] NULL,
	[close_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ColorCategories]    Script Date: 2023/7/6 上午 10:21:51 ******/
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
/****** Object:  Table [dbo].[CouponCategories]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CouponCategories](
	[CouponCategoryId] [int] NOT NULL,
	[CouponCategoryName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_coupon_category] PRIMARY KEY CLUSTERED 
(
	[CouponCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupons]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupons](
	[CouponId] [int] IDENTITY(1,1) NOT NULL,
	[fk_CouponCategoryId] [int] NOT NULL,
	[CouponName] [nvarchar](50) NOT NULL,
	[CouponCode] [nvarchar](50) NULL,
	[MinimumPurchaseAmount] [int] NOT NULL,
	[DiscountType] [int] NOT NULL,
	[DiscountValue] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndType] [bit] NOT NULL,
	[EndDays] [int] NULL,
	[EndDate] [datetime] NULL,
	[PersonMaxUsage] [int] NULL,
	[RequirementType] [int] NULL,
	[Requirement] [int] NULL,
	[fk_RequiredProjectTagID] [int] NULL,
 CONSTRAINT [PK_Coupon] PRIMARY KEY CLUSTERED 
(
	[CouponId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CouponSendings]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CouponSendings](
	[SendingId] [int] IDENTITY(1,1) NOT NULL,
	[fk_CouponId] [int] NOT NULL,
	[fk_MemberId] [int] NULL,
	[SentDate] [datetime] NOT NULL,
	[RedemptionStatus] [bit] NOT NULL,
	[RedeemedDate] [datetime] NULL,
 CONSTRAINT [PK_CouponSending] PRIMARY KEY CLUSTERED 
(
	[SendingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customized_materials]    Script Date: 2023/7/6 上午 10:21:51 ******/
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
/****** Object:  Table [dbo].[CustomizedOrders]    Script Date: 2023/7/6 上午 10:21:51 ******/
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
/****** Object:  Table [dbo].[CustomizedShoesPo]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomizedShoesPo](
	[ShoesProductId] [int] IDENTITY(1,1) NOT NULL,
	[ShoesName] [nvarchar](254) NOT NULL,
	[ShoesDescription] [nvarchar](254) NULL,
	[ShoesOrigin] [nvarchar](50) NULL,
	[ShoesUnitPrice] [int] NOT NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Status] [bit] NOT NULL,
	[fk_ShoesCategoryId] [int] NULL,
	[fk_ShoesColorId] [int] NULL,
	[DataCreateTime] [datetime] NULL,
	[DataEditTime] [datetime] NULL,
 CONSTRAINT [PK__Customiz__D7D2FD91792B994F] PRIMARY KEY CLUSTERED 
(
	[ShoesProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NULL,
 CONSTRAINT [PK__Departme__B2079BED023F95C3] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discounts]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discounts](
	[DiscountId] [int] IDENTITY(1,1) NOT NULL,
	[DiscountName] [nvarchar](20) NOT NULL,
	[DiscountDescription] [nvarchar](50) NULL,
	[fk_ProjectTagId] [int] NULL,
	[DiscountType] [int] NOT NULL,
	[DiscountValue] [int] NOT NULL,
	[ConditionType] [int] NOT NULL,
	[ConditionValue] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[OrderBy] [int] NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobTitles]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobTitles](
	[TitleId] [int] IDENTITY(1,1) NOT NULL,
	[TitleName] [nvarchar](50) NULL,
	[fk_StaffPermissions] [int] NULL,
 CONSTRAINT [PK__JobTitle__75758986DFA010AD] PRIMARY KEY CLUSTERED 
(
	[TitleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logistics_companies]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logistics_companies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[tel] [varchar](12) NULL,
	[logistics_description] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberPoints]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberPoints](
	[MemberPointsId] [int] IDENTITY(1,1) NOT NULL,
	[PointSubtotal] [int] NOT NULL,
	[fk_PointHistoryId] [int] NOT NULL,
	[fk_MemberId] [int] NOT NULL,
 CONSTRAINT [PK__MemberPo__8D672C97D8EFE351] PRIMARY KEY CLUSTERED 
(
	[MemberPointsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[MemberId] [int] IDENTITY(1,1) NOT NULL,
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
	[ConfirmCode] [varchar](50) NULL,
	[fk_LevelId] [int] NOT NULL,
	[fk_BlackListId] [int] NULL,
 CONSTRAINT [PK__Members__0CF04B18BDECE389] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MembershipLevelPrivileges]    Script Date: 2023/7/6 上午 10:21:51 ******/
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
/****** Object:  Table [dbo].[MembershipLevels]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipLevels](
	[LevelId] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [nvarchar](10) NOT NULL,
	[MinSpending] [varchar](30) NOT NULL,
	[Discount] [int] NULL,
	[Description] [nvarchar](300) NULL,
 CONSTRAINT [PK__Membersh__09F03C26F7CA5148] PRIMARY KEY CLUSTERED 
(
	[LevelId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OneToOneReservations]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OneToOneReservations](
	[ReservationId] [int] IDENTITY(1,1) NOT NULL,
	[fk_BookerId] [int] NOT NULL,
	[ReservationStartTime] [datetime] NOT NULL,
	[ReservationEndTime] [datetime] NOT NULL,
	[fk_BranchId] [int] NOT NULL,
	[fk_ReservationSpeakerId] [int] NOT NULL,
	[fk_ReservationStatusId] [int] NOT NULL,
	[ReservationCreatedDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_statuses]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_statuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[order_status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderItems]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[order_Id] [int] NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[fk_typeId] [int] NOT NULL,
	[per_price] [int] NULL,
	[quantity] [int] NULL,
	[discount_name] [nvarchar](50) NULL,
	[subtotal] [int] NULL,
	[discount_subtotal] [int] NULL,
	[Items_description] [nvarchar](50) NULL,
 CONSTRAINT [PK__orderIte__3214EC0749CD6A99] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ordertime] [datetime] NOT NULL,
	[fk_member_Id] [int] NOT NULL,
	[total_quantity] [int] NOT NULL,
	[logistics_company_Id] [int] NOT NULL,
	[order_status_Id] [int] NOT NULL,
	[pay_method_Id] [int] NOT NULL,
	[pay_status_Id] [int] NOT NULL,
	[coupon_name] [nvarchar](50) NULL,
	[coupon_discount] [int] NULL,
	[freight] [int] NULL,
	[cellphone] [varchar](12) NOT NULL,
	[receipt] [varchar](50) NULL,
	[receiver] [nvarchar](50) NULL,
	[recipient_address] [nvarchar](50) NULL,
	[order_description] [nvarchar](50) NULL,
	[close_Id] [int] NULL,
	[total_price] [int] NOT NULL,
 CONSTRAINT [PK__orders__3214EC0762A71CC1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pay_methods]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pay_methods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[pay_method] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pay_statuses]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pay_statuses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[pay_status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointHistories]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointHistories](
	[PointHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[GetOrDeduct] [bit] NOT NULL,
	[UsageAmount] [int] NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[fk_MemberId] [int] NULL,
	[fk_OrderId] [int] NULL,
	[fk_TypeId] [int] NULL,
 CONSTRAINT [PK__PointHis__DBE13F178E6B8343] PRIMARY KEY CLUSTERED 
(
	[PointHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointManage]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointManage](
	[PointManageId] [int] IDENTITY(1,1) NOT NULL,
	[GetOrDeduct] [bit] NOT NULL,
	[Amount] [int] NOT NULL,
	[fk_TypeId] [int] NOT NULL,
	[TypeProductId] [int] NULL,
	[PointExpirationDate] [datetime] NULL,
 CONSTRAINT [PK_PointManage] PRIMARY KEY CLUSTERED 
(
	[PointManageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PointTradeIn]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointTradeIn](
	[PointTradeInId] [int] IDENTITY(1,1) NOT NULL,
	[fk_MemberId] [int] NOT NULL,
	[fk_OrderId] [int] NULL,
	[GiftThreshold] [nvarchar](30) NOT NULL,
	[GetPoints] [varchar](30) NULL,
	[MaxGetPoints] [varchar](30) NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PointTradeIn] PRIMARY KEY CLUSTERED 
(
	[PointTradeInId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Privileges]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Privileges](
	[PrivilegeId] [int] IDENTITY(1,1) NOT NULL,
	[PrivilegeName] [nvarchar](30) NOT NULL,
	[Description] [nvarchar](300) NULL,
 CONSTRAINT [PK__Privileg__B3E77E5C75DCF9CC] PRIMARY KEY CLUSTERED 
(
	[PrivilegeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 2023/7/6 上午 10:21:51 ******/
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
/****** Object:  Table [dbo].[ProductGroups]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductGroups](
	[ProductGroupId] [int] IDENTITY(1000,1) NOT NULL,
	[fk_ProductId] [varchar](254) NOT NULL,
	[fk_ColorId] [int] NOT NULL,
	[fk_SizeId] [int] NOT NULL,
	[Qty] [int] NOT NULL,
 CONSTRAINT [PK_ProductGroups] PRIMARY KEY CLUSTERED 
(
	[ProductGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImgs]    Script Date: 2023/7/6 上午 10:21:51 ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 2023/7/6 上午 10:21:51 ******/
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
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Status] [bit] NOT NULL,
	[LogOut] [bit] NOT NULL,
	[Tag] [nvarchar](100) NULL,
	[fk_ProductSubCategoryId] [int] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
	[EditTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSubCategories]    Script Date: 2023/7/6 上午 10:21:51 ******/
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
/****** Object:  Table [dbo].[ProjectTagItems]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectTagItems](
	[fk_ProjectTagId] [int] NOT NULL,
	[fk_ProductId] [varchar](254) NOT NULL,
 CONSTRAINT [PK_discount_group_item] PRIMARY KEY CLUSTERED 
(
	[fk_ProjectTagId] ASC,
	[fk_ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectTags]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectTags](
	[ProjectTagId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectTagName] [nvarchar](30) NOT NULL,
	[CreateAt] [datetime] NOT NULL,
	[ModifiedAt] [datetime] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_discount_group] PRIMARY KEY CLUSTERED 
(
	[ProjectTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReservationStatuses]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReservationStatuses](
	[ReservationId] [int] NOT NULL,
	[ReservationStatusDescription] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesCategories]    Script Date: 2023/7/6 上午 10:21:51 ******/
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
/****** Object:  Table [dbo].[ShoesCategories]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoesCategories](
	[ShoesCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ShoesCategoryName] [nvarchar](254) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ShoesCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoesColorCategories]    Script Date: 2023/7/6 上午 10:21:51 ******/
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
/****** Object:  Table [dbo].[ShoesPictures]    Script Date: 2023/7/6 上午 10:21:51 ******/
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
/****** Object:  Table [dbo].[ShoppingCarts]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCarts](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[fk_MemberID] [int] NOT NULL,
 CONSTRAINT [PK_ShoppingCart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SizeCategories]    Script Date: 2023/7/6 上午 10:21:51 ******/
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
/****** Object:  Table [dbo].[SpeakerFields]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpeakerFields](
	[FieldId] [int] IDENTITY(1,1) NOT NULL,
	[FieldName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speakers]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speakers](
	[SpeakerId] [int] IDENTITY(1,1) NOT NULL,
	[SpeakerName] [nvarchar](50) NOT NULL,
	[SpeakerPhone] [varchar](10) NULL,
	[fk_SpeakerFieldId] [int] NOT NULL,
	[SpeakerImg] [varchar](300) NULL,
	[fk_SpeakerBranchId] [int] NULL,
	[SpeakerDescription] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[SpeakerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaffPermissions]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffPermissions](
	[PermissionsId] [int] IDENTITY(1,1) NOT NULL,
	[LevelName] [nvarchar](30) NULL,
 CONSTRAINT [PK__StaffPer__1EDAF9A81349059A] PRIMARY KEY CLUSTERED 
(
	[PermissionsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staffs]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staffs](
	[StaffId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Age] [tinyint] NULL,
	[Gender] [bit] NULL,
	[Mobile] [varchar](10) NOT NULL,
	[Email] [nvarchar](300) NOT NULL,
	[Birthday] [date] NULL,
	[Account] [varchar](30) NOT NULL,
	[Password] [varchar](70) NOT NULL,
	[DueDate] [date] NULL,
	[fk_PermissionsId] [int] NOT NULL,
	[fk_TitleId] [int] NOT NULL,
	[fk_DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Staffs] PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 2023/7/6 上午 10:21:51 ******/
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
/****** Object:  Table [dbo].[Type]    Script Date: 2023/7/6 上午 10:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Activity__732635EC39068F8F]    Script Date: 2023/7/6 上午 10:21:51 ******/
ALTER TABLE [dbo].[ActivityStatuses] ADD UNIQUE NONCLUSTERED 
(
	[ActivityStatusDescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Alternat__3B54230C838D6C60]    Script Date: 2023/7/6 上午 10:21:51 ******/
ALTER TABLE [dbo].[AlternateAddresses] ADD UNIQUE NONCLUSTERED 
(
	[fk_MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Branches__3903DB03E43F8E8B]    Script Date: 2023/7/6 上午 10:21:51 ******/
ALTER TABLE [dbo].[Branches] ADD UNIQUE NONCLUSTERED 
(
	[BranchName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Branches__F50DE17A28D64100]    Script Date: 2023/7/6 上午 10:21:51 ******/
ALTER TABLE [dbo].[Branches] ADD UNIQUE NONCLUSTERED 
(
	[BranchAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__JobTitle__252BE89C516695E0]    Script Date: 2023/7/6 上午 10:21:51 ******/
ALTER TABLE [dbo].[JobTitles] ADD  CONSTRAINT [UQ__JobTitle__252BE89C516695E0] UNIQUE NONCLUSTERED 
(
	[TitleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__MemberPo__3B54230C8C81DA21]    Script Date: 2023/7/6 上午 10:21:51 ******/
ALTER TABLE [dbo].[MemberPoints] ADD  CONSTRAINT [UQ__MemberPo__3B54230C8C81DA21] UNIQUE NONCLUSTERED 
(
	[fk_MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__MemberPo__70594D45FBF5D88E]    Script Date: 2023/7/6 上午 10:21:51 ******/
ALTER TABLE [dbo].[MemberPoints] ADD  CONSTRAINT [UQ__MemberPo__70594D45FBF5D88E] UNIQUE NONCLUSTERED 
(
	[fk_PointHistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Members__6FAE0782E1A56EB7]    Script Date: 2023/7/6 上午 10:21:51 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [UQ__Members__6FAE0782E1A56EB7] UNIQUE NONCLUSTERED 
(
	[Mobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Members__A9D1053442354E1D]    Script Date: 2023/7/6 上午 10:21:51 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [UQ__Members__A9D1053442354E1D] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Members__B0C3AC46ED2152FF]    Script Date: 2023/7/6 上午 10:21:51 ******/
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [UQ__Members__B0C3AC46ED2152FF] UNIQUE NONCLUSTERED 
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Reservat__ADF40EA60812585A]    Script Date: 2023/7/6 上午 10:21:51 ******/
ALTER TABLE [dbo].[ReservationStatuses] ADD UNIQUE NONCLUSTERED 
(
	[ReservationStatusDescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__StaffPer__9EF3BE7B6829F02D]    Script Date: 2023/7/6 上午 10:21:51 ******/
ALTER TABLE [dbo].[StaffPermissions] ADD  CONSTRAINT [UQ__StaffPer__9EF3BE7B6829F02D] UNIQUE NONCLUSTERED 
(
	[LevelName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Staffs__6FAE0782FD4F2D68]    Script Date: 2023/7/6 上午 10:21:51 ******/
ALTER TABLE [dbo].[Staffs] ADD  CONSTRAINT [UQ__Staffs__6FAE0782FD4F2D68] UNIQUE NONCLUSTERED 
(
	[Mobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Staffs__A9D10534890691F1]    Script Date: 2023/7/6 上午 10:21:51 ******/
ALTER TABLE [dbo].[Staffs] ADD  CONSTRAINT [UQ__Staffs__A9D10534890691F1] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Staffs__B0C3AC46688CF00A]    Script Date: 2023/7/6 上午 10:21:51 ******/
ALTER TABLE [dbo].[Staffs] ADD  CONSTRAINT [UQ__Staffs__B0C3AC46688CF00A] UNIQUE NONCLUSTERED 
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Supplier__AE8E9B415D6CFDAA]    Script Date: 2023/7/6 上午 10:21:51 ******/
ALTER TABLE [dbo].[Suppliers] ADD UNIQUE NONCLUSTERED 
(
	[SupplierCompanyNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activities] ADD  CONSTRAINT [DF_Activities_fk_ActivityStatusId]  DEFAULT ((1)) FOR [fk_ActivityStatusId]
GO
ALTER TABLE [dbo].[BlackLists] ADD  CONSTRAINT [DF__BlackList__Creat__403A8C7D]  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF_Coupon_EndDays]  DEFAULT (NULL) FOR [EndDays]
GO
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF_Coupon_EndDate]  DEFAULT (NULL) FOR [EndDate]
GO
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF_Coupon_PersonMaxUsage]  DEFAULT (NULL) FOR [PersonMaxUsage]
GO
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF_Coupon_RequirementType]  DEFAULT (NULL) FOR [RequirementType]
GO
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF_Coupon_Requirement]  DEFAULT (NULL) FOR [Requirement]
GO
ALTER TABLE [dbo].[Coupons] ADD  CONSTRAINT [DF_Coupon_fk_RequiredGroupID]  DEFAULT (NULL) FOR [fk_RequiredProjectTagID]
GO
ALTER TABLE [dbo].[CustomizedShoesPo] ADD  CONSTRAINT [DF_Customized_Shoes_Status]  DEFAULT ('false') FOR [Status]
GO
ALTER TABLE [dbo].[CustomizedShoesPo] ADD  CONSTRAINT [DF_CustomizedShoesPo_DataCreateTime]  DEFAULT (getdate()) FOR [DataCreateTime]
GO
ALTER TABLE [dbo].[CustomizedShoesPo] ADD  CONSTRAINT [DF_CustomizedShoesPo_DataEditTime]  DEFAULT (getdate()) FOR [DataEditTime]
GO
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF__Members__Registr__32AB8735]  DEFAULT (getdate()) FOR [Registration]
GO
ALTER TABLE [dbo].[OneToOneReservations] ADD  DEFAULT (getdate()) FOR [ReservationCreatedDate]
GO
ALTER TABLE [dbo].[PointHistories] ADD  CONSTRAINT [DF__PointHist__Effec__3493CFA7]  DEFAULT (getdate()) FOR [EffectiveDate]
GO
ALTER TABLE [dbo].[PointTradeIn] ADD  CONSTRAINT [DF_PointTradeIn_EffectiveDate]  DEFAULT (getdate()) FOR [EffectiveDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Product_ProductId]  DEFAULT ('unique') FOR [ProductId]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Status]  DEFAULT ('false') FOR [Status]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Product_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Product_EditTime]  DEFAULT (getdate()) FOR [EditTime]
GO
ALTER TABLE [dbo].[ProjectTags] ADD  CONSTRAINT [DF_ProjectTags_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Staffs] ADD  CONSTRAINT [DF__Staffs__dueDate__395884C4]  DEFAULT (getdate()) FOR [DueDate]
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD FOREIGN KEY([fk_ActivityCategoryId])
REFERENCES [dbo].[ActivityCategories] ([ActivityCategoryId])
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD FOREIGN KEY([fk_ActivityStatusId])
REFERENCES [dbo].[ActivityStatuses] ([ActivityStatusId])
GO
ALTER TABLE [dbo].[Activities]  WITH CHECK ADD FOREIGN KEY([fk_SpeakerId])
REFERENCES [dbo].[Speakers] ([SpeakerId])
GO
ALTER TABLE [dbo].[AlternateAddresses]  WITH CHECK ADD  CONSTRAINT [FK__Alternate__fk_Me__3D2915A8] FOREIGN KEY([fk_MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[AlternateAddresses] CHECK CONSTRAINT [FK__Alternate__fk_Me__3D2915A8]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItem_CartItem] FOREIGN KEY([CartItemId])
REFERENCES [dbo].[ShoppingCarts] ([CartId])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItem_CartItem]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Type] FOREIGN KEY([fk_Type])
REFERENCES [dbo].[Type] ([TypeId])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Type]
GO
ALTER TABLE [dbo].[Coupons]  WITH CHECK ADD  CONSTRAINT [FK_Coupon_CouponCategory] FOREIGN KEY([fk_CouponCategoryId])
REFERENCES [dbo].[CouponCategories] ([CouponCategoryId])
GO
ALTER TABLE [dbo].[Coupons] CHECK CONSTRAINT [FK_Coupon_CouponCategory]
GO
ALTER TABLE [dbo].[Coupons]  WITH CHECK ADD  CONSTRAINT [FK_Coupon_ProjectTag] FOREIGN KEY([fk_RequiredProjectTagID])
REFERENCES [dbo].[ProjectTags] ([ProjectTagId])
GO
ALTER TABLE [dbo].[Coupons] CHECK CONSTRAINT [FK_Coupon_ProjectTag]
GO
ALTER TABLE [dbo].[CouponSendings]  WITH CHECK ADD  CONSTRAINT [FK_CouponSending_Coupon] FOREIGN KEY([fk_CouponId])
REFERENCES [dbo].[Coupons] ([CouponId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CouponSendings] CHECK CONSTRAINT [FK_CouponSending_Coupon]
GO
ALTER TABLE [dbo].[CouponSendings]  WITH CHECK ADD  CONSTRAINT [FK_CouponSendings_Members] FOREIGN KEY([fk_MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[CouponSendings] CHECK CONSTRAINT [FK_CouponSendings_Members]
GO
ALTER TABLE [dbo].[Customized_materials]  WITH CHECK ADD FOREIGN KEY([material_ColorId])
REFERENCES [dbo].[ShoesColorCategories] ([ShoesColorId])
GO
ALTER TABLE [dbo].[CustomizedOrders]  WITH CHECK ADD  CONSTRAINT [FK__Customize__Custo__46B27FE2] FOREIGN KEY([Customized_Shoes_Id])
REFERENCES [dbo].[CustomizedShoesPo] ([ShoesProductId])
GO
ALTER TABLE [dbo].[CustomizedOrders] CHECK CONSTRAINT [FK__Customize__Custo__46B27FE2]
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
ALTER TABLE [dbo].[CustomizedOrders]  WITH CHECK ADD  CONSTRAINT [FK_CustomizedOrders_Members] FOREIGN KEY([Fk_ForMemberCustomized_Id])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[CustomizedOrders] CHECK CONSTRAINT [FK_CustomizedOrders_Members]
GO
ALTER TABLE [dbo].[CustomizedShoesPo]  WITH CHECK ADD  CONSTRAINT [FK__Customize__fk_Sh__44CA3770] FOREIGN KEY([fk_ShoesCategoryId])
REFERENCES [dbo].[ShoesCategories] ([ShoesCategoryId])
GO
ALTER TABLE [dbo].[CustomizedShoesPo] CHECK CONSTRAINT [FK__Customize__fk_Sh__44CA3770]
GO
ALTER TABLE [dbo].[CustomizedShoesPo]  WITH CHECK ADD  CONSTRAINT [FK__Customize__fk_Sh__45BE5BA9] FOREIGN KEY([fk_ShoesColorId])
REFERENCES [dbo].[ShoesColorCategories] ([ShoesColorId])
GO
ALTER TABLE [dbo].[CustomizedShoesPo] CHECK CONSTRAINT [FK__Customize__fk_Sh__45BE5BA9]
GO
ALTER TABLE [dbo].[Discounts]  WITH CHECK ADD  CONSTRAINT [FK_Discount_DiscountGroup] FOREIGN KEY([fk_ProjectTagId])
REFERENCES [dbo].[ProjectTags] ([ProjectTagId])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Discounts] CHECK CONSTRAINT [FK_Discount_DiscountGroup]
GO
ALTER TABLE [dbo].[MemberPoints]  WITH CHECK ADD  CONSTRAINT [FK__MemberPoi__fk_Me__4E53A1AA] FOREIGN KEY([fk_MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[MemberPoints] CHECK CONSTRAINT [FK__MemberPoi__fk_Me__4E53A1AA]
GO
ALTER TABLE [dbo].[MemberPoints]  WITH CHECK ADD  CONSTRAINT [FK__MemberPoi__fk_Po__7EF6D905] FOREIGN KEY([fk_PointHistoryId])
REFERENCES [dbo].[PointHistories] ([PointHistoryId])
GO
ALTER TABLE [dbo].[MemberPoints] CHECK CONSTRAINT [FK__MemberPoi__fk_Po__7EF6D905]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK__Members__fk_Blac__503BEA1C] FOREIGN KEY([fk_BlackListId])
REFERENCES [dbo].[BlackLists] ([BlackListId])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK__Members__fk_Blac__503BEA1C]
GO
ALTER TABLE [dbo].[Members]  WITH CHECK ADD  CONSTRAINT [FK__Members__fk_Leve__00DF2177] FOREIGN KEY([fk_LevelId])
REFERENCES [dbo].[MembershipLevels] ([LevelId])
GO
ALTER TABLE [dbo].[Members] CHECK CONSTRAINT [FK__Members__fk_Leve__00DF2177]
GO
ALTER TABLE [dbo].[MembershipLevelPrivileges]  WITH CHECK ADD  CONSTRAINT [FK__Membershi__fk_Le__01D345B0] FOREIGN KEY([fk_LevelId])
REFERENCES [dbo].[MembershipLevels] ([LevelId])
GO
ALTER TABLE [dbo].[MembershipLevelPrivileges] CHECK CONSTRAINT [FK__Membershi__fk_Le__01D345B0]
GO
ALTER TABLE [dbo].[MembershipLevelPrivileges]  WITH CHECK ADD  CONSTRAINT [FK__Membershi__fk_Pr__531856C7] FOREIGN KEY([fk_PrivilegeId])
REFERENCES [dbo].[Privileges] ([PrivilegeId])
GO
ALTER TABLE [dbo].[MembershipLevelPrivileges] CHECK CONSTRAINT [FK__Membershi__fk_Pr__531856C7]
GO
ALTER TABLE [dbo].[OneToOneReservations]  WITH CHECK ADD FOREIGN KEY([fk_BranchId])
REFERENCES [dbo].[Branches] ([BranchId])
GO
ALTER TABLE [dbo].[OneToOneReservations]  WITH CHECK ADD FOREIGN KEY([fk_ReservationSpeakerId])
REFERENCES [dbo].[Speakers] ([SpeakerId])
GO
ALTER TABLE [dbo].[OneToOneReservations]  WITH CHECK ADD FOREIGN KEY([fk_ReservationStatusId])
REFERENCES [dbo].[ReservationStatuses] ([ReservationId])
GO
ALTER TABLE [dbo].[OneToOneReservations]  WITH CHECK ADD  CONSTRAINT [FK_OneToOneReservations_Members] FOREIGN KEY([fk_BookerId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[OneToOneReservations] CHECK CONSTRAINT [FK_OneToOneReservations_Members]
GO
ALTER TABLE [dbo].[orderItems]  WITH CHECK ADD  CONSTRAINT [FK__orderItem__order__1B9317B3] FOREIGN KEY([order_Id])
REFERENCES [dbo].[orders] ([Id])
GO
ALTER TABLE [dbo].[orderItems] CHECK CONSTRAINT [FK__orderItem__order__1B9317B3]
GO
ALTER TABLE [dbo].[orderItems]  WITH CHECK ADD  CONSTRAINT [FK_orderItems_Type] FOREIGN KEY([fk_typeId])
REFERENCES [dbo].[Type] ([TypeId])
GO
ALTER TABLE [dbo].[orderItems] CHECK CONSTRAINT [FK_orderItems_Type]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__close_Id__59C55456] FOREIGN KEY([close_Id])
REFERENCES [dbo].[closes] ([Id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__close_Id__59C55456]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__fk_membe__5BAD9CC8] FOREIGN KEY([fk_member_Id])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__fk_membe__5BAD9CC8]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__logistic__5BAD9CC8] FOREIGN KEY([logistics_company_Id])
REFERENCES [dbo].[logistics_companies] ([Id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__logistic__5BAD9CC8]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__order_st__5CA1C101] FOREIGN KEY([order_status_Id])
REFERENCES [dbo].[order_statuses] ([Id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__order_st__5CA1C101]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__pay_meth__5D95E53A] FOREIGN KEY([pay_method_Id])
REFERENCES [dbo].[pay_methods] ([Id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__pay_meth__5D95E53A]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__pay_stat__5E8A0973] FOREIGN KEY([pay_status_Id])
REFERENCES [dbo].[pay_statuses] ([Id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__pay_stat__5E8A0973]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_Members] FOREIGN KEY([fk_member_Id])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_Members]
GO
ALTER TABLE [dbo].[PointHistories]  WITH CHECK ADD  CONSTRAINT [FK__PointHist__fk_Me__03BB8E22] FOREIGN KEY([fk_MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[PointHistories] CHECK CONSTRAINT [FK__PointHist__fk_Me__03BB8E22]
GO
ALTER TABLE [dbo].[PointHistories]  WITH CHECK ADD  CONSTRAINT [FK_PointHistories_orders] FOREIGN KEY([fk_OrderId])
REFERENCES [dbo].[orders] ([Id])
GO
ALTER TABLE [dbo].[PointHistories] CHECK CONSTRAINT [FK_PointHistories_orders]
GO
ALTER TABLE [dbo].[PointHistories]  WITH CHECK ADD  CONSTRAINT [FK_PointHistories_Type] FOREIGN KEY([fk_TypeId])
REFERENCES [dbo].[Type] ([TypeId])
GO
ALTER TABLE [dbo].[PointHistories] CHECK CONSTRAINT [FK_PointHistories_Type]
GO
ALTER TABLE [dbo].[PointManage]  WITH CHECK ADD  CONSTRAINT [FK_PointManage_PointManage] FOREIGN KEY([PointManageId])
REFERENCES [dbo].[PointManage] ([PointManageId])
GO
ALTER TABLE [dbo].[PointManage] CHECK CONSTRAINT [FK_PointManage_PointManage]
GO
ALTER TABLE [dbo].[PointManage]  WITH CHECK ADD  CONSTRAINT [FK_PointManage_Type] FOREIGN KEY([fk_TypeId])
REFERENCES [dbo].[Type] ([TypeId])
GO
ALTER TABLE [dbo].[PointManage] CHECK CONSTRAINT [FK_PointManage_Type]
GO
ALTER TABLE [dbo].[PointTradeIn]  WITH CHECK ADD  CONSTRAINT [FK_PointTradeIn_Members] FOREIGN KEY([fk_MemberId])
REFERENCES [dbo].[Members] ([MemberId])
GO
ALTER TABLE [dbo].[PointTradeIn] CHECK CONSTRAINT [FK_PointTradeIn_Members]
GO
ALTER TABLE [dbo].[PointTradeIn]  WITH CHECK ADD  CONSTRAINT [FK_PointTradeIn_orders] FOREIGN KEY([fk_OrderId])
REFERENCES [dbo].[orders] ([Id])
GO
ALTER TABLE [dbo].[PointTradeIn] CHECK CONSTRAINT [FK_PointTradeIn_orders]
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
ALTER TABLE [dbo].[ProductGroups]  WITH CHECK ADD  CONSTRAINT [FK_ProductGroups_SizeCategories] FOREIGN KEY([fk_SizeId])
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
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductSubCategory] FOREIGN KEY([fk_ProductSubCategoryId])
REFERENCES [dbo].[ProductSubCategories] ([ProductSubCategoryId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Product_ProductSubCategory]
GO
ALTER TABLE [dbo].[ProductSubCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductSubCategories_ProductCategories] FOREIGN KEY([fk_ProductCategoryId])
REFERENCES [dbo].[ProductCategories] ([ProductCategoryId])
GO
ALTER TABLE [dbo].[ProductSubCategories] CHECK CONSTRAINT [FK_ProductSubCategories_ProductCategories]
GO
ALTER TABLE [dbo].[ProjectTagItems]  WITH CHECK ADD  CONSTRAINT [FK_discount_group_item_discount_group] FOREIGN KEY([fk_ProductId])
REFERENCES [dbo].[Products] ([ProductId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProjectTagItems] CHECK CONSTRAINT [FK_discount_group_item_discount_group]
GO
ALTER TABLE [dbo].[ProjectTagItems]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTagItems_ProjectTagItems] FOREIGN KEY([fk_ProjectTagId], [fk_ProductId])
REFERENCES [dbo].[ProjectTagItems] ([fk_ProjectTagId], [fk_ProductId])
GO
ALTER TABLE [dbo].[ProjectTagItems] CHECK CONSTRAINT [FK_ProjectTagItems_ProjectTagItems]
GO
ALTER TABLE [dbo].[ProjectTags]  WITH CHECK ADD  CONSTRAINT [FK_ProjectTags_ProjectTags] FOREIGN KEY([ProjectTagId])
REFERENCES [dbo].[ProjectTags] ([ProjectTagId])
GO
ALTER TABLE [dbo].[ProjectTags] CHECK CONSTRAINT [FK_ProjectTags_ProjectTags]
GO
ALTER TABLE [dbo].[ShoesPictures]  WITH CHECK ADD  CONSTRAINT [FK__ShoesPict__fk_Sh__70A8B9AE] FOREIGN KEY([fk_ShoesPictureProduct_Id])
REFERENCES [dbo].[CustomizedShoesPo] ([ShoesProductId])
GO
ALTER TABLE [dbo].[ShoesPictures] CHECK CONSTRAINT [FK__ShoesPict__fk_Sh__70A8B9AE]
GO
ALTER TABLE [dbo].[ShoesPictures]  WITH CHECK ADD FOREIGN KEY([fk_ShoesProductOrder_Id])
REFERENCES [dbo].[CustomizedOrders] ([Customized_Id])
GO
ALTER TABLE [dbo].[ShoppingCarts]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCarts_Members] FOREIGN KEY([fk_MemberID])
REFERENCES [dbo].[Members] ([MemberId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ShoppingCarts] CHECK CONSTRAINT [FK_ShoppingCarts_Members]
GO
ALTER TABLE [dbo].[Speakers]  WITH CHECK ADD FOREIGN KEY([fk_SpeakerBranchId])
REFERENCES [dbo].[Branches] ([BranchId])
GO
ALTER TABLE [dbo].[Speakers]  WITH CHECK ADD FOREIGN KEY([fk_SpeakerFieldId])
REFERENCES [dbo].[SpeakerFields] ([FieldId])
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD  CONSTRAINT [FK__Staffs__fk_Depar__74794A92] FOREIGN KEY([fk_DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Staffs] CHECK CONSTRAINT [FK__Staffs__fk_Depar__74794A92]
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD  CONSTRAINT [FK__Staffs__fk_Permi__756D6ECB] FOREIGN KEY([fk_PermissionsId])
REFERENCES [dbo].[StaffPermissions] ([PermissionsId])
GO
ALTER TABLE [dbo].[Staffs] CHECK CONSTRAINT [FK__Staffs__fk_Permi__756D6ECB]
GO
ALTER TABLE [dbo].[Staffs]  WITH CHECK ADD  CONSTRAINT [FK__Staffs__fk_Title__76619304] FOREIGN KEY([fk_TitleId])
REFERENCES [dbo].[JobTitles] ([TitleId])
GO
ALTER TABLE [dbo].[Staffs] CHECK CONSTRAINT [FK__Staffs__fk_Title__76619304]
GO
