BULK INSERT [Proyecto].[Tb_Personal]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_Personal.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')