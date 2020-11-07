BULK INSERT [Proyecto].[Tb_Prioridades]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_Prioridad.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')