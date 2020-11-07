BULK INSERT [Proyecto].[Tb_Departamentos]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_Departamentos.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')