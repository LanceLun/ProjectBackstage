USE [FlexEShop]
GO
/****** Object:  Table [dbo].[Activities]    Script Date: 2023/6/22 上午 09:49:20 ******/
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
/****** Object:  Table [dbo].[ActivityCategories]    Script Date: 2023/6/22 上午 09:49:21 ******/
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
/****** Object:  Table [dbo].[ActivityStatuses]    Script Date: 2023/6/22 上午 09:49:21 ******/
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
/****** Object:  Table [dbo].[Branches]    Script Date: 2023/6/22 上午 09:49:21 ******/
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
/****** Object:  Table [dbo].[OneToOneReservations]    Script Date: 2023/6/22 上午 09:49:21 ******/
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
/****** Object:  Table [dbo].[ReservationStatuses]    Script Date: 2023/6/22 上午 09:49:21 ******/
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
/****** Object:  Table [dbo].[SpeakerFields]    Script Date: 2023/6/22 上午 09:49:21 ******/
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
/****** Object:  Table [dbo].[Speakers]    Script Date: 2023/6/22 上午 09:49:21 ******/
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
SET IDENTITY_INSERT [dbo].[Activities] ON 
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityImage], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (1, N'2023台北歡慶雙十節路跑', 1, CAST(N'2023-10-10T07:00:00.000' AS DateTime), 1, N'臺北市政府市民廣場', N'D:\期中專題 Flex\FLEX活動照片\活動照片\2023台北歡慶雙十節路跑.jpg', CAST(N'2023-08-10T00:00:00.000' AS DateTime), CAST(N'2023-10-10T23:59:59.000' AS DateTime), 7, 600, 700, N'一起在清晨享受健康的路跑活動慶祝台灣的生日吧！', 1)
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityImage], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (2, N'2023新竹馬拉松', 2, CAST(N'2023-06-25T09:30:00.000' AS DateTime), 3, N'竹南寮十七公里海岸線', N'D:\期中專題 Flex\FLEX活動照片\活動照片\2023新竹馬拉松.png', CAST(N'2023-03-25T00:00:00.000' AS DateTime), CAST(N'2023-05-25T23:59:59.000' AS DateTime), 7, 600, 700, N'邀請您，一起來感受新竹南寮十七公里海岸線的無敵海景。', 3)
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityImage], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (3, N'2023太平山自行車挑戰賽', 3, CAST(N'2023-07-30T08:00:00.000' AS DateTime), 4, N'宜蘭太平山國家森林遊樂區', N'D:\期中專題 Flex\FLEX活動照片\活動照片\2023太平山自行車挑戰賽.jpg', CAST(N'2023-04-30T10:00:00.000' AS DateTime), CAST(N'2023-06-30T23:59:59.000' AS DateTime), 16, 850, 1000, N'一起騎著自行車遊覽台灣的美景吧！', 2)
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityImage], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (4, N'2023登峰造極之嘉明湖登山體驗', 4, CAST(N'2023-08-19T06:30:00.000' AS DateTime), 7, N'台東向陽森林遊樂區登山口', N'D:\期中專題 Flex\FLEX活動照片\活動照片\2023登峰造極之嘉明湖登山體驗.jpg', CAST(N'2023-05-19T00:00:00.000' AS DateTime), CAST(N'2023-07-19T23:59:59.000' AS DateTime), 18, 3300, 3500, N'一睹「?高山藍寶石」、「天使的眼淚」嘉明湖', 2)
GO
INSERT [dbo].[Activities] ([ActivityId], [ActivityName], [fk_ActivityCategoryId], [ActivityDate], [fk_SpeakerId], [ActivityPlace], [ActivityImage], [ActivityBookStartTime], [ActivityBookEndTime], [ActivityAge], [ActivitySalePrice], [ActivityOriginalPrice], [ActivityDescription], [fk_ActivityStatusId]) VALUES (5, N'2023第6屆桃園健行嘉年華', 5, CAST(N'2023-12-10T10:00:00.000' AS DateTime), 9, N'聖德基督教學院', N'D:\期中專題 Flex\FLEX活動照片\活動照片\2023第6屆桃園健行嘉年華.png', CAST(N'2023-08-10T00:00:00.000' AS DateTime), CAST(N'2023-10-10T23:59:59.000' AS DateTime), 7, 699, 799, N'加入我們，一同參加2023第6屆桃園健行嘉年華！這是一個充滿活力和健康的盛會，旨在鼓勵人們關注身心健康，享受戶外運動的樂趣。在這次活動中，您將有機會體驗桃園美麗的自然風光和豐富的運動活動。', 1)
GO
SET IDENTITY_INSERT [dbo].[Activities] OFF
GO
SET IDENTITY_INSERT [dbo].[ActivityCategories] ON 
GO
INSERT [dbo].[ActivityCategories] ([ActivityCategoryId], [ActivityCategoryName]) VALUES (1, N'路跑')
GO
INSERT [dbo].[ActivityCategories] ([ActivityCategoryId], [ActivityCategoryName]) VALUES (2, N'鐵人三項')
GO
INSERT [dbo].[ActivityCategories] ([ActivityCategoryId], [ActivityCategoryName]) VALUES (3, N'自行車')
GO
INSERT [dbo].[ActivityCategories] ([ActivityCategoryId], [ActivityCategoryName]) VALUES (4, N'健行')
GO
INSERT [dbo].[ActivityCategories] ([ActivityCategoryId], [ActivityCategoryName]) VALUES (5, N'登山')
GO
INSERT [dbo].[ActivityCategories] ([ActivityCategoryId], [ActivityCategoryName]) VALUES (6, N'瑜珈')
GO
SET IDENTITY_INSERT [dbo].[ActivityCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[ActivityStatuses] ON 
GO
INSERT [dbo].[ActivityStatuses] ([ActivityStatusId], [ActivityStatusDescription]) VALUES (3, N'已下架')
GO
INSERT [dbo].[ActivityStatuses] ([ActivityStatusId], [ActivityStatusDescription]) VALUES (2, N'已上架')
GO
INSERT [dbo].[ActivityStatuses] ([ActivityStatusId], [ActivityStatusDescription]) VALUES (1, N'待上架')
GO
SET IDENTITY_INSERT [dbo].[ActivityStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[Branches] ON 
GO
INSERT [dbo].[Branches] ([BranchId], [BranchName], [BranchAddress]) VALUES (1, N'新北永和店', N'234新北市永和區文化路7號')
GO
INSERT [dbo].[Branches] ([BranchId], [BranchName], [BranchAddress]) VALUES (2, N'新北板橋店', N'220新北市板橋區文化路一段135號')
GO
INSERT [dbo].[Branches] ([BranchId], [BranchName], [BranchAddress]) VALUES (3, N'桃園中壢店', N'桃園縣中壢市中正路89號1樓')
GO
INSERT [dbo].[Branches] ([BranchId], [BranchName], [BranchAddress]) VALUES (4, N'新竹站前店', N'300新竹市東區中華路二段458號')
GO
INSERT [dbo].[Branches] ([BranchId], [BranchName], [BranchAddress]) VALUES (5, N'新竹竹北店', N'302新竹縣竹北市莊敬北路130號')
GO
INSERT [dbo].[Branches] ([BranchId], [BranchName], [BranchAddress]) VALUES (6, N'台中逢甲店', N'407台中市西屯區西屯路二段272-3號1樓')
GO
INSERT [dbo].[Branches] ([BranchId], [BranchName], [BranchAddress]) VALUES (7, N'台北市府店', N'110台北市信義區松高路11號B2樓')
GO
SET IDENTITY_INSERT [dbo].[Branches] OFF
GO
SET IDENTITY_INSERT [dbo].[OneToOneReservations] ON 
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (1, 401, CAST(N'2023-06-21T09:00:00.000' AS DateTime), CAST(N'2023-06-21T11:00:00.000' AS DateTime), 1, 1, 0, CAST(N'2023-06-21T12:12:18.357' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (2, 402, CAST(N'2023-06-22T14:00:00.000' AS DateTime), CAST(N'2023-06-22T16:00:00.000' AS DateTime), 3, 3, 1, CAST(N'2023-06-21T12:12:18.357' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (3, 403, CAST(N'2023-06-23T11:00:00.000' AS DateTime), CAST(N'2023-06-23T13:00:00.000' AS DateTime), 2, 2, 1, CAST(N'2023-06-21T12:12:18.357' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (4, 404, CAST(N'2023-06-24T16:00:00.000' AS DateTime), CAST(N'2023-06-24T18:00:00.000' AS DateTime), 5, 5, 0, CAST(N'2023-06-21T12:12:18.357' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (5, 405, CAST(N'2023-06-25T13:00:00.000' AS DateTime), CAST(N'2023-06-25T14:00:00.000' AS DateTime), 4, 4, 0, CAST(N'2023-06-21T12:12:18.357' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (6, 403, CAST(N'2023-06-26T10:00:00.000' AS DateTime), CAST(N'2023-06-26T12:00:00.000' AS DateTime), 6, 6, 1, CAST(N'2023-06-21T12:12:18.357' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (7, 402, CAST(N'2023-06-27T15:00:00.000' AS DateTime), CAST(N'2023-06-27T17:00:00.000' AS DateTime), 1, 1, 0, CAST(N'2023-06-21T12:12:18.357' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (8, 401, CAST(N'2023-06-28T13:00:00.000' AS DateTime), CAST(N'2023-06-28T15:00:00.000' AS DateTime), 3, 3, 1, CAST(N'2023-06-21T12:12:18.357' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (9, 405, CAST(N'2023-06-29T12:00:00.000' AS DateTime), CAST(N'2023-06-29T14:00:00.000' AS DateTime), 2, 2, 1, CAST(N'2023-06-21T12:12:18.357' AS DateTime))
GO
INSERT [dbo].[OneToOneReservations] ([ReservationId], [fk_BookerId], [ReservationStartTime], [ReservationEndTime], [fk_BranchId], [fk_ReservationSpeakerId], [fk_ReservationStatusId], [ReservationCreatedDate]) VALUES (10, 404, CAST(N'2023-06-30T17:00:00.000' AS DateTime), CAST(N'2023-06-30T19:00:00.000' AS DateTime), 7, 7, 0, CAST(N'2023-06-21T12:12:18.357' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[OneToOneReservations] OFF
GO
INSERT [dbo].[ReservationStatuses] ([ReservationId], [ReservationStatusDescription]) VALUES (1, N'已完成')
GO
INSERT [dbo].[ReservationStatuses] ([ReservationId], [ReservationStatusDescription]) VALUES (0, N'未完成')
GO
SET IDENTITY_INSERT [dbo].[SpeakerFields] ON 
GO
INSERT [dbo].[SpeakerFields] ([FieldId], [FieldName]) VALUES (1, N'跑步')
GO
INSERT [dbo].[SpeakerFields] ([FieldId], [FieldName]) VALUES (2, N'健行')
GO
INSERT [dbo].[SpeakerFields] ([FieldId], [FieldName]) VALUES (3, N'登山')
GO
INSERT [dbo].[SpeakerFields] ([FieldId], [FieldName]) VALUES (4, N'自行車')
GO
INSERT [dbo].[SpeakerFields] ([FieldId], [FieldName]) VALUES (5, N'健身訓練')
GO
SET IDENTITY_INSERT [dbo].[SpeakerFields] OFF
GO
SET IDENTITY_INSERT [dbo].[Speakers] ON 
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName], [SpeakerPhone], [fk_SpeakerFieldId], [SpeakerImg], [fk_SpeakerBranchId], [SpeakerDescription]) VALUES (1, N'Allen', N'0935264851', 1, N'D:\期中專題 Flex\FLEX活動照片\講師大頭貼\Allen.jpg', 1, N'跑步專家Allen，擅長帶領跑者進行訓練和技巧分享。')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName], [SpeakerPhone], [fk_SpeakerFieldId], [SpeakerImg], [fk_SpeakerBranchId], [SpeakerDescription]) VALUES (2, N'Gary', N'0975641223', 2, N'D:\期中專題 Flex\FLEX活動照片\講師大頭貼\Gary.jpg', 2, N'健行導師Gary，喜歡帶領大家探索自然，並分享健行的益處和技巧。')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName], [SpeakerPhone], [fk_SpeakerFieldId], [SpeakerImg], [fk_SpeakerBranchId], [SpeakerDescription]) VALUES (3, N'Betty', N'0986523512', 3, N'D:\期中專題 Flex\FLEX活動照片\講師大頭貼\Betty.jpg', 3, N'登山教練Betty，對於登山路線和技巧有豐富的經驗，喜歡與登山愛好者分享知識。')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName], [SpeakerPhone], [fk_SpeakerFieldId], [SpeakerImg], [fk_SpeakerBranchId], [SpeakerDescription]) VALUES (4, N'Vivi', N'0953214147', 4, N'D:\期中專題 Flex\FLEX活動照片\講師大頭貼\Vivi.jpg', 4, N'自行車專家Vivi，熱衷於自行車運動，擅長技術指導和騎行安全注意事項的講解。')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName], [SpeakerPhone], [fk_SpeakerFieldId], [SpeakerImg], [fk_SpeakerBranchId], [SpeakerDescription]) VALUES (5, N'Katty', N'0933685421', 5, N'D:\期中專題 Flex\FLEX活動照片\講師大頭貼\Katty.jpg', 5, N'健身訓練教練Katty，擁有多年的健身訓練經驗，善於制定個人化的訓練計劃和建議飲食指導。')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName], [SpeakerPhone], [fk_SpeakerFieldId], [SpeakerImg], [fk_SpeakerBranchId], [SpeakerDescription]) VALUES (6, N'Steve', N'0937996501', 1, N'D:\期中專題 Flex\FLEX活動照片\講師大頭貼\Steve.jpg', 1, N'跑步專家Steve，對於長跑和競賽技巧有豐富的知識，喜歡鼓勵跑者挑戰自己的極限。')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName], [SpeakerPhone], [fk_SpeakerFieldId], [SpeakerImg], [fk_SpeakerBranchId], [SpeakerDescription]) VALUES (7, N'Jack', N'0985226553', 2, N'D:\期中專題 Flex\FLEX活動照片\講師大頭貼\Jack.jpg', 2, N'健行導師Jack，經常帶領團隊進行山岳健行和探險活動，並分享山地生態知識。')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName], [SpeakerPhone], [fk_SpeakerFieldId], [SpeakerImg], [fk_SpeakerBranchId], [SpeakerDescription]) VALUES (8, N'Sam', N'0988166355', 3, N'D:\期中專題 Flex\FLEX活動照片\講師大頭貼\Sam.jpeg', 3, N'登山教練Sam，擅長攀登技巧和高海拔環境適應，經驗豐富的山岳遠征者。')
GO
INSERT [dbo].[Speakers] ([SpeakerId], [SpeakerName], [SpeakerPhone], [fk_SpeakerFieldId], [SpeakerImg], [fk_SpeakerBranchId], [SpeakerDescription]) VALUES (9, N'Teddy', N'0957446325', 4, N'D:\期中專題 Flex\FLEX活動照片\講師大頭貼\Teddy.jpg', 4, N'自行車專家Teddy，喜歡挑戰極限，對自行車的相關裝備和規則都有豐富的知識。')
GO
SET IDENTITY_INSERT [dbo].[Speakers] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Activity__121B440BD4DEB4B4]    Script Date: 2023/6/22 上午 09:49:21 ******/
ALTER TABLE [dbo].[ActivityStatuses] ADD UNIQUE NONCLUSTERED 
(
	[ActivityStatusDescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Branches__3903DB031FF96DF0]    Script Date: 2023/6/22 上午 09:49:21 ******/
ALTER TABLE [dbo].[Branches] ADD UNIQUE NONCLUSTERED 
(
	[BranchName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Branches__F50DE17A653B9398]    Script Date: 2023/6/22 上午 09:49:21 ******/
ALTER TABLE [dbo].[Branches] ADD UNIQUE NONCLUSTERED 
(
	[BranchAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Reservat__31AFC63E4C652668]    Script Date: 2023/6/22 上午 09:49:21 ******/
ALTER TABLE [dbo].[ReservationStatuses] ADD UNIQUE NONCLUSTERED 
(
	[ReservationStatusDescription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OneToOneReservations] ADD  DEFAULT (getdate()) FOR [ReservationCreatedDate]
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
ALTER TABLE [dbo].[OneToOneReservations]  WITH CHECK ADD FOREIGN KEY([fk_BranchId])
REFERENCES [dbo].[Branches] ([BranchId])
GO
ALTER TABLE [dbo].[OneToOneReservations]  WITH CHECK ADD FOREIGN KEY([fk_ReservationSpeakerId])
REFERENCES [dbo].[Speakers] ([SpeakerId])
GO
ALTER TABLE [dbo].[OneToOneReservations]  WITH CHECK ADD FOREIGN KEY([fk_ReservationStatusId])
REFERENCES [dbo].[ReservationStatuses] ([ReservationId])
GO
ALTER TABLE [dbo].[Speakers]  WITH CHECK ADD FOREIGN KEY([fk_SpeakerBranchId])
REFERENCES [dbo].[Branches] ([BranchId])
GO
ALTER TABLE [dbo].[Speakers]  WITH CHECK ADD FOREIGN KEY([fk_SpeakerFieldId])
REFERENCES [dbo].[SpeakerFields] ([FieldId])
GO
