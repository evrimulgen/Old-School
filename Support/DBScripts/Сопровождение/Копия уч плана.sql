USE [UGTU]
GO
/****** Object:  StoredProcedure [dbo].[CopyUchPlan]    Script Date: 05.10.2016 15:32:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--
/*
declare @pl int
set @pl=0
exec [CopyUchPlan] 6401, 1,@pl, 19
select @pl


*/
ALTER procedure [dbo].[CopyUchPlan]
@ik_uch_pl		int,  --2022
@is_main		bit,  --0
@ik_newUchPl	int OUTPUT,
@ik_year		int = null
as
begin
	declare @ik_spec				int 
	declare @ik_form_ed				int 
	declare @d_utv					date 
	declare @is_par_plan			bit
	declare @ik_newDics				int
	declare @ik_newDics2			int
	declare @ik_disc				int
	declare @ik_default_kaf			int
	declare @iHour_gos				int
	declare @iIndivid				int
	declare @ik_ckl_disc			int
	declare @ik_grp_disc			int
	declare @Cname_ckl_disc_gos		varchar(20)
	declare @ik_pdgrp_disc			int
	declare @ViborGroup				int
	declare @source_disc_uch_plan	int
	declare @id_parent				int = NULL
	declare @ik_spclz				int
	declare @year_value				int
	declare @iHour_Audit			int

	select @ik_year = ISNULL(@ik_year, Uch_pl.ik_year_uch_pl), @is_par_plan = is_main,
	  @year_value= year_value
	from Uch_pl,Year_uch_pl where Uch_pl.ik_uch_plan = @ik_uch_pl
	and Uch_pl.ik_year_uch_pl = Year_uch_pl.ik_year_uch_pl

	if (@is_main = 0) --если создаем план для группы
	begin 
	  if (@is_par_plan = 1)and(@year_value>2010) set @id_parent = @ik_uch_pl
	  else select @id_parent = id_parent from Uch_pl where ik_uch_plan = @ik_uch_pl
	end

    --создаем идентичный план
    insert into Uch_pl (ik_year_uch_pl, ik_form_ed, ik_spec, ik_year_utverzh, date_utv, IsChecked, IsBRSPlan,[is_main],id_parent) 
	select @ik_year, ik_form_ed, ik_spec, ik_year_utverzh, date_utv, 0, IsBRSPlan,@is_main,@id_parent
	from Uch_pl where ik_uch_plan = @ik_uch_pl
	select @ik_newUchPl =  @@IDENTITY

	--копируем параметры плана
	exec [dbo].UpdateUchPlan 4, @ik_newUchPl, @ik_spec,@ik_spclz, null, @ik_form_ed, @ik_year, @d_utv, @ik_uch_pl;
	
	--отключаем триггер проверки копий
	--DISABLE TRIGGER Content_UchPlInsertBRS ON Content_UchPl;
	
	--копируем все дисциплины
	declare curs_disc cursor for 
	Select ik_disc, ik_default_kaf, iHour_gos, iIndivid, ik_ckl_disc, ik_grp_disc, cname_ckl_disc1, ik_pdgrp_disc, ViborGroup, ik_disc_uch_plan, iK_spclz, [iHour_Audit]
	From sv_disc Where ik_uch_plan = @ik_uch_pl
	open curs_disc
	FETCH curs_disc INTO @ik_disc, @ik_default_kaf, @iHour_gos, @iIndivid, @ik_ckl_disc, @ik_grp_disc, @Cname_ckl_disc_gos,@ik_pdgrp_disc, @ViborGroup, @source_disc_uch_plan,@ik_spclz, @iHour_Audit
	while  @@FETCH_STATUS = 0
	begin
		EXECUTE @ik_newDics = [dbo].UpdateDiscInUchPlan 1, null, @ik_newUchPl, @ik_disc, @ik_default_kaf, @iHour_gos, 
					@iIndivid, @ik_ckl_disc, @ik_grp_disc, @Cname_ckl_disc_gos,@ik_pdgrp_disc, @ViborGroup, 
					@ik_spclz, null, @iHour_Audit

		EXECUTE [dbo].UpdateDiscInUchPlan 4, @ik_newDics, @ik_newUchPl, @ik_disc, @ik_default_kaf, @iHour_gos, @iIndivid, @ik_ckl_disc, 
									@ik_grp_disc, @Cname_ckl_disc_gos,@ik_pdgrp_disc, @ViborGroup, @ik_spclz, @source_disc_uch_plan
		
	FETCH NEXT FROM curs_disc INTO @ik_disc, @ik_default_kaf, @iHour_gos, @iIndivid, @ik_ckl_disc, @ik_grp_disc, @Cname_ckl_disc_gos,@ik_pdgrp_disc, @ViborGroup, @source_disc_uch_plan,@ik_spclz, @iHour_Audit
	END
	CLOSE curs_disc
	DEALLOCATE curs_disc;

	--ENABLE TRIGGER Content_UchPlInsertBRS ON Content_UchPl;

  --возвращает результатом идентификатор нового плана	
  --SELECT @ik_newUchPl as ReturnValue
end 
return @ik_newUchPl




