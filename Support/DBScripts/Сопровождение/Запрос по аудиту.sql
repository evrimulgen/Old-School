/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [UGTU].[dbo].[AUDIT]
  where [ObjectName] like 'ведом%' 
  and (/*[Description] like '%35831%' or*/ [Description] like '%9433%')