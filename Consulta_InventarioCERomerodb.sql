/* 
	10/Mayo/2023
	InventarioCERomerodb
	1. Kathleen Odette Calderón Linares
	2. Osmany Adalberto Lopez Lopez
	3. Miguel Alejandro García Calderón
	4. Hector Leandro Garcia Lopez
	5. José Adrián Musto Hernández

*/

-- FASE 1: Crear base de datos

CREATE DATABASE InventarioCERomerodb
GO
USE InventarioCERomerodb
GO

-- FASE 2: Crear tablas de la base de datos.

CREATE TABLE Categoria(
Id Tinyint NOT NULL Primary Key Identity(1,1),
Nombre Varchar(75) NOT NULL
);

CREATE TABLE Producto(
Id Tinyint NOT NULL Primary Key Identity(1,1),
Nombre Varchar(75) NOT NULL,
Stock Int NOT NULL,
Descripcion Varchar(200) NOT NULL,
IdCategoria Tinyint NOT NULL Foreign Key References Categoria(Id),
);

CREATE TABLE Usuario(
Id Tinyint NOT NULL Primary Key Identity(1,1),
Correo Varchar(75) NOT NULL,
Contraseña Varchar(75) NOT NULL
);

CREATE TABLE Cargo(
Id Tinyint NOT NULL Primary Key Identity(1,1),
Nombre Varchar(75) NOT NULL
);

CREATE TABLE Encargado(
Id Tinyint NOT NULL  Primary Key Identity(1,1),
Nombres Varchar(75) NOT NULL,
Apellidos Varchar(75) NOT NULL,
DUI Varchar(10)NOT NULL,
Edad varchar(3) NOT NULL,
Telefono varchar(9) NOT NULL,
IdCargo Tinyint NOT NULL Foreign Key References Cargo(Id),
);

CREATE TABLE Turno(
Id Tinyint NOT NULL Primary Key Identity(1,1),
Nombre Varchar(10) NOT NULL 
);

CREATE TABLE Proveedor(
Id Tinyint NOT NULL Primary Key Identity(1,1),
Nombres Varchar(75) NOT NULL,
Apellidos Varchar(75) NOT NULL,
DUI Varchar(10) NOT NULL,
Telefono varchar(9) NOT NULL,
Direccion Varchar(300) NOT NULL
);

CREATE TABLE RegistroEntrada(
Id Tinyint NOT NULL Primary Key Identity(1,1),
IdProducto Tinyint NOT NULL Foreign Key References Producto(Id),
IdCategoria Tinyint NOT NULL Foreign Key References Categoria(Id),
Cantidad Int NOT NULL,
IdEncargado Tinyint NOT NULL Foreign Key References Encargado(Id),
IdProveedor Tinyint NOT NULL Foreign Key References Proveedor(Id),
Fecha DateTime NOT NULL
);

CREATE TABLE RegistroSalida(
Id Int NOT NULL Primary Key Identity(1,1),
IdProducto Tinyint NOT NULL Foreign Key References Producto(Id),
IdCategoria Tinyint NOT NULL Foreign Key References Categoria(Id),
Cantidad Int NOT NULL,
IdEncargado Tinyint NOT NULL Foreign Key References Encargado(Id),
Fecha DateTime NOT NULL
);

CREATE TABLE Inventario(
Id Int NOT NULL Primary Key Identity(1,1),
Fecha DateTime NOT NULL,
IdRegistroEntrada Tinyint Foreign Key References RegistroEntrada(Id),
IdRegistroSalida Int Foreign Key References RegistroSalida(Id)
);


-- FASE 3: Practica de comandos DML

----------Insertar Datos-------------------
Insert Into Categoria(Nombre)
Values ('Cereal'), ('Leche');

Insert Into Usuario (Correo, Contraseña)
Values ('Usuario1@empresa.com', 'Usuario123')

Insert Into Usuario (Correo, Contraseña)
Values ('Usuario2@empresa.com', 'Usuario1234')

---------Modificar Datos--------------------
UPDATE Categoria SET Nombre = 'Granos Basicos' Where Id = 1;

UPDATE Usuario SET Correo = 'Usuario3@empresa.com' Where Id = 2;


------------Eliminar Datos--------------
Delete Usuario Where Id = 2
Delete Usuario Where Id = 1
Delete Categoria Where Id = 1
Delete Categoria Where Id = 2

---------------Mostrar Datos---------------------
Select * from Categoria;
Select * from Usuario;


-- FASE 4: Creación de procedimientos almacenados

