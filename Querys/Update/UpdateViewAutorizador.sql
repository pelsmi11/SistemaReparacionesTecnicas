
UPDATE Db_Reparaciones.Proyecto.Tb_PlazosTiempo
   SET 
      [Plazo_TiempoFin] = CAST(('9/11/2018 23:11:53') AS datetime)
 WHERE Id_PlazoTiempo=(SELECT tiempo.Id_PlazoTiempo
FROM
Db_Reparaciones.Proyecto.Tb_PlazosTiempo AS tiempo
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_TrabajosTecnicos AS TRABAJO
ON 
tiempo.Id_PlazoTiempo = TRABAJO.Id_Plazotiempo_FK
WHERE TRABAJO.Id_TrabajoTecnico=(6))


UPDATE Db_Reparaciones.Proyecto.Tb_TrabajosTecnicos 
   SET [Id_Tecnico_FK] = 4
      ,[Id_ProblemaTecnico_FK] = 3
      ,[Id_Prioridad_FK] = 1
 WHERE [Id_TrabajoTecnico]=6
 /*
----correo
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
----correo
*/

