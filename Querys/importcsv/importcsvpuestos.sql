BULK INSERT [Proyecto].[Tb_Puestos]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_Puestos.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')