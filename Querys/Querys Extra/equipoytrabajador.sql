
select EQUIPO.Id_EquipoTrabajo,PERSONAL.Id_Personal
FROM Db_Reparaciones.Proyecto.Tb_EquiposTrabajo AS EQUIPO
inner join
Db_Reparaciones.Proyecto.Tb_AsignacionEquipos as asignacion
on
EQUIPO.Id_EquipoTrabajo = asignacion.Id_EquipoTrabajo_FK
inner join
Db_Reparaciones.Proyecto.Tb_Personal AS PERSONAL
ON
PERSONAL.Id_Personal = asignacion.Id_Personal_FK