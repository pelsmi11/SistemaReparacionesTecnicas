BULK INSERT [Proyecto].[Tb_CorreosElectronico]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_CorreosElectronico.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')