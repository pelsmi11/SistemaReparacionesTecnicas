BULK INSERT [Proyecto].[Tb_TipoSoftware]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_TipoSoftware.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')