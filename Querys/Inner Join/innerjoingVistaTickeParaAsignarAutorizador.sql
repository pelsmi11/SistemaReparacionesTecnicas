--TABLAS A UTILIZAR										|
--*trabajotecnico
--*trabajotecnico -->tecnico
--*tecnico -- >personal			|
--*trabajotecnico-> asignacionequipo		|
--*trabajotecnico -> problematecnico
--*trabajotecnico -> prioridad  		|
--*trabajotecnico --> plazotiempo
--*personal --> ubicacion
--*ubicacion -->oficinas
--*ubicacion -->edificio
--*ubicacion -->settrabajo
--*ubiacion -->piso
--*trabajotecnico -->EstadoReparacion													
--------------------------------------------------------+

--31,465
--121

SELECT
	trabajotecnico.Id_TrabajoTecnico AS TrabajoTecnico,
	tecnico.Id_Tecnico
	,equipos.Id_AsignacionEquipo AS Equipo,
	problema.ProblemaTecnico_Tipo AS Problema
	,prioridad.Prioridad_Estado AS Prioridad
	,tiempo.Plazo_TiempoInicio AS generado
	,tiempo.Plazo_TiempoFin		AS PlazoFin
	--,trabajotecnico.Trabajo_Pendiente AS Estado
	,CASE
	WHEN trabajotecnico.Trabajo_Pendiente = CAST('FALSE' AS bit) THEN 'NO'
	WHEN trabajotecnico.Trabajo_Pendiente = CAST('TRUE' AS bit) THEN 'SI'
	ELSE trabajotecnico.Trabajo_Pendiente END AS Pendiente
	,EstadoR.EstadoR_Descripcion AS Estado
FROM
	Db_Reparaciones.Proyecto.Tb_TrabajosTecnicos				AS trabajotecnico
LEFT JOIN	
	Db_Reparaciones.Proyecto.Tb_Tecnicos				AS tecnico
ON
	tecnico.Id_Tecnico = trabajotecnico.Id_Tecnico_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_AsignacionEquipos		AS equipos
ON
	equipos.Id_AsignacionEquipo = trabajotecnico.Id_AsignacionEquipo_FK
LEFT JOIN
	Db_Reparaciones.Proyecto.Tb_ProblemasTecnicos				AS problema
ON
	problema.Id_ProblemaTecnico = trabajotecnico.Id_ProblemaTecnico_FK
LEFT JOIN
	Db_Reparaciones.Proyecto.Tb_Prioridades				AS prioridad
ON
	prioridad.Id_Prioridad = trabajotecnico.Id_Prioridad_FK
LEFT JOIN
	Db_Reparaciones.Proyecto.Tb_PlazosTiempo		AS tiempo
ON
	tiempo.Id_PlazoTiempo = trabajotecnico.Id_Plazotiempo_FK
LEFT JOIN
	Db_Reparaciones.Proyecto.Tb_EstadoReparacion	AS EstadoR
on
	trabajotecnico.Id_EstadoReparacion_FK = EstadoR.Id_EstadoReparacion
order by Id_TrabajoTecnico asc
GO