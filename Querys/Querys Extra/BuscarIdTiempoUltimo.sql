DECLARE @tiempo INT;
SELECT TOP 1 @tiempo= tiempo.Id_PlazoTiempo 
FROM
Db_Reparaciones.Proyecto.Tb_PlazosTiempo AS tiempo
ORDER BY tiempo.Id_PlazoTiempo DESC

SELECT @tiempo