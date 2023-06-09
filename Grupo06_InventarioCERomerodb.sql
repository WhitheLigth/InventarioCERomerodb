USE [master]
GO
/****** Object:  Database [InventarioCERomerodb]    Script Date: 12/05/2023 03:29:07 ******/
CREATE DATABASE [InventarioCERomerodb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InventarioCERomerodb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\InventarioCERomerodb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InventarioCERomerodb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\InventarioCERomerodb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [InventarioCERomerodb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InventarioCERomerodb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InventarioCERomerodb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InventarioCERomerodb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InventarioCERomerodb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InventarioCERomerodb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InventarioCERomerodb] SET ARITHABORT OFF 
GO
ALTER DATABASE [InventarioCERomerodb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InventarioCERomerodb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InventarioCERomerodb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InventarioCERomerodb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InventarioCERomerodb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InventarioCERomerodb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InventarioCERomerodb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InventarioCERomerodb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InventarioCERomerodb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InventarioCERomerodb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [InventarioCERomerodb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InventarioCERomerodb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InventarioCERomerodb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InventarioCERomerodb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InventarioCERomerodb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InventarioCERomerodb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InventarioCERomerodb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InventarioCERomerodb] SET RECOVERY FULL 
GO
ALTER DATABASE [InventarioCERomerodb] SET  MULTI_USER 
GO
ALTER DATABASE [InventarioCERomerodb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InventarioCERomerodb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InventarioCERomerodb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InventarioCERomerodb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InventarioCERomerodb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InventarioCERomerodb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'InventarioCERomerodb', N'ON'
GO
ALTER DATABASE [InventarioCERomerodb] SET QUERY_STORE = ON
GO
ALTER DATABASE [InventarioCERomerodb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [InventarioCERomerodb]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 12/05/2023 03:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](75) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 12/05/2023 03:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](75) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Encargado]    Script Date: 12/05/2023 03:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Encargado](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](75) NOT NULL,
	[Apellidos] [varchar](75) NOT NULL,
	[DUI] [varchar](10) NOT NULL,
	[Edad] [varchar](3) NOT NULL,
	[Telefono] [varchar](9) NOT NULL,
	[IdCargo] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 12/05/2023 03:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IdRegistroEntrada] [tinyint] NULL,
	[IdRegistroSalida] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 12/05/2023 03:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](75) NOT NULL,
	[Stock] [int] NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[IdCategoria] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 12/05/2023 03:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](75) NOT NULL,
	[Apellidos] [varchar](75) NOT NULL,
	[DUI] [varchar](10) NOT NULL,
	[Telefono] [varchar](9) NOT NULL,
	[Direccion] [varchar](300) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroEntrada]    Script Date: 12/05/2023 03:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroEntrada](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[IdProducto] [tinyint] NOT NULL,
	[IdCategoria] [tinyint] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[IdEncargado] [tinyint] NOT NULL,
	[IdProveedor] [tinyint] NOT NULL,
	[Fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroSalida]    Script Date: 12/05/2023 03:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroSalida](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [tinyint] NOT NULL,
	[IdCategoria] [tinyint] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[IdEncargado] [tinyint] NOT NULL,
	[Fecha] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turno]    Script Date: 12/05/2023 03:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 12/05/2023 03:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Correo] [varchar](75) NOT NULL,
	[Contraseña] [varchar](75) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cargo] ON 

INSERT [dbo].[Cargo] ([Id], [Nombre]) VALUES (1, N'Director')
INSERT [dbo].[Cargo] ([Id], [Nombre]) VALUES (2, N'Profesor')
INSERT [dbo].[Cargo] ([Id], [Nombre]) VALUES (3, N'Encargado Cafetin')
SET IDENTITY_INSERT [dbo].[Cargo] OFF
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([Id], [Nombre]) VALUES (1, N'Bebidas')
INSERT [dbo].[Categoria] ([Id], [Nombre]) VALUES (2, N'Granos Basicos')
INSERT [dbo].[Categoria] ([Id], [Nombre]) VALUES (3, N'Alimentos Procesados')
INSERT [dbo].[Categoria] ([Id], [Nombre]) VALUES (4, N'Aceites')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Encargado] ON 

