BULK INSERT [Proyecto].[Tb_CompaniasTelefonia]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_CompaniaTelefonica.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')