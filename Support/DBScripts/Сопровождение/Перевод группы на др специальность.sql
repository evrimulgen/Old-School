

/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [Ik_grup]
      ,[ik_spec_fac]
      ,[Cname_grup]
      ,[Ik_uch_plan]
      ,[nYear_post]
      ,[DateCreate]
      ,[DateExit]
      ,[ik_spclz]
      ,[ik_Kurator]
  FROM [UGTU].[dbo].[Grup]
  where [Cname_grup] like 'НГД%'
  and [ik_spec_fac]= 189
  go

  select Grup.Cname_grup + ', ' + Form_ed.Cname_form_ed,Relation_spec_fac.ik_spec_fac,
       Grup.Ik_uch_plan, Ik_grup, Relation_spec_fac.ik_spec
from Grup, Relation_spec_fac,EducationBranch,Form_ed, Direction
where Grup.ik_spec_fac = Relation_spec_fac.ik_spec_fac
and Relation_spec_fac.ik_spec = EducationBranch.ik_spec
and EducationBranch.ik_direction = Direction.ik_direction
--and Relation_spec_fac.Ik_form_ed = Form_ed.Ik_form_ed
and Relation_spec_fac.ik_spec in (select ik_spec from Relation_spec_fac where ik_spec_fac = 189) 
and Ik_grup<>9793
order by Grup.Cname_grup + ', ' + Form_ed.Cname_form_ed
296
go
select * 
from Relation_spec_fac where ik_spec_fac = 189  ik_spec=354569 ik_spec=354433
go

update [UGTU].[dbo].[Grup]
set [ik_spec_fac]=296
  where [Cname_grup] like 'НГД%'
  and [ik_spec_fac]= 189


