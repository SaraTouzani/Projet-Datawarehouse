USE master ;
IF DB_ID('LightFinanceDW') IS NOT NULL
DROP DATABASE LightFinanceDW;
GO
CREATE DATABASE LightFinanceDW
	ON PRIMARY 
	(NAME = N'LightFinanceDW' , FILENAME =
N'C:\DW\LightFinanceDW.mdf',
	SIZE = 307200KB , FILEGROWTH = 10240KB )
	LOG ON
	(NAME = N'LightFinanceDW_log' , FILENAME =
N'C:\DW\LightFinanceDW_log.ldf',
	SIZE = 51200KB , FILEGROWTH = 10%);
GO
ALTER DATABASE LightFinanceDW SET RECOVERY SIMPLE WITH NO_WAIT;
GO