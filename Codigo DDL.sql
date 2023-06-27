--Creacion de base de datos
create database Daños_SITP

	--Creacion de tabla independientes

--Tabla tipo de daños
create table Tipos_Daños (
	Id_Daño int primary key,
	Tipo_Daño varchar(10)
);

--Tabla de buses
create table Buses (
	Num_Bus varchar (10) primary key,
	Placa varchar (10)
);

--Tabla de tipo de usuario
create table Tipo_Usuario (
	Cod_Tipo int primary key,
	Tipo_Usuario varchar(15)
);

	--Creacion de tablas dependientes

--Tabla de daños
create table Daños ( 
	Cod_Daño int primary key,
	Id_Daño int null,
	Nombre_Daño varchar(35),
	constraint FK_Daños foreign key (Id_Daño) references Tipos_Daños (Id_Daño)
);

--Tabla de Inf_Usuarios
create table Inf_Usuarios (
	Id_Usuario int primary key,
	Cod_Tipo int,
	Nombre1 varchar (20),
	Nombre2 varchar (20),
	Apellido1 varchar (30),
	Apellido2 varchar (30),
	Num_Celular bigint,
	Correo varchar (50),
	constraint FK_Usuario foreign key (Cod_Tipo) references Tipo_Usuario (Cod_Tipo)
);

--Tabla de reportes
create table Reportes (
	Id_Reporte int primary key,
	Cod_Tipo int,
	Id_Usuario int,
	Num_Bus varchar (10),
	Cod_Daño int,
	Fecha_Reporte varchar (15),
	constraint FK_T_Usu foreign key (Cod_Tipo) references Tipo_Usuario (Cod_Tipo),
	constraint FK_Users foreign key (Id_Usuario) references Inf_Usuarios (Id_Usuario),
	constraint FK_Bus foreign key (Num_Bus) references Buses (Num_Bus),
	constraint FK_Daño foreign key (Cod_Daño) references Daños (Cod_Daño)
);

--Creacion de procemientos

	--Tabla buses
create procedure Pl_Buses
@Num_Bus varchar (10),
@Placa varchar (10)
as begin
insert into Buses (Num_Bus,Placa) values (@Num_Bus,@Placa);
select*from Buses
end
go

	--Tabla informacion usuarios
create procedure If_Usuarios
@Id_Usuario int,
@Cod_Tipo int,
@Nombre1 varchar (20),
@Nombre2 varchar (20),
@Apellido1 varchar (30),
@Apellido2 varchar (30),
@Num_Celular bigint,
@Correo varchar (50)
as begin 
insert into Inf_Usuarios (Id_Usuario,Cod_Tipo,Nombre1,Nombre2,Apellido1,Apellido2,Num_Celular,Correo) values (@Id_Usuario,@Cod_Tipo,@Nombre1,
@Nombre2,@Apellido1,@Apellido2,@Num_Celular,@Correo);
select*from Inf_Usuarios;
end
go

	--Tabla reportes
create procedure In_Reportes 
@Id_Reporte int,
@Cod_Tipo int,
@Id_Usuario int,
@Num_Bus varchar (10),
@Cod_Daño int,
@Fecha_Reporte varchar (15)
as begin
insert into Reportes (Id_Reporte,Cod_Tipo,Id_Usuario,Num_Bus,Cod_Daño,Fecha_Reporte) values (@Id_Reporte,@Cod_Tipo,@Id_Usuario,
@Num_Bus,@Cod_Daño,@Fecha_Reporte);
select*from Reportes;
end
go

--Vistas

	--Vista de Usuario y Fecha
create view Usu_Fecha
as
select Inf_Usuarios.Id_Usuario,Inf_Usuarios.Nombre1,Inf_Usuarios.Apellido1,Reportes.Fecha_Reporte
from Inf_Usuarios
INNER JOIN Reportes on Inf_Usuarios.Id_Usuario=Reportes.Id_Usuario


	--Vista de Usuario y Daño
create view Usu_Daños
as
select Reportes.Id_Usuario,Daños.Nombre_Daño,Reportes.Fecha_Reporte
from Daños
INNER JOIN Reportes on Daños.Cod_Daño=Reportes.Cod_Daño

	--Vista de conteo de daños
create view Veces_repo
as
select Cod_Daño, count(*) as 'Numero de veces reportado' 
from Reportes 
group by Cod_Daño;

	--Vista de conteo de buses
create view Veces_Bus
as
select Num_Bus, count(*) as 'Numero de veces reportado' 
from Reportes 
group by Num_Bus;

	--Vista de conteo de usuarios

create view Veces_Usu
as
select Id_Usuario, count(*) as 'Numero de veces que ha reportado' 
from Reportes 
group by Id_Usuario;