/****** Script for SelectTopNRows command from SSMS  ******/
SELECT *
  FROM [UGTU].dbo.[EducationBranch]
  where [Cname_spec] like '%Эл%'



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
           (354442,15,5,1,2,4,2,0,0,'D8EE3FD5-664D-E111-96A2-0018FE865BEC')


		   SELECT *
  FROM [dbo].[Relation_spec_fac]
  where [ik_spec]=354442 or [ik_fac]=15