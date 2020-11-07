BULK INSERT [Proyecto].[Tb_Telefonos]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_Telefonos.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')