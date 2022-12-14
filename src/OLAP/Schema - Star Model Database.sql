CREATE DATABASE DW_BikeStores;
GO
USE DW_BikeStores;
GO
---CREACIO TABLA EMPLEADOS---
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Empleados](
	[Id_Empleado] [int] NOT NULL,
	[Nombre_Empleado] [nvarchar](500) NOT NULL,
	[Correo_Electronico] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Empleados] PRIMARY KEY CLUSTERED 
(
	[Id_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

---CREACION TABLA CLIENTES---
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Clientes](
	[Id_Cliente] [int] NOT NULL,
	[Nombre_completo] [nvarchar](500) NOT NULL,
	[Correo_Cliente] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[Id_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
--CREACION TABLA PRODUCTOS---
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[Id_Producto] [int] NOT NULL,
	[Nombre_Producto] [nvarchar](255) NOT NULL,
	[Nombre_Marca][nvarchar](255) NOT NULL,
	[Nombre_Categoria][nvarchar](255) NOT NULL,
	[Anio_Modelo] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[Id_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--CREACION TABLA TIENDA---
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Tienda](
	[Id_Store] [int] NOT NULL,
	[Nombre_Tienda] [nvarchar](255) NOT NULL,
	[Direccion] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Tienda] PRIMARY KEY CLUSTERED 
(
	[Id_Store] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

---CREACION TABLA TIEMPO---


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tabla_Tiempo](
	[Id_Tiempo] [date] NOT NULL,
	[Anio] [int] NOT NULL,
	[Mes] [int] NOT NULL,
	[Trimestre] [int] NOT NULL,
	[Semestre] [int] NOT NULL,
	[Dia_Semana] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Tiempo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
---CREACION TABLA HECHOS---
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Hechos_Ordenes](
	[Id_Codigo] [int] IDENTITY(1,1) NOT NULL,
	[Id_Empleado] [int] NOT NULL,
	[Id_Tiempo] [date] NOT NULL,
	[Id_Producto] [int] NOT NULL,
	[Id_Cliente] [int] NOT NULL,
	[Id_Tienda] [int] NOT NULL,
	[Total_Venta_Producto] [float] NULL,
 CONSTRAINT [PK_Hechos_Ordenes] PRIMARY KEY CLUSTERED 
(
	[Id_Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [Hechos_Ordenes]  WITH CHECK ADD FOREIGN KEY([Id_Empleado])
REFERENCES [Empleados] ([Id_Empleado])
GO
ALTER TABLE [Hechos_Ordenes]  WITH CHECK ADD FOREIGN KEY([Id_Producto])
REFERENCES [products] ([Id_Producto])
GO
ALTER TABLE [Hechos_Ordenes]  WITH CHECK ADD FOREIGN KEY([Id_Cliente])
REFERENCES [Clientes] ([Id_Cliente])
GO
ALTER TABLE [Hechos_Ordenes]  WITH CHECK ADD FOREIGN KEY([Id_Tiempo])
REFERENCES [Tabla_Tiempo] ([Id_Tiempo])
GO
ALTER TABLE [Hechos_Ordenes]  WITH CHECK ADD FOREIGN KEY([Id_Tienda])
REFERENCES [Tienda] ([Id_Store])
GO