INSERT [dbo].[Encargado] ([Id], [Nombres], [Apellidos], [DUI], [Edad], [Telefono], [IdCargo]) VALUES (8, N'Alvaro Julian', N'Linares Caceres', N'06453564-3', N'32', N'4374-4365', 1)
INSERT [dbo].[Encargado] ([Id], [Nombres], [Apellidos], [DUI], [Edad], [Telefono], [IdCargo]) VALUES (9, N'Ever Alexis', N'Lue Morales', N'06454456-3', N'22', N'4456-2984', 3)
INSERT [dbo].[Encargado] ([Id], [Nombres], [Apellidos], [DUI], [Edad], [Telefono], [IdCargo]) VALUES (10, N'Liza Esmeralda', N'Linares Portillo', N'06453784-2', N'37', N'7732-6722', 2)
INSERT [dbo].[Encargado] ([Id], [Nombres], [Apellidos], [DUI], [Edad], [Telefono], [IdCargo]) VALUES (11, N'Rosa Margarita', N'Sandoval Mendez', N'06459727-2', N'45', N'8875-3997', 3)
INSERT [dbo].[Encargado] ([Id], [Nombres], [Apellidos], [DUI], [Edad], [Telefono], [IdCargo]) VALUES (12, N'Pablo Ernesto', N'Perez Perez', N'06474579-3', N'50', N'6538-8428', 2)
INSERT [dbo].[Encargado] ([Id], [Nombres], [Apellidos], [DUI], [Edad], [Telefono], [IdCargo]) VALUES (13, N'Ernesto Luisandro', N'Martinez Linarez', N'06569345-1', N'27', N'6665-8429', 2)
SET IDENTITY_INSERT [dbo].[Encargado] OFF
GO
SET IDENTITY_INSERT [dbo].[Inventario] ON 

INSERT [dbo].[Inventario] ([Id], [Fecha], [IdRegistroEntrada], [IdRegistroSalida]) VALUES (2, CAST(N'2023-05-12T09:39:58.593' AS DateTime), 5, NULL)
INSERT [dbo].[Inventario] ([Id], [Fecha], [IdRegistroEntrada], [IdRegistroSalida]) VALUES (3, CAST(N'2023-05-12T09:40:50.000' AS DateTime), NULL, 3)
INSERT [dbo].[Inventario] ([Id], [Fecha], [IdRegistroEntrada], [IdRegistroSalida]) VALUES (4, CAST(N'2023-05-12T09:41:21.797' AS DateTime), 7, NULL)
INSERT [dbo].[Inventario] ([Id], [Fecha], [IdRegistroEntrada], [IdRegistroSalida]) VALUES (5, CAST(N'2023-05-12T09:41:40.590' AS DateTime), 6, NULL)
INSERT [dbo].[Inventario] ([Id], [Fecha], [IdRegistroEntrada], [IdRegistroSalida]) VALUES (6, CAST(N'2023-05-12T09:42:21.677' AS DateTime), NULL, 5)
SET IDENTITY_INSERT [dbo].[Inventario] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([Id], [Nombre], [Stock], [Descripcion], [IdCategoria]) VALUES (2, N'Arroz', 30, N'Su tipo de medicion para el almacenamiento de este producto es en libras', 2)
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Proveedor] ON 

INSERT [dbo].[Proveedor] ([Id], [Nombres], [Apellidos], [DUI], [Telefono], [Direccion]) VALUES (1, N'Jose Alberto', N'Hernandez Mendez', N'06462233-5', N'7695-7654', N'Sonzacate, Sonsonate El Salvador')
INSERT [dbo].[Proveedor] ([Id], [Nombres], [Apellidos], [DUI], [Telefono], [Direccion]) VALUES (2, N'Manuel Ernesto', N'Perez Martinez', N'06342283-3', N'8755-7458', N'Nahuilingo, Sonsonate El Salvador')
INSERT [dbo].[Proveedor] ([Id], [Nombres], [Apellidos], [DUI], [Telefono], [Direccion]) VALUES (3, N'Emeralda Tatiana', N'Jimenez Cortez', N'06467532-2', N'6437-8657', N'Sonsonate, Sonsonate El Salvador')
INSERT [dbo].[Proveedor] ([Id], [Nombres], [Apellidos], [DUI], [Telefono], [Direccion]) VALUES (4, N'Emilio Antonio', N'Sanchez Flores', N'06454565-5', N'6547-5776', N'San Julian, Sonsonate El Salvador')
INSERT [dbo].[Proveedor] ([Id], [Nombres], [Apellidos], [DUI], [Telefono], [Direccion]) VALUES (5, N'Katherine Maria', N'Lopez Garcia', N'06468533-1', N'5435-7763', N'San Juan Opico, La Libertad El Salvador')
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
GO
SET IDENTITY_INSERT [dbo].[RegistroEntrada] ON 

