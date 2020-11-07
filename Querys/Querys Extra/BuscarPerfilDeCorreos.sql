/*
correos
correos -->usuarios
usuarios -->personal
personal -->tecnicos
tecnicos -->perfil
*/


select 
		PERFILES.Id_Perfil
		
FROM
 Db_Reparaciones.Proyecto.Tb_CorreosElectronico AS CORREOS
 INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Usuarios		AS USUARIOS
ON
	CORREOS.Id_Correo =USUARIOS.Id_Correo_FK
INNER JOIN
Db_Reparaciones.Proyecto.Tb_Personal AS	PERSONAL
ON
PERSONAL.Id_Personal = USUARIOS.Id_Personal_FK
INNER JOIN
Db_Reparaciones.Proyecto.Tb_Tecnicos AS TECNICOS
on
PERSONAL.Id_Personal= TECNICOS.Id_Personal_FK
INNER JOIN
Db_Reparaciones.Proyecto.Tb_Perfiles AS PERFILES
ON
PERFILES.Id_Perfil = TECNICOS.Id_Perfil_FK
WHERE
CORREOS.Correo_Correo='candidatocant4@outlook.com' AND CORREOS.Correo_Contrasenia='cadidato123456789'
