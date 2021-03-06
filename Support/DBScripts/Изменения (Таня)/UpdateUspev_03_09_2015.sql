USE [UGTU]
GO
/****** Object:  StoredProcedure [dbo].[UpdateUspev]    Script Date: 03.09.2015 13:48:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--добавила учет модулей БРС
ALTER procedure [dbo].[UpdateUspev]
@ik_grup int,
@ik_uch_plan_new int
as

declare @ik_uch_plan_old int
select @ik_uch_plan_old=ik_uch_plan from grup where ik_grup=@ik_grup 

declare @table table
(
	ik_ved int NOT NULL
)

insert into @table (ik_ved)
	select ik_ved from vedomost v
	inner join Content_UchPl cup on cup.ik_upContent=v.ik_upContent
	inner join sv_disc svd on svd.ik_disc_uch_plan=cup.ik_disc_uch_plan
		where svd.ik_uch_plan=@ik_uch_plan_old --старый учебный план
		and v.ik_grup=@ik_grup --группа
		 
declare @ik_ved int

declare @ik_disc int
declare @n_sem int
declare @ik_vid_zanyat int
declare @n_module int

declare @ik_upcontent int

SELECT @ik_ved=MIN(Ik_ved) FROM @table
	WHILE @ik_ved IS NOT NULL
	begin
		
		select @ik_disc=ik_disc, @n_sem=n_sem, @ik_vid_zanyat=ik_vid_zanyat, @n_module=cup.n_module from Vedomost v
		inner join Content_UchPl cup on cup.ik_upContent=v.ik_upContent
		inner join sv_disc svd on svd.ik_disc_uch_plan=cup.ik_disc_uch_plan
			where v.ik_ved=@ik_ved

		select @ik_upcontent=ik_upcontent from Content_UchPl cup
			inner join sv_disc svd on svd.ik_disc_uch_plan=cup.ik_disc_uch_plan
			where svd.ik_uch_plan=@ik_uch_plan_new
			and ik_disc=@ik_disc and n_sem=@n_sem and ik_vid_zanyat=@ik_vid_zanyat
			and (@n_module=cup.n_module OR (@n_module IS NULL AND cup.n_module IS NULL))

		if (@ik_upcontent is NOT NULL)	and (not EXISTS(SELECT Ik_ved FROM Vedomost WHERE (ik_upContent = @ik_upcontent)))
			update Vedomost set ik_upcontent=@ik_upcontent where ik_ved=@ik_ved

		SELECT @ik_ved=MIN(Ik_ved) FROM @table where ik_ved > @ik_ved
	end






	/*
	/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [n_sem]
      ,[ik_vid_zanyat]
      ,[ik_disc_uch_plan],[n_module]
	  , COUNT([ik_upContent])
      
  FROM [UGTU].[dbo].[Content_UchPl]
  where [ik_vid_zanyat] between 6 and 9 
  GROUP BY [n_sem]
      ,[ik_vid_zanyat]
      ,[ik_disc_uch_plan]
	  ,[n_module]
HAVING COUNT([ik_upContent])>1*/

