--Creacion de base de datos
create database Da�os_SITP

	--Creacion de tabla independientes

--Tabla tipo de da�os
create table Tipos_Da�os (
	Id_Da�o int primary key,
	Tipo_Da�o varchar(10)
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

--Tabla de da�os
create table Da�os ( 
	Cod_Da�o int primary key,
	Id_Da�o int null,
	Nombre_Da�o varchar(35),
	constraint FK_Da�os foreign key (Id_Da�o) references Tipos_Da�os (Id_Da�o)
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
	Cod_Da�o int,
	Fecha_Reporte varchar (15),
	constraint FK_T_Usu foreign key (Cod_Tipo) references Tipo_Usuario (Cod_Tipo),
	constraint FK_Users foreign key (Id_Usuario) references Inf_Usuarios (Id_Usuario),
	constraint FK_Bus foreign key (Num_Bus) references Buses (Num_Bus),
	constraint FK_Da�o foreign key (Cod_Da�o) references Da�os (Cod_Da�o)
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
@Cod_Da�o int,
@Fecha_Reporte varchar (15)
as begin
insert into Reportes (Id_Reporte,Cod_Tipo,Id_Usuario,Num_Bus,Cod_Da�o,Fecha_Reporte) values (@Id_Reporte,@Cod_Tipo,@Id_Usuario,
@Num_Bus,@Cod_Da�o,@Fecha_Reporte);
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


	--Vista de Usuario y Da�o
create view Usu_Da�os
as
select Reportes.Id_Usuario,Da�os.Nombre_Da�o,Reportes.Fecha_Reporte
from Da�os
INNER JOIN Reportes on Da�os.Cod_Da�o=Reportes.Cod_Da�o

	--Vista de conteo de da�os
create view Veces_repo
as
select Cod_Da�o, count(*) as 'Numero de veces reportado' 
from Reportes 
group by Cod_Da�o;

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