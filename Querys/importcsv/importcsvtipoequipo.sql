BULK INSERT [Proyecto].[Tb_TipoEquipo]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_TipoEquipo.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')