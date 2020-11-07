BULK INSERT [Proyecto].[Tb_SetTrabajos]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_SetTrabajo.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')