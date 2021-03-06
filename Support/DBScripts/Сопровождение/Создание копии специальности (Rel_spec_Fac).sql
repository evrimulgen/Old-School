/****** Script for SelectTopNRows command from SSMS  ******/

SELECT *
  FROM [UGTU].[dbo].[Grup]
  where [Cname_grup]='СТсп-13(б)з'

  update [Grup]
  set ik_spec_fac=339
  where [Cname_grup]='СТсп-13(б)з'

SELECT *
  FROM [UGTU].[dbo].[Relation_spec_fac]
  where [ik_spec_fac]=315 or [ik_spec]=354440

  update [dbo].[Relation_spec_fac]
  set [YearObuch]=5
    where [ik_spec_fac]=315

  INSERT INTO [dbo].[Relation_spec_fac]
           ([ik_spec]
           ,[ik_fac]
           ,[YearObuch]
           ,[ik_rule]
           ,[Ik_form_ed]
           ,[ik_kat_zaved]
           ,[VidGos]
           ,[MonthObuch]
           ,[DepartmentGUID]
           ,[is_short]
           ,[is_old]
           ,[ik_room]
           ,[DiplExcPatternName]
           ,[DiplVclExcPatternName])
 select
[ik_spec]
      ,[ik_fac]
      ,[YearObuch]
      ,[ik_rule]
      ,[Ik_form_ed]
      ,[ik_kat_zaved]
      ,[VidGos]
      ,[MonthObuch]
      ,[DepartmentGUID]
      ,[is_short]
      ,[is_old]
      ,[ik_room]
      ,[DiplExcPatternName]
      ,[DiplVclExcPatternName]
  FROM [UGTU].[dbo].[Relation_spec_fac]
  where [ik_spec_fac]=315