/****** Script for SelectTopNRows command from SSMS  ******/
select * from [dbo].[TREE_student] inner join
(SELECT [Ik_zach]
      ,COUNT([Ik_studGrup])asi
  FROM [UGTU].[dbo].[StudGrup]
  where Ik_prikazOtch is null 
  group by [Ik_zach]
  having COUNT(*)>1
)zach
on [TREE_student].[Ik_zach]=zach.Ik_zach
inner join dbo.grup on [TREE_student].Ik_grup=grup.Ik_grup
and grup.nYear_post>2014
order by [TREE_student].NameStud


SELECT *
  FROM [UGTU].[dbo].[StudGrup]
  where Ik_zach in (36486,41028,36492,41823)


  SELECT *
  FROM [UGTU].[dbo].Zach
  inner join [dbo].[Zach] newZach
  on Zach.[Nn_zach]=newZach.[Nn_zach]
  inner join (select [Ik_zach], max([Ik_studGrup])[maxIk_studGrup] from dbo.StudGrup group by [Ik_zach])maxGroup 
	on Zach.[Ik_zach]=maxGroup.Ik_zach 
  inner join dbo.StudGrup on maxGroup.[maxIk_studGrup]=StudGrup.Ik_studGrup 
  where Zach.Ik_zach in (36486,41028,36492,41823)
  and newZach.ik_zach not in (select ik_zach from dbo.StudGrup)


INSERT INTO [dbo].[Zach]
           ([Nn_zach]
           ,[nCode])
select [Nn_zach]
           ,[nCode] from
		   [UGTU].[dbo].Zach
  where Ik_zach in (36486,41028,36492,41823)


update [dbo].[StudGrup]
set [Ik_zach]=newZach.Ik_zach
--  SELECT *
  FROM [UGTU].[dbo].Zach
  inner join [dbo].[Zach] newZach
  on Zach.[Nn_zach]=newZach.[Nn_zach]
  inner join (select [Ik_zach], max([Ik_studGrup])[maxIk_studGrup] from dbo.StudGrup group by [Ik_zach])maxGroup 
	on Zach.[Ik_zach]=maxGroup.Ik_zach 
  inner join dbo.StudGrup on maxGroup.[maxIk_studGrup]=StudGrup.Ik_studGrup 
  where Zach.Ik_zach in (36486,41028,36492,41823)
  and newZach.ik_zach not in (select ik_zach from dbo.StudGrup)