USE InventarioCERomerodb
GO

--------------Guardar-------------------------------------------------------
Create Procedure SPGuardarCategoria
 @Nombre Varchar(75)
 as
 begin
 Insert into Categoria(Nombre) values (@Nombre);
End


Create Procedure SPGuardarUsuario
@Correo Varchar (75),
@Contraseña Varchar (75)
as
begin
Insert Into Usuario (Correo, Contraseña) Values (@Correo, @Contraseña);
End

------------ Modificar ------------------------------------------------------------
Create Procedure SPModificarCategoria
@Id Tinyint,
@Nombre Varchar(75)
as
begin
UPDATE Categoria SET Nombre = @Nombre Where Id = @Id;
End


Create Procedure SPModificarUsuario
@Id Tinyint,
@Correo Varchar (75),
@Contraseña Varchar (75)
as
begin
	IF(EXISTS(SELECT * FROM Usuario WHERE Id = @Id AND Contraseña = @Contraseña))
	BEGIN
		UPDATE Usuario SET Correo = @Correo Where Id = @Id;
	END;
End

Create Procedure SPModificarContraUsuario
@Id Tinyint,
@Correo Varchar (75),
@Contraseña Varchar (75),
@NewContraseña varchar(75)
as
begin
	IF(EXISTS(SELECT * FROM Usuario WHERE Id = @Id AND Contraseña = @Contraseña AND Correo = @Correo))
	BEGIN
		UPDATE Usuario SET Contraseña = @NewContraseña Where Id = @Id;
	END;
End


--------------Eliminar---------------
Create Procedure SPEliminarCategoria
@Id Tinyint
as
begin
DELETE FROM Categoria Where Id = @Id;
End


Create Procedure SPELiminarUsuario
@Id Tinyint
as
begin
DELETE FROM Usuario Where Id = @Id;
End


-----------Mostrar-------------
Create Procedure SPMostrarCategoria
as
begin
Select * From Categoria;
End


Create Procedure SPMostrarUsuario
as
begin
Select * From Usuario;
End


-- FASE 5: Agregar registros a todas las tablas de la base de datos

---------------------------TABLA USUARIO-------------------------------------------------
Insert Into Usuario (Correo, Contraseña) Values ('Usuario01@empresa.com', 'UsuarioXX01');
Insert Into Usuario (Correo, Contraseña) Values ('Usuario02@empresa.com', 'UsuarioXX02');
Insert Into Usuario (Correo, Contraseña) Values ('Usuario03@empresa.com', 'UsuarioXX03');
Insert Into Usuario (Correo, Contraseña) Values ('Usuario04@empresa.com', 'UsuarioXX04');
Insert Into Usuario (Correo, Contraseña) Values ('Usuario05@empresa.com', 'UsuarioXX05');


-------------------TABLA PRODUCTO--------------------------------
Insert Into Producto(Nombre,Stock,Descripcion,IdCategoria)
Values ('Arroz',30,'Su tipo de medicion para el almacenamiento de este producto es en libras',2)

-------------------TABLA TURNO--------------------------------
Insert Into Turno (Nombre) Values ('Matutino'),('Vespertino');

-----------------------TABLA CATEGORIA------------------------------------
Insert Into Categoria (Nombre) 
Values ('Bebidas'), ('Granos Basicos'), ('Alimentos Procesados'), ('Aceites');

---------------------TABLA CARGO-------------------------
Insert Into  Cargo (Nombre)
Values ('Director'),('Profesor'),('Encargado Cafetin');


--------------------TABLA INVENTARIO------------------------------
Insert Into  Inventario (Fecha, IdRegistroEntrada)
Values (GETDATE() ,5);

Insert Into  Inventario (Fecha ,IdRegistroSalida)
Values (GETDATE() ,3);

Insert Into  Inventario (Fecha, IdRegistroEntrada)
Values (GETDATE() ,7);

Insert Into  Inventario (Fecha, IdRegistroEntrada)
Values (GETDATE() ,6);

Insert Into  Inventario (Fecha, IdRegistroSalida)
Values (GETDATE() ,5);

--------------------TABLA PROVEEDOR------------------------------
Insert Into Proveedor(Nombres,Apellidos,DUI,Telefono,Direccion)
Values ('Jose Alberto', 'Hernandez Mendez','06462233-5','7695-7654','Sonzacate, Sonsonate El Salvador');

