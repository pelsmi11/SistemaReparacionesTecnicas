USE MASTER
GO 
CREATE DATABASE Db_Reparaciones
ON PRIMARY
(
	NAME = 'Bb_Reparaciones_mdf'								--NOMBRE LOGICO
	,FILENAME = 'D:\FileGroupPrimary\Bb_Reparaciones.mdf'	--NOMBRE FISICO
	,SIZE = 250MB													--TAMANIO INICIAL
	,MAXSIZE = 1024MB												--TAMANIO MAXIMO(ANTES DEL AUTOCRECIMIENTO)
	,FILEGROWTH = 50MB												--AUTOCRECIMIENTO
)

LOG ON
(
	NAME = 'Bb_Reparaciones_log'								--NOMBRE LOGICO
	,FILENAME = 'D:\LogsDefault\Bb_Reparaciones.ldf'	    --NOMBRE FISICO
	,SIZE = 250MB													--TAMANIO INICIAL
	,MAXSIZE = 1024MB												--TAMANIO MAXIMO(ANTES DEL AUTOCRECIMIENTO)
	,FILEGROWTH = 10%												--AUTOCRECIMIENTO
)
------------fin creacion base
--- CREANDO ESQUEMA
USE Db_Reparaciones
GO 

CREATE SCHEMA Proyecto
GO
---- fin creacion esquema



-- El esquema debe estar creado con anterioridad

USE Db_Reparaciones
GO 
CREATE TABLE Proyecto.Tb_Departamentos(
	Id_Departamento INT NOT NULL IDENTITY(1,1) CONSTRAINT Pk_Departamento PRIMARY KEY
	,Departamento_Nombre NVARCHAR(50) NOT NULL CONSTRAINT Uq_Departamento_Nombre UNIQUE
	
)
go
CREATE TABLE Proyecto.Tb_Areas(
	Id_Areas INT NOT NULL IDENTITY(1,1) CONSTRAINT Pk_Areas PRIMARY KEY
	,Id_Departamento_Fk int references Proyecto.Tb_Departamentos(Id_Departamento)
	,Area_Nombre NVARCHAR(50) NOT NULL CONSTRAINT Uq_Area_Nombre UNIQUE
	
)
go
CREATE TABLE Proyecto.Tb_Puestos(
	Id_Puestos INT NOT NULL IDENTITY(1,1) CONSTRAINT Pk_Puestos PRIMARY KEY
	,Puesto_Nomre NVARCHAR(50) NOT NULL CONSTRAINT Puesto_Nomre  UNIQUE
)
go

