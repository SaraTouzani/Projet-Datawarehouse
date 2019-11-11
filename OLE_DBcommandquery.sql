Use  LightFinanceDW;
Update dbo.DimAccount
SET
isCurrent='False'
where
AccountKey
=
?;