BULK INSERT [Proyecto].[Tb_Perfiles]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_Perfil.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')