--TABLAS A UTILIZAR										|
--*pesonal									|
--*personal -> asignacion app			|
--*asignacionapp-->puesto
--*personal
--*asignacionapp--->area	|
--*area---> departamento			|
--*PRODUCTO -> SALES ORDER DETAIL						|
--*SPECIAL OFERT -> SALES ORDER DETAIL					|
--------------------------------------------------------+
-- personal id, nombre, puesto, area, departamento


SELECT
	personal.Id_Personal,
	personal.Personal_Nombre1+' '+
	personal.Personal_Nombre2+' '+
	personal.Personal_Apellido1+' '+
	personal.Personal_Apellido2 AS nombrecompleto,
	puestos.Puesto_Nomre,
	areas.Area_Nombre,
	departamentos.Departamento_Nombre
FROM
	Db_Reparaciones.Proyecto.Tb_Personal			AS personal
INNER JOIN	
	Db_Reparaciones.Proyecto.Tb_AsignacionesAreaPuestoPersonal				AS app
ON
	personal.Id_Personal = app.Id_Personal_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Areas		AS areas
ON
	areas.Id_Areas = app.Id_Area_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Departamentos				AS departamentos
ON
	departamentos.Id_Departamento = areas.Id_Departamento_Fk
LEFT JOIN
	Db_Reparaciones.Proyecto.Tb_Puestos				AS puestos
ON
	puestos.Id_Puestos = app.Id_Puestos_FK

	order by personal.Id_Personal asc
GO