BULK INSERT [Proyecto].[Tb_EquiposTrabajo]
FROM 'C:\Users\pcmoreira\Desktop\csvs\CSVSkoke\equipostrabajo2.csv' 
WITH (
firstrow=2
,FIELDTERMINATOR =';'
, ROWTERMINATOR='\n')