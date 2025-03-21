USE [NoiThat]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 09/29/24 22:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 09/29/24 22:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FromUserID] [int] NULL,
	[ToUserID] [int] NULL,
	[Content] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[Send] [bit] NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 09/29/24 22:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[ProductName] [nvarchar](50) NULL,
	[ProductPrice] [int] NULL,
	[Quantity] [int] NULL,
	[OrderID] [int] NULL,
	[ProductImage] [nvarchar](500) NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 09/29/24 22:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[DateOrder] [datetime] NULL,
	[DateShip] [datetime] NULL,
	[IsPaid] [bit] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 09/29/24 22:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Price] [int] NULL,
	[CreatedBy] [int] NULL,
	[ViewCount] [int] NULL,
	[Image1] [nvarchar](500) NULL,
	[Image2] [nvarchar](500) NULL,
	[Image3] [nvarchar](500) NULL,
	[Quantity] [int] NULL,
	[PurchasedCount] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CategoryID] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 09/29/24 22:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Email] [nvarchar](50) NULL,
	[Captcha] [nvarchar](50) NULL,
	[IsConfirm] [bit] NULL,
	[Address] [nvarchar](500) NULL,
	[Phone] [nchar](12) NULL,
	[UserTypeID] [int] NULL,
	[Password] [nvarchar](50) NULL,
	[Avatar] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 09/29/24 22:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([ID], [Name], [IsActive]) VALUES (1, N'Nội thất gia đình.', 1)
INSERT [dbo].[Categories] ([ID], [Name], [IsActive]) VALUES (2, N'Nội thất văn phòng', 1)
INSERT [dbo].[Categories] ([ID], [Name], [IsActive]) VALUES (3, N'Nội thất cổ điển', 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Message] ON 