INSERT [dbo].[RegistroEntrada] ([Id], [IdProducto], [IdCategoria], [Cantidad], [IdEncargado], [IdProveedor], [Fecha]) VALUES (5, 2, 3, 34, 8, 1, CAST(N'2023-05-12T09:22:35.053' AS DateTime))
INSERT [dbo].[RegistroEntrada] ([Id], [IdProducto], [IdCategoria], [Cantidad], [IdEncargado], [IdProveedor], [Fecha]) VALUES (6, 2, 2, 4, 9, 2, CAST(N'2023-05-12T09:23:26.217' AS DateTime))
INSERT [dbo].[RegistroEntrada] ([Id], [IdProducto], [IdCategoria], [Cantidad], [IdEncargado], [IdProveedor], [Fecha]) VALUES (7, 2, 1, 33, 10, 1, CAST(N'2023-05-12T09:24:10.557' AS DateTime))
INSERT [dbo].[RegistroEntrada] ([Id], [IdProducto], [IdCategoria], [Cantidad], [IdEncargado], [IdProveedor], [Fecha]) VALUES (8, 2, 1, 44, 13, 1, CAST(N'2023-05-12T09:24:24.160' AS DateTime))
SET IDENTITY_INSERT [dbo].[RegistroEntrada] OFF
GO
SET IDENTITY_INSERT [dbo].[RegistroSalida] ON 

INSERT [dbo].[RegistroSalida] ([Id], [IdProducto], [IdCategoria], [Cantidad], [IdEncargado], [Fecha]) VALUES (3, 2, 2, 34, 8, CAST(N'2023-05-12T09:27:20.347' AS DateTime))
INSERT [dbo].[RegistroSalida] ([Id], [IdProducto], [IdCategoria], [Cantidad], [IdEncargado], [Fecha]) VALUES (4, 2, 2, 47, 13, CAST(N'2023-05-12T09:27:20.347' AS DateTime))
INSERT [dbo].[RegistroSalida] ([Id], [IdProducto], [IdCategoria], [Cantidad], [IdEncargado], [Fecha]) VALUES (5, 2, 2, 33, 10, CAST(N'2023-05-12T09:27:20.347' AS DateTime))
INSERT [dbo].[RegistroSalida] ([Id], [IdProducto], [IdCategoria], [Cantidad], [IdEncargado], [Fecha]) VALUES (6, 2, 2, 23, 12, CAST(N'2023-05-12T09:27:20.347' AS DateTime))
SET IDENTITY_INSERT [dbo].[RegistroSalida] OFF
GO
SET IDENTITY_INSERT [dbo].[Turno] ON 

INSERT [dbo].[Turno] ([Id], [Nombre]) VALUES (1, N'Matutino')
INSERT [dbo].[Turno] ([Id], [Nombre]) VALUES (2, N'Vespertino')
SET IDENTITY_INSERT [dbo].[Turno] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id], [Correo], [Contraseña]) VALUES (1, N'Usuario01@empresa.com', N'UsuarioXX01')
INSERT [dbo].[Usuario] ([Id], [Correo], [Contraseña]) VALUES (2, N'Usuario02@empresa.com', N'UsuarioXX02')
INSERT [dbo].[Usuario] ([Id], [Correo], [Contraseña]) VALUES (3, N'Usuario03@empresa.com', N'UsuarioXX03')
INSERT [dbo].[Usuario] ([Id], [Correo], [Contraseña]) VALUES (4, N'Usuario04@empresa.com', N'UsuarioXX04')
INSERT [dbo].[Usuario] ([Id], [Correo], [Contraseña]) VALUES (5, N'Usuario05@empresa.com', N'UsuarioXX05')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
ALTER TABLE [dbo].[Encargado]  WITH CHECK ADD FOREIGN KEY([IdCargo])
REFERENCES [dbo].[Cargo] ([Id])
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD FOREIGN KEY([IdRegistroEntrada])
REFERENCES [dbo].[RegistroEntrada] ([Id])
GO
ALTER TABLE [dbo].[Inventario]  WITH CHECK ADD FOREIGN KEY([IdRegistroSalida])
REFERENCES [dbo].[RegistroSalida] ([Id])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[RegistroEntrada]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[RegistroEntrada]  WITH CHECK ADD FOREIGN KEY([IdEncargado])
REFERENCES [dbo].[Encargado] ([Id])
GO
ALTER TABLE [dbo].[RegistroEntrada]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
ALTER TABLE [dbo].[RegistroEntrada]  WITH CHECK ADD FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([Id])
GO
ALTER TABLE [dbo].[RegistroSalida]  WITH CHECK ADD FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categoria] ([Id])
GO
ALTER TABLE [dbo].[RegistroSalida]  WITH CHECK ADD FOREIGN KEY([IdEncargado])
REFERENCES [dbo].[Encargado] ([Id])
GO
ALTER TABLE [dbo].[RegistroSalida]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([Id])
GO
USE [master]
GO
ALTER DATABASE [InventarioCERomerodb] SET  READ_WRITE 
GO