CREATE TABLE Proyecto.Tb_Generos(
	Id_Genero INT NOT NULL IDENTITY(1,1) CONSTRAINT Pk_Genero PRIMARY KEY
	,Genero_Descripcion NVARCHAR(25) NOT NULL CONSTRAINT Uq_Genero_Descripcion UNIQUE
	,CONSTRAINT CH_Genero_Descripcion_MasculinoyFemenino CHECK(Genero_Descripcion='MASCULINO' OR Genero_Descripcion='FEMENINO')
)
GO
CREATE TABLE Proyecto.Tb_Edificios(
	Id_Edificio INT NOT NULL IDENTITY(1,1) CONSTRAINT Pk_Edificio PRIMARY KEY
	,Edificio_Nombre NVARCHAR(25) NOT NULL CONSTRAINT Uq_Edificio_Nombre UNIQUE
)
GO
CREATE TABLE Proyecto.Tb_Pisos(
	Id_Piso INT NOT NULL IDENTITY(1,1) CONSTRAINT Pk_Piso PRIMARY KEY
	,Piso_Numeracion NVARCHAR(25) NOT NULL CONSTRAINT Uq_Piso_Numeracion UNIQUE
)
GO
CREATE TABLE Proyecto.Tb_Oficinas(
	Id_Oficina INT NOT NULL IDENTITY(1,1) CONSTRAINT Pk_Oficina PRIMARY KEY
	,Oficina_Numeracion NVARCHAR(25) NOT NULL CONSTRAINT Uq_Oficina_Numeracion UNIQUE
)
GO
CREATE TABLE Proyecto.Tb_SetTrabajos(
	Id_SetTrabajo INT NOT NULL IDENTITY(1,1) CONSTRAINT Pk_SetTrabajo PRIMARY KEY
	,SetTrabajo_Numeracion NVARCHAR(25) NOT NULL CONSTRAINT Uq_SetTrabajo_Numeracion UNIQUE
)
GO
CREATE TABLE Proyecto.Tb_Ubicaciones(
	Id_Ubicacion INT NOT NULL IDENTITY(1,1) CONSTRAINT Pk_Ubicacion PRIMARY KEY
	,Id_Edificio_FK int FOREIGN KEY REFERENCES Proyecto.Tb_Edificios(Id_Edificio)
	,ID_Piso_FK int FOREIGN KEY REFERENCES Proyecto.TB_Pisos(Id_piso)
	,Id_Oficina_FK int FOREIGN KEY REFERENCES Proyecto.TB_Oficinas(Id_oficina)
	,ID_SetTrabajo_FK int FOREIGN KEY REFERENCES Proyecto.TB_SetTrabajos(Id_SetTrabajo)
)
GO
CREATE TABLE Proyecto.Tb_Personal(
Id_Personal	INT NOT NULL IDENTITY(1,1) CONSTRAINT Pk_Cliente_Id PRIMARY KEY(Id_Personal)
,Id_Ubicaciones_FK int FOREIGN KEY REFERENCES Proyecto.Tb_Ubicaciones(Id_Ubicacion)
,Id_Genero_FK int FOREIGN KEY REFERENCES Proyecto.TB_Generos(Id_Genero)
,Personal_Dpi NVARCHAR(13) NOT NULL CONSTRAINT Chk_Personal_Dpi CHECK(LEN(Personal_Dpi)=13) CONSTRAINT Uq_Personal_Dpi unique(Personal_Dpi)
,Personal_Nombre1 NVARCHAR(25) NOT NULL
,Personal_Nombre2 NVARCHAR(25) NULL
,Personal_Nombre3 NVARCHAR(25) NULL
,Personal_Apellido1 NVARCHAR(25) NOT NULL
,Personal_Apellido2 NVARCHAR(25) NULL
,Personal_Apellido3 NVARCHAR(25) NULL
,Personal_FechaNacimiento DATE NOT NULL 

)
go

CREATE TABLE Proyecto.Tb_CorreosElectronico
(
	Id_Correo INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Correo PRIMARY KEY
	,Correo_Correo NVARCHAR(50) NOT NULL CONSTRAINT U_Correo_correo UNIQUE
	,Correo_Contrasenia NVARCHAR(25) NOT NULL 
	,CONSTRAINT CHK_Correo_contrasenia CHECK(LEN(Correo_Contrasenia)>6)
)
go



CREATE TABLE Proyecto.Tb_TipoEquipo(
Id_TipoEquipo	INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_TipoEquipo PRIMARY KEY
,Tipo_Descripcion NVARCHAR(50) NOT NULL CONSTRAINT UQ_Tipo_Descripcion UNIQUE
)
GO
CREATE TABLE Proyecto.Tb_TipoSoftware(
Id_TipoSoftware	INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_TipoSoftware PRIMARY KEY
,TipoSoft_Descripcion NVARCHAR(50) NOT NULL CONSTRAINT UQ_TipoSoft_Descripcion UNIQUE
)
GO
CREATE TABLE Proyecto.Tb_TipoHardware(
Id_TipoHardware	INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_TipoHardware PRIMARY KEY
,TipoHard_Descripcion NVARCHAR(50) NOT NULL CONSTRAINT UQ_TipoHard_Descripcion UNIQUE
)
GO

