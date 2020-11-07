BULK INSERT [Proyecto].[Tb_Respuestas]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_Respuestas.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')