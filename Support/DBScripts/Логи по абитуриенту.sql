/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Audit_Event].[OperationTypeID]
      ,[ObjectID]
      ,[AuditDateTime]
      ,[UserName]
      , OperationName
FROM [UGTU].[dbo].[Audit_Event],Audit_OperationType
where [Audit_Event].OperationTypeID = Audit_OperationType.OperationTypeID

and Description like '%67731 %'
order by AuditDateTime