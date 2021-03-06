alter table [dbo].[sv_disc]
add iHour_Audit int

go


--заполнение часов аудиторных по текущим значениям
update [dbo].[sv_disc]
set [iHour_Audit]=0
update [dbo].[sv_disc]
set [iHour_Audit]= AllHourCount
FROM
[dbo].[sv_disc] INNER JOIN
(SELECT ik_disc_uch_plan, SUM(HourCount) AllHourCount
FROM
(SELECT DISTINCT Content_UchPl.[ik_upContent], sv_disc.ik_disc_uch_plan, ISNULL([i_hour_per_week],0)*ISNULL(ISNULL(UchPlan_WeekCount_Exception.week_count, sem_uch_pl.kol_ned),1) HourCount
FROM 
	dbo.Uch_pl 
	INNER JOIN
	dbo.sv_disc ON dbo.sv_disc.ik_uch_plan = dbo.Uch_pl.ik_uch_plan INNER JOIN
    dbo.Content_UchPl ON dbo.sv_disc.ik_disc_uch_plan = dbo.Content_UchPl.ik_disc_uch_plan	LEFT JOIN
    dbo.sem_uch_pl  ON dbo.sem_uch_pl.ik_uch_plan = Uch_pl.ik_uch_plan AND sem_uch_pl.[n_sem]=Content_UchPl.[n_sem] LEFT JOIN
    dbo.UchPlan_WeekCount_Exception ON dbo.Content_UchPl.ik_upContent = dbo.UchPlan_WeekCount_Exception.ik_upContent
WHERE Content_UchPl.ik_vid_zanyat IN (3,4,5))allContent
GROUP BY ik_disc_uch_plan)AllDiskHour
ON [sv_disc].ik_disc_uch_plan=AllDiskHour.ik_disc_uch_plan

--ORDER BY AllHourCount

go

SELECT DISTINCT Content_UchPl.[ik_upContent], sv_disc.ik_disc_uch_plan, ISNULL([i_hour_per_week],0)HourCount,ISNULL(ISNULL(UchPlan_WeekCount_Exception.week_count, sem_uch_pl.kol_ned),1)  weekCount
FROM 
	dbo.Uch_pl 
	INNER JOIN
	dbo.sv_disc ON dbo.sv_disc.ik_uch_plan = dbo.Uch_pl.ik_uch_plan INNER JOIN
    dbo.Content_UchPl ON dbo.sv_disc.ik_disc_uch_plan = dbo.Content_UchPl.ik_disc_uch_plan	LEFT JOIN
    dbo.sem_uch_pl  ON dbo.sem_uch_pl.ik_uch_plan = Uch_pl.ik_uch_plan LEFT JOIN
    dbo.UchPlan_WeekCount_Exception ON dbo.Content_UchPl.ik_upContent = dbo.UchPlan_WeekCount_Exception.ik_upContent
ORDER BY weekCount DESC, HourCount DESC
	
	
	




GO

ALTER PROCEDURE [dbo].[GetDisciplines_4filters] 
	@ik_uch_plan	int,
	@ik_ckl_disc	int,
	@ik_grp_disc	int,
	@ik_pdgrp_disc	int,
	@n_sem			int,
	@ik_vid_zan		int,
	@ik_grup		int
AS
declare @table table
(
	ik_disc				int,
	ik_grp_disc			int,
	ik_ckl_disc			int,
	ik_pdgrp_disc		int,
	ik_podckl			int,
	iK_spclz			int,
	cname_ckl_disc1		varchar(100),
	ik_uch_plan			int,
	uchet				bit,
	ihour_gos			int,
	[iHour_Audit]		int,
	ik_disc_uch_plan	int,
	ik_default_kaf		int,
	iindivid			int,
	ViborGroup			int,
	iK_disc1			int,
	cname_disc			varchar(500),
	cName_spclz_short	varchar(20),
	cshortname			varchar(40),
	lpract				bit,
	ik_type_disc		tinyint,
	ik_ed_izm			int,
	ShowToUser			varchar(50)
)

