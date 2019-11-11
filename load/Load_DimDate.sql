
USE LightFinanceDW;
GO
IF OBJECT_ID('dbo.SeqDateDwKey' ,'SO') IS NOT NULL
DROP SEQUENCE dbo.SeqDateDwKey ;
GO
CREATE SEQUENCE dbo.SeqDateDwKey AS INT
START WITH 1
INCREMENT BY 1;
GO

INSERT INTO LightFinanceDW.dbo.DimDate
([DateKey]
	,[AlternateDateKey]
      ,[FullDateAlternateKey]
      ,[DayNumberOfWeek]
      ,[EnglishDayNameOfWeek]
      ,[SpanishDayNameOfWeek]
      ,[FrenchDayNameOfWeek]
      ,[DayNumberOfMonth]
      ,[DayNumberOfYear]
      ,[WeekNumberOfYear]
      ,[EnglishMonthName]
      ,[SpanishMonthName]
      ,[FrenchMonthName]
      ,[MonthNumberOfYear]
      ,[CalendarQuarter]
      ,[CalendarYear]
      ,[CalendarSemester]
      ,[FiscalQuarter]
      ,[FiscalYear]
      ,[FiscalSemester])
SELECT
NEXT VALUE FOR LightFinanceDW.dbo.SeqDateDwKey AS DateKey,
C.DateKey,
C.FullDateAlternateKey, C.DayNumberOfWeek , C.EnglishDayNameOfWeek, C.SpanishDayNameOfWeek,
C.FrenchDayNameOfWeek, C.DayNumberOfMonth, C.DayNumberOfYear, C.WeekNumberOfYear, C.EnglishMonthName, C.SpanishMonthName,
C.FrenchMonthName,C.MonthNumberOfYear, C.CalendarQuarter, C.CalendarYear,C.CalendarSemester, C.FiscalQuarter,C.FiscalYear,C.FiscalSemester
FROM AdventureWorksDW2012.dbo.DimDate AS C
GO
