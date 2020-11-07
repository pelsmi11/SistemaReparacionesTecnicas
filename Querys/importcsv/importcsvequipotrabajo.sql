BULK INSERT [Proyecto].[Tb_EquiposTrabajo]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\Tb_EquiposTrabajo.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')