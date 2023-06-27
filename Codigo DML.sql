--Insercion en tablas independientes

	--Codigo tipo daños

insert into Tipos_Daños (Id_Daño,Tipo_Daño) values (001,'Graves')
insert into Tipos_Daños (Id_Daño,Tipo_Daño) values (002,'Leves')

	--Codigo tipo usuarios

insert into Tipo_Usuario (Cod_Tipo,Tipo_Usuario) values (001,'Operador')
insert into Tipo_Usuario (Cod_Tipo,Tipo_Usuario) values (002,'P_Natural')

	--Identificador de buses

execute Pl_Buses 'Z80-5762','JFH-864'
execute Pl_Buses 'Z50-7392',''
execute Pl_Buses 'Z40-8952','HDP-264'
execute Pl_Buses 'Z20-3584','FEA-550'
execute Pl_Buses 'Z50-6944',''
execute Pl_Buses 'Z50-2261','GAY-489'

--Insercion en tablas dependientes

	--Codigo daños

insert into Daños (Cod_Daño,Id_Daño,Nombre_Daño) values (01,001,'Caja de cambios')
insert into Daños (Cod_Daño,Id_Daño,Nombre_Daño) values (02,001,'Catalizador')
insert into Daños (Cod_Daño,Id_Daño,Nombre_Daño) values (03,001,'Circuito de refrigeracion')
insert into Daños (Cod_Daño,Id_Daño,Nombre_Daño) values (04,001,'Correa reventada')
insert into Daños (Cod_Daño,Id_Daño,Nombre_Daño) values (05,001,'Fallas de inyectores')
insert into Daños (Cod_Daño,Id_Daño,Nombre_Daño) values (06,001,'Filtro obstruyendo')
insert into Daños (Cod_Daño,Id_Daño,Nombre_Daño) values (07,001,'Fugas de aceite')
insert into Daños (Cod_Daño,Id_Daño,Nombre_Daño) values (08,001,'Llantas')
insert into Daños (Cod_Daño,Id_Daño,Nombre_Daño) values (09,001,'Motor')
insert into Daños (Cod_Daño,Id_Daño,Nombre_Daño) values (010,001,'Valvulas fallando')
insert into Daños (Cod_Daño,Id_Daño,Nombre_Daño) values (011,002,'Sillas en mal estado')
insert into Daños (Cod_Daño,Id_Daño,Nombre_Daño) values (012,002,'Puertas mal cierre')
insert into Daños (Cod_Daño,Id_Daño,Nombre_Daño) values (013,002,'Fallas en timbre')
insert into Daños (Cod_Daño,Id_Daño,Nombre_Daño) values (014,002,'Fallas torniquete')
insert into Daños (Cod_Daño,Id_Daño,Nombre_Daño) values (015,002,'Tubos mal estado')
insert into Daños (Cod_Daño,Id_Daño,Nombre_Daño) values (016,002,'Manija ventana')

	--Informacion Usuarios

execute If_Usuarios 1038747693,001,'Jose','Roberto','Bernal','Mora',3228940851,'JoseBerM10@gmail.com'
execute If_Usuarios 1078484893,002,'Maria','Jose','Rosalba','Castillo',3009454354,'MarJo309@hotmail.com'
execute If_Usuarios 789964382,001,'Juan','David','Torres','Cortes',3157583734,'Locogamer@gmail.com'
execute If_Usuarios 1032793549,002,'Natalia','','Castillo','Rosas',3228640284,'Guisa0709@hotmail.com'
execute If_Usuarios 788893759,001,'Fabian','Javier','Rodriguez','Tobon',3007483948,'Bandidopte4@gmail.com'
execute If_Usuarios 1074973245,002,'Marcela','','Perez','Perez',3158392857,'Marcelauwu09@hotmail.com'

	--Reportes

execute In_Reportes 001,001,1038747693,'Z80-5762',003,'15-07-2022'
execute In_Reportes 002,001,788893759,'Z20-3584',002,'13-05-2023'
execute In_Reportes 003,001,789964382,'Z40-8952',009,'22-11-2021'
execute In_Reportes 004,002,1032793549,'Z50-2261',013,'30-04-2022'
execute In_Reportes 005,002,1074973245,'Z50-7392',015,'29-02-2023'
execute In_Reportes 006,002,1078484893,'Z50-6944',014,'07-01-2021'

	--Resultados de tablas

select * from Tipos_Daños

select * from Tipo_Usuario

select * from Buses

select*from Daños

select*from Inf_Usuarios

select*from Reportes

	--Ejecucion de vistas

select*from Usu_Fecha

select * from Usu_Daños

select*from Veces_repo

select * from Veces_Bus

select * from Veces_Usu 