BULK INSERT [Proyecto].[Tb_AsignacionSoftwareEquipo]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_AsignacionSoftwareEquipo.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')