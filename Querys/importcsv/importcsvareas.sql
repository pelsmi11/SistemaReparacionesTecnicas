BULK INSERT [Proyecto].[Tb_Areas]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_Areas.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')