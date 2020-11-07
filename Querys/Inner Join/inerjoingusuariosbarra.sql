--TABLAS A UTILIZAR										|
--*Personal
--*personal -->tb_asignacionapp--> puesto				|
--*personal -> asignacion equipos-> equipotrabajo		|
--*equipotrabajo -> tipoequipo 							|
--*														|
--------------------------------------------------------+

--31,465
--121

SELECT
	Personal.Id_Personal AS IdPersonal,
	Personal.Personal_Nombre1+' '+Personal.Personal_Nombre2+' '+Personal_Apellido1+' '+Personal_Apellido2 AS Nombre,
	puesto.Puesto_Nomre AS Puesto,
	equipo.Id_EquipoTrabajo,
	tipoequipo.Tipo_Descripcion
	
FROM
	Db_Reparaciones.Proyecto.Tb_Personal				AS Personal
INNER JOIN	
	Db_Reparaciones.Proyecto.Tb_AsignacionesAreaPuestoPersonal				AS asigapp
ON
	personal.Id_Personal = asigapp.Id_Personal_FK 
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Puestos		AS puesto
ON
	puesto.Id_Puestos = asigapp.Id_Puestos_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_AsignacionEquipos				AS asignacionequipos
ON
	Personal.Id_Personal = asignacionequipos.Id_Personal_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_EquiposTrabajo				AS equipo
ON
	equipo.Id_EquipoTrabajo = asignacionequipos.Id_EquipoTrabajo_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_TipoEquipo		AS tipoequipo
ON
	tipoequipo.Id_TipoEquipo = equipo.Id_TipoEquipo_FK
order by Id_Personal asc
GO