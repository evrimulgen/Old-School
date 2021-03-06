/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [UGTU].dbo.[EducationBranch]
  where --[Cname_spec] like '%Эл%'
[Sh_spec]='21.02.01'


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [UGTU].[dbo].[Fac]

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [UGTU].[dbo].Form_ed

  INSERT INTO [dbo].[Relation_spec_fac]
           ([ik_spec]
           ,[ik_fac]
           ,[YearObuch]
           ,[ik_rule]
           ,[Ik_form_ed]
           ,[ik_kat_zaved]
           ,[VidGos]
           ,[MonthObuch]
           ,[is_old],[DepartmentGUID])
     VALUES
           (354779,17,3,1,2,4,2,10,0,'DAEE3FD5-664D-E111-96A2-0018FE865BEC')--

SELECT *
  FROM [UGTU].[dbo].[TREE_specialties]
  where --[Cname_spec] like '%Эл%'
[Sh_spec]='13.03.02'

--ИНИГ
  INSERT INTO [dbo].[Relation_spec_fac]
           ([ik_spec]
           ,[ik_fac]
           ,[YearObuch]
           ,[ik_rule]
           ,[Ik_form_ed]
           ,[ik_kat_zaved]
           ,[VidGos]
           ,[MonthObuch]
           ,[is_old],[DepartmentGUID])
     VALUES
           (354690,27,5,1,6,4,2,0,0,'D8AAC220-DA0A-4703-918A-0339AA479D9D')

--СТИ
  INSERT INTO [dbo].[Relation_spec_fac]
           ([ik_spec]
           ,[ik_fac]
           ,[YearObuch]
           ,[ik_rule]
           ,[Ik_form_ed]
           ,[ik_kat_zaved]
           ,[VidGos]
           ,[MonthObuch]
           ,[is_old],[DepartmentGUID])
     VALUES
           (354442,27,5,1,6,4,2,0,0,'DEB2E840-7C08-45BA-8224-B69F3397DD4A')

		   SELECT *
  FROM [dbo].[Relation_spec_fac]
  where [ik_spec]=354442 or [ik_fac]=15

  D8AAC220-DA0A-4703-918A-0339AA479D9D


  INSERT INTO [dbo].[EducationBranch]
           ([Cname_spec]
           ,[Cshort_spec]
           ,[Sh_spec]
           ,[ik_direction]
           ,[Ik_vip_dep]
           ,[dDate_spec]
           ,[nN_prikaz]
           ,[spDateExit]
           ,[Cname_qualif]
           ,[SpecСategory]
           ,[QualifShortName]
           ,[ik_FB]
           ,[ik_main_spec]
           ,[id_parent]
           ,[id_type_branch]
           ,[YearNormObuch]
           ,[ik_FinancingSource]
           ,[ik_FB_2015])

		   select '(9 кл) Рациональное использование природохозяйственных комплексов'
           ,[Cshort_spec]
           ,[Sh_spec]
           ,[ik_direction]
           ,[Ik_vip_dep]
           ,[dDate_spec]
           ,[nN_prikaz]
           ,[spDateExit]
           ,[Cname_qualif]
           ,[SpecСategory]
           ,[QualifShortName]
           ,[ik_FB]
           ,[ik_main_spec]
           ,[id_parent]
           ,[id_type_branch]
           ,[YearNormObuch]
           ,[ik_FinancingSource]
           ,[ik_FB_2015]
		   from [UGTU].dbo.[EducationBranch]
  where --[Cname_spec] like '%Эл%'
[ik_spec]=354779


update [dbo].[EducationBranch]
set [Sh_spec]='20.02.01'
 where --[Cname_spec] like '%Эл%'
[ik_spec]=354779

update [dbo].[Relation_spec_fac]
select * from 
[dbo].[Relation_spec_fac]
--set [Ik_form_ed]=1
where [ik_spec] in (354778,354779)