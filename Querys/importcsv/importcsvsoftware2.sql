BULK INSERT [Proyecto].[Tb_AsignacionSoftwareEquipo]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\asignacionsoftware2.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')