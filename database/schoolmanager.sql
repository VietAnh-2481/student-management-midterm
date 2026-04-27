USE [schoolmanager]
GO
/****** Object:  Table [dbo].[permissions]    Script Date: 16/01/2026 11:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role_permissions]    Script Date: 16/01/2026 11:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role_permissions](
	[role_id] [bigint] NOT NULL,
	[permission_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC,
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 16/01/2026 11:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[name] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[students]    Script Date: 16/01/2026 11:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[students](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_roles]    Script Date: 16/01/2026 11:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_roles](
	[user_id] [bigint] NOT NULL,
	[role_id] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 16/01/2026 11:26:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[status] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[permissions] ON 

INSERT [dbo].[permissions] ([id], [code], [description]) VALUES (1, N'USER_VIEW', N'Xem user')
INSERT [dbo].[permissions] ([id], [code], [description]) VALUES (2, N'USER_CREATE', N'Thêm user')
INSERT [dbo].[permissions] ([id], [code], [description]) VALUES (3, N'USER_DELETE', N'Xóa user')
INSERT [dbo].[permissions] ([id], [code], [description]) VALUES (4, N'USER_UPDATE', N'Sửa sinh viên')
SET IDENTITY_INSERT [dbo].[permissions] OFF
GO
INSERT [dbo].[role_permissions] ([role_id], [permission_id]) VALUES (3, 1)
INSERT [dbo].[role_permissions] ([role_id], [permission_id]) VALUES (3, 2)
INSERT [dbo].[role_permissions] ([role_id], [permission_id]) VALUES (3, 3)
INSERT [dbo].[role_permissions] ([role_id], [permission_id]) VALUES (3, 4)
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [code], [name]) VALUES (1, N'ADMIN', N'Quản trị hệ thống')
INSERT [dbo].[roles] ([id], [code], [name]) VALUES (2, N'TEACHER', N'Giảng viên')
INSERT [dbo].[roles] ([id], [code], [name]) VALUES (3, N'STUDENT', N'Sinh viên')
INSERT [dbo].[roles] ([id], [code], [name]) VALUES (4, N'TRAINING_STAFF', N'Phòng đào tạo')
INSERT [dbo].[roles] ([id], [code], [name]) VALUES (5, N'ACCOUNTANT', N'Kế toán')
INSERT [dbo].[roles] ([id], [code], [name]) VALUES (6, N'USER', N'Tài khoản')
INSERT [dbo].[roles] ([id], [code], [name]) VALUES (7, N'IT_SUPPORT', N'Hỗ trợ CNTT')
INSERT [dbo].[roles] ([id], [code], [name]) VALUES (8, N'HEAD_DEPARTMENT', N'Trưởng khoa')
INSERT [dbo].[roles] ([id], [code], [name]) VALUES (9, N'ASSISTANT', N'Trợ giảng')
INSERT [dbo].[roles] ([id], [code], [name]) VALUES (10, N'GUEST', N'Khách')
INSERT [dbo].[roles] ([id], [code], [name]) VALUES (11, N'RESEARCHER', N'Nghiên cứu')
INSERT [dbo].[roles] ([id], [code], [name]) VALUES (12, N'EXAM_STAFF', N'Khảo thí')
INSERT [dbo].[roles] ([id], [code], [name]) VALUES (13, N'CURRICULUM_STAFF', N'Chương trình đào tạo')
INSERT [dbo].[roles] ([id], [code], [name]) VALUES (14, N'HR_STAFF', N'Nhân sự')
INSERT [dbo].[roles] ([id], [code], [name]) VALUES (15, N'MANAGER', N'Quản lý')
INSERT [dbo].[roles] ([id], [code], [name]) VALUES (16, N'SYSTEM_AUDITOR', N'Kiểm toán')
INSERT [dbo].[roles] ([id], [code], [name]) VALUES (17, N'STUDENT_AFFAIR', N'Công tác sinh viên')
INSERT [dbo].[roles] ([id], [code], [name]) VALUES (18, N'ALUMNI', N'Cựu sinh viên')
INSERT [dbo].[roles] ([id], [code], [name]) VALUES (19, N'ONLINE_STUDENT', N'Sinh viên online')
INSERT [dbo].[roles] ([id], [code], [name]) VALUES (20, N'VISITING_LECTURER', N'Giảng viên thỉnh giảng')
INSERT [dbo].[roles] ([id], [code], [name]) VALUES (21, N'LIBRARIAN', N'Thư viện')
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
INSERT [dbo].[students] ([id], [name], [email]) VALUES (3, N'Lê Văn C', N'c@gmail.com')
INSERT [dbo].[students] ([id], [name], [email]) VALUES (4, N'Nguyen Thi Nguyet', N'nguyetnt@gmail.com')
INSERT [dbo].[students] ([id], [name], [email]) VALUES (5, N'Hoang Thi Truc', N'truc@gmail.com')
INSERT [dbo].[students] ([id], [name], [email]) VALUES (6, N'Trần Văn A', N'tranvana@gmail.com')
GO
INSERT [dbo].[user_roles] ([user_id], [role_id]) VALUES (1, 3)
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password], [status]) VALUES (1, N'user1', N'123', N'1')
INSERT [dbo].[users] ([id], [username], [password], [status]) VALUES (2, N'user2', N'123', N'1')
INSERT [dbo].[users] ([id], [username], [password], [status]) VALUES (3, N'user3', N'123', N'1')
INSERT [dbo].[users] ([id], [username], [password], [status]) VALUES (4, N'user4', N'123', N'0')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__permissi__357D4CF949FBF124]    Script Date: 16/01/2026 11:26:41 PM ******/
ALTER TABLE [dbo].[permissions] ADD UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__roles__357D4CF9C7FFEA5B]    Script Date: 16/01/2026 11:26:41 PM ******/
ALTER TABLE [dbo].[roles] ADD UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__F3DBC572B9F2C1BF]    Script Date: 16/01/2026 11:26:41 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[role_permissions]  WITH CHECK ADD FOREIGN KEY([permission_id])
REFERENCES [dbo].[permissions] ([id])
GO
ALTER TABLE [dbo].[role_permissions]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[user_roles]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[user_roles]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
