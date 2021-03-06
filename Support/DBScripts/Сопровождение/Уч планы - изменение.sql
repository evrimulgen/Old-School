/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [ik_uch_plan]
      ,[ik_year_uch_pl]
      ,[ik_spec]
      ,[ik_spclz]
      ,[ik_form_ed]
      ,[IsBRSPlan]
      ,[ik_year_utverzh]
      ,[date_utv]
      ,[UserName]
      ,[is_main]
      ,[id_parent]
      ,[grup_comment]
      ,[IsChecked]
      ,[date_approved]
      ,[Nprotocol]
      ,[ik_kaf]
  FROM [UGTU].[dbo].[Uch_pl]
  where [ik_spec]=354689 and [is_main]=1


  select distinct sv_disc.[ik_uch_plan]
  from dbo.sv_disc
  where sv_disc.[ik_uch_plan] in
  (SELECT  [ik_uch_plan]
      
  FROM [UGTU].[dbo].[Uch_pl]
  where [ik_spec]=354689 and [is_main]=1)




  select *
  from [UGTU].[dbo].[Uch_pl]
  where [ik_spec]=354689 and [is_main]=1
  and [Uch_pl].ik_uch_plan not in 
  (select [id_parent]
  from [UGTU].[dbo].[Uch_pl]
  where [is_main]=0 and [id_parent] is not null)


  DELETE FROM Uch_pl
	WHERE ik_uch_plan in
	(
  select ik_uch_plan
  from [UGTU].[dbo].[Uch_pl]
  where [ik_spec]=354689 and [is_main]=1
  and [Uch_pl].ik_uch_plan not in 
  (select [id_parent]
  from [UGTU].[dbo].[Uch_pl]
  where [is_main]=0 and [id_parent] is not null))

  update [UGTU].[dbo].[Uch_pl]
  set ik_form_ed=2
  where ik_uch_plan=6470




  
select *
from [dbo].[sv_disc]
where [ik_uch_plan]=6451
go

select *
from [dbo].[Uch_pl]
where [id_parent]=6445
go
[del_uch_pln] 6483

go

update grup
set Ik_uch_plan=null
---select * from [dbo].[Uch_pl]
where [ik_uch_plan]=6483