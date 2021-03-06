/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [ikPrikStud]
      ,[ik_prikaz]
      ,[ik_zach]
      ,[ik_pric]
      ,[LastProp]
      ,[cObosn]
  FROM [UGTU].[dbo].[Prikaz_Stud]
  where [ik_prikaz] in (select ik_prikaz
  from dbo.Prikaz
  where YEAR([Dd_prikaz])=YEAR(GETDATE()))
  and ik_pric = 119

  update [dbo].[Prikaz_Stud]
  set [LastProp]=[LastProp]-1
  where [ik_prikaz] in (select ik_prikaz
  from dbo.Prikaz
  where YEAR([Dd_prikaz])=YEAR(GETDATE()))
  and ik_pric = 119

  select *
  from dbo.Prikaz
  where YEAR([Dd_prikaz])=YEAR(GETDATE())