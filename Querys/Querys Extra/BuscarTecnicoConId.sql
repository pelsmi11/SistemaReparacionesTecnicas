SELECT
	TECNICO.Id_Tecnico
	,PERSONAL.Personal_Nombre1+' '+PERSONAL.Personal_Apellido1
FROM
Db_Reparaciones.Proyecto.Tb_Tecnicos AS TECNICO
INNER JOIN
Db_Reparaciones.Proyecto.Tb_Personal AS PERSONAL
ON
PERSONAL.Id_Personal = TECNICO.Id_Personal_FK
order by TECNICO.Id_Tecnico asc