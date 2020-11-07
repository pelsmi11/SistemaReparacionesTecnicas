BULK INSERT [Proyecto].[Tb_Edificios]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_Edificio.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')