BULK INSERT [Proyecto].[Tb_Marcas]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_Marcas.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')