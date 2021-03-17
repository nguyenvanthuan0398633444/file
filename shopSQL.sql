USE [master]
GO
/****** Object:  Database [Shop]    Script Date: 3/17/2021 4:17:48 PM ******/
CREATE DATABASE [Shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shop_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Shop_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Shop.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Shop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shop] SET RECOVERY FULL 
GO
ALTER DATABASE [Shop] SET  MULTI_USER 
GO
ALTER DATABASE [Shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shop] SET QUERY_STORE = OFF
GO
USE [Shop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/17/2021 4:17:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[PhotoPath] [nvarchar](50) NULL,
	[IDAccountType] [int] NULL,
 CONSTRAINT [PK_Account_1] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account type]    Script Date: 3/17/2021 4:17:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account type](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account_Power]    Script Date: 3/17/2021 4:17:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account_Power](
	[IDAccountType] [int] NOT NULL,
	[IDPower] [nvarchar](50) NOT NULL,
	[Note] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account_Power] PRIMARY KEY CLUSTERED 
(
	[IDAccountType] ASC,
	[IDPower] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/17/2021 4:17:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/17/2021 4:17:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 3/17/2021 4:17:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeName] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[Address] [nvarchar](max) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Power]    Script Date: 3/17/2021 4:17:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Power](
	[PowerID] [nvarchar](50) NOT NULL,
	[PowerName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Power] PRIMARY KEY CLUSTERED 
(
	[PowerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 3/17/2021 4:17:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[Descriptions] [nvarchar](max) NULL,
	[PhotoPath] [nvarchar](50) NULL,
	[DateAdded] [date] NULL,
	[PurchasePrice] [decimal](18, 4) NULL,
	[Price] [decimal](18, 4) NULL,
	[Amount] [int] NULL,
	[Sold] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 3/17/2021 4:17:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](50) NULL,
	[Address] [nchar](10) NULL,
	[Phone] [nchar](10) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountID], [Email], [Password], [Name], [PhotoPath], [IDAccountType]) VALUES (1, N'thuan@gmail.com', N'12345', N'Nguyễn Văn Thuận', N'ao5.jpg', 1)
