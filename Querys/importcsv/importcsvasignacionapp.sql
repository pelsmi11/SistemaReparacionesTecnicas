BULK INSERT [Proyecto].[Tb_AsignacionesAreaPuestoPersonal]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_asignacionapp.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')