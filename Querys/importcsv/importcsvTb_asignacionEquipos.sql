BULK INSERT [Proyecto].[Tb_AsignacionEquipos]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_asignacionequipo.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')