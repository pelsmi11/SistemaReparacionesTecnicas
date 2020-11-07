BULK INSERT [Proyecto].[Tb_Preguntas]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_Preguntas.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')