INSERT [dbo].[Message] ([ID], [FromUserID], [ToUserID], [Content], [CreatedDate], [Send]) VALUES (7, 2, 1, N'Chào shop', CAST(N'2024-09-24T22:20:24.923' AS DateTime), 1)
INSERT [dbo].[Message] ([ID], [FromUserID], [ToUserID], [Content], [CreatedDate], [Send]) VALUES (8, 1, 2, N'Chào bạn.', CAST(N'2024-09-24T22:22:16.520' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Message] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([ID], [ProductID], [ProductName], [ProductPrice], [Quantity], [OrderID], [ProductImage]) VALUES (7, 2, N'Ghế ', 250000, 1, 7, N'ghe_1.jpg')
INSERT [dbo].[OrderDetails] ([ID], [ProductID], [ProductName], [ProductPrice], [Quantity], [OrderID], [ProductImage]) VALUES (8, 2, N'Ghế ', 250000, 1, 8, N'ghe_1.jpg')
INSERT [dbo].[OrderDetails] ([ID], [ProductID], [ProductName], [ProductPrice], [Quantity], [OrderID], [ProductImage]) VALUES (9, 1, N'Bàn ', 2000000, 1, 9, N'ban_1.jpg')
INSERT [dbo].[OrderDetails] ([ID], [ProductID], [ProductName], [ProductPrice], [Quantity], [OrderID], [ProductImage]) VALUES (10, 1, N'Bàn ', 2000000, 1, 10, N'ban_1.jpg')
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([ID], [UserID], [Status], [DateOrder], [DateShip], [IsPaid]) VALUES (7, 2, N'Processing', CAST(N'2024-09-24T22:12:52.200' AS DateTime), CAST(N'2024-09-27T22:12:52.200' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [UserID], [Status], [DateOrder], [DateShip], [IsPaid]) VALUES (8, 2, N'Processing', CAST(N'2024-09-24T22:15:04.850' AS DateTime), CAST(N'2024-09-27T22:15:04.850' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [UserID], [Status], [DateOrder], [DateShip], [IsPaid]) VALUES (9, 2, N'Processing', CAST(N'2024-09-24T22:19:40.353' AS DateTime), CAST(N'2024-09-27T22:19:40.353' AS DateTime), 0)
INSERT [dbo].[Orders] ([ID], [UserID], [Status], [DateOrder], [DateShip], [IsPaid]) VALUES (10, 2, N'Processing', CAST(N'2024-09-24T22:20:04.857' AS DateTime), CAST(N'2024-09-27T22:20:04.857' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [Name], [Price], [CreatedBy], [ViewCount], [Image1], [Image2], [Image3], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (1, N'Bàn ', 2000000, 1, 0, N'ban_1.jpg', NULL, NULL, 98, 2, N'Bàn đẹp và tốt.', 1, 1)
INSERT [dbo].[Products] ([ID], [Name], [Price], [CreatedBy], [ViewCount], [Image1], [Image2], [Image3], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (2, N'Ghế ', 250000, 1, 0, N'ghe_1.jpg', NULL, NULL, 200, 1, N'Ghế đẹp và tốt.', 1, 1)
INSERT [dbo].[Products] ([ID], [Name], [Price], [CreatedBy], [ViewCount], [Image1], [Image2], [Image3], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (3, N'Bàn nhân viên', 1200000, 1, 0, N'banvp_1.jpg', NULL, NULL, 100, 3, N'Bàn dài và rộng.', 1, 2)
INSERT [dbo].[Products] ([ID], [Name], [Price], [CreatedBy], [ViewCount], [Image1], [Image2], [Image3], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (4, N'Ghế xoay', 450000, 1, 0, N'ghexoay_1.png', NULL, NULL, 300, 0, N'Ghế xoay nhẹ và dễ dàng.', 1, 2)
INSERT [dbo].[Products] ([ID], [Name], [Price], [CreatedBy], [ViewCount], [Image1], [Image2], [Image3], [Quantity], [PurchasedCount], [Description], [IsActive], [CategoryID]) VALUES (5, N'Tủ gỗ hoa văn', 2000000, 1, 0, N'tugo_1.jpg', NULL, NULL, 50, 1, N'Tủ hoa văn cổ điển.', 1, 3)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Name], [Email], [Captcha], [IsConfirm], [Address], [Phone], [UserTypeID], [Password], [Avatar]) VALUES (1, N'Admin', N'admin@gmail.com', N'123456', 1, N'CT', N'1234567890', 1, N'123456', N'pr.jpg')
INSERT [dbo].[Users] ([ID], [Name], [Email], [Captcha], [IsConfirm], [Address], [Phone], [UserTypeID], [Password], [Avatar]) VALUES (2, N'DuongNguyen', N'duongnm110198@gmail.com', N'604232', 0, N'pr.jpg', N'123456', 2, N'123456', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([ID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[UserType] ([ID], [Name]) VALUES (2, N'Client')
SET IDENTITY_INSERT [dbo].[UserType] OFF
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK__Message__FromUse__36B12243] FOREIGN KEY([FromUserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK__Message__FromUse__36B12243]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK__Message__ToUserI__37A5467C] FOREIGN KEY([ToUserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK__Message__ToUserI__37A5467C]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Order__25869641] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDeta__Order__25869641]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__OrderDeta__Produ__24927208] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK__OrderDeta__Produ__24927208]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__Catego__239E4DCF] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__Catego__239E4DCF]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK__Products__Create__276EDEB3] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK__Products__Create__276EDEB3]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[UserType] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a_QueueActivationSender]    Script Date: 09/29/24 22:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a_QueueActivationSender] 
WITH EXECUTE AS SELF
AS 
BEGIN 
    SET NOCOUNT ON;
    DECLARE @h AS UNIQUEIDENTIFIER;
    DECLARE @mt NVARCHAR(200);

    RECEIVE TOP(1) @h = conversation_handle, @mt = message_type_name FROM [dbo].[dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a_Sender];

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
    BEGIN
        END CONVERSATION @h;
    END

    IF @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/DialogTimer' OR @mt = N'http://schemas.microsoft.com/SQL/ServiceBroker/Error'
    BEGIN 
        

        END CONVERSATION @h;

        DECLARE @conversation_handle UNIQUEIDENTIFIER;
        DECLARE @schema_id INT;
        SELECT @schema_id = schema_id FROM sys.schemas WITH (NOLOCK) WHERE name = N'dbo';

        
        IF EXISTS (SELECT * FROM sys.triggers WITH (NOLOCK) WHERE object_id = OBJECT_ID(N'[dbo].[tr_dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a_Sender]')) DROP TRIGGER [dbo].[tr_dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a_Sender') EXEC (N'ALTER QUEUE [dbo].[dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a_Sender] WITH ACTIVATION (STATUS = OFF)');

        
        SELECT conversation_handle INTO #Conversations FROM sys.conversation_endpoints WITH (NOLOCK) WHERE far_service LIKE N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a_%' ORDER BY is_initiator ASC;
        DECLARE conversation_cursor CURSOR FAST_FORWARD FOR SELECT conversation_handle FROM #Conversations;
        OPEN conversation_cursor;
        FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        WHILE @@FETCH_STATUS = 0 
        BEGIN
            END CONVERSATION @conversation_handle WITH CLEANUP;
            FETCH NEXT FROM conversation_cursor INTO @conversation_handle;
        END
        CLOSE conversation_cursor;
        DEALLOCATE conversation_cursor;
        DROP TABLE #Conversations;

        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a_Receiver') DROP SERVICE [dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a_Receiver];
        
        IF EXISTS (SELECT * FROM sys.services WITH (NOLOCK) WHERE name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a_Sender') DROP SERVICE [dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a_Receiver') DROP QUEUE [dbo].[dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a_Receiver];
        
        IF EXISTS (SELECT * FROM sys.service_queues WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a_Sender') DROP QUEUE [dbo].[dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a_Sender];

        
        IF EXISTS (SELECT * FROM sys.service_contracts WITH (NOLOCK) WHERE name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a') DROP CONTRACT [dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a];
        
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/StartMessage/Insert') DROP MESSAGE TYPE [dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/StartMessage/Insert];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/StartMessage/Update') DROP MESSAGE TYPE [dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/StartMessage/Update];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/StartMessage/Delete') DROP MESSAGE TYPE [dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/StartMessage/Delete];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/ID') DROP MESSAGE TYPE [dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/ID];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/ID/old') DROP MESSAGE TYPE [dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/ID/old];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/FromUserID') DROP MESSAGE TYPE [dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/FromUserID];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/FromUserID/old') DROP MESSAGE TYPE [dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/FromUserID/old];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/ToUserID') DROP MESSAGE TYPE [dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/ToUserID];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/ToUserID/old') DROP MESSAGE TYPE [dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/ToUserID/old];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/Content') DROP MESSAGE TYPE [dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/Content];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/Content/old') DROP MESSAGE TYPE [dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/Content/old];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/CreatedDate') DROP MESSAGE TYPE [dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/CreatedDate];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/CreatedDate/old') DROP MESSAGE TYPE [dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/CreatedDate/old];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/Send') DROP MESSAGE TYPE [dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/Send];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/Send/old') DROP MESSAGE TYPE [dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/Send/old];
        IF EXISTS (SELECT * FROM sys.service_message_types WITH (NOLOCK) WHERE name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/EndMessage') DROP MESSAGE TYPE [dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a/EndMessage];

        
        IF EXISTS (SELECT * FROM sys.objects WITH (NOLOCK) WHERE schema_id = @schema_id AND name = N'dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a_QueueActivationSender') DROP PROCEDURE [dbo].[dbo_Message_6fca9d18-4c26-4ce6-a071-45d50ea5d62a_QueueActivationSender];

        
    END
END
GO
select * from dbo.Users