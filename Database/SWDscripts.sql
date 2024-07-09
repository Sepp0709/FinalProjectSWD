USE [master]
GO
/****** Object:  Database [FinalProjectSWD]    Script Date: 08/07/2024 23:21:51 ******/
USE DATABASE [FinalProjectSWD]
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
use [FinalProjectSWD]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 08/07/2024 23:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[userId] [int] NOT NULL,
 CONSTRAINT [PK_Admin_1] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT INTO [dbo].[Admin] ([userId])
VALUES
(1),
(2);

/****** Object:  Table [dbo].[Category]    Script Date: 08/07/2024 23:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[categoryName] [nvarchar](50) NULL,
	[image] [nvarchar](max) NULL,
	[categoryDescription] [nvarchar](255) NULL,
	[createDate] [date] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT INTO [dbo].[Category] ([categoryId], [userId], [categoryName], [image], [categoryDescription], [createDate])
VALUES
(1, 1, 'Skincare', 'https://cdn.chiaki.vn/unsafe/0x480/left/top/smart/filters:quality(75)/https://chiaki.vn/upload/news/content/2024/06/cach-chon-san-pham-skincare-phu-hop-jpg-1718864826-20062024132706.jpg', 'Skincare products', '2024-07-09'),
(2, 1, 'Makeup', 'https://cdn.tgdd.vn/Files/2021/03/17/1335949/tat-tan-tat-thong-tin-ve-thuat-ngu-makeup-danh-cho-nguoi-moi-bat-dau-202103171132489317.jpg', 'Makeup products', '2024-07-09'),
(3, 2, 'Haircare', 'https://www.realsimple.com/thmb/OfNb2EeOQD8wr4NNXpvDp2PgsxI=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/order-to-apply-hair-products-2000-af05cf6e57364a91a6b7f4c0554a45e3.jpg', 'Haircare products', '2024-07-09');

/****** Object:  Table [dbo].[Customer]    Script Date: 08/07/2024 23:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[userId] [int] NOT NULL,
	[cardId] [nvarchar](50) NOT NULL,
	[cardType] [nvarchar](50) NOT NULL,
	[expirationDate] [date] NOT NULL,
 CONSTRAINT [PK_Customer_1] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 08/07/2024 23:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[orderId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[quantity] [int] NULL,
	[unitPrice] [money] NULL,
 CONSTRAINT [PK_Item_1] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC,
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 08/07/2024 23:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[userId] [int] NOT NULL,
	[orderId] [int] NOT NULL identity(1,1),
	[creationDate] [date] NOT NULL,
	[paymentDate] [date] NOT NULL,
	[totalAmount] [money] NOT NULL,
 CONSTRAINT [PK_Order_1] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentGateway]    Script Date: 08/07/2024 23:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentGateway](
	[paymentId] [int] NOT NULL,
	[paymentMethod] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentGateway] PRIMARY KEY CLUSTERED 
(
	[paymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaymentOrder]    Script Date: 08/07/2024 23:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentOrder](
	[orderId] [int] NOT NULL,
	[paymentStatus] [nvarchar](50) NOT NULL,
	[paymentDate] [date] NOT NULL,
	[totalAmount] [money] NOT NULL,
	[paymentId] [int] NOT NULL,
 CONSTRAINT [PK_PaymentOrder] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Postman]    Script Date: 08/07/2024 23:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Postman](
	[userId] [int] NOT NULL,
 CONSTRAINT [PK_Postman_1] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 08/07/2024 23:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productId] [int] NOT NULL identity(1,1),
	[userId] [int] NOT NULL,
	[categoryId] [int] NOT NULL,
	[unitPrice] [money] NULL,
	[productDescription] [nvarchar](255) NULL,
	[image] [nvarchar](max) NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT INTO [dbo].[Product] ([productId], [userId], [categoryId], [unitPrice], [productDescription], [image], [quantity])
VALUES
-- Products for Skincare (categoryId = 1)
(1, 3, 1, 10.00, 'Makeup remover comes from nature', 'https://png.pngtree.com/png-clipart/20190920/original/pngtree-beauty-makeup-remover-water-illustration-png-image_4658443.jpg', 100),
(2, 3, 1, 12.00, 'Facial cleanser for women', 'https://img.lovepik.com/original_origin_pic/19/01/12/7864d35e0e672845023a4821e0055c06.png_wh860.png', 120),
(3, 3, 1, 15.00, 'Facial cleanser for men', 'https://img.lovepik.com/free-png/20211118/lovepik-elements-of-hand-painted-cartoon-facial-cleanser-png-image_400997740_wh1200.png', 80),
(4, 3, 1, 20.00, 'Body lotion', 'https://png.pngtree.com/png-vector/20240322/ourlarge/pngtree-body-cream-set-cartoon-png-image_12184597.png', 90),
(5, 3, 1, 25.00, 'Tone-enhancing sunscreen', 'https://png.pngtree.com/png-vector/20190116/ourlarge/pngtree-yellow-sunscreen-vacation-sunscreen-hand-painted-sunscreen-cartoon-sunscreen-png-image_407950.jpg', 110),

-- Products for Makeup (categoryId = 2)
(6, 3, 2, 8.00, 'Reddish brown lipstick', 'https://png.pngtree.com/png-clipart/20190116/ourlarge/pngtree-cartoon-lipstick-hand-painted-makeups-exquisite-lipstick-png-image_387189.jpg', 150),
(7, 3, 2, 9.00, 'Multi-colored eyeshadow', 'https://png.pngtree.com/png-clipart/20190904/original/pngtree-cartoon-square-eye-shadow-box-illustration-png-image_4506581.jpg', 130),
(8, 3, 2, 10.00, 'Black eyeliner', 'https://img.lovepik.com/free-png/20220126/lovepik-eyeliner-png-image_401764370_wh860.png', 140),
(9, 3, 2, 11.00, 'blusher with mirror', 'https://png.pngtree.com/png-clipart/20190921/original/pngtree-female-blush-cartoon-illustration-png-image_4730167.jpg', 120),
(10, 3, 2, 12.00, 'Makeup remover cotton', 'https://mochanstore.com/wp-content/uploads/2023/03/mochanstore.com-BONG-TAY-TRANG-200-MIENG-BEYAKI.jpg', 110),

-- Products for Haircare (categoryId = 3)
(11, 3, 3, 15.00, 'Water-based hair wax', 'https://gomsapvuottoc.com/wp-content/uploads/2016/11/sap-vuot-toc-kanfa-hair-to-90-3.jpg', 100),
(12, 3, 3, 16.00, 'Clay-based hair wax', 'https://product.hstatic.net/1000246396/product/upload_c0e78f26a2ba40b29d656ed65304f870_master.jpg', 90),
(13, 3, 3, 17.00, 'Styling comb set', 'https://sapvuottocnam.com/wp-content/uploads/2020/11/bo-luoc-blue-zoo.jpg', 80),
(14, 3, 3, 18.00, 'Hair tonic', 'https://www.shutterstock.com/shutterstock/photos/383915713/display_1500/stock-vector-vector-cartoon-hair-tonic-hair-growth-shampoo-flat-style-icon-template-383915713.jpg', 110),
(15, 3, 3, 19.00, 'Natural shampoo', 'https://banner2.cleanpng.com/20180228/vkq/kisspng-cartoon-shampoo-illustration-vector-cartoon-shampoo-5a971463bad389.6587752715198505957653.jpg', 120);

/****** Object:  Table [dbo].[Seller]    Script Date: 08/07/2024 23:21:51 ******/
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
INSERT INTO [dbo].[Seller] ([userId])
VALUES
(3);
/****** Object:  Table [dbo].[ShippingOrder]    Script Date: 08/07/2024 23:21:51 ******/
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
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 08/07/2024 23:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[userId] [int] NOT NULL identity(1,1),
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[phoneNumber] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User_1] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT INTO [dbo].[User] ([userId], [username], [password], [fullname], [phoneNumber], [email], [address])
VALUES
/*(1, 'user1', 'password1', ' test1', '1234567890', 'user1@example.com', 'Address 1'),
(2, 'user2', 'password2', 'test2', '0987654321', 'user2@example.com', 'Address 2'),*/
(3, 'user3', 'password3', 'test3', '0987654320', 'user3@example.com', 'Address 3');
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
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Product] FOREIGN KEY([quantity])
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
