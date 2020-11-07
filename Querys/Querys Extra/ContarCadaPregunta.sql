DECLARE @TECNICO INT;
SET @TECNICO=3;
DECLARE @PESIMO INT;
DECLARE @MALO INT;
DECLARE @REGULAR INT;
DECLARE @BUENO INT;
DECLARE @EXELENTE INT;

SELECT
@PESIMO = COUNT(respuestas.Respuesta_Descripcion)
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
WHERE tecnicos.Id_Tecnico=@TECNICO AND respuestas.Respuesta_Descripcion='PESIMO' 
GROUP BY
respuestas.Respuesta_Descripcion;

--------PESIMO

-----MALO
SELECT
@MALO = COUNT(respuestas.Respuesta_Descripcion)
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
WHERE tecnicos.Id_Tecnico=@TECNICO AND respuestas.Respuesta_Descripcion='MALO' 
GROUP BY
respuestas.Respuesta_Descripcion;

--------MALO

-----REGULAR
SELECT
@REGULAR = COUNT(respuestas.Respuesta_Descripcion)
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
WHERE tecnicos.Id_Tecnico=@TECNICO AND respuestas.Respuesta_Descripcion='REGULAR' 
GROUP BY
respuestas.Respuesta_Descripcion;

--------REGULAR

-----BUENO
SELECT
@BUENO = COUNT(respuestas.Respuesta_Descripcion)
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
WHERE tecnicos.Id_Tecnico=@TECNICO AND respuestas.Respuesta_Descripcion='BUENO' 
GROUP BY
respuestas.Respuesta_Descripcion;

--------BUENO

-----EXELETE
SELECT
@EXELENTE = COUNT(respuestas.Respuesta_Descripcion)
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
WHERE tecnicos.Id_Tecnico=@TECNICO AND respuestas.Respuesta_Descripcion='EXELENTE' 
GROUP BY
respuestas.Respuesta_Descripcion;

--------BUENO


SELECT @PESIMO  AS PESIMO
,@MALO AS MALO
,@REGULAR AS REGULAR
,@BUENO		AS BUENO
,@EXELENTE	AS EXELENTE

