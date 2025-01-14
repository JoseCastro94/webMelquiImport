USE [master]
GO
/****** Object:  Database [MEQUI_IMPORT]    Script Date: 30/10/2024 16:49:54 ******/
CREATE DATABASE [MEQUI_IMPORT]
GO

ALTER DATABASE [MEQUI_IMPORT] SET QUERY_STORE = OFF
GO
USE [MEQUI_IMPORT]
GO
/****** Object:  User [admmeq]    Script Date: 30/10/2024 16:49:54 ******/
CREATE USER [admmeq] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admmeq]
GO
/****** Object:  Schema [Contabilidad]    Script Date: 30/10/2024 16:49:54 ******/
CREATE SCHEMA [Contabilidad]
GO
/****** Object:  Schema [Logistica]    Script Date: 30/10/2024 16:49:54 ******/
CREATE SCHEMA [Logistica]
GO
/****** Object:  Schema [Maestros]    Script Date: 30/10/2024 16:49:54 ******/
CREATE SCHEMA [Maestros]
GO
/****** Object:  Schema [Seguridad]    Script Date: 30/10/2024 16:49:54 ******/
CREATE SCHEMA [Seguridad]
GO
/****** Object:  Schema [Ventas]    Script Date: 30/10/2024 16:49:54 ******/
CREATE SCHEMA [Ventas]
GO
/****** Object:  Table [Contabilidad].[Moneda]    Script Date: 30/10/2024 16:49:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contabilidad].[Moneda](
	[Cia_nCodigo] [int] NULL,
	[Mon_nCodigo] [int] NOT NULL,
	[Mon_cDescripcion] [varchar](100) NULL,
	[Mon_cUsuReg] [varchar](20) NULL,
	[Mon_fFecReg] [datetime] NULL,
 CONSTRAINT [PK_Moneda] PRIMARY KEY CLUSTERED 
(
	[Mon_nCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Contabilidad].[TipoCambio]    Script Date: 30/10/2024 16:49:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contabilidad].[TipoCambio](
	[Cia_nCodigo] [int] NULL,
	[Tca_nCodigo] [int] NOT NULL,
	[Tca_fFecDoc] [datetime] NULL,
	[Tca_nValorCompra] [decimal](18, 2) NULL,
	[Tca_nValorVenta] [decimal](18, 2) NULL,
	[Tca_cUsuReg] [varchar](20) NULL,
	[Tca_fFecReg] [datetime] NULL,
 CONSTRAINT [PK_TipoCambio] PRIMARY KEY CLUSTERED 
(
	[Tca_nCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Logistica].[Catalogo]    Script Date: 30/10/2024 16:49:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Logistica].[Catalogo](
	[Cia_nCodigo] [int] NULL,
	[Cma_nCodigo] [int] IDENTITY(1,1) NOT NULL,
	[Cma_cCodigo] [varchar](20) NULL,
	[Cma_cDescripcion] [varchar](200) NULL,
	[Cma_cEstado] [char](1) NULL,
	[Cma_cUsuReg] [varchar](20) NULL,
	[Cma_fFecReg] [datetime] NULL,
 CONSTRAINT [PK_Catalogo] PRIMARY KEY CLUSTERED 
(
	[Cma_nCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Maestros].[Compania]    Script Date: 30/10/2024 16:49:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Maestros].[Compania](
	[Cia_nCodigo] [int] IDENTITY(1,1) NOT NULL,
	[Cia_cNombre] [varchar](100) NOT NULL,
	[Cia_cEstado] [char](1) NOT NULL,
 CONSTRAINT [PK_Compania] PRIMARY KEY CLUSTERED 
(
	[Cia_nCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Seguridad].[Usuario]    Script Date: 30/10/2024 16:49:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Seguridad].[Usuario](
	[Cia_nCodigo] [int] NULL,
	[Usu_nCodigo] [int] IDENTITY(1,1) NOT NULL,
	[Usu_cUsuario] [varchar](20) NOT NULL,
	[Usu_cNombres] [varchar](100) NULL,
	[Usu_cApellidos] [varchar](100) NULL,
	[Usu_cDocIdentidad] [varchar](20) NULL,
	[Usu_cEstado] [char](1) NULL,
	[Usu_cUsuReg] [varchar](20) NULL,
	[Usu_fFecReg] [datetime] NULL,
 CONSTRAINT [PK_Usuario_1] PRIMARY KEY CLUSTERED 
(
	[Usu_cUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[Cliente]    Script Date: 30/10/2024 16:49:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[Cliente](
	[Cia_nCodigo] [int] NULL,
	[Cli_nCodigo] [int] NOT NULL,
	[Cli_cRuc] [varchar](20) NULL,
	[Cli_cRazonSocial] [varchar](120) NULL,
	[Cli_cDireccion] [varchar](150) NULL,
	[Cli_cUsuReg] [varchar](20) NULL,
	[Cli_fFecReg] [datetime] NULL,
 CONSTRAINT [PK_Moneda] PRIMARY KEY CLUSTERED 
(
	[Cli_nCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[DocumentosCab]    Script Date: 30/10/2024 16:49:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[DocumentosCab](
	[Cia_nCodigo] [int] NULL,
	[Doc_nCodigo] [int] NOT NULL,
	[Ser_nCodigo] [int] NOT NULL,
	[Doc_cNumero] [varchar](20) NULL,
	[Doc_fFecDoc] [datetime] NULL,
	[Doc_fFecVencimiento] [datetime] NULL,
	[Tca_nValorVenta] [decimal](18, 2) NULL,
	[Mon_nCodigo] [int] NULL,
	[Ven_nCodigo] [int] NULL,
	[Doc_cGlosa] [varchar](200) NULL,
	[Doc_cUsuReg] [varchar](20) NULL,
	[Doc_fFecReg] [datetime] NULL,
	[Cli_nCodigo] [int] NULL,
 CONSTRAINT [PK_DocumentosCab] PRIMARY KEY CLUSTERED 
(
	[Doc_nCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[DocumentosDet]    Script Date: 30/10/2024 16:49:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[DocumentosDet](
	[Cia_nCodigo] [int] NULL,
	[Doc_nCodigo] [int] NULL,
	[Dod_nCodigo] [int] NOT NULL,
	[Doc_nItem] [int] NULL,
	[Cma_nCodigo] [int] NULL,
	[Cma_cCodigo] [varchar](20) NULL,
	[Cma_cDescripcion] [varchar](200) NULL,
	[Doc_nCantidad] [decimal](18, 2) NULL,
	[Doc_nValorUnitario] [decimal](18, 2) NULL,
	[Doc_nDescuento] [decimal](18, 2) NULL,
	[Doc_nSubtotal] [decimal](18, 2) NULL,
	[Doc_nIgvValor] [decimal](18, 2) NULL,
	[Doc_nIgvPorcentaje] [decimal](18, 2) NULL,
	[Doc_cUsuReg] [varchar](20) NULL,
	[Doc_fFecReg] [datetime] NULL,
 CONSTRAINT [PK_DocumentosDet] PRIMARY KEY CLUSTERED 
(
	[Dod_nCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[Serie]    Script Date: 30/10/2024 16:49:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[Serie](
	[Cia_nCodigo] [int] NULL,
	[Ser_nCodigo] [int] NOT NULL,
	[Ser_cCodigo] [varchar](10) NULL,
	[Ser_nCorrelativo] [int] NULL,
	[Ser_cUsuReg] [varchar](20) NULL,
	[Ser_fFecReg] [datetime] NULL,
 CONSTRAINT [PK_Serie] PRIMARY KEY CLUSTERED 
(
	[Ser_nCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Ventas].[Vendedor]    Script Date: 30/10/2024 16:49:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Ventas].[Vendedor](
	[Cia_nCodigo] [int] NULL,
	[Ven_nCodigo] [int] NOT NULL,
	[Ven_cNombre] [varchar](100) NULL,
	[Ven_cApellidos] [varchar](100) NULL,
	[Ven_cEstado] [char](1) NULL,
	[Ven_cUsuReg] [varchar](20) NULL,
	[Ven_fFecReg] [datetime] NULL,
 CONSTRAINT [PK_Vendedor] PRIMARY KEY CLUSTERED 
(
	[Ven_nCodigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [Contabilidad].[Moneda] ([Cia_nCodigo], [Mon_nCodigo], [Mon_cDescripcion], [Mon_cUsuReg], [Mon_fFecReg]) VALUES (1, 1, N'Soles', N'user', CAST(N'2024-10-30T07:23:22.560' AS DateTime))
INSERT [Contabilidad].[Moneda] ([Cia_nCodigo], [Mon_nCodigo], [Mon_cDescripcion], [Mon_cUsuReg], [Mon_fFecReg]) VALUES (2, 2, N'Dolar', N'user', CAST(N'2024-10-30T07:23:33.853' AS DateTime))
GO
SET IDENTITY_INSERT [Logistica].[Catalogo] ON 

INSERT [Logistica].[Catalogo] ([Cia_nCodigo], [Cma_nCodigo], [Cma_cCodigo], [Cma_cDescripcion], [Cma_cEstado], [Cma_cUsuReg], [Cma_fFecReg]) VALUES (1, 21, N'PROD001', N'Palet de Madera', N'A', N'Admin', CAST(N'2024-10-30T08:57:06.480' AS DateTime))
INSERT [Logistica].[Catalogo] ([Cia_nCodigo], [Cma_nCodigo], [Cma_cCodigo], [Cma_cDescripcion], [Cma_cEstado], [Cma_cUsuReg], [Cma_fFecReg]) VALUES (2, 22, N'PROD002', N'Contenedor de Almacenamiento', N'A', N'Admin', CAST(N'2024-10-30T08:57:06.480' AS DateTime))
INSERT [Logistica].[Catalogo] ([Cia_nCodigo], [Cma_nCodigo], [Cma_cCodigo], [Cma_cDescripcion], [Cma_cEstado], [Cma_cUsuReg], [Cma_fFecReg]) VALUES (3, 23, N'PROD003', N'Caja de Cartón Mediana', N'A', N'Admin', CAST(N'2024-10-30T08:57:06.480' AS DateTime))
INSERT [Logistica].[Catalogo] ([Cia_nCodigo], [Cma_nCodigo], [Cma_cCodigo], [Cma_cDescripcion], [Cma_cEstado], [Cma_cUsuReg], [Cma_fFecReg]) VALUES (4, 24, N'PROD004', N'Film Transparente', N'A', N'Admin', CAST(N'2024-10-30T08:57:06.480' AS DateTime))
INSERT [Logistica].[Catalogo] ([Cia_nCodigo], [Cma_nCodigo], [Cma_cCodigo], [Cma_cDescripcion], [Cma_cEstado], [Cma_cUsuReg], [Cma_fFecReg]) VALUES (5, 25, N'PROD005', N'Cinta Adhesiva Industrial', N'A', N'Admin', CAST(N'2024-10-30T08:57:06.480' AS DateTime))
INSERT [Logistica].[Catalogo] ([Cia_nCodigo], [Cma_nCodigo], [Cma_cCodigo], [Cma_cDescripcion], [Cma_cEstado], [Cma_cUsuReg], [Cma_fFecReg]) VALUES (6, 26, N'PROD006', N'Tornillos Metralla', N'A', N'Admin', CAST(N'2024-10-30T08:57:06.480' AS DateTime))
INSERT [Logistica].[Catalogo] ([Cia_nCodigo], [Cma_nCodigo], [Cma_cCodigo], [Cma_cDescripcion], [Cma_cEstado], [Cma_cUsuReg], [Cma_fFecReg]) VALUES (7, 27, N'PROD007', N'Guantes de Seguridad', N'A', N'Admin', CAST(N'2024-10-30T08:57:06.480' AS DateTime))
INSERT [Logistica].[Catalogo] ([Cia_nCodigo], [Cma_nCodigo], [Cma_cCodigo], [Cma_cDescripcion], [Cma_cEstado], [Cma_cUsuReg], [Cma_fFecReg]) VALUES (8, 28, N'PROD008', N'Estantería Metálica', N'A', N'Admin', CAST(N'2024-10-30T08:57:06.480' AS DateTime))
INSERT [Logistica].[Catalogo] ([Cia_nCodigo], [Cma_nCodigo], [Cma_cCodigo], [Cma_cDescripcion], [Cma_cEstado], [Cma_cUsuReg], [Cma_fFecReg]) VALUES (9, 29, N'PROD009', N'Elevador Hidráulico', N'A', N'Admin', CAST(N'2024-10-30T08:57:06.480' AS DateTime))
INSERT [Logistica].[Catalogo] ([Cia_nCodigo], [Cma_nCodigo], [Cma_cCodigo], [Cma_cDescripcion], [Cma_cEstado], [Cma_cUsuReg], [Cma_fFecReg]) VALUES (10, 30, N'PROD010', N'Montacargas Eléctrico', N'A', N'Admin', CAST(N'2024-10-30T08:57:06.480' AS DateTime))
INSERT [Logistica].[Catalogo] ([Cia_nCodigo], [Cma_nCodigo], [Cma_cCodigo], [Cma_cDescripcion], [Cma_cEstado], [Cma_cUsuReg], [Cma_fFecReg]) VALUES (11, 31, N'PROD011', N'Carretilla Manual', N'A', N'Admin', CAST(N'2024-10-30T08:57:06.480' AS DateTime))
INSERT [Logistica].[Catalogo] ([Cia_nCodigo], [Cma_nCodigo], [Cma_cCodigo], [Cma_cDescripcion], [Cma_cEstado], [Cma_cUsuReg], [Cma_fFecReg]) VALUES (12, 32, N'PROD012', N'Tijeras Industriales', N'A', N'Admin', CAST(N'2024-10-30T08:57:06.480' AS DateTime))
INSERT [Logistica].[Catalogo] ([Cia_nCodigo], [Cma_nCodigo], [Cma_cCodigo], [Cma_cDescripcion], [Cma_cEstado], [Cma_cUsuReg], [Cma_fFecReg]) VALUES (13, 33, N'PROD013', N'Palet de Plástico', N'A', N'Admin', CAST(N'2024-10-30T08:57:06.480' AS DateTime))
INSERT [Logistica].[Catalogo] ([Cia_nCodigo], [Cma_nCodigo], [Cma_cCodigo], [Cma_cDescripcion], [Cma_cEstado], [Cma_cUsuReg], [Cma_fFecReg]) VALUES (14, 34, N'PROD014', N'Sellador de Cartón', N'A', N'Admin', CAST(N'2024-10-30T08:57:06.480' AS DateTime))
INSERT [Logistica].[Catalogo] ([Cia_nCodigo], [Cma_nCodigo], [Cma_cCodigo], [Cma_cDescripcion], [Cma_cEstado], [Cma_cUsuReg], [Cma_fFecReg]) VALUES (15, 35, N'PROD015', N'Cuerda de Nylon', N'A', N'Admin', CAST(N'2024-10-30T08:57:06.480' AS DateTime))
INSERT [Logistica].[Catalogo] ([Cia_nCodigo], [Cma_nCodigo], [Cma_cCodigo], [Cma_cDescripcion], [Cma_cEstado], [Cma_cUsuReg], [Cma_fFecReg]) VALUES (16, 36, N'PROD016', N'Cascos de Seguridad', N'A', N'Admin', CAST(N'2024-10-30T08:57:06.480' AS DateTime))
INSERT [Logistica].[Catalogo] ([Cia_nCodigo], [Cma_nCodigo], [Cma_cCodigo], [Cma_cDescripcion], [Cma_cEstado], [Cma_cUsuReg], [Cma_fFecReg]) VALUES (17, 37, N'PROD017', N'Chaleco Reflectante', N'A', N'Admin', CAST(N'2024-10-30T08:57:06.480' AS DateTime))
INSERT [Logistica].[Catalogo] ([Cia_nCodigo], [Cma_nCodigo], [Cma_cCodigo], [Cma_cDescripcion], [Cma_cEstado], [Cma_cUsuReg], [Cma_fFecReg]) VALUES (18, 38, N'PROD018', N'Carro de Carga', N'A', N'Admin', CAST(N'2024-10-30T08:57:06.480' AS DateTime))
INSERT [Logistica].[Catalogo] ([Cia_nCodigo], [Cma_nCodigo], [Cma_cCodigo], [Cma_cDescripcion], [Cma_cEstado], [Cma_cUsuReg], [Cma_fFecReg]) VALUES (19, 39, N'PROD019', N'Bolsa de Embalaje', N'A', N'Admin', CAST(N'2024-10-30T08:57:06.480' AS DateTime))
INSERT [Logistica].[Catalogo] ([Cia_nCodigo], [Cma_nCodigo], [Cma_cCodigo], [Cma_cDescripcion], [Cma_cEstado], [Cma_cUsuReg], [Cma_fFecReg]) VALUES (20, 40, N'PROD020', N'Transpaleta Manual', N'A', N'Admin', CAST(N'2024-10-30T08:57:06.480' AS DateTime))
SET IDENTITY_INSERT [Logistica].[Catalogo] OFF
GO
SET IDENTITY_INSERT [Maestros].[Compania] ON 

INSERT [Maestros].[Compania] ([Cia_nCodigo], [Cia_cNombre], [Cia_cEstado]) VALUES (1, N'MEQUI IMPORT', N'1')
SET IDENTITY_INSERT [Maestros].[Compania] OFF
GO
SET IDENTITY_INSERT [Seguridad].[Usuario] ON 

INSERT [Seguridad].[Usuario] ([Cia_nCodigo], [Usu_nCodigo], [Usu_cUsuario], [Usu_cNombres], [Usu_cApellidos], [Usu_cDocIdentidad], [Usu_cEstado], [Usu_cUsuReg], [Usu_fFecReg]) VALUES (1, 1, N'admin', N'Nombre', N'Apellidos', N'12345678', N'1', N'jmejia', CAST(N'2024-10-23T23:46:18.253' AS DateTime))
SET IDENTITY_INSERT [Seguridad].[Usuario] OFF
GO
INSERT [Ventas].[Cliente] ([Cia_nCodigo], [Cli_nCodigo], [Cli_cRuc], [Cli_cRazonSocial], [Cli_cDireccion], [Cli_cUsuReg], [Cli_fFecReg]) VALUES (1, 1, N'20100123456', N'Lima Cía. de Comercio S.A.', N'Av. Javier Prado Este 1234, Lima, Perú', N'admin', CAST(N'2024-10-30T10:14:49.820' AS DateTime))
INSERT [Ventas].[Cliente] ([Cia_nCodigo], [Cli_nCodigo], [Cli_cRuc], [Cli_cRazonSocial], [Cli_cDireccion], [Cli_cUsuReg], [Cli_fFecReg]) VALUES (2, 2, N'20456789012', N'Distribuciones Peruanas S.A.', N'Calle 2 N° 567, San Isidro, Lima, Perú', N'admin', CAST(N'2024-10-30T10:14:49.820' AS DateTime))
INSERT [Ventas].[Cliente] ([Cia_nCodigo], [Cli_nCodigo], [Cli_cRuc], [Cli_cRazonSocial], [Cli_cDireccion], [Cli_cUsuReg], [Cli_fFecReg]) VALUES (3, 3, N'20543210001', N'Productos Alimenticios S.A.C.', N'Av. La Marina 456, San Miguel, Lima, Perú', N'admin', CAST(N'2024-10-30T10:14:49.820' AS DateTime))
INSERT [Ventas].[Cliente] ([Cia_nCodigo], [Cli_nCodigo], [Cli_cRuc], [Cli_cRazonSocial], [Cli_cDireccion], [Cli_cUsuReg], [Cli_fFecReg]) VALUES (4, 4, N'20123456789', N'Comercializadora El Buen Sabor S.A.', N'Calle Los Olivos 789, Miraflores, Lima, Perú', N'admin', CAST(N'2024-10-30T10:14:49.820' AS DateTime))
INSERT [Ventas].[Cliente] ([Cia_nCodigo], [Cli_nCodigo], [Cli_cRuc], [Cli_cRazonSocial], [Cli_cDireccion], [Cli_cUsuReg], [Cli_fFecReg]) VALUES (5, 5, N'20654321098', N'Tecnología y Ventas S.A.C.', N'Av. Arequipa 2345, Lince, Lima, Perú', N'admin', CAST(N'2024-10-30T10:14:49.820' AS DateTime))
INSERT [Ventas].[Cliente] ([Cia_nCodigo], [Cli_nCodigo], [Cli_cRuc], [Cli_cRazonSocial], [Cli_cDireccion], [Cli_cUsuReg], [Cli_fFecReg]) VALUES (6, 6, N'20345678901', N'Ferretería La Fama S.R.L.', N'Calle Huancavelica 102, Villa El Salvador, Lima, Perú', N'admin', CAST(N'2024-10-30T10:14:49.820' AS DateTime))
INSERT [Ventas].[Cliente] ([Cia_nCodigo], [Cli_nCodigo], [Cli_cRuc], [Cli_cRazonSocial], [Cli_cDireccion], [Cli_cUsuReg], [Cli_fFecReg]) VALUES (7, 7, N'20765432109', N'Muebles y Decoraciones S.A.C.', N'Av. Javier Prado 1122, La Victoria, Lima, Perú', N'admin', CAST(N'2024-10-30T10:14:49.820' AS DateTime))
INSERT [Ventas].[Cliente] ([Cia_nCodigo], [Cli_nCodigo], [Cli_cRuc], [Cli_cRazonSocial], [Cli_cDireccion], [Cli_cUsuReg], [Cli_fFecReg]) VALUES (8, 8, N'20432109876', N'Electrodomésticos Lima S.A.', N'Calle Miraflores 345, San Borja, Lima, Perú', N'admin', CAST(N'2024-10-30T10:14:49.820' AS DateTime))
INSERT [Ventas].[Cliente] ([Cia_nCodigo], [Cli_nCodigo], [Cli_cRuc], [Cli_cRazonSocial], [Cli_cDireccion], [Cli_cUsuReg], [Cli_fFecReg]) VALUES (9, 9, N'20234567890', N'Juguetes y Juegos S.A.C.', N'Av. La Libertad 5678, Santiago de Surco, Lima, Perú', N'admin', CAST(N'2024-10-30T10:14:49.820' AS DateTime))
INSERT [Ventas].[Cliente] ([Cia_nCodigo], [Cli_nCodigo], [Cli_cRuc], [Cli_cRazonSocial], [Cli_cDireccion], [Cli_cUsuReg], [Cli_fFecReg]) VALUES (10, 10, N'20876543210', N'Bebidas y Refrescos S.A.', N'Calle Los Abetos 1234, Surquillo, Lima, Perú', N'admin', CAST(N'2024-10-30T10:14:49.820' AS DateTime))
GO
INSERT [Ventas].[Serie] ([Cia_nCodigo], [Ser_nCodigo], [Ser_cCodigo], [Ser_nCorrelativo], [Ser_cUsuReg], [Ser_fFecReg]) VALUES (1, 1, N'F001', 1, N'jmejia', CAST(N'2024-10-30T14:36:23.053' AS DateTime))
GO
INSERT [Ventas].[Vendedor] ([Cia_nCodigo], [Ven_nCodigo], [Ven_cNombre], [Ven_cApellidos], [Ven_cEstado], [Ven_cUsuReg], [Ven_fFecReg]) VALUES (1, 1, N'Caceres Quispe', N'Juan Carlos', N'A', N'user', CAST(N'2024-10-30T07:21:27.350' AS DateTime))
INSERT [Ventas].[Vendedor] ([Cia_nCodigo], [Ven_nCodigo], [Ven_cNombre], [Ven_cApellidos], [Ven_cEstado], [Ven_cUsuReg], [Ven_fFecReg]) VALUES (2, 2, N'Palacios Carbajal', N'Sergio', N'A', N'user', CAST(N'2024-10-30T07:21:52.467' AS DateTime))
GO
ALTER TABLE [Ventas].[DocumentosCab]  WITH CHECK ADD  CONSTRAINT [FK_DocumentosCab_Compania] FOREIGN KEY([Cia_nCodigo])
REFERENCES [Maestros].[Compania] ([Cia_nCodigo])
GO
ALTER TABLE [Ventas].[DocumentosCab] CHECK CONSTRAINT [FK_DocumentosCab_Compania]
GO
ALTER TABLE [Ventas].[DocumentosCab]  WITH CHECK ADD  CONSTRAINT [FK_DocumentosCab_Moneda] FOREIGN KEY([Mon_nCodigo])
REFERENCES [Contabilidad].[Moneda] ([Mon_nCodigo])
GO
ALTER TABLE [Ventas].[DocumentosCab] CHECK CONSTRAINT [FK_DocumentosCab_Moneda]
GO
ALTER TABLE [Ventas].[DocumentosCab]  WITH CHECK ADD  CONSTRAINT [FK_DocumentosCab_Serie] FOREIGN KEY([Ser_nCodigo])
REFERENCES [Ventas].[Serie] ([Ser_nCodigo])
GO
ALTER TABLE [Ventas].[DocumentosCab] CHECK CONSTRAINT [FK_DocumentosCab_Serie]
GO
ALTER TABLE [Ventas].[DocumentosDet]  WITH CHECK ADD  CONSTRAINT [FK_DocumentosDet_Catalogo] FOREIGN KEY([Cma_nCodigo])
REFERENCES [Logistica].[Catalogo] ([Cma_nCodigo])
GO
ALTER TABLE [Ventas].[DocumentosDet] CHECK CONSTRAINT [FK_DocumentosDet_Catalogo]
GO
ALTER TABLE [Ventas].[DocumentosDet]  WITH CHECK ADD  CONSTRAINT [FK_DocumentosDet_DocumentosCab] FOREIGN KEY([Doc_nCodigo])
REFERENCES [Ventas].[DocumentosCab] ([Doc_nCodigo])
GO
ALTER TABLE [Ventas].[DocumentosDet] CHECK CONSTRAINT [FK_DocumentosDet_DocumentosCab]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarDocumentoCab]    Script Date: 30/10/2024 16:49:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertarDocumentoCab]
    @Ser_nCodigo INT,
    @Doc_fFecDoc DATE,
    @Doc_fFecVencimiento DATE,
    @Tca_nValorVenta DECIMAL(18, 2),
    @Mon_nCodigo INT,
    @Ven_nCodigo INT,
    @Doc_cGlosa VARCHAR(200),
	@Cli_nCodigo INT 
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Doc_nCodigo INT;
    DECLARE @Ser_cCodigo VARCHAR(10);
    DECLARE @Ser_nCorrelativo INT;
    DECLARE @Doc_cNumero VARCHAR(20);
	DECLARE @Doc_cUsuReg VARCHAR(20);
	DECLARE @Cia_nCodigo INT;

	SET @Doc_cUsuReg = 'admin';
	SET @Cia_nCodigo = 1; -- Codigo compañia

	SELECT @Doc_nCodigo = ISNULL(MAX(Doc_nCodigo), 0) + 1
    FROM Ventas.DocumentosCab;

    SELECT @Ser_nCorrelativo = ISNULL(MAX(Ser_nCorrelativo), 0)
    FROM Ventas.Serie
    WHERE Ser_nCodigo = @Ser_nCodigo;

	SELECT @Ser_cCodigo = Ser_cCodigo
    FROM Ventas.Serie
    WHERE Ser_nCodigo = @Ser_nCodigo;

    SET @Doc_cNumero = @Ser_cCodigo + '-' + RIGHT('00000000' + CAST(@Ser_nCorrelativo AS VARCHAR(8)), 8);

    INSERT INTO Ventas.DocumentosCab (
        Cia_nCodigo,
        Doc_nCodigo,
        Ser_nCodigo,
        Doc_cNumero,
        Doc_fFecDoc,
        Doc_fFecVencimiento,
        Tca_nValorVenta,
        Mon_nCodigo,
        Ven_nCodigo,
        Doc_cGlosa,
        Doc_cUsuReg,
        Doc_fFecReg,
		Cli_nCodigo 
    )
    VALUES (
        @Cia_nCodigo,
        @Doc_nCodigo,
        @Ser_nCodigo,
        @Doc_cNumero,
        @Doc_fFecDoc,
        @Doc_fFecVencimiento,
        @Tca_nValorVenta,
        @Mon_nCodigo,
        @Ven_nCodigo,
        @Doc_cGlosa,
        @Doc_cUsuReg,
        GETDATE(),
		@Cli_nCodigo
    );

    IF @@ROWCOUNT > 0
    BEGIN
        UPDATE Ventas.Serie
        SET Ser_nCorrelativo = @Ser_nCorrelativo + 1
        WHERE Ser_nCodigo = @Ser_nCodigo

		SELECT @Doc_nCodigo AS Doc_nNumero, @Doc_cNumero AS Doc_cNumero
    END
	ELSE
	BEGIN
	   SELECT 0 AS Doc_nNumero,  NULL AS Doc_cNumero
	END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertarDocumentoDet]    Script Date: 30/10/2024 16:49:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_InsertarDocumentoDet]
    @Doc_nCodigo INT,
    @Doc_nItem INT,
    @Cma_nCodigo INT,
    @Cma_cCodigo VARCHAR(20),
    @Cma_cDescripcion VARCHAR(200),
    @Doc_nCantidad DECIMAL(18, 2),
    @Doc_nValorUnitario DECIMAL(18, 2),
    @Doc_nDescuento DECIMAL(18, 2),
    @Doc_nSubtotal DECIMAL(18, 2),
    @Doc_nIgvValor DECIMAL(18, 2),
    @Doc_nIgvPorcentaje DECIMAL(18, 2)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Dod_nCodigo INT;
	DECLARE @Doc_cUsuReg VARCHAR(20);
	DECLARE @Cia_nCodigo INT;
	SET @Cia_nCodigo = 1; -- Codigo compañia

	SET @Doc_cUsuReg = 'admin'

    SELECT @Dod_nCodigo = ISNULL(MAX(Dod_nCodigo), 0) + 1
    FROM Ventas.DocumentosDet;

    INSERT INTO Ventas.DocumentosDet (
        Cia_nCodigo,
        Doc_nCodigo,
        Dod_nCodigo,
        Doc_nItem,
        Cma_nCodigo,
        Cma_cCodigo,
        Cma_cDescripcion,
        Doc_nCantidad,
        Doc_nValorUnitario,
        Doc_nDescuento,
        Doc_nSubtotal,
        Doc_nIgvValor,
        Doc_nIgvPorcentaje,
        Doc_cUsuReg,
        Doc_fFecReg
    )
    VALUES (
        @Cia_nCodigo,
        @Doc_nCodigo,
        @Dod_nCodigo,
        @Doc_nItem,
        @Cma_nCodigo,
        @Cma_cCodigo,
        @Cma_cDescripcion,
        @Doc_nCantidad,
        @Doc_nValorUnitario,
        @Doc_nDescuento,
        @Doc_nSubtotal,
        @Doc_nIgvValor,
        @Doc_nIgvPorcentaje,
        @Doc_cUsuReg,
        GETDATE() 
    );

END

GO
USE [master]
GO
ALTER DATABASE [MEQUI_IMPORT] SET  READ_WRITE 
GO
