/*
busqueda de asignacion dequipo usando el id de personal y de equipotrabajo
*/

DECLARE @asigequipo INT;
DECLARE @PERSONAL INT;
DECLARE @EQUIPO	INT;
SET @PERSONAL = 8;
SET @EQUIPO = 8;
SELECT @asigequipo = asigequipo.Id_AsignacionEquipo
FROM Db_Reparaciones.Proyecto.Tb_AsignacionEquipos AS asigequipo
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_EquiposTrabajo AS equipo
ON
	equipo.Id_EquipoTrabajo = asigequipo.Id_EquipoTrabajo_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Personal AS personal
ON
	personal.Id_Personal = asigequipo.Id_Personal_FK
WHERE personal.Id_Personal=@PERSONAL AND equipo.Id_EquipoTrabajo = @EQUIPO
select @asigequipo
go
