--TABLAS A UTILIZAR										|
--*tecnico
--*personal -->tecnico
--* personal -->usuario -->correo
--*tecnico ---> perfil
													
--------------------------------------------------------+

--31,465
--121

DECLARE @find INT;

SET @find=1;

SELECT
	personal.Personal_Nombre1+' '+personal.Personal_Nombre2+' '+
	personal.Personal_Apellido1+' '+personal.Personal_Apellido2 AS nombre,
	correo.Correo_Correo as correo,
	perfiles.Perfil_Descripcion AS perfil
FROM
	Db_Reparaciones.Proyecto.Tb_Tecnicos				AS tecnicos
INNER JOIN	
	Db_Reparaciones.Proyecto.Tb_Personal				AS personal
ON
 personal.Id_Personal = tecnicos.Id_Personal_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Usuarios				AS usuario
ON
	personal.Id_Personal = usuario.Id_Personal_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_CorreosElectronico		AS correo
ON
	correo.Id_Correo = usuario.Id_Correo_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Perfiles				AS perfiles
on
	perfiles.Id_Perfil= tecnicos.Id_Perfil_FK
 --WHERE tecnicos.Id_Tecnico = @find
 order by tecnicos.Id_Tecnico asc 