declare @ik_spclz_grup int
declare @vidgos		   int

  if @ik_grup <> 0 
	select @ik_spclz_grup = ik_spclz,  @vidgos = VidGos
	from Grup,Relation_spec_fac where Ik_grup = @ik_grup and Grup.ik_spec_fac = Relation_spec_fac.ik_spec_fac
  else set @ik_spclz_grup = null

  insert into @table (ik_disc, ik_grp_disc, ik_ckl_disc, ik_pdgrp_disc, ik_podckl, cname_ckl_disc1, ik_uch_plan,
				uchet,ihour_gos, [iHour_Audit], ik_disc_uch_plan, ik_default_kaf, iindivid, ViborGroup, iK_disc1,
				cname_disc, cshortname, lpract, ik_type_disc,iK_spclz, cName_spclz_short, ik_ed_izm, ShowToUser)
	SELECT sv_disc.ik_disc, ik_grp_disc, ik_ckl_disc,ik_pdgrp_disc, ik_podckl, cname_ckl_disc1, ik_uch_plan,
	uchet,ihour_gos, [iHour_Audit], ik_disc_uch_plan, ik_default_kaf, iindivid, ViborGroup, discpln.iK_disc,
	cname_disc, cshortname, lpract, Type_disc.ik_type_disc, sv_disc.iK_spclz, eb.Cshort_spec, Ed_izm.ik_ed_izm, ShowToUser

	FROM sv_disc INNER JOIN discpln ON sv_disc.ik_disc = discpln.ik_disc
	inner join Type_disc on discpln.ik_type_disc = Type_disc.ik_type_disc
	inner join Ed_izm on Type_disc.ik_ed_izm = Ed_izm.ik_ed_izm
	left join EducationBranch eb on sv_disc.iK_spclz = eb.ik_spec
	WHERE sv_disc.ik_uch_plan = @ik_uch_plan
	and ((sv_disc.ik_pdgrp_disc = @ik_pdgrp_disc)or(@ik_pdgrp_disc = 3))	--фильтр по подгруппе
	and ((sv_disc.ik_grp_disc = @ik_grp_disc)or(@ik_grp_disc = 9))			--фильтр по группе
	and ((sv_disc.ik_ckl_disc = @ik_ckl_disc)or(@ik_ckl_disc = 11))			--фильтр по циклу
	and ((@n_sem in (select n_sem from Content_UchPl where ik_disc_uch_plan=sv_disc.ik_disc_uch_plan))or(@n_sem=0))	--фильтр по семестру
	ORDER BY ik_spec,Cshort_spec,Cname_disc

  /*if (@ik_grup <> 0)and(@vidgos>1)
	begin
	  if (@ik_spclz_grup is null) delete from @table where (iK_spclz is not null)
	  else delete from @table where (iK_spclz <> @ik_spclz_grup)
	end*/

	update @table set cName_spclz_short = '<все профили>' where cName_spclz_short is null

  if (@ik_vid_zan=0)
	begin
		SELECT * FROM @table
	end
	else
	begin
		if (@n_sem=0)
		begin
			SELECT * FROM @table t
			where @ik_vid_zan in (select ik_vid_zanyat from Content_UchPl
						where ik_disc_uch_plan=t.ik_disc_uch_plan)
		end
		else 
		begin
			SELECT * FROM @table t
			where @ik_vid_zan in (select ik_vid_zanyat from Content_UchPl
						where ik_disc_uch_plan=t.ik_disc_uch_plan and n_sem=@n_sem)
		end
	end





GO


ALTER PROCEDURE [dbo].[UpdateDiscInUchPlan]
	@i_type					tinyint,				--Тип выполняемого действия
	@ik_disc_uch_plan		int,					--ID дисциплины в учебном плане
	@ik_uch_plan			int = NULL,				--ID учебного плана
	@ik_disc				int = NULL,				--ID изменяемой дисциплины
	@ik_default_kaf			int = NULL,				--ID кафедры, за которой закрепляется дисциплина
	@iHour_gos				int = NULL,				--Общее количество часов по дисциплине
	@iIndivid				int = NULL,				--Количество часов по индивидуальным занятиям
	@ik_ckl_disc			int = NULL,				--Шифр дисциплины по ГОС
	@ik_grp_disc			int = NULL,				--ID цикла дисциплин, к которому относится дисциплина
	@Cname_ckl_disc_gos		varchar(20)  = NULL,	--ID группы дисциплин, к которой относится дисциплина
	@ik_pdgrp_disc			int = NULL,				--ID подгруппы дисциплин, к которой относится дисциплина
    @ViborGroup				int=null,   
	@ik_spclz				int = null,
	@source_disc_uch_plan	int = NULL,
	@iHour_Audit			int = NULL