INSERT [dbo].[Account] ([AccountID], [Email], [Password], [Name], [PhotoPath], [IDAccountType]) VALUES (2, N'thuan1@gmail.com', N'12345', N'Nguyễn Văn Thuận', N'ao7.jpg', 2)
INSERT [dbo].[Account] ([AccountID], [Email], [Password], [Name], [PhotoPath], [IDAccountType]) VALUES (3, N'thuan2@gmail.com', N'12345', N'Nguyễn Văn Thuận', N'ao5.jpg', 3)
INSERT [dbo].[Account] ([AccountID], [Email], [Password], [Name], [PhotoPath], [IDAccountType]) VALUES (4, N'thuan22', N'12345', N'Nguyễn Văn Thuận', N'ao1.jpg', NULL)
INSERT [dbo].[Account] ([AccountID], [Email], [Password], [Name], [PhotoPath], [IDAccountType]) VALUES (5, N'thuan23', N'12345', N'Nguyễn Văn Thuận', N'ao2.jpg', NULL)
INSERT [dbo].[Account] ([AccountID], [Email], [Password], [Name], [PhotoPath], [IDAccountType]) VALUES (6, N'thuan24', N'12345', N'Nguyễn Văn Thuận', N'ao5.jpg', NULL)
INSERT [dbo].[Account] ([AccountID], [Email], [Password], [Name], [PhotoPath], [IDAccountType]) VALUES (7, N'thuan3', N'12345', N'Nguyễn Văn Thuận', N'ao1.jpg', NULL)
INSERT [dbo].[Account] ([AccountID], [Email], [Password], [Name], [PhotoPath], [IDAccountType]) VALUES (8, N'thuan35434@gmail.com', N'12345', N'Nguyễn Văn Thuận', N'ao9.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
INSERT [dbo].[Account type] ([ID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Account type] ([ID], [Name]) VALUES (2, N'Menber')
INSERT [dbo].[Account type] ([ID], [Name]) VALUES (3, N'mod')
INSERT [dbo].[Account_Power] ([IDAccountType], [IDPower], [Note]) VALUES (1, N'Account', NULL)
INSERT [dbo].[Account_Power] ([IDAccountType], [IDPower], [Note]) VALUES (1, N'Category', NULL)
INSERT [dbo].[Account_Power] ([IDAccountType], [IDPower], [Note]) VALUES (1, N'Customer', NULL)
INSERT [dbo].[Account_Power] ([IDAccountType], [IDPower], [Note]) VALUES (1, N'DangNhap', NULL)
INSERT [dbo].[Account_Power] ([IDAccountType], [IDPower], [Note]) VALUES (1, N'Employee', NULL)
INSERT [dbo].[Account_Power] ([IDAccountType], [IDPower], [Note]) VALUES (1, N'Product', NULL)
INSERT [dbo].[Account_Power] ([IDAccountType], [IDPower], [Note]) VALUES (1, N'Supplier', NULL)
INSERT [dbo].[Account_Power] ([IDAccountType], [IDPower], [Note]) VALUES (2, N'Category', NULL)
INSERT [dbo].[Account_Power] ([IDAccountType], [IDPower], [Note]) VALUES (2, N'Customer', NULL)
INSERT [dbo].[Account_Power] ([IDAccountType], [IDPower], [Note]) VALUES (2, N'DangNhap', NULL)
INSERT [dbo].[Account_Power] ([IDAccountType], [IDPower], [Note]) VALUES (2, N'Employee', NULL)
INSERT [dbo].[Account_Power] ([IDAccountType], [IDPower], [Note]) VALUES (2, N'Product', NULL)
INSERT [dbo].[Account_Power] ([IDAccountType], [IDPower], [Note]) VALUES (2, N'Supplier', NULL)
INSERT [dbo].[Account_Power] ([IDAccountType], [IDPower], [Note]) VALUES (3, N'Customer', NULL)
INSERT [dbo].[Account_Power] ([IDAccountType], [IDPower], [Note]) VALUES (3, N'DangNhap', NULL)
INSERT [dbo].[Account_Power] ([IDAccountType], [IDPower], [Note]) VALUES (3, N'Product', NULL)
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description]) VALUES (1, N'áo sơ mi', N'đồ văn phòng')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description]) VALUES (2, N'quần tây', N'nhiều kích cỡ đa dạng')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description]) VALUES (3, N'quần rin', N'hàng nhập khẩu châu âu')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description]) VALUES (4, N'áo quần công sở', N'ok')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description]) VALUES (6, N'thanh long', N'tốt')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description]) VALUES (7, N'áo thun', N'hàng xuất khẩu')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description]) VALUES (8, N'áo sơ mi ', N'hàng trung quốc')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description]) VALUES (9, N'áo len', N'hàng quảng châu')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [Description]) VALUES (1004, N'long ', N'hue')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Address], [Phone], [Email], [Password]) VALUES (1011, N'Cao thị thùy linh', N'quảng trị', N'123443', N'thuangmail.com', N'12345')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Address], [Phone], [Email], [Password]) VALUES (1012, N'Cao thị thùy linh 12', N'quảng trị', N'123443', N'thuan@gmail.com', N'12345')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Address], [Phone], [Email], [Password]) VALUES (1013, N'Cao thị thùy linh 1', N'huong vinh', N'123443', N'thuan@', N'12345')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Address], [Phone], [Email], [Password]) VALUES (1019, N'Cao thị thùy linh', NULL, NULL, N'thuan@gmail.com', N'1234')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Address], [Phone], [Email], [Password]) VALUES (1020, N'Cao tiến thành', NULL, NULL, N'thanh@gmail.com', N'123456')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Address], [Phone], [Email], [Password]) VALUES (1021, N'Cao thị thùy linh', NULL, NULL, N'thuan@gmail.com', N'234')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Address], [Phone], [Email], [Password]) VALUES (1023, N'Cao thị thùy linh', NULL, NULL, N'thuan@gmail.com', N'12')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Address], [Phone], [Email], [Password]) VALUES (1024, N'nguyễn văn Thuận', NULL, NULL, N'thuan@gmail.com', N'123')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Address], [Phone], [Email], [Password]) VALUES (2024, N'nguyễn đức nhật tùng', NULL, NULL, N'tung@gmail.com', N'12345')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Address], [Phone], [Email], [Password]) VALUES (2025, N'nguyễn văn Thuận', NULL, NULL, N'nvthuan@gmail.com', N'123454')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [BirthDate], [Address], [Email], [Password], [phone]) VALUES (4, N'nhật', CAST(N'1997-10-20' AS Date), N'2021-01-5', N'nhat@gmail.com', N'123', N'23454667')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [BirthDate], [Address], [Email], [Password], [phone]) VALUES (5, N'anh', CAST(N'1999-03-25' AS Date), N'2021-02-28', N'anh@gmail.com', N'123', N'2341243')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [BirthDate], [Address], [Email], [Password], [phone]) VALUES (6, N'thuan', NULL, N'34214', N'thuan@', N'123', N'234123')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [BirthDate], [Address], [Email], [Password], [phone]) VALUES (7, N'thuận', CAST(N'1999-01-22' AS Date), N'2020-01-23', N'thuan@gmail.com', N'123', N'2343243')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [BirthDate], [Address], [Email], [Password], [phone]) VALUES (9, N'anh', CAST(N'1999-03-25' AS Date), N'2021-02-28', N'anh@gmail.com', N'123', N'2343324')
INSERT [dbo].[Employee] ([EmployeeID], [EmployeeName], [BirthDate], [Address], [Email], [Password], [phone]) VALUES (10, N'anh tùng', NULL, N'hue', N'thuan2', N'12343', N'23414')
SET IDENTITY_INSERT [dbo].[Employee] OFF
INSERT [dbo].[Power] ([PowerID], [PowerName]) VALUES (N'Account', N'QL Tài Khoản')
INSERT [dbo].[Power] ([PowerID], [PowerName]) VALUES (N'Category', N'QL loại ')
INSERT [dbo].[Power] ([PowerID], [PowerName]) VALUES (N'Customer', N'QL Khách Hàng')
INSERT [dbo].[Power] ([PowerID], [PowerName]) VALUES (N'DangNhap', N'Đăng Nhập')
INSERT [dbo].[Power] ([PowerID], [PowerName]) VALUES (N'Employee', N'QL Nhân Viên')
INSERT [dbo].[Power] ([PowerID], [PowerName]) VALUES (N'Product', N'QL sản phẩm')
INSERT [dbo].[Power] ([PowerID], [PowerName]) VALUES (N'Supplier', N'QL Nhà Cung Cấp')
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Descriptions], [PhotoPath], [DateAdded], [PurchasePrice], [Price], [Amount], [Sold]) VALUES (20, N'thanh', 2, 9, N'  ĐẦM MAXI CỔ YẾM DÁNG MULLET IZABEL LONDON', N'ao-ren-trang-tay-ngan-lovadova.jpg', CAST(N'2020-12-10' AS Date), CAST(50000.0000 AS Decimal(18, 4)), CAST(600000.0000 AS Decimal(18, 4)), 30, 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Descriptions], [PhotoPath], [DateAdded], [PurchasePrice], [Price], [Amount], [Sold]) VALUES (25, N'ĐẦM MAXI MX03007 IVINCI MÀU XANH ĐEN', 2, 9, N'ĐẦM MAXI MX03007 IVINCI MÀU XANH ĐEN', N'dam-maxi-mx03007-ivinci-mau-xanh-den.jpg', CAST(N'2020-12-10' AS Date), CAST(50000.0000 AS Decimal(18, 4)), CAST(600000.0000 AS Decimal(18, 4)), 2131, 123)
INSERT [dbo].[Product] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Descriptions], [PhotoPath], [DateAdded], [PurchasePrice], [Price], [Amount], [Sold]) VALUES (1005, N'  ÁO REN TRẮNG TAY NGẮN LOVADOVA', 2, 9, N'  ÁO REN TRẮNG TAY NGẮN LOVADOVA', N'ao-ren-trang-tay-ngan-lovadova.jpg', CAST(N'2020-12-10' AS Date), CAST(50000.0000 AS Decimal(18, 4)), CAST(600000.0000 AS Decimal(18, 4)), 112, 21)
INSERT [dbo].[Product] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Descriptions], [PhotoPath], [DateAdded], [PurchasePrice], [Price], [Amount], [Sold]) VALUES (1006, N'ÁO KIỂU OWL & CAT TAY RỘNG MÀU ĐEN', 2, 9, N'ÁO KIỂU OWL & CAT TAY RỘNG MÀU ĐEN', N'dam-maxi-mx03007-ivinci-mau-xanh-den.jpg', CAST(N'2020-12-10' AS Date), CAST(50000.0000 AS Decimal(18, 4)), CAST(600000.0000 AS Decimal(18, 4)), 23, 2)
INSERT [dbo].[Product] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Descriptions], [PhotoPath], [DateAdded], [PurchasePrice], [Price], [Amount], [Sold]) VALUES (1008, N'  ÁO REN KEM TAY LỬNG LAI RĂNG CƯA LOVADOVA', 2, 9, N'ÁO KIỂU NỮ ORGAMIE S10 MÀU XANH COBAN  ÁO KIỂU NỮ ORGAMIE S10 MÀU XANH COBAN', N'ao-kieu-nu-orgamie-s10-mau-xanh-coban.jpg', CAST(N'2020-12-10' AS Date), CAST(50000.0000 AS Decimal(18, 4)), CAST(600000.0000 AS Decimal(18, 4)), 12, 12)
INSERT [dbo].[Product] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Descriptions], [PhotoPath], [DateAdded], [PurchasePrice], [Price], [Amount], [Sold]) VALUES (1009, N' ORGAMIE S10 MÀU XANH COBAN', 2, 9, N'ÁO KIỂU NỮ ORGAMIE S10 MÀU XANH COBAN  ÁO KIỂU NỮ ORGAMIE S10 MÀU XANH COBAN', N'p52_large.jpg', CAST(N'2020-12-10' AS Date), CAST(50000.0000 AS Decimal(18, 4)), CAST(600000.0000 AS Decimal(18, 4)), 23, 12)
INSERT [dbo].[Product] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Descriptions], [PhotoPath], [DateAdded], [PurchasePrice], [Price], [Amount], [Sold]) VALUES (1010, N'ÁO REN TRẮNG TAY NGẮN LOVADOVA', 2, 9, N'ÁO KIỂU NỮ ORGAMIE S10 MÀU XANH COBAN  ÁO KIỂU NỮ ORGAMIE S10 MÀU XANH COBAN', N'ao-somi-2_master.jpg', CAST(N'2020-12-10' AS Date), CAST(50000.0000 AS Decimal(18, 4)), CAST(600000.0000 AS Decimal(18, 4)), 231, 12)
INSERT [dbo].[Product] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Descriptions], [PhotoPath], [DateAdded], [PurchasePrice], [Price], [Amount], [Sold]) VALUES (1011, N'  ÁO KIỂU OWL & CAT XẺ VẠT SAU MÀU ĐEN', 2, 9, N'tuyệt vời', N'product15.jpg', CAST(N'2020-12-10' AS Date), CAST(50000.0000 AS Decimal(18, 4)), CAST(600000.0000 AS Decimal(18, 4)), 231, 23)
INSERT [dbo].[Product] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Descriptions], [PhotoPath], [DateAdded], [PurchasePrice], [Price], [Amount], [Sold]) VALUES (1012, N'ÁO KIỂU NỮ ORGAMIE S10 MÀU XANH COBAN', 2, 9, N'quá đẹp', N'p35_large.jpg', CAST(N'2020-12-10' AS Date), CAST(50000.0000 AS Decimal(18, 4)), CAST(600000.0000 AS Decimal(18, 4)), 123, 123)
INSERT [dbo].[Product] ([ProductID], [ProductName], [SupplierID], [CategoryID], [Descriptions], [PhotoPath], [DateAdded], [PurchasePrice], [Price], [Amount], [Sold]) VALUES (1013, N'ÁO KIỂU NT FASHION TRẮNG CARO XANH DƯƠNG', 2, 9, N'ÁO KIỂU NỮ ORGAMIE S10 MÀU XANH COBAN  ÁO KIỂU NỮ ORGAMIE S10 MÀU XANH COBAN', N'ao-belike1_master.jpg', CAST(N'2020-12-10' AS Date), CAST(50000.0000 AS Decimal(18, 4)), CAST(14556.0000 AS Decimal(18, 4)), 23, 2)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([SupplierID], [SupplierName], [Address], [Phone]) VALUES (1, N'công ty việt tiến', N'huế       ', N'12435445  ')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName], [Address], [Phone]) VALUES (2, N'công ty việt anh', N'đà nẵng   ', N'1243545   ')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName], [Address], [Phone]) VALUES (3, N'công ty việt pháp', N'huế       ', N'2435465   ')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName], [Address], [Phone]) VALUES (4, N'Nguyễn Văn Thuận', N'hue       ', N'123443    ')
INSERT [dbo].[Supplier] ([SupplierID], [SupplierName], [Address], [Phone]) VALUES (7, N'lý thanh tùng', N'quảng nam ', N'12435454  ')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Account type] FOREIGN KEY([IDAccountType])
REFERENCES [dbo].[Account type] ([ID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Account type]
GO
ALTER TABLE [dbo].[Account_Power]  WITH CHECK ADD  CONSTRAINT [FK_Account_Power_Account type1] FOREIGN KEY([IDAccountType])
REFERENCES [dbo].[Account type] ([ID])
GO
ALTER TABLE [dbo].[Account_Power] CHECK CONSTRAINT [FK_Account_Power_Account type1]
GO
ALTER TABLE [dbo].[Account_Power]  WITH CHECK ADD  CONSTRAINT [FK_Account_Power_Power1] FOREIGN KEY([IDPower])
REFERENCES [dbo].[Power] ([PowerID])
GO
ALTER TABLE [dbo].[Account_Power] CHECK CONSTRAINT [FK_Account_Power_Power1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
USE [master]
GO
ALTER DATABASE [Shop] SET  READ_WRITE 
GO