CREATE TABLE Proyecto.Tb_Perfiles(
Id_Perfil	INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Perfil PRIMARY KEY
,Perfil_Descripcion NVARCHAR(50) NOT NULL CONSTRAINT UQ_Perfil_Descripcion UNIQUE
)
GO
CREATE TABLE Proyecto.Tb_Marcas(
Id_Marca	INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Marca PRIMARY KEY
,Marca_Nombre NVARCHAR(50) NOT NULL CONSTRAINT UQ_Marca_Nombre UNIQUE
)
GO
CREATE TABLE Proyecto.Tb_Hardware(
Id_Hardware INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Hardware PRIMARY KEY
,Id_TipoHardware_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_TipoHardware(Id_TipoHardware)
,Id_Marca_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_Marcas(Id_Marca)
,Hardware_Nombre Nvarchar(80) NOT NULL CONSTRAINT UQ_Hardware_Nombre UNIQUE
,Hardware_CantNucleo Nvarchar(80)
,Hardware_HRz Nvarchar(80)
,Hardware_MemoriaCache Nvarchar(80)
,Hardware_Almacenamiento Nvarchar(80)
,Hardware_Frecuencia Nvarchar(80)
,Hardware_VelocidadLectura Nvarchar(80)
,Hardware_VelocidadEscritura Nvarchar(80)
)
GO
CREATE TABLE Proyecto.Tb_EquiposTrabajo(
Id_EquipoTrabajo INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_EquipoTrabajo PRIMARY KEY
,Id_TipoEquipo_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_TipoEquipo(Id_TipoEquipo)
,Id_Marca_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_Marcas(Id_Marca)
)
GO
CREATE TABLE Proyecto.Tb_CompaniasTelefonia(
Id_CompaniaTelefonica	INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_CompaniaTelefonica PRIMARY KEY
,Compania_Nombre NVARCHAR(50) NOT NULL CONSTRAINT UQ_Compania_Nombre UNIQUE
)
GO
CREATE TABLE Proyecto.Tb_TiposTelefono(
Id_TipoTelefono	INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_TipoTelefono PRIMARY KEY
,TipoTel_Descripcion NVARCHAR(50) NOT NULL CONSTRAINT UQ_TipoTel_Descripcion  UNIQUE
)
GO
CREATE TABLE Proyecto.Tb_Software(
Id_Software INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Software PRIMARY KEY
,Id_TipoSoftware_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_TipoSoftware(Id_TipoSoftware)
,Id_Marca_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_Marcas(Id_Marca)
,Software_Nombre Nvarchar(80) NOT NULL CONSTRAINT UQ_Software_Nombre UNIQUE
,Software_Version Nvarchar(80) NOT NULL 
)
GO
CREATE TABLE Proyecto.Tb_AsignacionesAreaPuestoPersonal(
Id_AsignacionAPP INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_AsignacionAPP PRIMARY KEY
,Id_Area_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_Areas(Id_Areas)
,Id_Puestos_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_Puestos(Id_Puestos)
,Id_Personal_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_Personal(Id_Personal)
)
GO
CREATE TABLE Proyecto.Tb_Prioridades(
Id_Prioridad	INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Prioridad PRIMARY KEY
,Prioridad_Estado NVARCHAR(20) NOT NULL CONSTRAINT UQ_Prioridad_Estado  UNIQUE
)
GO
CREATE TABLE Proyecto.Tb_ProblemasTecnicos(
Id_ProblemaTecnico	INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_ProblemaTecnico PRIMARY KEY
,ProblemaTecnico_Tipo NVARCHAR(20) NOT NULL CONSTRAINT UQ_ProblemaTecnico_Tipo  UNIQUE
)
GO
CREATE TABLE Proyecto.Tb_Usuarios(
Id_Usuario INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Usuario PRIMARY KEY
,Id_Personal_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_Personal(Id_Personal)
,Id_Correo_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_CorreosElectronico(Id_Correo)
)
GO
CREATE TABLE Proyecto.Tb_PlazosTiempo(
Id_PlazoTiempo	INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_PlazoTiempo PRIMARY KEY
,Plazo_TiempoInicio DATETIME NOT NULL CONSTRAINT DF_Plazo_TiempoInicio DEFAULT(GETDATE())
,Plazo_TiempoFin DATETIME  
)
GO
CREATE TABLE Proyecto.Tb_Tecnicos(
Id_Tecnico INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Tecnico PRIMARY KEY
,Id_Personal_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_Personal(Id_Personal)
,Id_Perfil_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_Perfiles(Id_Perfil)
)
GO
CREATE TABLE Proyecto.Tb_Jefes(
Id_Jefe INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Jefe PRIMARY KEY
,Id_PersonalJefe_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_Personal(Id_Personal)
,Id_Personal_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_Personal(Id_Personal)
)
GO
CREATE TABLE Proyecto.Tb_AsignacionEquipos(
Id_AsignacionEquipo INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_AsignacionEquipo PRIMARY KEY
,Id_EquipoTrabajo_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_EquiposTrabajo(Id_EquipoTrabajo)
,Id_Personal_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_Personal(Id_Personal)
)
GO
CREATE TABLE Proyecto.Tb_AsignacionHardwareEquipo(
Id_AsignacionHardwareEquipo INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_AsignacionHardwareEquipo PRIMARY KEY
,Id_EquipoTrabajo_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_EquiposTrabajo(Id_EquipoTrabajo)
,Id_Hardware_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_Hardware(Id_Hardware)
)
GO
CREATE TABLE Proyecto.Tb_AsignacionSoftwareEquipo(
Id_AsignacionSoftwareEquipo INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_AsignacionSoftwareEquipo PRIMARY KEY
,Id_EquipoTrabajo_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_EquiposTrabajo(Id_EquipoTrabajo)
,Id_Software_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_Software(Id_Software)
)
GO
CREATE TABLE Proyecto.Tb_Telefonos(
Id_Telefono INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Telefono PRIMARY KEY
,Id_TipoTelefono_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_TiposTelefono(Id_TipoTelefono)
,Id_CompaniaTelefonica_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_CompaniasTelefonia(Id_CompaniaTelefonica)
,Id_Personal_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_Personal(Id_Personal)
,Telefono_Numero NVARCHAR(200) NOT NULL CONSTRAINT UQ_Telefono_Numero   UNIQUE
)
GO
CREATE TABLE Proyecto.Tb_Preguntas(
Id_Pregunta	INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Pregunta PRIMARY KEY
,Pregunta_Pregunta NVARCHAR(200) NOT NULL CONSTRAINT UQ_Pregunta_Pregunta   UNIQUE
)
GO
CREATE TABLE Proyecto.Tb_Respuestas(
Id_Respuesta	INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Respuesta PRIMARY KEY
,Id_Pregunta_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_Preguntas(Id_Pregunta)
,Respuesta_Descripcion NVARCHAR(20) NOT NULL 
)
GO
CREATE TABLE Proyecto.Tb_EstadoReparacion(
Id_EstadoReparacion INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_EstadoReparacion PRIMARY KEY
,EstadoR_Descripcion NVARCHAR(25) NOT NULL CONSTRAINT UQ_EstadoR_Descripcion UNIQUE
)
GO
CREATE TABLE Proyecto.Tb_TrabajosTecnicos(
Id_TrabajoTecnico INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_TrabajoTecnico PRIMARY KEY
,Id_Tecnico_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_Tecnicos(Id_Tecnico)
,Id_AsignacionEquipo_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_AsignacionEquipos(Id_AsignacionEquipo)
,Id_ProblemaTecnico_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_ProblemasTecnicos(Id_ProblemaTecnico)
,Id_Plazotiempo_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_PlazosTiempo(Id_PlazoTiempo)
,Id_Prioridad_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_Prioridades(Id_Prioridad)
,Trabajo_Descripcion NVARCHAR(1000) NOT NULL
,Trabajo_Pendiente BINARY NOT NULL
,Id_EstadoReparacion_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_EstadoReparacion(Id_EstadoReparacion)
)
GO
CREATE TABLE Proyecto.Tb_SatisfaccionEncuesta(
Id_SatisfaccionEncuesta INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_SatisfaccionEncuesta PRIMARY KEY
,Id_TrabajoTecnico_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_TrabajosTecnicos(Id_TrabajoTecnico)
,Id_Respuesta_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_Respuestas(Id_Respuesta)
)
GO
CREATE TABLE Proyecto.Tb_Tickets(
Id_Tickets INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_Tickets PRIMARY KEY
,Id_TrabajoTecnico_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_TrabajosTecnicos(Id_TrabajoTecnico)
)
GO
CREATE TABLE Proyecto.Tb_BasesConocimientos(
Id_BaseConocimiento INT NOT NULL IDENTITY(1,1) CONSTRAINT PK_BaseConocimiento PRIMARY KEY
,Id_TrabajoTecnico_FK INT FOREIGN KEY REFERENCES Proyecto.Tb_TrabajosTecnicos(Id_TrabajoTecnico)
,Base_Solucion NVARCHAR(1000) NOT NULL
)
GO
