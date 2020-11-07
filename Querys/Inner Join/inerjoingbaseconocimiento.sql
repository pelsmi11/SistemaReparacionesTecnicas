--TABLAS A UTILIZAR										|
--*trabajotecnico
--*baseconocimiento -->trabajotecnico

													
--------------------------------------------------------+

--31,465
--121

DECLARE @find INT;
DECLARE @problema INT;
SET @find=10;
SET @problema=3;
SELECT
	trabajotecnico.Id_TrabajoTecnico AS No_Ticket,
	trabajotecnico.Trabajo_Descripcion as Descripcion,
	base.Base_Solucion AS Solucion
FROM
	Db_Reparaciones.Proyecto.Tb_TrabajosTecnicos				AS trabajotecnico
LEFT JOIN	
	Db_Reparaciones.Proyecto.Tb_BasesConocimientos				AS base
ON
 trabajotecnico.Id_TrabajoTecnico = base.Id_TrabajoTecnico_FK
 INNER JOIN
 Db_Reparaciones.Proyecto.Tb_ProblemasTecnicos	AS PROBLEMA
 ON
 PROBLEMA.Id_ProblemaTecnico = trabajotecnico.Id_ProblemaTecnico_FK
 WHERE trabajotecnico.Id_AsignacionEquipo_FK = @find AND PROBLEMA.Id_ProblemaTecnico = 3
order by Id_TrabajoTecnico asc
