USE [master]
GO
/****** Object:  Database [SystemElement]    Script Date: 28.12.2017 10:09:59 ******/
CREATE DATABASE [SystemElement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SystemElement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SystemElement.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SystemElement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\SystemElement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SystemElement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SystemElement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SystemElement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SystemElement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SystemElement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SystemElement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SystemElement] SET ARITHABORT OFF 
GO
ALTER DATABASE [SystemElement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SystemElement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SystemElement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SystemElement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SystemElement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SystemElement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SystemElement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SystemElement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SystemElement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SystemElement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SystemElement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SystemElement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SystemElement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SystemElement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SystemElement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SystemElement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SystemElement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SystemElement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SystemElement] SET  MULTI_USER 
GO
ALTER DATABASE [SystemElement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SystemElement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SystemElement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SystemElement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SystemElement] SET DELAYED_DURABILITY = DISABLED 
GO
USE [SystemElement]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 28.12.2017 10:09:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Elements]    Script Date: 28.12.2017 10:09:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Elements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](max) NULL,
	[Order] [int] NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_dbo.Elements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_ParentId]    Script Date: 28.12.2017 10:09:59 ******/
CREATE NONCLUSTERED INDEX [IX_ParentId] ON [dbo].[Elements]
(
	[ParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Elements]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Elements_dbo.Elements_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Elements] ([Id])
GO
ALTER TABLE [dbo].[Elements] CHECK CONSTRAINT [FK_dbo.Elements_dbo.Elements_ParentId]
GO
USE [master]
GO
ALTER DATABASE [SystemElement] SET  READ_WRITE 
GO
