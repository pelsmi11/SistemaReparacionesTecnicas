BULK INSERT [Proyecto].[Tb_CorreosElectronico]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\correos2.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')