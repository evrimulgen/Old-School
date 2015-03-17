/****** Script for SelectTopNRows command from SSMS  ******/
SELECT distinct [RegNumber],[Spec_stud].[Sh_spec], [Spec_stud].[Cname_spec], [Spec_stud].[Cname_qualif], YearPost, 2014 as YearGrad, [TREE_specialties].YearObuch,
[Clastname], [Cfirstname], [Cotch], CONVERT(VARCHAR(10), [Dd_birth], 104) [Dd_birth]

  FROM [dbo].[StudGrup]
  inner join [dbo].[TREE_groups] [Grup] ON [StudGrup].Ik_grup=[Grup].Ik_grup
  inner join [dbo].[TREE_specialties] ON [Grup].ik_spec_fac=[TREE_specialties].ik_spec_fac
  inner join [dbo].[Spec_stud] ON [TREE_specialties].ik_spec=[Spec_stud].ik_spec
  inner join [dbo].[TREE_student] ON [StudGrup].Ik_zach=[TREE_student].Ik_zach
  inner join [dbo].[Diplom] ON [StudGrup].Ik_zach=[Diplom].Ik_zach
  inner join (select [Ik_zach], MIN(YEAR([Dd_prikaz]))YearPost FROM [dbo].[StudGrup] inner join [dbo].[Prikaz] ON [StudGrup].[Ik_prikazZach]=[Prikaz].[Ik_prikaz] GROUP BY [Ik_zach])YearPostTable
  ON [StudGrup].Ik_zach=YearPostTable.Ik_zach
  --inner join  ON 
  --inner join  ON 
  --inner join  ON 
  where 
  [dbo].[Spec_stud].ik_direction=3
  and lSex=1
  and 
  [StudGrup].[ik_pricOtch]=3
  and [StudGrup].[Ik_prikazOtch] IN
  (select [Ik_prikaz] from [dbo].[Prikaz] where YEAR([Dd_prikaz])=2013)
  and IsExcellent=0

  order by [Spec_stud].[Sh_spec],
[Clastname], [Cfirstname], [Cotch]