BULK INSERT [Proyecto].[Tb_TiposTelefono]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_TipoTelefono.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')