Insert Into Proveedor(Nombres,Apellidos,DUI,Telefono,Direccion)
Values ('Manuel Ernesto', 'Perez Martinez','06342283-3','8755-7458','Nahuilingo, Sonsonate El Salvador');

Insert Into Proveedor(Nombres,Apellidos,DUI,Telefono,Direccion)
Values ('Emeralda Tatiana', 'Jimenez Cortez','06467532-2','6437-8657','Sonsonate, Sonsonate El Salvador');

Insert Into Proveedor(Nombres,Apellidos,DUI,Telefono,Direccion)
Values ('Emilio Antonio', 'Sanchez Flores','06454565-5','6547-5776','San Julian, Sonsonate El Salvador');

Insert Into Proveedor(Nombres,Apellidos,DUI,Telefono,Direccion)
Values ('Katherine Maria', 'Lopez Garcia','06468533-1','5435-7763','San Juan Opico, La Libertad El Salvador');


--------------------TABLA ENCARGADO------------------------------
Insert Into Encargado(Nombres,Apellidos,DUI,Edad,Telefono,IdCargo)
Values ('Alvaro Julian', 'Linares Caceres', '06453564-3',32,'4374-4365',1);

Insert Into Encargado(Nombres,Apellidos,DUI,Edad,Telefono,IdCargo)
Values ('Ever Alexis', 'Lue Morales', '06454456-3',22,'4456-2984',3);

Insert Into Encargado(Nombres,Apellidos,DUI,Edad,Telefono,IdCargo)
Values ('Liza Esmeralda', 'Linares Portillo', '06453784-2',37,'7732-6722',2);

Insert Into Encargado(Nombres,Apellidos,DUI,Edad,Telefono,IdCargo)
Values ('Rosa Margarita', 'Sandoval Mendez', '06459727-2',45,'8875-3997',3);

Insert Into Encargado(Nombres,Apellidos,DUI,Edad,Telefono,IdCargo)
Values ('Pablo Ernesto', 'Perez Perez', '06474579-3',50,'6538-8428',2);

Insert Into Encargado(Nombres,Apellidos,DUI,Edad,Telefono,IdCargo)
Values ('Ernesto Luisandro', 'Martinez Linarez', '06569345-1',27,'6665-8429',2);


--------------------TABLA REGISTRO ENTRADA-------------------------------
Insert Into RegistroEntrada(IdProducto,IdCategoria,Cantidad,IdEncargado,IdProveedor,Fecha)
Values (2,3,34,8,1,GETDATE());

Insert Into RegistroEntrada(IdProducto,IdCategoria,Cantidad,IdEncargado,IdProveedor,Fecha)
Values (2,2,4,9,2,GETDATE());

Insert Into RegistroEntrada(IdProducto,IdCategoria,Cantidad,IdEncargado,IdProveedor,Fecha)
Values (2,1,33,10,1,GETDATE());

Insert Into RegistroEntrada(IdProducto,IdCategoria,Cantidad,IdEncargado,IdProveedor,Fecha)
Values (2,1,44,13,1,GETDATE());


------------------------TABLA REGISTRO SALIDA------------------------------------
Insert Into RegistroSalida(IdProducto,IdCategoria,Cantidad,IdEncargado,Fecha)
Values (2,2,34,8,GETDATE()), (2,2,47,13,GETDATE()), (2,2,33,10,GETDATE()), (2,2,23,12,GETDATE());


-- FASE 6: Creación de consultas SELECT con multi-tablas para reportes


------Consulta Para ver registros de salida y encargado de retirar-----------

Select p.Nombre as producto,
c.Nombre as Categoria,
rs.Fecha as Fechasalida,
en.Nombres +' '+ en.Apellidos as EncargadoRetirar
From Producto as p
Join Categoria as c
On p.IdCategoria = c.Id
Join RegistroSalida as rs
on rs.IdProducto =  p.Id
Join Encargado as en
on rs.IdEncargado = en.Id


------Consulta Para ver registros de Entrada y proveedor-----------

Select p.Nombre as producto,
c.Nombre as Categoria,
re.Fecha as Fechaentrada,
pr.Nombres +' '+ pr.Apellidos as Proveedor
From Producto as p
Join Categoria as c
On p.IdCategoria = c.Id
Join RegistroEntrada as re
on re.IdProducto =  p.Id
Join Proveedor as pr
on re.IdProveedor = pr.Id


-----Consulta para ver productos y su categoria----------

Select p.Nombre as Producto,
c.Nombre as Categoria
From Producto as p
Join Categoria as c
on p.IdCategoria = c.Id

