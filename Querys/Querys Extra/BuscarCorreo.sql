DECLARE @CORREO NVARCHAR(40);
SELECT @CORREO= CORREO.Correo_Correo
FROM	Db_Reparaciones.Proyecto.Tb_CorreosElectronico	AS CORREO
INNER JOIN
Db_Reparaciones.Proyecto.Tb_Usuarios AS USUARIO
ON
CORREO.Id_Correo = USUARIO.Id_Correo_FK
INNER JOIN
Db_Reparaciones.Proyecto.Tb_Personal AS PERSONAL
ON
PERSONAL.Id_Personal = USUARIO.Id_Personal_FK
INNER JOIN
Db_Reparaciones.Proyecto.Tb_AsignacionEquipos AS ASIGNACIONEQUIPO
ON
PERSONAL.Id_Personal = ASIGNACIONEQUIPO.Id_Personal_FK
INNER JOIN
Db_Reparaciones.Proyecto.Tb_TrabajosTecnicos AS TRABAJO
ON
ASIGNACIONEQUIPO.Id_AsignacionEquipo=TRABAJO.Id_AsignacionEquipo_FK
WHERE TRABAJO.Id_TrabajoTecnico=5
select @CORREO