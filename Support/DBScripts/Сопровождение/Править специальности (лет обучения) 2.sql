/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [UGTU].[dbo].[TREE_specialties]
  where [Cname_spec] like '%ФИз%'


SELECT *
  FROM [UGTU].[dbo].[Relation_spec_fac]
  where [ik_spec_fac]=161


  update [dbo].[Relation_spec_fac]
  set [YearObuch]=5
   where [ik_spec_fac]=161