BULK INSERT [Proyecto].[Tb_TipoHardware]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_TipoHardware.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')