--TABLAS A UTILIZAR	
--*tecnicos									|
--*tecnicos -> perfiles				|
--*tecnicos-->personal									|
--*personal -->tb_asignacionapp--> puesto				|
--*personal -> asignacion equipos-> equipotrabajo		|
--*equipotrabajo -> tipoequipo 							|
--*														|
--------------------------------------------------------+
SELECT Id_Tecnico
      ,Personal.Personal_Nombre1+' '+Personal.Personal_Nombre2+' '+Personal.Personal_Apellido1+' '+Personal.Personal_Apellido2 AS NombreCompleto
      ,'AREA '+areas.Area_Nombre+' DEL DEPARTAMENTO DE '+departamentos.Departamento_Nombre AS Puesto
	  ,perfiles.Perfil_Descripcion AS Perfil
	  ,equipo.Id_EquipoTrabajo AS Equipo
  FROM [Db_Reparaciones].[Proyecto].[Tb_Tecnicos]	AS tecnicos
  INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Perfiles	AS perfiles
ON
	perfiles.Id_Perfil = tecnicos.Id_Perfil_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Personal AS Personal
ON
	Personal.Id_Personal= tecnicos.Id_Personal_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_AsignacionesAreaPuestoPersonal AS asignacionapp
ON
	asignacionapp.Id_Personal_FK = Personal.Id_Personal
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Areas	AS areas
ON
	areas.Id_Areas=asignacionapp.Id_Area_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Departamentos AS departamentos
ON
	departamentos.Id_Departamento = areas.Id_Departamento_Fk
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_AsignacionEquipos	AS asignacionequipos
ON
	Personal.Id_Personal = asignacionequipos.Id_Personal_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_EquiposTrabajo AS equipo
ON
	equipo.Id_EquipoTrabajo = asignacionequipos.Id_EquipoTrabajo_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_TipoEquipo AS tipoequipo
ON
	tipoequipo.Id_TipoEquipo = equipo.Id_TipoEquipo_FK
WHERE perfiles.Id_Perfil=5
go