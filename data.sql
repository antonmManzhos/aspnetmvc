USE [SystemElement]
GO
SET IDENTITY_INSERT [dbo].[Elements] ON 

INSERT [dbo].[Elements] ([Id], [Url], [Order], [ParentId]) VALUES (1, N'Creating Digital Images', 1, NULL)
INSERT [dbo].[Elements] ([Id], [Url], [Order], [ParentId]) VALUES (2, N'Resources', 1, 1)
INSERT [dbo].[Elements] ([Id], [Url], [Order], [ParentId]) VALUES (3, N'Evidence', 2, 1)
INSERT [dbo].[Elements] ([Id], [Url], [Order], [ParentId]) VALUES (4, N'Graphic Products', 3, 1)
INSERT [dbo].[Elements] ([Id], [Url], [Order], [ParentId]) VALUES (5, N'Primary Sources', 1, 2)
INSERT [dbo].[Elements] ([Id], [Url], [Order], [ParentId]) VALUES (6, N'Secondary Sources', 2, 2)
INSERT [dbo].[Elements] ([Id], [Url], [Order], [ParentId]) VALUES (7, N'Process', 1, 4)
INSERT [dbo].[Elements] ([Id], [Url], [Order], [ParentId]) VALUES (8, N'Final Product', 2, 4)
SET IDENTITY_INSERT [dbo].[Elements] OFF
