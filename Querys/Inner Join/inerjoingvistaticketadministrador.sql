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
	personal.Personal_Nombre1+' '+Personal_Apellido1 as Nombre,
	equipos.Id_AsignacionEquipo AS Equipo,
	problema.ProblemaTecnico_Tipo AS Problema
	,prioridad.Prioridad_Estado AS Prioridad
	,tiempo.Plazo_TiempoInicio AS generado
	,tiempo.Plazo_TiempoFin		AS PlazoFin
	,edificio.Edificio_Nombre+pisos.Piso_Numeracion+oficinas.Oficina_Numeracion+settrabajo.SetTrabajo_Numeracion AS ubicacion
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
	INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Personal		AS personal
ON
	personal.Id_Personal = tecnico.Id_Personal_FK
INNER JOIN
Db_Reparaciones.Proyecto.Tb_Ubicaciones AS ubicacion
ON
ubicacion.Id_Ubicacion = Personal.Id_Ubicaciones_FK
INNER JOIN
Db_Reparaciones.Proyecto.Tb_Edificios	AS edificio
ON 
	edificio.Id_Edificio= ubicacion.Id_Edificio_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Pisos	AS pisos
ON
	pisos.Id_Piso = ubicacion.ID_Piso_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Oficinas	AS oficinas
ON 
	oficinas.Id_Oficina = ubicacion.Id_Oficina_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_SetTrabajos		AS settrabajo
on
	settrabajo.Id_SetTrabajo = ubicacion.ID_SetTrabajo_FK
LEFT JOIN
	Db_Reparaciones.Proyecto.Tb_EstadoReparacion	AS EstadoR
on
	trabajotecnico.Id_EstadoReparacion_FK = EstadoR.Id_EstadoReparacion
order by Id_TrabajoTecnico asc
GO