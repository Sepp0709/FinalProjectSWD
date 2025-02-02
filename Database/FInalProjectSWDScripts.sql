USE [master]
GO
/****** Object:  Database [FinalProjectSWD]    Script Date: 09/07/2024 23:38:41 ******/
CREATE DATABASE [FinalProjectSWD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FinalProjectSWD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FinalProjectSWD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FinalProjectSWD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\FinalProjectSWD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FinalProjectSWD] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FinalProjectSWD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FinalProjectSWD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FinalProjectSWD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FinalProjectSWD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FinalProjectSWD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FinalProjectSWD] SET ARITHABORT OFF 
GO
ALTER DATABASE [FinalProjectSWD] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FinalProjectSWD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FinalProjectSWD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FinalProjectSWD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FinalProjectSWD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FinalProjectSWD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FinalProjectSWD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FinalProjectSWD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FinalProjectSWD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FinalProjectSWD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FinalProjectSWD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FinalProjectSWD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FinalProjectSWD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FinalProjectSWD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FinalProjectSWD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FinalProjectSWD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FinalProjectSWD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FinalProjectSWD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FinalProjectSWD] SET  MULTI_USER 
GO
ALTER DATABASE [FinalProjectSWD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FinalProjectSWD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FinalProjectSWD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FinalProjectSWD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FinalProjectSWD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FinalProjectSWD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FinalProjectSWD] SET QUERY_STORE = ON
GO
ALTER DATABASE [FinalProjectSWD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FinalProjectSWD]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 09/07/2024 23:38:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[userId] [int] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 09/07/2024 23:38:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[image] [nvarchar](max) NULL,
	[categoryDescription] [nvarchar](255) NULL,
	[createDate] [date] NULL,
	[categoryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 09/07/2024 23:38:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[userId] [int] NOT NULL,
	[cardId] [nvarchar](50) NULL,
	[cardType] [nvarchar](50) NULL,
	[expirationDate] [date] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 09/07/2024 23:38:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[orderId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[unitPrice] [money] NOT NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC,
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 09/07/2024 23:38:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[userId] [int] NOT NULL,
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[creationDate] [date] NULL,
	[totalAmount] [money] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentGateway]    Script Date: 09/07/2024 23:38:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentGateway](
	[paymentId] [int] IDENTITY(1,1) NOT NULL,
	[paymentMethod] [nvarchar](50) NULL,
 CONSTRAINT [PK_PaymentGateway] PRIMARY KEY CLUSTERED 
(
	[paymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentOrder]    Script Date: 09/07/2024 23:38:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentOrder](
	[orderId] [int] NOT NULL,
	[paymentStatus] [nvarchar](50) NULL,
	[paymentDate] [date] NULL,
	[totalAmount] [money] NOT NULL,
	[paymentId] [int] NOT NULL,
 CONSTRAINT [PK_PaymentOrder] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC,
	[paymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Postman]    Script Date: 09/07/2024 23:38:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postman](
	[userId] [int] NOT NULL,
 CONSTRAINT [PK_Postman] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 09/07/2024 23:38:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[categoryId] [int] NOT NULL,
	[unitPrice] [money] NOT NULL,
	[productDescription] [nvarchar](255) NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seller]    Script Date: 09/07/2024 23:38:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seller](
	[userId] [int] NOT NULL,
 CONSTRAINT [PK_Seller] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingOrder]    Script Date: 09/07/2024 23:38:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingOrder](
	[orderId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[shippingStatus] [nvarchar](50) NULL,
	[receiveStatus] [nvarchar](50) NULL,
	[shippingDate] [date] NULL,
	[receiveDate] [date] NULL,
 CONSTRAINT [PK_ShippingOrder] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC,
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 09/07/2024 23:38:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userId] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[phoneNumber] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([userId]) VALUES (1)
INSERT [dbo].[Admin] ([userId]) VALUES (2)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([categoryId], [userId], [image], [categoryDescription], [createDate], [categoryName]) VALUES (2, 1, N'https://cdn.chiaki.vn/unsafe/0x480/left/top/smart/filters:quality(75)/https://chiaki.vn/upload/news/content/2024/06/cach-chon-san-pham-skincare-phu-hop-jpg-1718864826-20062024132706.jpg', N'Skincare products', CAST(N'2024-07-09' AS Date), N'Skincare')
INSERT [dbo].[Category] ([categoryId], [userId], [image], [categoryDescription], [createDate], [categoryName]) VALUES (3, 1, N'https://cdn.tgdd.vn/Files/2021/03/17/1335949/tat-tan-tat-thong-tin-ve-thuat-ngu-makeup-danh-cho-nguoi-moi-bat-dau-202103171132489317.jpg', N'Makeup products', CAST(N'2024-07-09' AS Date), N'Makeup')
INSERT [dbo].[Category] ([categoryId], [userId], [image], [categoryDescription], [createDate], [categoryName]) VALUES (4, 2, N'https://www.realsimple.com/thmb/OfNb2EeOQD8wr4NNXpvDp2PgsxI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/order-to-apply-hair-products-2000-af05cf6e57364a91a6b7f4c0554a45e3.jpg', N'Haircare products', CAST(N'2024-07-09' AS Date), N'Haircare')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentGateway] ON 

