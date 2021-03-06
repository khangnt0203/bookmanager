USE [master]
GO
/****** Object:  Database [BookManagement]    Script Date: 06/02/2021 1:09:07 SA ******/
CREATE DATABASE [BookManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SE140281\MSSQL\DATA\BookManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SE140281\MSSQL\DATA\BookManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BookManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BookManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [BookManagement] SET  MULTI_USER 
GO
ALTER DATABASE [BookManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookManagement', N'ON'
GO
ALTER DATABASE [BookManagement] SET QUERY_STORE = OFF
GO
USE [BookManagement]
GO
/****** Object:  Table [dbo].[tblBooks]    Script Date: 06/02/2021 1:09:07 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBooks](
	[bookID] [nvarchar](50) NOT NULL,
	[bookName] [nvarchar](50) NULL,
	[image] [nvarchar](50) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tblBooks] PRIMARY KEY CLUSTERED 
(
	[bookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 06/02/2021 1:09:07 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderDetailID] [nvarchar](50) NOT NULL,
	[orderID] [nvarchar](50) NULL,
	[bookID] [nvarchar](50) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_tblOrderDetails] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 06/02/2021 1:09:07 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[total] [float] NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 06/02/2021 1:09:07 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[role] [nvarchar](50) NOT NULL,
	[roleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 06/02/2021 1:09:07 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[role] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblBooks] ([bookID], [bookName], [image], [price], [quantity]) VALUES (N'cb', N'How to learn C', N'c.jpg', 124, 6)
INSERT [dbo].[tblBooks] ([bookID], [bookName], [image], [price], [quantity]) VALUES (N'jv', N'Java 3.2', N'java.jpg', 5.8000001907348633, 7)
INSERT [dbo].[tblBooks] ([bookID], [bookName], [image], [price], [quantity]) VALUES (N'sql', N'SQL', N'sql.png', 10.5, 2)
GO
INSERT [dbo].[tblOrders] ([orderID], [name], [total], [date]) VALUES (N'OD-bac-1', N'bac', 17.299999237060547, CAST(N'2020-12-21T17:34:17.027' AS DateTime))
INSERT [dbo].[tblOrders] ([orderID], [name], [total], [date]) VALUES (N'OD-bac-2', N'bac', 124, CAST(N'2020-12-21T17:42:47.880' AS DateTime))
INSERT [dbo].[tblOrders] ([orderID], [name], [total], [date]) VALUES (N'OD-bac-3', N'bac', 5.8000001907348633, CAST(N'2020-12-21T17:44:33.623' AS DateTime))
INSERT [dbo].[tblOrders] ([orderID], [name], [total], [date]) VALUES (N'OD-bac-4', N'bac', 5.8000001907348633, CAST(N'2020-12-21T20:52:30.597' AS DateTime))
GO
INSERT [dbo].[tblRoles] ([role], [roleName]) VALUES (N'AD', N'admin')
INSERT [dbo].[tblRoles] ([role], [roleName]) VALUES (N'US', N'user')
GO
INSERT [dbo].[tblUsers] ([userID], [password], [name], [phone], [address], [email], [role]) VALUES (N'admin', N'1', N'Admin', N'01652738462', N'Binh Thanh', N'admin@gmail.com', N'AD')
INSERT [dbo].[tblUsers] ([userID], [password], [name], [phone], [address], [email], [role]) VALUES (N'bac', N'1', N'Bắc', N'0273681827', N'Quan 9', N'bac@yahoo.com', N'US')
INSERT [dbo].[tblUsers] ([userID], [password], [name], [phone], [address], [email], [role]) VALUES (N'khang', N'1', N'Khang', N'0814819032', N'Binh Thanh', N'khang@gmail.com', N'AD')
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblBooks] FOREIGN KEY([bookID])
REFERENCES [dbo].[tblBooks] ([bookID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblBooks]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblOrders] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK_tblOrderDetails_tblOrders]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([name])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([role])
REFERENCES [dbo].[tblRoles] ([role])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
USE [master]
GO
ALTER DATABASE [BookManagement] SET  READ_WRITE 
GO
