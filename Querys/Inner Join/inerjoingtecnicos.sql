--TABLAS A UTILIZAR										|
--*tecnicos									|
--*tecnicos -> perfiles				|
--*tecnicos-->personal
--*personal
--*Usuarios--->personal	|
--*Usuarios---> correoelectronico			|
--*PRODUCTO -> SALES ORDER DETAIL						|
--*SPECIAL OFERT -> SALES ORDER DETAIL					|
--------------------------------------------------------+



SELECT
	tecnicos.Id_Tecnico,
	personal.Personal_Nombre1+' '+
	personal.Personal_Nombre2+' '+
	personal.Personal_Apellido1+' '+
	personal.Personal_Apellido2,
	perfil.Perfil_Descripcion,
	correos.Correo_Correo
FROM
	Proyecto.Tb_Tecnicos			AS tecnicos
INNER JOIN	
	Proyecto.Tb_Perfiles				AS perfil
ON
	perfil.Id_Perfil = tecnicos.Id_Perfil_FK
INNER JOIN
	Proyecto.Tb_Personal		AS personal
ON
	personal.Id_Personal = tecnicos.Id_Personal_FK
INNER JOIN
	Proyecto.Tb_Usuarios				AS Usuarios
ON
	personal.Id_Personal = Usuarios.Id_Personal_FK
INNER JOIN
	Proyecto.Tb_CorreosElectronico				AS correos
ON
	correos.Id_Correo = Usuarios.Id_Usuario

	order by tecnicos.Id_Tecnico asc
GO