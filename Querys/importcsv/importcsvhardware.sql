BULK INSERT [Proyecto].[Tb_Hardware]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_Hardware.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')