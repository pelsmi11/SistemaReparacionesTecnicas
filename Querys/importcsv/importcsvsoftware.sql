BULK INSERT [Proyecto].[Tb_Software]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_Software.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')