INSERT [dbo].[PaymentGateway] ([paymentId], [paymentMethod]) VALUES (1, N'Cash')
INSERT [dbo].[PaymentGateway] ([paymentId], [paymentMethod]) VALUES (2, N'Paypal')
SET IDENTITY_INSERT [dbo].[PaymentGateway] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productId], [userId], [categoryId], [unitPrice], [productDescription], [productName], [image], [quantity]) VALUES (3, 1, 2, 650.0000, N' The quintessence of haute couture lipstick, Rouge Premier offers the ultimate experience of refinement in a precious ceramic case.', N'ROUGE PREMIER', N'https://www.dior.com/dw/image/v2/BGXS_PRD/on/demandware.static/-/Sites-master_dior/default/dw335ad898/Y3387000/Y3387000_C338700008_dynamic.png?sw=1412&sh=1480', 100)
INSERT [dbo].[Product] ([productId], [userId], [categoryId], [unitPrice], [productDescription], [productName], [image], [quantity]) VALUES (4, 1, 2, 950.0000, N'To apply Rouge Premier, the haute couture Dior lipstick, the House of Dior has crafted an exceptional ceramic makeup brush.', N'ROUGE PREMIER BRUSH', N'https://www.dior.com/dw/image/v2/BGXS_PRD/on/demandware.static/-/Sites-master_dior/default/dw04d6daba/Y0997111/Y0997111_C099700719_E01_ZHC.jpg?sw=1800&sh=1200', 120)
INSERT [dbo].[Product] ([productId], [userId], [categoryId], [unitPrice], [productDescription], [productName], [image], [quantity]) VALUES (5, 1, 2, 950.0000, N'Dior Addict is the Dior shine lipstick designed like a fashion accessory, now featuring a formula composed of 90%* natural-origin ingredients, and housed in an ultra-couture and refillable case.', N'DIOR ADDICT', N'https://www.dior.com/dw/image/v2/BGXS_PRD/on/demandware.static/-/Sites-master_dior/default/dw1f67ff2e/Y0291000/Y0291000_C029100362_E01_ZHC.jpg?sw=1800&sh=1200', 80)
INSERT [dbo].[Product] ([productId], [userId], [categoryId], [unitPrice], [productDescription], [productName], [image], [quantity]) VALUES (6, 2, 3, 800.0000, N'Dior''s first intensive repairing cream that visibly reverses the signs of aging', N'DIOR PRESTIGE LA CREME TEXTURE FINE', N'https://www.dior.com/dw/image/v2/BGXS_PRD/on/demandware.static/-/Sites-master_dior/default/dw1b4ce92d/Y0997073/Y0997073_C099700249_E01_ZHC.jpg?sw=1800&sh=1200', 150)
INSERT [dbo].[Product] ([productId], [userId], [categoryId], [unitPrice], [productDescription], [productName], [image], [quantity]) VALUES (7, 2, 3, 900.0000, N'Diorsnow Essence of Light Micro-Infused Lotion is the Dior face and neck lotion that protects the skin barrier and beautifies the skin', N'DIORSNOW ESSENCE OF LIGHT MICRO-INFUSED LOTION', N'https://www.dior.com/dw/image/v2/BGXS_PRD/on/demandware.static/-/Sites-master_dior/default/dwe9679cd8/Y0997047/Y0997047_C099700132_E01_ZHC.jpg?sw=1800&sh=1200', 130)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[Seller] ([userId]) VALUES (1)
INSERT [dbo].[Seller] ([userId]) VALUES (2)
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([userId], [username], [password], [fullname], [phoneNumber], [email], [address]) VALUES (1, N'user1', N'password1', N' test1', N'1234567890', N'user1@example.com', N'Address 1')
INSERT [dbo].[User] ([userId], [username], [password], [fullname], [phoneNumber], [email], [address]) VALUES (2, N'user2', N'password2', N'test2', N'0987654321', N'user2@example.com', N'Address 2')
INSERT [dbo].[User] ([userId], [username], [password], [fullname], [phoneNumber], [email], [address]) VALUES (3, N'user3', N'password3', N'test3', N'0987654320', N'user3@example.com', N'Address 3')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Admin]  WITH CHECK ADD  CONSTRAINT [FK_Admin_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Admin] CHECK CONSTRAINT [FK_Admin_User]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Admin] FOREIGN KEY([userId])
REFERENCES [dbo].[Admin] ([userId])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Admin]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_User]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Order] FOREIGN KEY([orderId])
REFERENCES [dbo].[Order] ([orderId])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Order]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Product] FOREIGN KEY([productId])
REFERENCES [dbo].[Product] ([productId])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([userId])
REFERENCES [dbo].[Customer] ([userId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[PaymentOrder]  WITH CHECK ADD  CONSTRAINT [FK_PaymentOrder_Order] FOREIGN KEY([orderId])
REFERENCES [dbo].[Order] ([orderId])
GO
ALTER TABLE [dbo].[PaymentOrder] CHECK CONSTRAINT [FK_PaymentOrder_Order]
GO
ALTER TABLE [dbo].[PaymentOrder]  WITH CHECK ADD  CONSTRAINT [FK_PaymentOrder_PaymentGateway] FOREIGN KEY([paymentId])
REFERENCES [dbo].[PaymentGateway] ([paymentId])
GO
ALTER TABLE [dbo].[PaymentOrder] CHECK CONSTRAINT [FK_PaymentOrder_PaymentGateway]
GO
ALTER TABLE [dbo].[Postman]  WITH CHECK ADD  CONSTRAINT [FK_Postman_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Postman] CHECK CONSTRAINT [FK_Postman_User]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([categoryId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Seller] FOREIGN KEY([userId])
REFERENCES [dbo].[Seller] ([userId])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Seller]
GO
ALTER TABLE [dbo].[Seller]  WITH CHECK ADD  CONSTRAINT [FK_Seller_User] FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([userId])
GO
ALTER TABLE [dbo].[Seller] CHECK CONSTRAINT [FK_Seller_User]
GO
ALTER TABLE [dbo].[ShippingOrder]  WITH CHECK ADD  CONSTRAINT [FK_ShippingOrder_Order] FOREIGN KEY([orderId])
REFERENCES [dbo].[Order] ([orderId])
GO
ALTER TABLE [dbo].[ShippingOrder] CHECK CONSTRAINT [FK_ShippingOrder_Order]
GO
ALTER TABLE [dbo].[ShippingOrder]  WITH CHECK ADD  CONSTRAINT [FK_ShippingOrder_Postman] FOREIGN KEY([userId])
REFERENCES [dbo].[Postman] ([userId])
GO
ALTER TABLE [dbo].[ShippingOrder] CHECK CONSTRAINT [FK_ShippingOrder_Postman]
GO
USE [master]
GO
ALTER DATABASE [FinalProjectSWD] SET  READ_WRITE 
GO
