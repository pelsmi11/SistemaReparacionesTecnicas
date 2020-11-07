/*
	VISTA USUARIO, OBSERVA SU TICKET
trablas a usar
*tickets
*trabajotecnico -->tickets
*trabajotecnico -->asignacion equipo
*trabajotecnico-->problematecnico
* trabajotecnico --> plazotiempo
*trabajoTecnico ---> estadoreparacion
*trajajotecnico --->tecnico

*/


SELECT 
	TrabajoTecnico.Id_TrabajoTecnico
	,case
	when Tecnicos.Id_Tecnico is null then 0 
	else Tecnicos.Id_Tecnico end AS IdTecnico
	,TrabajoTecnico.Id_AsignacionEquipo_FK
	,case
	when problema.ProblemaTecnico_Tipo is null then 0 
	else problema.ProblemaTecnico_Tipo end AS id_problema
	,CASE
	WHEN TrabajoTecnico.Id_Prioridad_FK is null then 0
	ELSE TrabajoTecnico.Id_Prioridad_FK END AS Id_Prioridad
	,tiempo.Plazo_TiempoInicio AS generado
	, tiempo.Plazo_TiempoFin 		
	,CASE
	WHEN trabajotecnico.Trabajo_Pendiente = CAST('FALSE' AS bit) THEN 'NO'
	WHEN trabajotecnico.Trabajo_Pendiente = CAST('TRUE' AS bit) THEN 'SI'
	ELSE trabajotecnico.Trabajo_Pendiente END AS Pendiente
	,EstadoR.EstadoR_Descripcion AS Estado

FROM Db_Reparaciones.Proyecto.Tb_Tickets AS Ticket
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_TrabajosTecnicos AS TrabajoTecnico
ON
	TrabajoTecnico.Id_TrabajoTecnico = Ticket.Id_TrabajoTecnico_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_AsignacionEquipos	AS AsignacionEquipo
ON
	AsignacionEquipo.Id_AsignacionEquipo = TrabajoTecnico.Id_AsignacionEquipo_FK
LEFT JOIN
	Db_Reparaciones.Proyecto.Tb_ProblemasTecnicos AS Problema
ON 
	Problema.Id_ProblemaTecnico = TrabajoTecnico.Id_ProblemaTecnico_FK 
LEFT JOIN
	Db_Reparaciones.Proyecto.Tb_PlazosTiempo	AS	Tiempo
ON
	Tiempo.Id_PlazoTiempo = TrabajoTecnico.Id_Plazotiempo_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_EstadoReparacion	AS	EstadoR
ON
	EstadoR.Id_EstadoReparacion = TrabajoTecnico.Id_EstadoReparacion_FK
LEFT JOIN
	Db_Reparaciones.Proyecto.Tb_Tecnicos AS Tecnicos
ON
	Tecnicos.Id_Tecnico = TrabajoTecnico.Id_Tecnico_FK
	WHERE TrabajoTecnico.Id_Tecnico_FK is null
order by TrabajoTecnico.Id_TrabajoTecnico ASC