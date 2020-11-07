BULK INSERT [Proyecto].[Tb_Ubicaciones]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_Ubicacion.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')