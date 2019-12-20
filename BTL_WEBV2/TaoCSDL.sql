
USE [ShopMobi]
GO
/****** Object:  UserDefinedFunction [dbo].[LayAnh]    Script Date: 10/17/2019 8:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[LayAnh] ()
	returns @BangAnh table (Link nvarchar(255))
as
begin
	insert into @BangAnh (Link)
		select (select dbo.LayAnh_id(tbl_sanpham.id)) as Anh 
		from tbl_sanpham 

	return
end

GO
/****** Object:  UserDefinedFunction [dbo].[LayAnh_id]    Script Date: 10/17/2019 8:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create function [dbo].[LayAnh_id] (@id_sp int)
	returns nvarchar(255)
as
begin
	declare @anh nvarchar(255)
	set @anh = (select top(1) duongdan from tbl_anh where id_sp = @id_sp)

	return @anh
end


GO
/****** Object:  Table [dbo].[tbl_anh]    Script Date: 10/17/2019 8:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_anh](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[duongdan] [varchar](255) NULL,
	[id_sp] [int] NULL,
 CONSTRAINT [PK_tbl_anh] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_chitietdonhang]    Script Date: 10/17/2019 8:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_chitietdonhang](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_don] [int] NULL,
	[id_sp] [int] NOT NULL,
	[id_tk] [int] NOT NULL,
	[soluong] [int] NULL,
	[id_tinhtrang] [int] NULL,
	[thoigian] [datetime] NULL,
 CONSTRAINT [PK_tbl_chitietdonhang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_danhmuc]    Script Date: 10/17/2019 8:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_danhmuc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_dondathang]    Script Date: 10/17/2019 8:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_dondathang](
	[id] [int] NOT NULL,
	[ngaylap] [date] NULL,
	[tonggia] [decimal](18, 0) NULL,
	[diachi] [nvarchar](50) NULL,
	[sdt] [nvarchar](20) NULL,
 CONSTRAINT [PK__tbl_dond__3213E83F268A181D] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_news]    Script Date: 10/17/2019 8:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_news](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tieude] [nvarchar](250) NULL,
	[noidung] [nvarchar](max) NULL,
	[ngaydang] [datetime] NULL,
	[id_tk] [int] NULL,
	[anh] [nchar](255) NULL,
 CONSTRAINT [PK__tbl_news__3213E83F85C8D18B] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_nhasanxuat]    Script Date: 10/17/2019 8:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_nhasanxuat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_quyen]    Script Date: 10/17/2019 8:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_quyen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_sanpham]    Script Date: 10/17/2019 8:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_sanpham](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_dm] [int] NULL,
	[ten] [nvarchar](150) NULL,
	[gia] [int] NULL,
	[soluong] [int] NULL,
	[trongluong] [nchar](10) NULL,
	[ROM] [nchar](10) NULL,
	[RAM] [nchar](10) NULL,
	[thenho] [nvarchar](50) NULL,
	[camera_truoc] [nchar](10) NULL,
	[camera_sau] [nchar](10) NULL,
	[pin] [int] NULL,
	[baohanh] [nchar](50) NULL,
	[bluetooth] [int] NULL,
	[id_nsx] [int] NULL,
	[CPU] [varchar](50) NULL,
	[manhinh] [nvarchar](50) NULL,
	[tinhtrang] [int] NULL,
 CONSTRAINT [PK_tbl_sanpham] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_taikhoan]    Script Date: 10/17/2019 8:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_taikhoan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_q] [int] NULL,
	[tentaikhoan] [nvarchar](50) NULL,
	[matkhau] [varchar](30) NULL,
	[id_ttcn] [int] NULL,
	[trangthai] [bit] NULL,
 CONSTRAINT [PK__tbl_nguo__3213E83FE3021EEB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_thongtincanhan]    Script Date: 10/17/2019 8:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_thongtincanhan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](100) NULL,
	[sdt] [decimal](18, 0) NULL,
	[email] [varchar](100) NULL,
	[ngaysinh] [date] NULL,
	[gioitinh] [bit] NULL,
	[anhdaidien] [varchar](255) NULL,
	[diachi] [nvarchar](100) NULL,
 CONSTRAINT [PK__tbl_nhan__3213E83F7D0D328F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_tinhtrangdonhang]    Script Date: 10/17/2019 8:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_tinhtrangdonhang](
	[id] [int] NOT NULL,
	[ten] [nvarchar](20) NULL,
 CONSTRAINT [PK_tbl_tinhtrangdonhang] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_xulydon]    Script Date: 10/17/2019 8:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_xulydon](
	[id] [int] NOT NULL,
	[id_don] [int] NOT NULL,
	[tinhtrang] [nvarchar](30) NULL,
	[thoigian] [datetime] NULL,
 CONSTRAINT [PK_tbl_xulydon] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_anh] OFF 
GO
SET IDENTITY_INSERT [dbo].[tbl_anh] ON 
GO
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (1, N'anh1.jpg', 1)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (2, N'anh2.jpg', 1)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (3, N'anh3.jpg', 2)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (4, N'anh4.jpg', 2)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (5, N'anh5.jpg', 2)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (6, N'anh6.jpg', 2)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (7, N'anh7.jpg', 3)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (8, N'anh8.jpg', 3)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (9, N'anh9.jpg', 3)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (10, N'anh10.jpg', 3)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (11, N'anh11.jpg', 4)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (12, N'anh12.jpg', 4)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (13, N'anh13.jpg', 4)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (14, N'anh14.jpg', 4)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (15, N'anh15.jpg', 5)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (16, N'anh16.jpg', 5)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (17, N'anh17.jpg', 5)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (18, N'anh18.jpg', 5)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (19, N'anh19.jpg', 6)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (20, N'anh20.jpg', 6)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (21, N'anh21.jpg', 6)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (22, N'anh22.jpg', 6)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (23, N'anh23.jpg', 7)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (24, N'anh24.jpg', 7)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (25, N'anh25.jpg', 7)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (26, N'anh26.jpg', 7)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (27, N'anh27.jpg', 8)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (28, N'anh28.jpg', 8)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (29, N'anh29.jpg', 8)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (30, N'anh30.jpg', 8)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (31, N'anh31.jpg', 9)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (32, N'anh32.jpg', 9)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (33, N'anh33.jpg', 9)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (34, N'anh34.jpg', 9)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (35, N'anh35.jpg', 10)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (36, N'anh36.jpg', 10)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (37, N'anh37.jpg', 10)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (38, N'anh38.jpg', 10)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (39, N'anh39.jpg', 11)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (40, N'anh40.jpg', 11)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (41, N'anh41.jpg', 11)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (42, N'anh42.jpg', 11)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (43, N'anh43.jpg', 12)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (44, N'anh44.jpg', 12)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (45, N'anh45.jpg', 12)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (46, N'anh46.jpg', 12)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (47, N'anh47.jpg', 13)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (48, N'anh48.jpg', 13)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (49, N'anh49.jpg', 13)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (50, N'anh50.jpg', 13)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (51, N'anh51.jpg', 14)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (52, N'anh52.jpg', 14)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (53, N'anh53.jpg', 14)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (54, N'anh54.jpg', 14)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (55, N'anh55.jpg', 15)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (56, N'anh56.jpg', 15)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (57, N'anh57.jpg', 15)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (58, N'anh58.jpg', 15)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (59, N'anh59.jpg', 16)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (60, N'anh60.jpg', 16)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (61, N'anh61.jpg', 16)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (62, N'anh62.jpg', 16)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (63, N'anh63.jpg', 17)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (64, N'anh64.jpg', 17)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (65, N'anh65.jpg', 17)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (66, N'anh66.jpg', 17)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (67, N'anh67.jpg', 18)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (68, N'anh68.jpg', 18)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (69, N'anh69.jpg', 18)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (70, N'anh70.jpg', 18)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (71, N'anh71.jpg', 19)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (72, N'anh72.jpg', 19)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (73, N'anh73.jpg', 19)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (74, N'anh74.jpg', 19)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (75, N'anh75.jpg', 20)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (76, N'anh76.jpg', 20)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (77, N'anh77.jpg', 20)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (78, N'anh78.jpg', 20)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (79, N'anh79.jpg', 21)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (80, N'anh80.jpg', 21)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (81, N'anh81.jpg', 21)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (82, N'anh82.jpg', 21)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (83, N'anh83.jpg', 22)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (84, N'anh84.jpg', 22)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (85, N'anh85.jpg', 22)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (86, N'anh86.jpg', 22)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (87, N'anh87.jpg', 23)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (88, N'anh88.jpg', 23)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (89, N'anh89.jpg', 23)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (90, N'anh90.jpg', 23)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (91, N'anh91.jpg', 24)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (92, N'anh92.jpg', 24)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (93, N'anh93.jpg', 24)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (94, N'anh94.jpg', 24)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (95, N'anh95.jpg', 25)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (96, N'anh96.jpg', 25)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (97, N'anh97.jpg', 25)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (98, N'anh98.jpg', 25)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (99, N'anh99.jpg', 26)
GO
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (100, N'anh100.jpg', 26)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (101, N'anh101.jpg', 26)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (102, N'anh102.jpg', 26)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (103, N'anh103.jpg', 27)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (104, N'anh104.jpg', 27)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (105, N'anh105.jpg', 27)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (106, N'anh106.jpg', 27)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (107, N'anh107.jpg', 28)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (108, N'anh108.jpg', 28)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (109, N'anh109.jpg', 28)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (110, N'anh110.jpg', 28)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (111, N'anh111.jpg', 29)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (112, N'anh112.jpg', 29)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (113, N'anh113.jpg', 29)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (114, N'anh114.jpg', 29)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (115, N'anh115.jpg', 30)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (116, N'anh116.jpg', 30)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (117, N'anh117.jpg', 30)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (118, N'anh118.jpg', 30)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (119, N'anh119.jpg', 31)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (120, N'anh120.jpg', 31)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (121, N'anh121.jpg', 31)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (122, N'anh122.jpg', 31)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (123, N'anh123.jpg', 32)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (124, N'anh124.jpg', 32)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (125, N'anh125.jpg', 32)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (126, N'anh126.jpg', 32)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (127, N'anh127.jpg', 33)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (128, N'anh128.jpg', 33)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (129, N'anh129.jpg', 33)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (130, N'anh130.jpg', 33)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (131, N'anh131.jpg', 34)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (132, N'anh132.jpg', 34)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (133, N'anh133.jpg', 34)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (134, N'anh134.jpg', 34)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (135, N'anh135.jpg', 35)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (136, N'anh136.jpg', 35)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (137, N'anh137.jpg', 35)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (138, N'anh138.jpg', 35)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (139, N'anh139.jpg', 36)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (140, N'anh140.jpg', 36)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (141, N'anh141.jpg', 36)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (142, N'anh142.jpg', 36)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (143, N'anh143.jpg', 37)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (144, N'anh144.jpg', 37)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (145, N'anh145.jpg', 37)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (146, N'anh146.jpg', 37)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (147, N'anh147.jpg', 1)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (148, N'anh148.jpg', 1)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (149, N'anh151.jpg', 38)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (150, N'anh152.jpg', 39)
INSERT [dbo].[tbl_anh] ([id], [duongdan], [id_sp]) VALUES (151, N'anh153.jpg', 39)
SET IDENTITY_INSERT [dbo].[tbl_anh] OFF

SET IDENTITY_INSERT [dbo].[tbl_chitietdonhang] ON 
INSERT [dbo].[tbl_chitietdonhang] ([id], [id_don], [id_sp], [id_tk], [soluong], [id_tinhtrang], [thoigian]) VALUES (N'1', N'1', 1, 2, 10, N'1', CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_chitietdonhang] ([id], [id_don], [id_sp], [id_tk], [soluong], [id_tinhtrang], [thoigian]) VALUES (N'2', N'2', 2, 2, 100, N'1', CAST(N'2019-06-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_chitietdonhang] ([id], [id_don], [id_sp], [id_tk], [soluong], [id_tinhtrang], [thoigian]) VALUES (N'3', N'3', 3, 3, 10, N'2', CAST(N'2019-06-19 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_chitietdonhang] OFF
 
SET IDENTITY_INSERT [dbo].[tbl_danhmuc] ON 

INSERT [dbo].[tbl_danhmuc] ([id], [ten]) VALUES (1, N'Điện Thoại')
INSERT [dbo].[tbl_danhmuc] ([id], [ten]) VALUES (2, N'Tablet    ')
INSERT [dbo].[tbl_danhmuc] ([id], [ten]) VALUES (3, N'Phụ Kiện  ')
INSERT [dbo].[tbl_danhmuc] ([id], [ten]) VALUES (5, N'Khuyến Mại')
SET IDENTITY_INSERT [dbo].[tbl_danhmuc] OFF
INSERT [dbo].[tbl_dondathang] ([id], [ngaylap], [tonggia], [diachi], [sdt]) VALUES (N'1', CAST(N'2018-09-11' AS Date), CAST(1000000 AS Decimal(18, 0)), N'234, Cầu Giấy , Hà Nội', N'01352141233')
INSERT [dbo].[tbl_dondathang] ([id], [ngaylap], [tonggia], [diachi], [sdt]) VALUES (N'10', CAST(N'2019-03-17' AS Date), CAST(56235423 AS Decimal(18, 0)), N'42, Yên Bái', N'01325412236')
INSERT [dbo].[tbl_dondathang] ([id], [ngaylap], [tonggia], [diachi], [sdt]) VALUES (N'2', CAST(N'2019-03-15' AS Date), CAST(10000 AS Decimal(18, 0)), N'42, Yên Bái', N'01325412236')
INSERT [dbo].[tbl_dondathang] ([id], [ngaylap], [tonggia], [diachi], [sdt]) VALUES (N'3', CAST(N'2019-03-17' AS Date), CAST(1000000 AS Decimal(18, 0)), N'42, Yên Bái', N'01325412236')
INSERT [dbo].[tbl_dondathang] ([id], [ngaylap], [tonggia], [diachi], [sdt]) VALUES (N'4', CAST(N'2019-03-17' AS Date), CAST(12312 AS Decimal(18, 0)), N'42, Yên Bái', N'01325412236')
INSERT [dbo].[tbl_dondathang] ([id], [ngaylap], [tonggia], [diachi], [sdt]) VALUES (N'5', CAST(N'2019-03-17' AS Date), CAST(312412 AS Decimal(18, 0)), N'42, Yên Bái', N'01325412236')
INSERT [dbo].[tbl_dondathang] ([id], [ngaylap], [tonggia], [diachi], [sdt]) VALUES (N'6', CAST(N'2019-03-17' AS Date), CAST(4125414 AS Decimal(18, 0)), N'42, Yên Bái', N'01325412236')
INSERT [dbo].[tbl_dondathang] ([id], [ngaylap], [tonggia], [diachi], [sdt]) VALUES (N'7', CAST(N'2019-03-17' AS Date), CAST(5235423 AS Decimal(18, 0)), N'42, Yên Bái', N'01325412236')
INSERT [dbo].[tbl_dondathang] ([id], [ngaylap], [tonggia], [diachi], [sdt]) VALUES (N'8', CAST(N'2019-03-17' AS Date), CAST(5235423 AS Decimal(18, 0)), N'42, Yên Bái', N'01325412236')
INSERT [dbo].[tbl_dondathang] ([id], [ngaylap], [tonggia], [diachi], [sdt]) VALUES (N'9', CAST(N'2019-03-17' AS Date), CAST(4234 AS Decimal(18, 0)), N'42, Yên Bái', N'01325412236')
SET IDENTITY_INSERT [dbo].[tbl_news] ON 

INSERT [dbo].[tbl_news] ([id], [tieude], [noidung], [ngaydang], [id_tk], [anh]) VALUES (1, N'Asus Zenfone Max Pro M1 đã lên kệ', N'Asus Zenfone Max Pro M1 đã lên kệ Asus Zenfone Max Pro M1 đã lên kệ Asus Zenfone Max Pro M1 đã lên kệ Asus Zenfone Max Pro M1 đã lên kệ Asus Zenfone Max Pro M1 đã lên kệ Asus Zenfone Max Pro M1 đã lên kệAsus Zenfone Max Pro M1 đã lên kệ Asus Zenfone Max Pro M1 đã lên kệ Asus Zenfone Max Pro M1 đã lên kệ Asus Zenfone Max Pro M1 đã lên kệ', CAST(N'2010-12-12 00:00:00.000' AS DateTime), 2, N'https://static.digit.in/product/04ea8fcf049e4cf545ba96d0dac190bd94e56a18.jpeg                                                                                                                                                                                  ')
INSERT [dbo].[tbl_news] ([id], [tieude], [noidung], [ngaydang], [id_tk], [anh]) VALUES (2, N'ASUS ZenFone Max Pro M2 3GB RAM Chính hãng', N'
1
2
Sau >
Trang 1 / 2	

        Mình cũng đã trải nghiệm Galaxy S10+ được một thời gian dài và có rất nhiều cảm xúc với chiếc máy này so với bất kỳ chiếc Samsung nào trước đây. Trong bài viết này, mình sẽ chia sẻ với anh em 5 điểm mà mình yêu thích nhất trên chiếc máy này, cũng là 5 điểm đáng giá cho ai lựa chọn Galaxy S10+. Tất nhiên, một chiếc máy không thể hoàn hảo. Ở bài viết tiếp theo, mình sẽ chia sẻ những điểm chưa hài lòng với anh em sau. Ngay từ thông số, chiếc màn hình này đã ấn tượng với kích thước 6.4" QHD+, hỗ trợ HDR10+. Trải nghiệm thực tế, chiếc màn hình này trong, độ sáng cao, góc nhìn tốt, sắc nét với chi tiết cao và tái tạo màu sắc chính xác. Tổng thể thì đây là một trong những chiếc màn hình smartphone đẹp nhất.

Kết hợp với thiết kế cong nhẹ và nốt ruồi Infinity-O để mang đến một chiếc màn hình với 4 viền mỏng thì trải nghiệm màn hình trên S10+ thật sự là 1 điểm cộng đáng giá. Mình hoàn toàn không thấy ảnh hưởng hay khó chịu gì nhiều bởi nốt ruồi (dù nốt ruồi của S10+ có phần to hơn tẹo so với S10) bởi vị trí đó thường không phải là vị trí tập trung mắt và nó cũng không làm ảnh hưởng gì nhiều đến nội dung đang xem cả. Hơn nữa, anh em còn có thể làm nhiều trò vui vẻ với nốt ruồi này như hiển thị phần trăm pin, cài hình nền độc đáo thú vị.

Ngoài ra, S10+ là điện thoại đầu tiên hỗ trợ HDR10+. Khi xem nội dung có hỗ trợ HDR10+, độ sáng tối sẽ còn thay đổi theo nội dung đang hiển thị (sáng có nhiều sắc độ, không phải đều thành sáng trắng hết hay đen cũng nhiều sắc độ chứ không phải đều tối đen hết).
 Camera selfie của S10+ có đến 2 cái với nốt ruồi bự hơn bao gồm 1 camera chính 10MP và 1 camera phụ đo chiều sâu 8MP. Chính điều này, cho phép chúng ta chụp ảnh selfie xóa phông trực tiếp - tức là chụp Live Focus với camera trước, có thể điều chỉnh mức độ xóa phông trong khi chụp.

Ngoài ra, camera selfie cũng chia thành góc thường và góc rộng. Dù góc rộng không thuộc dạng siêu rộng, rộng thêm được bao nhiêu nhưng ít ra cho chúng ta 2 lựa chọn. Có lúc bạn muốn lấy thêm khung cảnh xung quanh, có lúc bạn muốn crop lại và không muốn dính ai đó vào khung hình.

Cùng với cải tiến về làm đẹp, xử lý da người trắng, làm đẹp tự nhiên và những hiệu ứng xóa phông y như camera sau, quay video 4K thì camera selfie của S10+ cũng trở thành 1 điểm cộng của chiếc máy này. Xóa đi khái niệm điện thoại Samsung không có thế mạnh về selfie.', CAST(N'2019-04-17 15:28:00.000' AS DateTime), 3, N'https://photo2.tinhte.vn/data/attachment-files/2019/04/4623140_cover-top5s10_2.jpg                                                                                                                                                                             ')
INSERT [dbo].[tbl_news] ([id], [tieude], [noidung], [ngaydang], [id_tk], [anh]) VALUES (3, N'Điện Thoại Samsung Galaxy Note 9 (128GB/6GB) chỉ còn  17.242.500đ', N'Samsung Galaxy Note 9 sở hữu thiết kế hợp kim nguyên khối sang trọng kết hợp khung viền kim loại sắc sảo và chắc chắn với phong cách thiết kế đa diện. Camera sau ẩn vào lưng máy cho trải nghiệm hoàn toàn mượt mà và vô cùng quyến rũ. Trang bị màn hình Super AMOLED 6.4inch mang đến trải nghiệm thị giác không giới hạn kết hợp độ phân giải Quad HD+ (2K+) tạo nên sự đột phá so các dòng điện thoại

Chi tiết chương trình

    Bắt đầu từ ngày 31/10/2018 - Đến khi hết sản phẩm khuyến mãi
    Tiết kiệm chi phí lên đến 25%
    Cam kết hàng chính hãng
    Bảo hành 12 tháng
    Miễn phí vận chuyển

Sơ lược sản phẩm

    Thiết kế: Nguyên khối, Màn hình vô cực không viền
    Màn hình: 6.4 inch 2960 x 1440 pixels
    Camera Trước: 8MP
    Camera Sau: 12 MP Dual-camera
    CPU: Exynos 9810 8 nhân 64 bit
    Bộ Nhớ: 128GB
    RAM: 6GB
    SIM tương thích: 2 Nano SIM
    Tính năng: Mở khóa bằng vân tay, nhận dạng khuôn mặt
', CAST(N'2018-10-31 00:00:00.000' AS DateTime), 2, N'https://photo2.tinhte.vn/data/attachment-files/2018/10/4468249_ast.jpg                                                                                                                                                                                         ')
INSERT [dbo].[tbl_news] ([id], [tieude], [noidung], [ngaydang], [id_tk], [anh]) VALUES (4, N'Đồng hồ Samsung Gear Sport chỉ còn 5.790.000đ', N'

        Samsung Gear Sport đặt các mục tiêu về sức khoẻ, ăn kiêng trên điện thoại của bạn và bắt đầu theo dõi sự tiến triển ngay trên cổ tay: Gear Sport giúp bạn giữ cân bằng và theo dõi lượng calo. Nó cũng cung cấp những lời khuyên và cái nhìn sâu sắc mà bạn có thể sử dụng để hoạch định kế hoạch cho mình.

        Chi tiết chương trình 
            Bắt đầu từ ngày 31/08/2018 - Đến khi hết sản phẩm khuyến mãi
            Tiết kiệm chi phí lên đến 11%
            Cam kết hàng chính hãng
            Bảo hành 12 tháng
            Miễn phí vận chuyển
        Sơ lược sản phẩm
            Là dòng sản phẩm mới của Samsung với chuẩn chống nước lên tới 50m.
            Thu thập các chỉ số vận động của bạn cả ngày và dễ dàng tính toán ra mức tiêu hao năng lượng cũng như hướng dẫn tập luyện.
            Tương thích với chuẩn thanh toán Samsung Pay, bạn sẽ dễ dàng thanh toán chỉ với một vài thao tác trên chiếc đồng hồ.
            Kiểm tra và cập nhật các thông tin thông báo, dễ dàng trả lời lại cuộc gọi cũng như tin nhắn chỉ bằng cách xoay vòng benzel.
', CAST(N'2018-10-31 00:00:00.000' AS DateTime), 2, N'https://photo2.tinhte.vn/data/attachment-files/2018/08/4413655_ss.jpg                                                                                                                                                                                          ')
INSERT [dbo].[tbl_news] ([id], [tieude], [noidung], [ngaydang], [id_tk], [anh]) VALUES (5, N'iPad Pro 11 inch (2018) 64GB Wifi chỉ còn 19.490.000đ', N'iPad Pro 11 inch (2018) 64GB Wifi được trang bị phần viền mỏng đều ở cả bốn cạnh, loại bỏ phím home vật lý truyền thống và tích hợp thêm công nghệ nhận diện khuôn mặt Face ID. Cấu hình trên iPad Pro được nâng cấp để khiến nó mạnh hơn cả về xử lý ứng dụng lẫn xử lý đồ họa. iPad Pro được trang bị chip A12X Bionic trên công nghệ 7nm, chip này có tổng cộng 10 tỉ bóng bán dẫn với 8 nhân (4 nhân ở hiệu năng cao và 4 nhân bình thường).

Chi tiết chương trình
e
    Bắt đầu từ ngày 18/04/2019 - Đến khi hết sản phẩm khuyến mãi
    Tiết kiệm chi phí lên đến 15%
    Cam kết hàng chính hãng
    Bảo hành 12 tháng
    Miễn phí vận chuyển

Sơ lược sản phẩm

    Thiết kế: Siêu mỏng, loại bỏ nút home
    Màn hình: 11 inch (2388 x1668), 264 ppi
    Camera Trước/Sau: 7MP Portrait Mode/Lighting - 12MP , f/1.8 Zoom quang 5x, Smart HDR
    CPU: A12X Bionic 64bit, Neural Engine, M12, 7 nhân GPU
    Bộ Nhớ: 64GB
    RAM: 4GB
    Pin: 29.37Wh
', CAST(N'2019-04-18 17:27:00.000' AS DateTime), 3, N'https://photo2.tinhte.vn/data/attachment-files/2019/04/4622230_ast.jpg                                                                                                                                                                                         ')
SET IDENTITY_INSERT [dbo].[tbl_news] OFF
SET IDENTITY_INSERT [dbo].[tbl_nhasanxuat] ON 

INSERT [dbo].[tbl_nhasanxuat] ([id], [ten]) VALUES (1, N'Apple')
INSERT [dbo].[tbl_nhasanxuat] ([id], [ten]) VALUES (2, N'Samsung')
INSERT [dbo].[tbl_nhasanxuat] ([id], [ten]) VALUES (3, N'Oppo')
INSERT [dbo].[tbl_nhasanxuat] ([id], [ten]) VALUES (4, N'Nokia')
INSERT [dbo].[tbl_nhasanxuat] ([id], [ten]) VALUES (5, N'Asus')
INSERT [dbo].[tbl_nhasanxuat] ([id], [ten]) VALUES (6, N'Xiaomi')
SET IDENTITY_INSERT [dbo].[tbl_nhasanxuat] OFF
SET IDENTITY_INSERT [dbo].[tbl_quyen] ON 

INSERT [dbo].[tbl_quyen] ([id], [ten]) VALUES (1, N'admin')
INSERT [dbo].[tbl_quyen] ([id], [ten]) VALUES (2, N'nhanvien')
INSERT [dbo].[tbl_quyen] ([id], [ten]) VALUES (3, N'khachhang')
SET IDENTITY_INSERT [dbo].[tbl_quyen] OFF
SET IDENTITY_INSERT [dbo].[tbl_sanpham] ON 

INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (1, 1, N'Iphone Xs', 35000001, 13, N'101       ', N'1GB       ', N'4GB       ', N'null', N'8         ', N'13        ', 3000, N'10                                                ', 6, 1, N'Apple A13', N'5.9', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (2, 1, N'Iphone Xs Max', 40000000, 9, N'100       ', N'512       ', N'4         ', N'null', N'7         ', N'12        ', 3174, N'12                                                ', 5, 1, N'Apple A12', N'6.5', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (3, 1, N'Iphone X', 25000000, 10, N'100       ', N'256       ', N'3         ', N'0', N'7         ', N'12        ', 2716, N'12                                                ', 5, 1, N'Apple A11', N'5.8', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (4, 1, N'Iphone Xr', 30000000, 10, N'100       ', N'256       ', N'3         ', N'0', N'7         ', N'12        ', 2942, N'12                                                ', 5, 1, N'Apple A12', N'6.1', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (5, 1, N'Samsung Galaxy Note 9', 30000000, 10, N'100       ', N'512       ', N'8         ', N'1', N'8         ', N'12        ', 4000, N'12                                                ', 5, 2, N'Exynos 9810', N'6.4', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (6, 1, N'Samsung Galaxy S9+', 25000000, 10, N'100       ', N'128       ', N'6         ', N'1', N'8         ', N'12        ', 3500, N'12                                                ', 5, 2, N'Exynos 9810', N'6.2', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (7, 1, N'Samsung Galaxy Note 8', 20000000, 10, N'100       ', N'64        ', N'6         ', N'1', N'8         ', N'12        ', 3300, N'12                                                ', 5, 2, N'Exynos 8895', N'6.3', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (8, 1, N'Samsung Galaxy S8+', 18000000, 10, N'100       ', N'64        ', N'4         ', N'1', N'8         ', N'12        ', 3500, N'12                                                ', 5, 2, N'Exynos 8895', N'6.2', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (9, 1, N'Oppo Find X', 20000000, 10, N'100       ', N'256       ', N'8         ', N'1', N'25        ', N'20        ', 3730, N'12                                                ', 5, 3, N'Snapdragon 845', N'6.42', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (10, 1, N'Oppo R17 Pro', 17000000, 10, N'100       ', N'128       ', N'8         ', N'1', N'25        ', N'20        ', 3700, N'12                                                ', 5, 3, N'Snapdragon 710', N'6.4', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (11, 1, N'Oppo F3+', 10000000, 10, N'100       ', N'64        ', N'6         ', N'1', N'25        ', N'16        ', 3500, N'12                                                ', 4, 3, N'Media Tek P60', N'6.3', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (12, 1, N'Oppo F7', 7000000, 10, N'100       ', N'64        ', N'6         ', N'1', N'25        ', N'16        ', 3400, N'12                                                ', 4, 3, N'MediaTek P60', N'6.23', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (13, 1, N'Nokia 7+', 8000000, 10, N'100       ', N'64        ', N'4         ', N'1', N'12        ', N'16        ', 3800, N'12                                                ', 5, 4, N'Snapdragon 660', N'6', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (14, 1, N'Nokia X7', 6000000, 10, N'100       ', N'64        ', N'4         ', N'1', N'12        ', N'20        ', 3500, N'12                                                ', 4, 4, N'Snapdragon 710', N'6.18', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (15, 1, N'Nokia X6', 5000000, 10, N'100       ', N'64        ', N'6         ', N'1', N'16        ', N'16        ', 3060, N'12                                                ', 4, 4, N'Snapdragon 636', N'5.8', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (16, 1, N'Nokia 6.1+', 7000000, 10, N'100       ', N'64        ', N'4         ', N'1', N'16        ', N'16        ', 3060, N'12                                                ', 5, 4, N'Snapdragon 636', N'5.8', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (17, 1, N'Asus 5z', 11000000, 10, N'100       ', N'128       ', N'6         ', N'1', N'8         ', N'12        ', 3300, N'12                                                ', 5, 5, N'Snapdragon 845', N'6.2', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (18, 1, N'Asus Max Pro M1', 5000000, 10, N'100       ', N'64        ', N'4         ', N'1', N'5         ', N'16        ', 5000, N'12                                                ', 4, 5, N'Snapdragon 636', N'6', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (19, 1, N'Asus Max Plus M1', 3000000, 10, N'100       ', N'32        ', N'3         ', N'1', N'8         ', N'16        ', 4130, N'12                                                ', 4, 5, N'MTK', N'5.7', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (20, 1, N'Asus 3 Max', 4000000, 10, N'100       ', N'32        ', N'3         ', N'1', N'8         ', N'16        ', 4100, N'12                                                ', 4, 5, N'Snapdragon 430', N'5.5', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (21, 1, N'Xiaomi Mi Mix 2S', 14000000, 10, N'100       ', N'128       ', N'8         ', N'1', N'12        ', N'16        ', 3400, N'12                                                ', 5, 6, N'Snapdragon 845', N'6', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (22, 1, N'Xiaomi Mi 8 Pro', 15000000, 10, N'100       ', N'128       ', N'8         ', N'1', N'12        ', N'20        ', 3000, N'12                                                ', 5, 6, N'Snapdragon 845', N'6.21', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (23, 1, N'Xiaomi Mi 8', 12000000, 10, N'100       ', N'64        ', N'6         ', N'1', N'12        ', N'20        ', 3400, N'12                                                ', 5, 6, N'Snapdragon 845', N'6.21', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (24, 1, N'Xiaomi Note 6 Pro', 6000000, 10, N'100       ', N'64        ', N'4         ', N'1', N'12        ', N'20        ', 4000, N'12                                                ', 4, 6, N'Snapdragon 636', N'6.26', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (25, 2, N'Ipad Pro 10.5', 20000000, 10, N'200       ', N'512       ', N'4         ', N'0', N'7         ', N'12        ', 30400, N'12                                                ', 5, 1, N'Apple A10X', N'10.5', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (26, 2, N'Ipad 2018', 15000000, 10, N'200       ', N'128       ', N'2         ', N'0', N'2         ', N'8         ', 32400, N'12                                                ', 5, 1, N'Apple A10', N'9.7', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (27, 2, N'Ipad 4', 5000000, 10, N'200       ', N'64        ', N'1         ', N'0', N'2         ', N'5         ', 11500, N'12                                                ', 4, 1, N'Apple A6X', N'9.7', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (28, 2, N'Ipad Air 2', 7000000, 10, N'200       ', N'32        ', N'2         ', N'0', N'2         ', N'8         ', 7340, N'12                                                ', 4, 1, N'Apple A8X', N'9.7', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (29, 2, N'Samsung Galaxy Tab A6', 8000000, 10, N'200       ', N'16        ', N'3         ', N'1', N'2         ', N'8         ', 7300, N'12                                                ', 4, 2, N'Exynos 7870', N'10.1', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (30, 2, N'Samsung Galaxy Tab A8', 6000000, 10, N'200       ', N'16        ', N'2         ', N'1', N'5         ', N'8         ', 5000, N'12                                                ', 4, 2, N'MSM 8917', N'8', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (31, 2, N'Samsung Galaxy Tab S4', 18000000, 10, N'200       ', N'64        ', N'4         ', N'1', N'8         ', N'13        ', 7300, N'12                                                ', 5, 2, N'MSM 8998', N'10.5', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (32, 2, N'Samsung Galaxy TabS', 10000000, 10, N'200       ', N'16        ', N'3         ', N'1', N'2         ', N'8         ', 7900, N'12                                                ', 4, 2, N'Intel Core', N'10.5', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (33, 2, N'Nokia N1', 4000000, 10, N'200       ', N'32        ', N'2         ', N'1', N'5         ', N'8         ', 5300, N'12                                                ', 4, 4, N'Intel Atom Z3580', N'7.9', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (34, 2, N'Asus Zenpad Z8', 3000000, 10, N'200       ', N'16        ', N'2         ', N'1', N'2         ', N'8         ', 4600, N'12                                                ', 4, 5, N'Snapdragon 650', N'8', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (35, 2, N'Asus Zenpad Z10', 6000000, 10, N'200       ', N'32        ', N'3         ', N'1', N'5         ', N'8         ', 7800, N'12                                                ', 4, 5, N'Snapdragon 650', N'9.7', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (36, 2, N'Xiaomi Mipad 3', 5000000, 10, N'200       ', N'64        ', N'4         ', N'1', N'5         ', N'13        ', 6600, N'12                                                ', 4, 6, N'MediaTek MT8176', N'7.9', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (37, 2, N'Xiaomi Mipad 4', 6000000, 10, N'200       ', N'64        ', N'4         ', N'1', N'5         ', N'13        ', 6000, N'12                                                ', 4, 6, N'Snapdragon 660', N'8', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (38, 3, N'apple watch', 105222, 3, N'100       ', N'256       ', N'4         ', N'null', N'          ', N'          ', 1000, N'12                                                ', 1, 1, N'512', N'5', 1)
INSERT [dbo].[tbl_sanpham] ([id], [id_dm], [ten], [gia], [soluong], [trongluong], [ROM], [RAM], [thenho], [camera_truoc], [camera_sau], [pin], [baohanh], [bluetooth], [id_nsx], [CPU], [manhinh], [tinhtrang]) VALUES (39, 3, N'oppo watch', 11111, 3, N'100       ', N'512       ', N'4         ', N'null', N'          ', N'          ', 1500, N'12                                                ', 1, 3, N'12', N'5', 1)
SET IDENTITY_INSERT [dbo].[tbl_sanpham] OFF
SET IDENTITY_INSERT [dbo].[tbl_taikhoan] ON 

INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (1, 1, N'admin', N'admin', 1, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (2, 2, N'tranvana', N'ta123', 2, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (3, 2, N'tranvanb', N'tb123', 3, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (4, 2, N'tranvanc', N'tc123', 4, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (5, 3, N'levana', N'la123', 5, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (6, 3, N'levanb', N'lb123', 6, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (7, 3, N'levanc', N'lc123', 7, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (8, 3, N'giaplinux', N'giaplinux', 10, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (9, 3, N'test', N'aaa', 11, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (11, 3, N'user1', N'12345678', 13, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (12, 3, N'user2', N'87654321', 14, 1)
INSERT [dbo].[tbl_taikhoan] ([id], [id_q], [tentaikhoan], [matkhau], [id_ttcn], [trangthai]) VALUES (13, 3, N'quan', N'111', 15, 1)
SET IDENTITY_INSERT [dbo].[tbl_taikhoan] OFF
SET IDENTITY_INSERT [dbo].[tbl_thongtincanhan] ON 

INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (1, N'Nguyễn Văn Lộc', CAST(353237025 AS Decimal(18, 0)), N'mr.jerry0997@gmail.com', CAST(N'1997-02-01' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'Hà nội')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (2, N'Trần Văn B', CAST(476964655 AS Decimal(18, 0)), N'tranvanb@gmail.com', CAST(N'1997-02-02' AS Date), 0, N'https://img.icons8.com/bubbles/2x/user.png', N'Bắc giang')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (3, N'Trần Văn C', CAST(31514656 AS Decimal(18, 0)), N'tranvanc@gmail.com', CAST(N'1997-02-03' AS Date), 0, N'https://img.icons8.com/bubbles/2x/user.png', N'Bắc Ninh')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (4, N'Đoàn Văn Hậu', CAST(865768755 AS Decimal(18, 0)), N'hau@gmail.com', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'Nghệ an')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (5, N'Bùi Tiến Dũng', CAST(243543236 AS Decimal(18, 0)), N'dung@gmail.com', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'đà lạy')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (6, N'Quang Hải', CAST(352342354 AS Decimal(18, 0)), N'lam@gmail.com', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'Lạng Sơn')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (7, N'Văn Lâm', CAST(5648651 AS Decimal(18, 0)), N'lam@gmail.com', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'Hà Giang')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (8, N'Anh Đức', CAST(284683223 AS Decimal(18, 0)), N'duc@gmail.com', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'THanh Hóa')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (10, N'aaa', CAST(1 AS Decimal(18, 0)), N'a@gmail.com', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'Hà nội')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (11, N'test', CAST(1 AS Decimal(18, 0)), N'a@gmail.com', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'Hà nội')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (12, N'test', CAST(11 AS Decimal(18, 0)), N'a@gmail.com', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'Hà nội')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (13, N'user1', CAST(1 AS Decimal(18, 0)), N'user1@local', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'Hà nội')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (14, N'user2', CAST(1 AS Decimal(18, 0)), N'user2@local', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'Hà nội')
INSERT [dbo].[tbl_thongtincanhan] ([id], [ten], [sdt], [email], [ngaysinh], [gioitinh], [anhdaidien], [diachi]) VALUES (15, N'quan', CAST(1 AS Decimal(18, 0)), N'korangar910@gmail.com', CAST(N'1997-02-03' AS Date), 1, N'https://img.icons8.com/bubbles/2x/user.png', N'Hà nội')
SET IDENTITY_INSERT [dbo].[tbl_thongtincanhan] OFF
INSERT [dbo].[tbl_tinhtrangdonhang] ([id], [ten]) VALUES (N'1', N'Trong giỏ hàng')
INSERT [dbo].[tbl_tinhtrangdonhang] ([id], [ten]) VALUES (N'2', N'Đã xuất đơn hàng')
INSERT [dbo].[tbl_tinhtrangdonhang] ([id], [ten]) VALUES (N'3', N'Đã bán')
INSERT [dbo].[tbl_xulydon] ([id], [id_don], [tinhtrang], [thoigian]) VALUES (N'1', N'1', N'Đang Giao', CAST(N'2019-06-05 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_xulydon] ([id], [id_don], [tinhtrang], [thoigian]) VALUES (N'2', N'3', N'Đã nhận', CAST(N'2019-04-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_xulydon] ([id], [id_don], [tinhtrang], [thoigian]) VALUES (N'3', N'5', N'Đã hủy', CAST(N'2019-04-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_xulydon] ([id], [id_don], [tinhtrang], [thoigian]) VALUES (N'4', N'5', N'Đang giao', CAST(N'2019-03-19 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_xulydon] ([id], [id_don], [tinhtrang], [thoigian]) VALUES (N'5', N'6', N'Khách hàng hủy', CAST(N'2019-03-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_xulydon] ([id], [id_don], [tinhtrang], [thoigian]) VALUES (N'6', N'6', N'Khách hàng kiếu nại', CAST(N'2019-03-03 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_xulydon] ([id], [id_don], [tinhtrang], [thoigian]) VALUES (N'7', N'6', N'Shop đã sử lý', CAST(N'2019-03-04 00:00:00.000' AS DateTime))
INSERT [dbo].[tbl_xulydon] ([id], [id_don], [tinhtrang], [thoigian]) VALUES (N'8', N'8', N'Đang giao', CAST(N'2019-06-06 00:00:00.000' AS DateTime))
ALTER TABLE [dbo].[tbl_anh]  WITH CHECK ADD  CONSTRAINT [FK_tbl_anh_tbl_sanpham] FOREIGN KEY([id_sp])
REFERENCES [dbo].[tbl_sanpham] ([id])
GO
ALTER TABLE [dbo].[tbl_anh] CHECK CONSTRAINT [FK_tbl_anh_tbl_sanpham]
GO
ALTER TABLE [dbo].[tbl_chitietdonhang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_chitietdonhang_tbl_dondathang] FOREIGN KEY([id_don])
REFERENCES [dbo].[tbl_dondathang] ([id])
GO
ALTER TABLE [dbo].[tbl_chitietdonhang] CHECK CONSTRAINT [FK_tbl_chitietdonhang_tbl_dondathang]
GO
ALTER TABLE [dbo].[tbl_chitietdonhang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_chitietdonhang_tbl_sanpham] FOREIGN KEY([id_sp])
REFERENCES [dbo].[tbl_sanpham] ([id])
GO
ALTER TABLE [dbo].[tbl_chitietdonhang] CHECK CONSTRAINT [FK_tbl_chitietdonhang_tbl_sanpham]
GO
ALTER TABLE [dbo].[tbl_chitietdonhang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_chitietdonhang_tbl_taikhoan] FOREIGN KEY([id_tk])
REFERENCES [dbo].[tbl_taikhoan] ([id])
GO
ALTER TABLE [dbo].[tbl_chitietdonhang] CHECK CONSTRAINT [FK_tbl_chitietdonhang_tbl_taikhoan]
GO
ALTER TABLE [dbo].[tbl_chitietdonhang]  WITH CHECK ADD  CONSTRAINT [FK_tbl_chitietdonhang_tbl_tinhtrangdonhang] FOREIGN KEY([id_tinhtrang])
REFERENCES [dbo].[tbl_tinhtrangdonhang] ([id])
GO
ALTER TABLE [dbo].[tbl_chitietdonhang] CHECK CONSTRAINT [FK_tbl_chitietdonhang_tbl_tinhtrangdonhang]
GO
ALTER TABLE [dbo].[tbl_news]  WITH CHECK ADD  CONSTRAINT [FK_tbl_news_tbl_taikhoan] FOREIGN KEY([id_tk])
REFERENCES [dbo].[tbl_taikhoan] ([id])
GO
ALTER TABLE [dbo].[tbl_news] CHECK CONSTRAINT [FK_tbl_news_tbl_taikhoan]
GO
ALTER TABLE [dbo].[tbl_sanpham]  WITH CHECK ADD  CONSTRAINT [FK_tbl_sanpham_tbl_danhmuc] FOREIGN KEY([id_dm])
REFERENCES [dbo].[tbl_danhmuc] ([id])
GO
ALTER TABLE [dbo].[tbl_sanpham] CHECK CONSTRAINT [FK_tbl_sanpham_tbl_danhmuc]
GO
ALTER TABLE [dbo].[tbl_sanpham]  WITH CHECK ADD  CONSTRAINT [FK_tbl_sanpham_tbl_nhasanxuat] FOREIGN KEY([id_nsx])
REFERENCES [dbo].[tbl_nhasanxuat] ([id])
GO
ALTER TABLE [dbo].[tbl_sanpham] CHECK CONSTRAINT [FK_tbl_sanpham_tbl_nhasanxuat]
GO
ALTER TABLE [dbo].[tbl_taikhoan]  WITH CHECK ADD  CONSTRAINT [FK_tbl_taikhoan_tbl_nhanvien] FOREIGN KEY([id_ttcn])
REFERENCES [dbo].[tbl_thongtincanhan] ([id])
GO
ALTER TABLE [dbo].[tbl_taikhoan] CHECK CONSTRAINT [FK_tbl_taikhoan_tbl_nhanvien]
GO
ALTER TABLE [dbo].[tbl_taikhoan]  WITH CHECK ADD  CONSTRAINT [FK_tbl_taikhoan_tbl_quyen] FOREIGN KEY([id_q])
REFERENCES [dbo].[tbl_quyen] ([id])
GO
ALTER TABLE [dbo].[tbl_taikhoan] CHECK CONSTRAINT [FK_tbl_taikhoan_tbl_quyen]
GO
ALTER TABLE [dbo].[tbl_xulydon]  WITH CHECK ADD  CONSTRAINT [FK_tbl_xulydon_tbl_dondathang] FOREIGN KEY([id_don])
REFERENCES [dbo].[tbl_dondathang] ([id])
GO
ALTER TABLE [dbo].[tbl_xulydon] CHECK CONSTRAINT [FK_tbl_xulydon_tbl_dondathang]
GO
/****** Object:  StoredProcedure [dbo].[LayAnh_1]    Script Date: 10/17/2019 8:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayAnh_1]
	@id_sp int
AS
begin
	select duongdan from tbl_anh where id_sp = @id_sp
end

GO
/****** Object:  StoredProcedure [dbo].[LayAnh_id_sp]    Script Date: 10/17/2019 8:50:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LayAnh_id_sp]
	@id_sp int
AS
begin
	select duongdan from tbl_anh where id_sp = @id_sp
end


GO
