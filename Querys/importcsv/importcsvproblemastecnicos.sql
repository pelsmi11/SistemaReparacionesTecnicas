BULK INSERT [Proyecto].[Tb_ProblemasTecnicos]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_Problemastecnicos.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')