USE [Db_Reparaciones]
GO
INSERT INTO Db_Reparaciones.Proyecto.Tb_PlazosTiempo
           (Plazo_TiempoInicio,Plazo_TiempoFin)
     VALUES
           (GETDATE(),CAST(AS datetime))
GO

INSERT INTO Db_Reparaciones.[Proyecto].[Tb_TrabajosTecnicos]
           ([Id_Tecnico_FK]
           ,[Id_AsignacionEquipo_FK]
           ,[Id_ProblemaTecnico_FK]
           ,[Id_Plazotiempo_FK]
           ,[Id_Prioridad_FK]
           ,[Trabajo_Descripcion]
           ,[Trabajo_Pendiente]
           ,[Id_EstadoReparacion_FK])
     VALUES
           (<Id_Tecnico_FK, int,>
           ,(SELECT  asigequipo.Id_AsignacionEquipo
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
           ,<Id_ProblemaTecnico_FK, int,>
           ,(SELECT TOP 1 tiempo.Id_PlazoTiempo 
FROM
Db_Reparaciones.Proyecto.Tb_PlazosTiempo AS tiempo
ORDER BY tiempo.Id_PlazoTiempo DESC)
           ,<Id_Prioridad_FK, int,>
           ,<Trabajo_Descripcion, nvarchar(1000),>
           ,CAST('FALSE' AS bit)
           ,<Id_EstadoReparacion_FK, int,>)
GO
 INSERT INTO Db_Reparaciones.Proyecto.Tb_Tickets
           ([Id_TrabajoTecnico_FK])
     VALUES
           ((SELECT TOP 1 trabajo.Id_TrabajoTecnico
FROM
Db_Reparaciones.Proyecto.Tb_TrabajosTecnicos AS trabajo
ORDER BY trabajo.Id_TrabajoTecnico DESC))

GO


