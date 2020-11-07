USE [Db_Reparaciones]
GO

--pregunta uno rango 1,2,3,4,5[pesimo,malo,regular,bueno,exelente]
DECLARE @trabajo INT;
set @trabajo =4;
DECLARE @repuesta1 INT;
set @repuesta1 =3;
INSERT INTO [Proyecto].[Tb_SatisfaccionEncuesta]
           ([Id_TrabajoTecnico_FK]
           ,[Id_Respuesta_FK])
     VALUES
           (@trabajo
           ,@repuesta1)
GO

--pregunta dos rango 6, 7,8,9,10[pesimo,malo,regular,bueno,exelente]
DECLARE @trabajo INT;
set @trabajo =4;
DECLARE @repuesta2 INT;
set @repuesta2 =7;
INSERT INTO [Proyecto].[Tb_SatisfaccionEncuesta]
           ([Id_TrabajoTecnico_FK]
           ,[Id_Respuesta_FK])
     VALUES
           (@trabajo
           ,@repuesta2)
GO

--pregunta tres rango 11,12,13,14,15[pesimo,malo,regular,bueno,exelente]
DECLARE @trabajo INT;
set @trabajo =4;
DECLARE @repuesta3 INT;
set @repuesta3 =12;
INSERT INTO [Proyecto].[Tb_SatisfaccionEncuesta]
           ([Id_TrabajoTecnico_FK]
           ,[Id_Respuesta_FK])
     VALUES
           (@trabajo
           ,@repuesta3)
GO

--pregunta cuatro rango 16,17,18,19,20[pesimo,malo,regular,bueno,exelente]
DECLARE @trabajo INT;
set @trabajo =4;
DECLARE @repuesta4 INT;
set @repuesta4 =16;
INSERT INTO [Proyecto].[Tb_SatisfaccionEncuesta]
           ([Id_TrabajoTecnico_FK]
           ,[Id_Respuesta_FK])
     VALUES
           (@trabajo
           ,@repuesta4)
GO

--pregunta cinco rango 21,22,23,24,25[pesimo,malo,regular,bueno,exelente]
DECLARE @trabajo INT;
set @trabajo =4;
DECLARE @repuesta5 INT;
set @repuesta5 =21;
INSERT INTO [Proyecto].[Tb_SatisfaccionEncuesta]
           ([Id_TrabajoTecnico_FK]
           ,[Id_Respuesta_FK])
     VALUES
           (@trabajo
           ,@repuesta5)
GO


