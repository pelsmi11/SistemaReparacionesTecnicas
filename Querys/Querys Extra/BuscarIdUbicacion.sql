/*
busca el id de la ubicacion usando
las id de edificio, piso, oficina y set
*/
DECLARE @variable INT;
select @variable = UBICACION.Id_Ubicacion
FROM Db_Reparaciones.Proyecto.Tb_Ubicaciones	AS UBICACION
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Edificios		AS EDIFICIO
ON
	EDIFICIO.Id_Edificio=UBICACION.Id_Edificio_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Pisos			AS PISOS
ON
	PISOS.Id_Piso=UBICACION.ID_Piso_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Oficinas		AS OFICINAS
ON
	OFICINAS.Id_Oficina=UBICACION.Id_Oficina_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_SetTrabajos		AS SETT
ON
	SETT.Id_SetTrabajo =UBICACION.ID_SetTrabajo_FK
where EDIFICIO.Edificio_Nombre='B' AND PISOS.Piso_Numeracion='2' AND OFICINAS.Oficina_Numeracion='2' AND SETT.SetTrabajo_Numeracion='11'
select @variable AS id_ubicacion