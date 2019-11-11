
INSERT INTO [LightFinanceDW].[dbo].[FactFinance]
           ([DateKey]
           ,[OrganizationKey]
           ,[DepartmentGroupKey]
           ,[ScenarioKey]
           ,[AccountKey]
           ,[Amount]
		   ,[Date]) 
SELECT dw3.[DateKey]
      ,dw2.[OrganizationKey]
      ,dw6.[DepartmentGroupKey]
      ,dw4.[ScenarioKey]
      ,dw5.[AccountKey]
      ,dw1.[Amount]
      ,dw1.[Date]
  FROM [AdventureWorksDW2012].[dbo].[FactFinance] as dw1, 
[LightFinanceDW].[dbo].[DimOrganization] as dw2,
[LightFinanceDW].[dbo].[DimDate] as dw3,
[LightFinanceDW].[dbo].[DimScenario] as dw4,
[LightFinanceDW].[dbo].[DimAccount] as dw5,
[LightFinanceDW].[dbo].[DimDepartmentGroup] as dw6

 where dw1.[OrganizationKey]=dw2.[OrganizationKey] and dw1.[ScenarioKey]=dw4.[ScenarioKey] and dw1.[AccountKey]=dw5.[AccountKey] and dw1.[DateKey]=dw3.[AlternateDateKey] and dw1.[DepartmentGroupKey]=dw6.[DepartmentGroupKey] ;
