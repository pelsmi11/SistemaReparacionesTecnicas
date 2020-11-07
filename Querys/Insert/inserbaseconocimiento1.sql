DECLARE @TRAAJOTECNICO INT;
SET @TRAAJOTECNICO=2


INSERT INTO Db_Reparaciones.Proyecto.Tb_BasesConocimientos
           ([Id_TrabajoTecnico_FK]
           ,[Base_Solucion])
     VALUES
           (@TRAAJOTECNICO
           ,'cambio de cable usb de la impresora')
GO


