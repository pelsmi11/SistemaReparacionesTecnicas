BULK INSERT [Proyecto].[Tb_Jefes]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_jefes.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')