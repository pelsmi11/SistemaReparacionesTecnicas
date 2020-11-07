BULK INSERT [Proyecto].[Tb_Oficinas]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_Oficinas.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')