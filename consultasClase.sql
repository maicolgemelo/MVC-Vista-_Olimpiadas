USE [master]
GO
CREATE DATABASE [bdolimpiadas] ON  PRIMARY 
( NAME = N'bdolimpiadas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\bdolimpiadas.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bdolimpiadas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\bdolimpiadas_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bdolimpiadas] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bdolimpiadas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bdolimpiadas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bdolimpiadas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bdolimpiadas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bdolimpiadas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bdolimpiadas] SET ARITHABORT OFF 
GO
ALTER DATABASE [bdolimpiadas] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bdolimpiadas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bdolimpiadas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bdolimpiadas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bdolimpiadas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bdolimpiadas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bdolimpiadas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bdolimpiadas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bdolimpiadas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bdolimpiadas] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bdolimpiadas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bdolimpiadas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bdolimpiadas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bdolimpiadas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bdolimpiadas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bdolimpiadas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bdolimpiadas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bdolimpiadas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bdolimpiadas] SET  MULTI_USER 
GO
ALTER DATABASE [bdolimpiadas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bdolimpiadas] SET DB_CHAINING OFF 
GO
USE [bdolimpiadas]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tblmodalidades](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblmodalidades] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [tblpaises](
	[idpais] [int] IDENTITY(1,1) NOT NULL,
	[nombrepais] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblpaises] PRIMARY KEY CLUSTERED 
(
	[idpais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [tblpaises] ON 

INSERT [tblpaises] ([idpais], [nombrepais]) VALUES (1, N'COLOMBIA')
INSERT [tblpaises] ([idpais], [nombrepais]) VALUES (3, N'peru')
INSERT [tblpaises] ([idpais], [nombrepais]) VALUES (4, N'uruguay')
INSERT [tblpaises] ([idpais], [nombrepais]) VALUES (5, N'Ecuador')
SET IDENTITY_INSERT [tblpaises] OFF
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [spConsultaPaises]
as
select * from dbo.tblpaises

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [spEliminarPais]
@idpais int
as
delete from dbo.tblpaises where
idpais = @idpais

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [spGuardarCambiosPais]
@idpais int,
@nombrepais varchar(50)
as
update dbo.tblpaises set 
nombrepais = @nombrepais where 
idpais = @idpais

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [spNuevoPais]
@nombrepais varchar(50)
as
insert into dbo.tblpaises(nombrepais)
values (@nombrepais)

GO
USE [master]
GO
ALTER DATABASE [bdolimpiadas] SET  READ_WRITE 
GO
