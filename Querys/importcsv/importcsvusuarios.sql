BULK INSERT [Proyecto].[Tb_Usuarios]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_Usuarios.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')