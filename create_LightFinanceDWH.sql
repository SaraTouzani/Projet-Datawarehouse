USE master ;
IF DB_ID('LightFinanceDWH') IS NOT NULL
DROP DATABASE LightFinanceDWH;
GO
CREATE DATABASE LightFinanceDWH
ON PRIMARY
(NAME = N'LightFinanceDWH' , FILENAME =
N'C:\DW\LightFinanceDWH.mdf',
SIZE = 307200KB , FILEGROWTH = 10240KB )
LOG ON
(NAME = N'LightFinanceDWH_log' , FILENAME =
N'C:\DW\LightFinanceDWH_log.ldf',
SIZE = 51200KB , FILEGROWTH = 10%);
GO
ALTER DATABASE LightFinanceDWH SET RECOVERY SIMPLE WITH NO_WAIT;
GO