AS
IF (@i_type not in (1,2,3,4))
BEGIN
	RAISERROR('Неправильное значение управляющего параметра!', 16, 1)
	RETURN 0
END

DECLARE @inserted_disc_uch_plan	int
SET @inserted_disc_uch_plan = 0

if @ik_spclz = 0 set @ik_spclz = null

IF (@i_type = 1)		--выполняем вставку
BEGIN		
	--IF NOT EXISTS(Select ik_disc_uch_plan FROM sv_disc WHERE (ik_disc = @ik_disc) and (ik_uch_plan = @ik_uch_plan)and (ik_pdgrp_disc = @ik_pdgrp_disc))
	--BEGIN
		INSERT INTO sv_disc (ik_uch_plan, ik_disc, ik_ckl_disc, ik_grp_disc,ik_pdgrp_disc, ik_default_kaf, iHour_gos, iIndivid, Cname_ckl_disc1, ViborGroup,iK_spclz, iHour_Audit)
		VALUES (@ik_uch_plan, @ik_disc, @ik_ckl_disc, @ik_grp_disc, @ik_pdgrp_disc, @ik_default_kaf, @iHour_gos, @iIndivid, @Cname_ckl_disc_gos, @ViborGroup, @ik_spclz, @iHour_Audit)
	--END
	--ELSE
	--BEGIN
	--	RAISERROR('Данная дисциплина уже внесена в учебный план!', 16, 1)
	--END
	--SET @inserted_disc_uch_plan = IDENT_CURRENT('sv_disc')
	select @inserted_disc_uch_plan =  @@IDENTITY

END

IF (@i_type = 2)		--выполняем обновление
BEGIN
	--IF NOT EXISTS(Select ik_disc_uch_plan FROM sv_disc WHERE (ik_disc = @ik_disc) and (ik_uch_plan = @ik_uch_plan)
	--and (ik_pdgrp_disc = @ik_pdgrp_disc) and (ik_disc_uch_plan <> @ik_disc_uch_plan))
	--BEGIN
		UPDATE sv_disc
		SET
		ik_disc = @ik_disc,
		ik_uch_plan = @ik_uch_plan,
		Cname_ckl_disc1 = @Cname_ckl_disc_gos,	
		ik_default_kaf = @ik_default_kaf,	
		iHour_gos = @iHour_gos,
		iIndivid = @iIndivid,
		ik_ckl_disc = @ik_ckl_disc,
		ik_grp_disc = @ik_grp_disc,
		ik_pdgrp_disc= @ik_pdgrp_disc,
		ViborGroup = @ViborGroup,
		iK_spclz = @ik_spclz,
		iHour_Audit = @iHour_Audit        
		WHERE ik_disc_uch_plan = @ik_disc_uch_plan

		if (@ik_spclz is null) 
		  delete from sv_disc where ik_uch_plan = @ik_uch_plan and ik_disc = @ik_disc 
		  and ik_ckl_disc = @ik_ckl_disc and ik_grp_disc = @ik_grp_disc and ik_pdgrp_disc= @ik_pdgrp_disc
		  and iK_spclz is not NULL

	--END
	--ELSE
	--BEGIN
	--	RAISERROR('Данная дисциплина уже внесена в учебный план!', 16, 1)
	--END
	SET @inserted_disc_uch_plan = @ik_disc_uch_plan	
END

IF (@i_type = 3)			
BEGIN
	
	DELETE FROM sv_disc
	WHERE ik_disc_uch_plan = @ik_disc_uch_plan	
END

IF (@i_type = 4)			
BEGIN
	--используется группировка, чтобы убрать дубляж из аттестаций БРС
	INSERT Content_UchPl(ik_disc_uch_plan, n_sem, ik_vid_zanyat, i_hour_per_week, ik_kaf, n_module, i_balls)
	SELECT @ik_disc_uch_plan, n_sem, ik_vid_zanyat, i_hour_per_week, ik_kaf, n_module, i_balls
		FROM Content_UchPl WHERE ik_disc_uch_plan = @source_disc_uch_plan
	--GROUP BY n_sem, ik_vid_zanyat, n_module
		
	insert Competence_sv_disc(ik_disc_uch_plan,ik_competence)
	select @ik_disc_uch_plan,ik_competence from Competence_sv_disc where ik_disc_uch_plan = @source_disc_uch_plan

	SET @inserted_disc_uch_plan = @ik_disc_uch_plan
END
return @inserted_disc_uch_plan



