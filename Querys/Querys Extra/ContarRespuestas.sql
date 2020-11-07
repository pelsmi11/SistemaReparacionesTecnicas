SELECT
respuestas.Respuesta_Descripcion,
    COUNT(respuestas.Respuesta_Descripcion) AS CANTIDAD
FROM
	Db_Reparaciones.Proyecto.Tb_TrabajosTecnicos AS trabajos
INNER JOIN	
	Db_Reparaciones.Proyecto.Tb_SatisfaccionEncuesta AS encuesta
ON
	trabajos.Id_TrabajoTecnico = encuesta.Id_TrabajoTecnico_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Respuestas		AS respuestas
ON
	respuestas.Id_Respuesta = encuesta.Id_Respuesta_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Preguntas				AS pregunta
ON
	pregunta.Id_Pregunta = respuestas.Id_Pregunta_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Tecnicos AS tecnicos
ON
	tecnicos.Id_Tecnico = trabajos.Id_Tecnico_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Personal AS personal
ON
	personal.Id_Personal = tecnicos.Id_Personal_FK
WHERE tecnicos.Id_Tecnico=3
GROUP BY
respuestas.Respuesta_Descripcion;