SELECT 
	TrabajoTecnico.Id_TrabajoTecnico
	,
	Tecnicos.Id_Tecnico 
	
	,TrabajoTecnico.Id_AsignacionEquipo_FK
	,
	problema.ProblemaTecnico_Tipo 
	
	,
	TrabajoTecnico.Id_Prioridad_FK 
	,tiempo.Plazo_TiempoInicio AS generado
	, tiempo.Plazo_TiempoFin 
	,edificio.Edificio_Nombre+pisos.Piso_Numeracion+oficinas.Oficina_Numeracion+settrabajo.SetTrabajo_Numeracion AS ubicacioN	
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
INNER JOIN
Db_Reparaciones.Proyecto.Tb_Personal AS PERSONAL
ON
PERSONAL.Id_Personal = AsignacionEquipo.Id_Personal_FK
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
	where TrabajoTecnico.Id_Tecnico_FK IS NULL
order by TrabajoTecnico.Id_TrabajoTecnico ASC