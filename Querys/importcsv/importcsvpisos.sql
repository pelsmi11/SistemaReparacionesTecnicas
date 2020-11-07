BULK INSERT [Proyecto].[Tb_Pisos]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_Pisos.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')