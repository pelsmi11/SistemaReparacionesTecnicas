BULK INSERT [Proyecto].[Tb_AsignacionHardwareEquipo]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_AsignacionHardwareEquipo.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')