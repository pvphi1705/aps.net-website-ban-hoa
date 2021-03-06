USE [master]
GO
/****** Object:  Database [FlowerShop]    Script Date: 1/6/2022 12:59:08 AM ******/
CREATE DATABASE [FlowerShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FlowerShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FlowerShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FlowerShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FlowerShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FlowerShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FlowerShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FlowerShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FlowerShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FlowerShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FlowerShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FlowerShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [FlowerShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FlowerShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FlowerShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FlowerShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FlowerShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FlowerShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FlowerShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FlowerShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FlowerShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FlowerShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FlowerShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FlowerShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FlowerShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FlowerShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FlowerShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FlowerShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FlowerShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FlowerShop] SET RECOVERY FULL 
GO
ALTER DATABASE [FlowerShop] SET  MULTI_USER 
GO
ALTER DATABASE [FlowerShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FlowerShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FlowerShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FlowerShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FlowerShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FlowerShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FlowerShop', N'ON'
GO
ALTER DATABASE [FlowerShop] SET QUERY_STORE = OFF
GO
USE [FlowerShop]
GO
/****** Object:  Table [dbo].[ChiTietGioHang]    Script Date: 1/6/2022 12:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietGioHang](
	[MaGioHang] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuongMua] [int] NOT NULL,
	[Gia] [decimal](18, 0) NOT NULL,
 CONSTRAINT [pk] PRIMARY KEY CLUSTERED 
(
	[MaGioHang] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 1/6/2022 12:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDM] [int] IDENTITY(1,1) NOT NULL,
	[TenDM] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 1/6/2022 12:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[MaGioHang] [int] IDENTITY(1,1) NOT NULL,
	[TenTaiKhoan] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaGioHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 1/6/2022 12:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [datetime] NOT NULL,
	[TinhTrang] [nvarchar](100) NOT NULL,
	[PhiShip] [money] NOT NULL,
	[GhiChu] [ntext] NULL,
	[DcNhanHang] [ntext] NULL,
	[MaGioHang] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 1/6/2022 12:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[MaDM] [int] NOT NULL,
	[TenSP] [nvarchar](100) NOT NULL,
	[HoaChinh] [nvarchar](100) NOT NULL,
	[HoaPhu] [nvarchar](100) NOT NULL,
	[ChieuNgang] [int] NOT NULL,
	[ChieuCao] [int] NOT NULL,
	[TrongLuong] [float] NULL,
	[SoLuongTon] [int] NULL,
	[Gia] [decimal](18, 0) NOT NULL,
	[GiaKM] [decimal](18, 0) NULL,
	[MoTa] [ntext] NULL,
	[Anh] [ntext] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 1/6/2022 12:59:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[TenTaiKhoan] [varchar](100) NOT NULL,
	[MatKhau] [varchar](100) NOT NULL,
	[Quyen] [int] NOT NULL,
	[TinhTrang] [bit] NOT NULL,
	[TenKhachHang] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[SoDienThoai] [varchar](12) NULL,
	[DiaChi] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[TenTaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[ChiTietGioHang] ([MaGioHang], [MaSP], [SoLuongMua], [Gia]) VALUES (1, 2, 5, CAST(70000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietGioHang] ([MaGioHang], [MaSP], [SoLuongMua], [Gia]) VALUES (1, 3, 2, CAST(70000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietGioHang] ([MaGioHang], [MaSP], [SoLuongMua], [Gia]) VALUES (1, 4, 6, CAST(80000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietGioHang] ([MaGioHang], [MaSP], [SoLuongMua], [Gia]) VALUES (5, 9, 7, CAST(250000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietGioHang] ([MaGioHang], [MaSP], [SoLuongMua], [Gia]) VALUES (5, 10, 3, CAST(170000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietGioHang] ([MaGioHang], [MaSP], [SoLuongMua], [Gia]) VALUES (6, 7, 2, CAST(80000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietGioHang] ([MaGioHang], [MaSP], [SoLuongMua], [Gia]) VALUES (6, 8, 3, CAST(70000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietGioHang] ([MaGioHang], [MaSP], [SoLuongMua], [Gia]) VALUES (7, 2, 3, CAST(380000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietGioHang] ([MaGioHang], [MaSP], [SoLuongMua], [Gia]) VALUES (7, 6, 2, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietGioHang] ([MaGioHang], [MaSP], [SoLuongMua], [Gia]) VALUES (7, 9, 5, CAST(280000 AS Decimal(18, 0)))
GO
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (1, N'Hoa cao cấp')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (2, N'Hoa kỉ niệm')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (3, N'Hoa khai trương')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (4, N'Hoa sinh nhật')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (5, N'Hoa tình yêu')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (6, N'Hoa cưới')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (7, N'Lẵng hoa')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (8, N'Hoa sự kiện')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (9, N'Hoa bó')
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM]) VALUES (10, N'Hoa ngày lễ')
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
GO
SET IDENTITY_INSERT [dbo].[GioHang] ON 

INSERT [dbo].[GioHang] ([MaGioHang], [TenTaiKhoan]) VALUES (1, N'phongnd')
INSERT [dbo].[GioHang] ([MaGioHang], [TenTaiKhoan]) VALUES (2, N'hopnt')
INSERT [dbo].[GioHang] ([MaGioHang], [TenTaiKhoan]) VALUES (3, N'phipv')
INSERT [dbo].[GioHang] ([MaGioHang], [TenTaiKhoan]) VALUES (4, N'anhntn')
INSERT [dbo].[GioHang] ([MaGioHang], [TenTaiKhoan]) VALUES (5, N'lamvv')
INSERT [dbo].[GioHang] ([MaGioHang], [TenTaiKhoan]) VALUES (6, N'hienlt')
INSERT [dbo].[GioHang] ([MaGioHang], [TenTaiKhoan]) VALUES (7, N'dunght')
INSERT [dbo].[GioHang] ([MaGioHang], [TenTaiKhoan]) VALUES (8, N'namnn')
INSERT [dbo].[GioHang] ([MaGioHang], [TenTaiKhoan]) VALUES (9, N'hoanghv')
INSERT [dbo].[GioHang] ([MaGioHang], [TenTaiKhoan]) VALUES (10, N'binhvv')
SET IDENTITY_INSERT [dbo].[GioHang] OFF
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayDat], [TinhTrang], [PhiShip], [GhiChu], [DcNhanHang], [MaGioHang]) VALUES (1, CAST(N'2021-08-08T15:37:03.417' AS DateTime), N'Đang giao', 15000.0000, N'', N'296/3 Cầu Diễn-MinhKhai-Hà nội', 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayDat], [TinhTrang], [PhiShip], [GhiChu], [DcNhanHang], [MaGioHang]) VALUES (2, CAST(N'2021-08-08T15:37:03.417' AS DateTime), N'Chờ xác nhận', 15000.0000, N'', N'8 Hồ Tùng Mậu-Cầu Giấy-Hà Nội', 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayDat], [TinhTrang], [PhiShip], [GhiChu], [DcNhanHang], [MaGioHang]) VALUES (3, CAST(N'2021-08-08T15:37:03.417' AS DateTime), N'Chờ xác nhận', 15000.0000, N'', N'20 Hồ Tùng Mậu-Cầu Giấy-Hà Nội', 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayDat], [TinhTrang], [PhiShip], [GhiChu], [DcNhanHang], [MaGioHang]) VALUES (4, CAST(N'2021-08-08T15:37:03.417' AS DateTime), N'Đang giao', 15000.0000, N'', N'Ba Đình-Hà Nội', 1)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayDat], [TinhTrang], [PhiShip], [GhiChu], [DcNhanHang], [MaGioHang]) VALUES (5, CAST(N'2021-08-08T15:37:03.417' AS DateTime), N'Đang giao', 15000.0000, N'', N'Trực Ninh - Nam Định', 2)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayDat], [TinhTrang], [PhiShip], [GhiChu], [DcNhanHang], [MaGioHang]) VALUES (6, CAST(N'2021-08-08T15:37:03.417' AS DateTime), N'Chờ xác nhận', 15000.0000, N'', N'Trực Ninh - Nam Định', 2)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayDat], [TinhTrang], [PhiShip], [GhiChu], [DcNhanHang], [MaGioHang]) VALUES (7, CAST(N'2021-08-08T15:37:03.417' AS DateTime), N'Đang giao', 15000.0000, N'', N'Lê văn Luong-Thanh Xuân', 2)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayDat], [TinhTrang], [PhiShip], [GhiChu], [DcNhanHang], [MaGioHang]) VALUES (8, CAST(N'2021-08-08T15:37:03.417' AS DateTime), N'Chờ xác nhận', 15000.0000, N'', N'Trực Ninh - Nam Định', 6)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayDat], [TinhTrang], [PhiShip], [GhiChu], [DcNhanHang], [MaGioHang]) VALUES (9, CAST(N'2021-08-08T15:37:03.417' AS DateTime), N'Đã hủy', 15000.0000, N'', N'Ý Yên - Nam Định', 6)
INSERT [dbo].[HoaDon] ([MaHoaDon], [NgayDat], [TinhTrang], [PhiShip], [GhiChu], [DcNhanHang], [MaGioHang]) VALUES (10, CAST(N'2021-08-08T15:39:41.000' AS DateTime), N'Đã hủy', 15000.0000, NULL, N'Đại học Công Nghiệp Hà Nội', 7)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (1, 1, N'Ấm áp', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'11.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (2, 1, N'Nhịp điệu yêu thương', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'12.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (3, 1, N'Red roses', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'13.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (4, 1, N'Yêu vô bờ bến', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'14.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (5, 1, N'Dịu dàng', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'15.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (6, 1, N'Tình yêu mãi xanh', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'16.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (7, 1, N'Big love', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'17.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (8, 1, N'Tươi trẻ', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'18.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (9, 1, N'Khát khao', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'19.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (10, 1, N'Love you', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'110.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (11, 1, N'For you', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'111.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (12, 1, N'Sắc đỏ', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'112.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (13, 1, N'Nắng vàng', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'113.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (14, 1, N'Lời tự tình', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'114.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (15, 1, N'Tình ca', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'115.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (16, 2, N'Sum họp', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'21.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (17, 2, N'Ngày em đến', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'22.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (18, 2, N'Nhớ nhung', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'23.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (19, 2, N'Định mệnh', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'24.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (20, 2, N'Ngày em đến', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'25.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (21, 2, N'Thời gian', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'26.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (22, 2, N'Vòng tay', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'27.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (23, 2, N'Tình yêu hát mãi', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'28.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (24, 2, N'An nhiên', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'29.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (25, 2, N'An bình', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'210.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (26, 2, N'Kính trọng', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'211.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (27, 2, N'Giọt nắng', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'212.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (28, 2, N'Giọt mưa', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'213.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (29, 2, N'Bất tận ', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'214.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (30, 2, N'Gửi gắm', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'215.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (31, 3, N'Hưng thịnh', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'31.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (32, 3, N'Thịnh vượng', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'32.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (33, 3, N'Lộc phát', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'33.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (34, 3, N'Tài lộc', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'34.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (35, 3, N'Thần tài', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'35.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (36, 3, N'Vươn cao', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'36.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (37, 3, N'Quyết thắng', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'37.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (38, 4, N'Sâu lắngNồng cháy', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'41.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (39, 4, N'Nồng cháy', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'42.jpg')
INSERT [dbo].[SanPham] ([MaSP], [MaDM], [TenSP], [HoaChinh], [HoaPhu], [ChieuNgang], [ChieuCao], [TrongLuong], [SoLuongTon], [Gia], [GiaKM], [MoTa], [Anh]) VALUES (40, 4, N'Hương xuân', N'Hoa hồng Red Naomi', N'Hoa hướng dương, hoa cúc ping pong, hoa thiên điểu', 50, 70, NULL, NULL, CAST(1000000 AS Decimal(18, 0)), CAST(800000 AS Decimal(18, 0)), N'Sự kết hợp giữa màu đỏ của hoa hồng và màu vàng của hướng dương lẫn hoa cúc giúp giỏ hoa đầy sức sống và khát vọng. Giữa cuộc sống với nhiều điều thú vị, chúng ta luôn khát khao tìm kiếm những cơ hội cho riêng mình. Vậy còn gì bằng cho sự hiện diện của chậu hoa này tới các dịp khai trương, kỷ niệm thành lập... giúp cho những người mà bạn yêu thương vươn tới những khát khao của họ và gặt hái được thành công.', N'43.jpg')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [Quyen], [TinhTrang], [TenKhachHang], [Email], [SoDienThoai], [DiaChi]) VALUES (N'anhntn', N'12345', 2, 1, N'Nguyễn Thị Ngọc Anh', N'anhntn@gmail.com', N'0378951234', N'Ba Vì-Hà Nội')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [Quyen], [TinhTrang], [TenKhachHang], [Email], [SoDienThoai], [DiaChi]) VALUES (N'binhvv', N'12345', 0, 0, N'Vũ Văn Bình', N'binhvv231@gnamil.com', N'0992316236', N'Mê Linh - Hà Nội')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [Quyen], [TinhTrang], [TenKhachHang], [Email], [SoDienThoai], [DiaChi]) VALUES (N'dunght', N'dung123', 0, 1, N'Hoàng Trọng Dũng', N'dunght2k4@gmail.com', N'0955213512', N'Mê Linh - Hà Nội')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [Quyen], [TinhTrang], [TenKhachHang], [Email], [SoDienThoai], [DiaChi]) VALUES (N'hienlt', N'admin', 1, 0, N'Lê Thu Hiền', N'hienlt@gmail.com', N'0378951234', N'Hà Nội')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [Quyen], [TinhTrang], [TenKhachHang], [Email], [SoDienThoai], [DiaChi]) VALUES (N'hoanghv', N'12345', 0, 0, N'Hồ Văn Hoàng', N'hoanghv18@gnamil.com', N'0992316236', N'Mê Linh - Hà Nội')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [Quyen], [TinhTrang], [TenKhachHang], [Email], [SoDienThoai], [DiaChi]) VALUES (N'hopnt', N'12345', 0, 1, N'hopnt3456', N'hopnt@gmail.com', N'0983419342', N'Từ Sơn-Bắc Ninh')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [Quyen], [TinhTrang], [TenKhachHang], [Email], [SoDienThoai], [DiaChi]) VALUES (N'lamvv', N'doan12345', 0, 1, N'Vũ Văn Lâm', N'lamvv@gmail.com', N'0987328540', N'Trực Ninh-Nam Định')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [Quyen], [TinhTrang], [TenKhachHang], [Email], [SoDienThoai], [DiaChi]) VALUES (N'namnn', N'12345', 0, 0, N'Nguyễn Ngọc Nam', N'namnguyen2k@gnamil.com', N'0992316236', N'Mê Linh - Hà Nội')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [Quyen], [TinhTrang], [TenKhachHang], [Email], [SoDienThoai], [DiaChi]) VALUES (N'phipv', N'12345', 0, 1, N'phibd123', N'phipv@gmail.com', N'09999123421', N'Hải Hậu-Nam Định')
INSERT [dbo].[TaiKhoan] ([TenTaiKhoan], [MatKhau], [Quyen], [TinhTrang], [TenKhachHang], [Email], [SoDienThoai], [DiaChi]) VALUES (N'phongnd', N'12345', 1, 1, N'phongnd2k1', N'phongnd@gmail.com', N'0378951234', N'Ý Yên-Nam Định')
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD FOREIGN KEY([MaGioHang])
REFERENCES [dbo].[GioHang] ([MaGioHang])
GO
ALTER TABLE [dbo].[ChiTietGioHang]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD FOREIGN KEY([TenTaiKhoan])
REFERENCES [dbo].[TaiKhoan] ([TenTaiKhoan])
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD FOREIGN KEY([MaGioHang])
REFERENCES [dbo].[GioHang] ([MaGioHang])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaDM])
REFERENCES [dbo].[DanhMuc] ([MaDM])
GO
USE [master]
GO
ALTER DATABASE [FlowerShop] SET  READ_WRITE 
GO
