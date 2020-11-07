--TABLAS A UTILIZAR										|
--*Personal
--*personal -->tb_asignacionapp--> puesto				|
--*personal -> asignacion equipos-> equipotrabajo		|
--*equipotrabajo -> tipoequipo
--*equipotrabajo -> asignacionhardware -> hardware -->tipoHardware 		|
--*personal --> ubicacion
--*ubicacion -->oficinas
--*ubicacion -->edificio
--*ubicacion -->settrabajo
--*ubiacion -->piso														|
--------------------------------------------------------+

--31,465
--121
--VARIABLE PERSONAL
DECLARE @PERSONAL INT;
SET @PERSONAL=3;
--VARIABLE PERSONAL



SELECT
	Personal.Id_Personal,
	Personal.Personal_Nombre1+' '+Personal.Personal_Nombre2 as nombre,
	Personal_Apellido1+' '+Personal_Apellido2 as apellido,
	puesto.Puesto_Nomre,
	edificio.Edificio_Nombre+pisos.Piso_Numeracion+oficinas.Oficina_Numeracion+settrabajo.SetTrabajo_Numeracion AS ubicacion,
	equipo.Id_EquipoTrabajo,
	tipoequipo.Tipo_Descripcion
	,(
SELECT  hardware.Hardware_Nombre+' '+hardware.Hardware_HRz+' GHz '+hardware.Hardware_CantNucleo	

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
	INNER JOIN
	Db_Reparaciones.Proyecto.Tb_AsignacionHardwareEquipo AS asighardware
ON
	equipo.Id_EquipoTrabajo = asighardware.Id_EquipoTrabajo_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Hardware AS hardware
ON
	hardware.Id_Hardware = asighardware.Id_Hardware_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_TipoHardware		AS tipohard
ON
	tipohard.Id_TipoHardware = hardware.Id_TipoHardware_FK
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
WHERE tipohard.Id_TipoHardware=1 AND Personal.Id_Personal=@PERSONAL
) AS PROCESADOR
	,(
SELECT hardware.Hardware_Nombre+' '+hardware.Hardware_Almacenamiento+' Gb '+hardware.Hardware_Frecuencia	

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
	INNER JOIN
	Db_Reparaciones.Proyecto.Tb_AsignacionHardwareEquipo AS asighardware
ON
	equipo.Id_EquipoTrabajo = asighardware.Id_EquipoTrabajo_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Hardware AS hardware
ON
	hardware.Id_Hardware = asighardware.Id_Hardware_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_TipoHardware		AS tipohard
ON
	tipohard.Id_TipoHardware = hardware.Id_TipoHardware_FK
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
WHERE tipohard.Id_TipoHardware=2 AND Personal.Id_Personal=@PERSONAL ) AS RAM
	,(SELECT  hardware.Hardware_Nombre+' '+hardware.Hardware_Almacenamiento+' Gb '+hardware.Hardware_VelocidadLectura+' LECTURA '+hardware.Hardware_VelocidadEscritura+' ESCRITURA'

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
	INNER JOIN
	Db_Reparaciones.Proyecto.Tb_AsignacionHardwareEquipo AS asighardware
ON
	equipo.Id_EquipoTrabajo = asighardware.Id_EquipoTrabajo_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Hardware AS hardware
ON
	hardware.Id_Hardware = asighardware.Id_Hardware_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_TipoHardware		AS tipohard
ON
	tipohard.Id_TipoHardware = hardware.Id_TipoHardware_FK
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
WHERE tipohard.Id_TipoHardware=4 AND Personal.Id_Personal=@PERSONAL) AS DISCODURO
	,(	SELECT hardware.Hardware_Nombre

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
	INNER JOIN
	Db_Reparaciones.Proyecto.Tb_AsignacionHardwareEquipo AS asighardware
ON
	equipo.Id_EquipoTrabajo = asighardware.Id_EquipoTrabajo_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Hardware AS hardware
ON
	hardware.Id_Hardware = asighardware.Id_Hardware_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_TipoHardware		AS tipohard
ON
	tipohard.Id_TipoHardware = hardware.Id_TipoHardware_FK
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
WHERE tipohard.Id_TipoHardware=3 AND Personal.Id_Personal=@PERSONAL
) AS PLACA
	,(SELECT hardware.Hardware_Nombre

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
	INNER JOIN
	Db_Reparaciones.Proyecto.Tb_AsignacionHardwareEquipo AS asighardware
ON
	equipo.Id_EquipoTrabajo = asighardware.Id_EquipoTrabajo_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Hardware AS hardware
ON
	hardware.Id_Hardware = asighardware.Id_Hardware_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_TipoHardware		AS tipohard
ON
	tipohard.Id_TipoHardware = hardware.Id_TipoHardware_FK
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
WHERE tipohard.Id_TipoHardware=5 AND Personal.Id_Personal=@PERSONAL
) AS TARJETARED
	,(SELECT marcas.Marca_Nombre+' '+hardware.Hardware_Nombre

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
	INNER JOIN
	Db_Reparaciones.Proyecto.Tb_AsignacionHardwareEquipo AS asighardware
ON
	equipo.Id_EquipoTrabajo = asighardware.Id_EquipoTrabajo_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Hardware AS hardware
ON
	hardware.Id_Hardware = asighardware.Id_Hardware_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_TipoHardware		AS tipohard
ON
	tipohard.Id_TipoHardware = hardware.Id_TipoHardware_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Marcas AS marcas
ON
	marcas.Id_Marca= hardware.Id_Marca_FK
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
WHERE tipohard.Id_TipoHardware=11 AND Personal.Id_Personal=@PERSONAL
) AS TARJETAGRAFICA

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
WHERE Personal.Id_Personal=@PERSONAL
GO
