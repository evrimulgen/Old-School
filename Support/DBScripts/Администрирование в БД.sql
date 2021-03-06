/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [ik_Element]
      ,[uid]
      ,[ik_filter1]
      ,[ik_filter2]
  FROM [UGTU].[dbo].[Relation_VisElem_User] where ik_filter2 = 295

  select * from sysusers 
  where uid in (205,205,194,194,177,177)
  order by name

  select Relation_VisElem_User.[ik_Element],sysusers.uid,sysusers.name, Relation_VisElem_User.ik_filter1, Fac.Ik_fac, EducationBranch.Cname_spec,  Relation_spec_fac.ik_spec_fac
  from EducationBranch,Relation_spec_fac, sysusers, Relation_VisElem_User,Fac
  where Relation_spec_fac.ik_spec = EducationBranch.ik_spec
  and Relation_spec_fac.ik_spec_fac = Relation_VisElem_User.ik_filter2
  and Relation_spec_fac.ik_fac = Fac.ik_fac
  and Relation_VisElem_User.uid = sysusers.uid
  and ik_direction = 3
  order by EducationBranch.Cname_spec

