--TABLAS A UTILIZAR										|
--*Personal
--*personal -->tb_asignacionapp--> puesto				|
--*personal -> asignacion equipos-> equipotrabajo		|
--*equipotrabajo -> tipoequipo
--*equipotrabajo -> asignacionhardware -> hardware 		|
--*personal --> ubicacion
--*ubicacion -->oficinas
--*ubicacion -->edificio
--*ubicacion -->settrabajo
--*ubiacion -->piso														|
--------------------------------------------------------+

--31,465
--121

SELECT
	Personal.Id_Personal,
	Personal.Personal_Nombre1+' '+Personal.Personal_Nombre2 as nombre,
	Personal_Apellido1+' '+Personal_Apellido2 as apellido,
	puesto.Puesto_Nomre,
	edificio.Edificio_Nombre+pisos.Piso_Numeracion+oficinas.Oficina_Numeracion+settrabajo.SetTrabajo_Numeracion AS ubicacion,
	equipo.Id_EquipoTrabajo,
	tipoequipo.Tipo_Descripcion
	--,hardware.Hardware_Nombre+' '+hardware.Hardware_HRz+' GHz '+hardware.Hardware_CantNucleo+' nucleos '+hardware.Hardware_MemoriaCache AS procesador
	--,hardware.Hardware_Nombre+' '+hardware.Hardware_Almacenamiento+' Gb '+hardware.Hardware_Frecuencia+' frecuencia'	AS ram
	--,hardware.Hardware_Nombre+' '+hardware.Hardware_Almacenamiento+' Gb '+hardware.Hardware_VelocidadEscritura+' velocidad escritura '+hardware.Hardware_VelocidadLectura+' velocidad escritura '	AS DISCO_DURO
	
FROM
	Proyecto.Tb_Personal				AS Personal
INNER JOIN	
	Proyecto.Tb_AsignacionesAreaPuestoPersonal				AS asigapp
ON
	personal.Id_Personal = asigapp.Id_Personal_FK 
LEFT JOIN
	Proyecto.Tb_Puestos		AS puesto
ON
	puesto.Id_Puestos = asigapp.Id_Puestos_FK
INNER JOIN
	Proyecto.Tb_AsignacionEquipos				AS asignacionequipos
ON
	Personal.Id_Personal = asignacionequipos.Id_Personal_FK
INNER JOIN
	Proyecto.Tb_EquiposTrabajo				AS equipo
ON
	equipo.Id_EquipoTrabajo = asignacionequipos.Id_EquipoTrabajo_FK
INNER JOIN
	Proyecto.Tb_TipoEquipo		AS tipoequipo
ON
	tipoequipo.Id_TipoEquipo = equipo.Id_TipoEquipo_FK
--	INNER JOIN
--	Proyecto.Tb_AsignacionHardwareEquipo AS asighard
--ON
--	equipo.Id_EquipoTrabajo = asighard.Id_EquipoTrabajo_FK
--	INNER JOIN
--	Proyecto.Tb_Hardware	AS hardware
--ON
--	hardware.Id_Hardware = asighard.Id_Hardware_FK
	INNER JOIN
Proyecto.Tb_Ubicaciones AS ubicacion
ON
ubicacion.Id_Ubicacion = Personal.Id_Ubicaciones_FK
INNER JOIN
Proyecto.Tb_Edificios	AS edificio
ON 
	edificio.Id_Edificio= ubicacion.Id_Edificio_FK
INNER JOIN
	Proyecto.Tb_Pisos	AS pisos
ON
	pisos.Id_Piso = ubicacion.ID_Piso_FK
INNER JOIN
	Proyecto.Tb_Oficinas	AS oficinas
ON 
	oficinas.Id_Oficina = ubicacion.Id_Oficina_FK
INNER JOIN
	Proyecto.Tb_SetTrabajos		AS settrabajo
on
	settrabajo.Id_SetTrabajo = ubicacion.ID_SetTrabajo_FK
order by Id_Personal asc
GO