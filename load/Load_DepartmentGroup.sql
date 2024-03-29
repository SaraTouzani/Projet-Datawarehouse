delete from LightFinanceDW.dbo.DimDepartmentGroup; 
GO
use LightFinanceDW;
IF OBJECT_ID('seqIdDepGroup' ,'SO') IS NOT NULL
DROP SEQUENCE seqIdDepGroup CREATE SEQUENCE seqIdDepGroup START WITH 1 INCREMENT BY 1;
GO
 --Insérer la racine de la hiérarchie : 
SET IDENTITY_INSERT LightFinanceDW.dbo.DimDepartmentGroup ON; 
GO
DECLARE curGroupName CURSOR FOR SELECT GroupName 
FROM AdventureWorks2012.HumanResources.Department 
GROUP BY GroupName;
DECLARE @GrpName NVARCHAR(50); 
--Définir la racine : 
INSERT INTO LightFinanceDW.dbo.DimDepartmentGroup (DepartmentGroupKey ,ParentDepartmentGroupKey ,DepartmentGroupName) VALUES (NEXT VALUE FOR seqIdDepGroup, null, 'Corporate');
OPEN curGroupName FETCH NEXT FROM curGroupName INTO @GrpName 
WHILE @@FETCH_STATUS = 0 
BEGIN 
INSERT INTO LightFinanceDW.dbo.DimDepartmentGroup (DepartmentGroupKey ,ParentDepartmentGroupKey ,DepartmentGroupName) VALUES (NEXT VALUE FOR seqIdDepGroup, 1, @GrpName); 
FETCH NEXT FROM curGroupName INTO @GrpName 
END 
CLOSE curGroupName 
DEALLOCATE curGroupName




/*INSERT INTO LightFinanceDW.dbo.DimDepartmentGroup
([DepartmentGroupKey],[ParentDepartmentGroupKey],[DepartmentGroupName])
SELECT
NEXT VALUE FOR LightFinanceDW.dbo.seqIdDepGroup AS DepartmentGroupKey,
C.ParentDepartmentGroupKey, C.DepartmentGroupName
FROM AdventureWorksDW2012.dbo.DimDepartmentGroup AS C
GO*/