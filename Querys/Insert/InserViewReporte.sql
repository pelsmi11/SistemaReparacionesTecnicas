--inicio plazo tiempo
/*
inserta el tiempo en que se genero el reporte
*/
--insertplazotiempo
INSERT INTO Db_Reparaciones.Proyecto.Tb_PlazosTiempo
           (Plazo_TiempoInicio)
     VALUES
           (GETDATE())
GO


--inicio variables a utilizar
DECLARE @PERSONAL INT;
DECLARE @EQUIPO	INT;
DECLARE @DESCRIPCION NVARCHAR(1000);

	--insertar variables
		SET @PERSONAL = 8;
		SET @EQUIPO = 8;
		set @DESCRIPCION='mi impresora se atasca a la 5ta hoja'
	--insertar variables
--fin variables a utilizar

INSERT INTO Db_Reparaciones.Proyecto.Tb_TrabajosTecnicos 
           ([Id_AsignacionEquipo_FK]
           ,[Id_Plazotiempo_FK]
           ,[Trabajo_Descripcion]
           ,[Trabajo_Pendiente]
           ,[Id_EstadoReparacion_FK])
     VALUES
           ((SELECT  asigequipo.Id_AsignacionEquipo
FROM Db_Reparaciones.Proyecto.Tb_AsignacionEquipos AS asigequipo
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_EquiposTrabajo AS equipo
ON
	equipo.Id_EquipoTrabajo = asigequipo.Id_EquipoTrabajo_FK
INNER JOIN
	Db_Reparaciones.Proyecto.Tb_Personal AS personal
ON
	personal.Id_Personal = asigequipo.Id_Personal_FK
WHERE personal.Id_Personal=@PERSONAL AND equipo.Id_EquipoTrabajo = @EQUIPO
)
           ,(SELECT TOP 1 tiempo.Id_PlazoTiempo 
FROM
Db_Reparaciones.Proyecto.Tb_PlazosTiempo AS tiempo
ORDER BY tiempo.Id_PlazoTiempo DESC)
           ,@DESCRIPCION
           ,CAST('FALSE' AS bit)
           ,1)

		   INSERT INTO Db_Reparaciones.Proyecto.Tb_Tickets
           ([Id_TrabajoTecnico_FK])
     VALUES
           ((SELECT TOP 1 trabajo.Id_TrabajoTecnico
FROM
Db_Reparaciones.Proyecto.Tb_TrabajosTecnicos AS trabajo
ORDER BY trabajo.Id_TrabajoTecnico DESC))

GO


