USE [UGTU]
GO
/****** Object:  StoredProcedure [dbo].[SelUspevForVipisca]    Script Date: 31.03.2016 12:28:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--DECLARE @ik_zach INT
--SET @ik_zach=5544
--exec [SelUspevForVipisca] 35785,1473
--exec [SelUspevForVipisca] 18465, 1565					--Баракшина
--exec [SelUspevForVipisca] 18961, 1585					--
--exec [SelUspevForVipisca] 24962, 1981
--exec [SelUspevForVipisca] 35790, 1205
--exec [SelUspevForVipisca] 18693, 1572
--exec [SelUspevForVipisca] 13969, 2080
--выбирает изученные предметы и оценки по ним в выписку к диплому
ALTER PROCEDURE [dbo].[SelUspevForVipisca]
@ik_zach INT,
@ik_CurGroup INT				--код текущей группы 

AS

declare @GOSVidzaniat int	--код гос экзамена (используется, чтобы исключить)
set @GOSVidzaniat=56

--вначале заносим предметы по текущей группе
if @ik_CurGroup is null
	SELECT @ik_CurGroup = ik_grup FROM dbo.StudGrup 
		WHERE ik_zach=@ik_zach AND ik_pricOtch IS NULL AND Ik_prikazOtch IS NULL

DECLARE @ik_grup int
SET @ik_grup=@ik_CurGroup

DECLARE @CurrIk_uch_plan INT
SELECT @CurrIk_uch_plan=Ik_uch_plan FROM Grup Where Ik_grup = @ik_CurGroup


DECLARE @ik_profile INT
SELECT @ik_profile=[ik_spclz] FROM [dbo].[Grup] Where Ik_grup = @ik_CurGroup

DECLARE @VidGos INT
SELECT @VidGos=[VidGos] FROM [dbo].[Relation_spec_fac]
INNER JOIN [dbo].[Grup] ON [Relation_spec_fac].ik_spec_fac=[Grup].ik_spec_fac
Where Ik_grup = @ik_CurGroup

DECLARE @ResultTable Table
(
	iK_disc 			INT,					--код дисциплины
	cName_disc			VARCHAR(150),			--наименование
	HourCount			INT,					--кол-во часов
	AuditHourCount		INT,
	cOsenca				VARCHAR(20),
	shfr_disc			VARCHAR(20),			--шифр дисциплины
	cklOrderNumber			INT,				--номер цикла дисциплины по плану
	grpOrderNumber			INT,
	OtchSemNumber		INT,
	ik_vid_zanyat		INT,
	ZECount INT,
	Dd_exam DATETIME,
	[lVibor]            BIT
--	ik_ved				INT						--код ведомости
)

--вначале вносим все необходимые дисциплины и оценки по текущей группе
INSERT INTO @ResultTable(iK_disc, cName_disc, HourCount, AuditHourCount, shfr_disc, 
	cklOrderNumber, grpOrderNumber, OtchSemNumber, ik_vid_zanyat, ZECount, cOsenca, Dd_exam, [lVibor])
SELECT DISTINCT iK_disc, cName_disc, iHour_gos, AuditHourCount, 
		cname_ckl_disc1, cklOrderNumber, grpOrderNumber, MAX(n_sem), MIN(ik_vid_zanyat),
		 ZECount, MAX(Osenca.Name_osenca), MAX(Dd_exam), lVibor
FROM 
	[dbo].[GetUchPlanContent](@CurrIk_uch_plan,@ik_profile,@VidGos,@GOSVidzaniat)uchPlan
		LEFT JOIN
		(SELECT  ik_upContent, MAX(Uspev.[Cosenca]) [Cosenca], MAX(Vedomost.Dd_exam) Dd_exam
		FROM
		dbo.Vedomost  
		INNER JOIN 
		dbo.Uspev ON Vedomost.Ik_ved=Uspev.Ik_ved AND Uspev.Ik_zach=@ik_zach AND (Uspev.Cosenca>0 and Uspev.Cosenca<>1)
		GROUP BY ik_upContent)Vedomost
		ON Vedomost.ik_upContent=uchPlan.ik_upContent
		LEFT JOIN dbo.Osenca ON Vedomost.Cosenca=Osenca.Cosenca

GROUP BY iK_disc, cName_disc, iHour_gos, cname_ckl_disc1, cklOrderNumber, grpOrderNumber, AuditHourCount,  uchPlan.ik_upContent, ZECount, lVibor


DECLARE @ik_disc INT


--пока есть незанесенные дисциплины
WHILE (@ik_grup IS NOT NULL) AND EXISTS(SELECT 'TRUE' FROM @ResultTable WHERE cOsenca IS NULL)
BEGIN
	SELECT @ik_disc = MIN(iK_disc) FROM @ResultTable WHERE cOsenca IS NULL

	--цикл по группе 
	WHILE @ik_disc IS NOT NULL
	BEGIN

		UPDATE @ResultTable
		SET cOsenca=Osenca.Name_osenca, Dd_exam=Vedomost.Dd_exam FROM
--оценку выбираем по текущей группе	
			@ResultTable result,
			--(SELECT Name_osenca, MAX(Content_UchPl.n_sem) sem
				--FROM 
				Uspev, dbo.Vedomost, dbo.Content_UchPl, dbo.sv_disc, dbo.Osenca,		
		(SELECT TOP 1 Content_UchPl.n_sem
		FROM dbo.sv_disc, dbo.Content_UchPl, dbo.vid_zaniat,dbo.TypeZanyat
		WHERE  sv_disc.ik_disc=@ik_disc
			AND sv_disc.ik_disc_uch_plan=Content_UchPl.ik_disc_uch_plan
			AND sv_disc.Ik_uch_plan=@CurrIk_uch_plan
			AND Content_UchPl.ik_vid_zanyat=vid_zaniat.ik_vid_zanyat 
			AND Content_UchPl.iK_vid_zanyat!=@GOSVidzaniat --исключаем гос экзамен
			and vid_zaniat.ikTypeZanyat =TypeZanyat.ikTypeZanyat 
			AND TypeZanyat.bitOtchetnost=1 AND (TypeZanyat.bitExam=1 OR TypeZanyat.bitZach=1)
		ORDER BY TypeZanyat.bitExam DESC, Content_UchPl.n_sem DESC
		) MaxSem
				WHERE Uspev.ik_zach=@ik_zach AND Uspev.Cosenca>0 AND Uspev.Cosenca<>2
					AND Uspev.ik_ved=Vedomost.ik_ved AND Vedomost.ik_grup=@ik_grup
					AND Vedomost.ik_upContent=Content_UchPl.ik_upContent
					--если текущая группа проверяем совпадение № семестра и вида занятий
					AND Content_UchPl.ik_disc_uch_plan=sv_disc.ik_disc_uch_plan
					AND sv_disc.ik_disc=@ik_disc
					AND Uspev.Cosenca=Osenca.Cosenca
					AND Content_UchPl.ik_vid_zanyat=result.ik_vid_zanyat
					AND result.ik_disc=@ik_disc
					AND Content_UchPl.n_sem = MaxSem.n_sem--((@ik_grup=@ik_CurGroup AND Content_UchPl.n_sem = result.OtchSemNumber)
						 --or (@ik_grup!=@ik_CurGroup))
					
		SELECT @ik_disc = MIN(iK_disc) FROM @ResultTable WHERE cOsenca IS NULL AND iK_disc>@ik_disc
	END

--выбираем следующую группу
	IF @ik_CurGroup=@ik_grup
	BEGIN
		SELECT @ik_grup = MIN(ik_grup) FROM dbo.StudGrup 
			WHERE ik_zach=@ik_zach AND ik_grup!=@ik_grup
	END
	ELSE
	BEGIN
		SELECT @ik_grup = MIN(ik_grup) FROM dbo.StudGrup 
			WHERE ik_zach=@ik_zach 
				AND ik_grup>@ik_grup AND ik_grup!=@ik_CurGroup
	END
	SELECT @CurrIk_uch_plan=Ik_uch_plan FROM Grup Where Ik_grup = @ik_grup
END

--удаляем дисциплины по выбору
delete from @ResultTable
where  /*cName_disc is nulland */cOsenca IS NULL





INSERT INTO @ResultTable(iK_disc, cName_disc, HourCount, cOsenca, cklOrderNumber, grpOrderNumber, ZECount)
		SELECT -1, 'Общая трудоемкость образовательной программы', SUM(HourCount), 'x',1000, 1000, SUM(ZECount)
		FROM @ResultTable


INSERT INTO @ResultTable(iK_disc, cName_disc, HourCount, cOsenca, cklOrderNumber, grpOrderNumber)
		SELECT 0, 'в том числе объем работы обучающихся во взаимодействии с преподавателем:', SUM(AuditHourCount), 'x', 10000, 10000 
		FROM @ResultTable

select iK_disc,	cName_disc,	HourCount, cOsenca, shfr_disc, AuditHourCount as AuditHourCount, /*IIF(iK_disc=10,2, HourCount/36) as*/ ZECount, Dd_exam, lVibor
 from @ResultTable
 ORDER BY cklOrderNumber, grpOrderNumber, lVibor, shfr_disc

























 go

 create FUNCTION [dbo].[GetUchPlanContent] 
(
	@CurrIk_uch_plan INT,
	@ik_profile		 INT,
	@VidGos			 INT,
	@GOSVidzaniat	 INT
)
RETURNS  TABLE

AS
RETURN
	(SELECT DISTINCT disc.iK_disc, cName_disc, iHour_gos, iHour_Audit AS AuditHourCount, 
		cname_ckl_disc1, cklOrderNumber, grpOrderNumber, (OtchContent_UchPl.n_sem) , (OtchContent_UchPl.ik_vid_zanyat),
		 IIF(disc.iK_disc=10,2, iHour_gos/36) as ZECount, OtchContent_UchPl.ik_upContent
FROM 
	(select discpln.iK_disc, discpln.cName_disc,
		sv_disc.ik_disc_uch_plan, sv_disc.iHour_gos, sem_uch_pl.kol_ned, sem_uch_pl.n_sem,
		cname_ckl_disc1, ckl_disc.OrderNumber as cklOrderNumber,
		grp_disc.OrderNumber as grpOrderNumber, [iIndivid], sv_disc.iHour_Audit
	  from dbo.sv_disc inner join dbo.sem_uch_pl ON sv_disc.Ik_uch_plan=@CurrIk_uch_plan
		AND sem_uch_pl.Ik_uch_plan=@CurrIk_uch_plan 
		AND ([iK_spclz] IS NULL OR [iK_spclz]=@ik_profile OR @VidGos<>2) 
	  INNER JOIN
	   dbo.discpln ON sv_disc.iK_disc=discpln.iK_disc
	   LEFT JOIN dbo.ckl_disc ON sv_disc.IK_ckl_disc=ckl_disc.IK_ckl_disc
	   LEFT JOIN  dbo.grp_disc ON sv_disc.ik_grp_disc=grp_disc.ik_grp_disc
		) disc
		INNER JOIN
		
		(SELECT sv_disc.ik_disc, ISNULL(MAX(EkzContent_UchPl.n_sem),MAX(ZachContent_UchPl.n_sem)) n_sem
		FROM dbo.sv_disc LEFT JOIN 
		dbo.Content_UchPl EkzContent_UchPl ON sv_disc.ik_disc_uch_plan=EkzContent_UchPl.ik_disc_uch_plan
			AND EkzContent_UchPl.ik_vid_zanyat IN 
						(SELECT ik_vid_zanyat FROM dbo.vid_zaniat WHERE 
								iK_vid_zanyat!=@GOSVidzaniat --исключаем гос экзамен
							and ikTypeZanyat IN 
							(SELECT ikTypeZanyat FROM dbo.TypeZanyat WHERE bitOtchetnost=1 AND bitExam=1))
		 LEFT JOIN dbo.Content_UchPl as ZachContent_UchPl ON sv_disc.ik_disc_uch_plan=ZachContent_UchPl.ik_disc_uch_plan
			AND ZachContent_UchPl.ik_vid_zanyat IN 
						(SELECT ik_vid_zanyat FROM dbo.vid_zaniat WHERE 
								iK_vid_zanyat!=@GOSVidzaniat --исключаем гос экзамен
							and ikTypeZanyat IN 
							(SELECT ikTypeZanyat FROM dbo.TypeZanyat WHERE bitOtchetnost=1 AND bitZach=1))
		WHERE 
			sv_disc.Ik_uch_plan=@CurrIk_uch_plan AND ([iK_spclz] IS NULL OR [iK_spclz]=@ik_profile OR @VidGos<>2)
		GROUP BY sv_disc.ik_disc) MaxSem
		ON disc.iK_disc=MaxSem.ik_disc AND MaxSem.n_sem IS NOT NULL
		
		INNER JOIN Content_UchPl OtchContent_UchPl
		ON disc.ik_disc_uch_plan=OtchContent_UchPl.ik_disc_uch_plan AND OtchContent_UchPl.n_sem=MaxSem.n_sem
			AND OtchContent_UchPl.ik_vid_zanyat IN 
						(SELECT ik_vid_zanyat FROM dbo.vid_zaniat WHERE 
								iK_vid_zanyat!=@GOSVidzaniat --исключаем гос экзамен
							and ikTypeZanyat IN 
							(SELECT ikTypeZanyat FROM dbo.TypeZanyat WHERE bitOtchetnost=1 AND (bitExam=1 OR bitZach=1)))
		
		

	 
--GROUP BY disc.iK_disc, cName_disc, iHour_gos, cname_ckl_disc1, cklOrderNumber, grpOrderNumber, [iIndivid],iHour_Audit,  OtchContent_UchPl.ik_upContent
)




go
go
--select * from [dbo].[GetUchPlanSums](2080)
 alter function [dbo].[GetUchPlanSums] 
(@ik_CurGroup INT)				--код текущей группы 
RETURNS @Result TABLE
   (
	 GosHourCount INT, 
	 AuditHourCount INT, 
	 ZECount  INT
   ) 
AS
BEGIN
declare @GOSVidzaniat int	--код гос экзамена (используется, чтобы исключить)
set @GOSVidzaniat=56

DECLARE @CurrIk_uch_plan INT
SELECT @CurrIk_uch_plan=Ik_uch_plan FROM Grup Where Ik_grup = @ik_CurGroup

DECLARE @ik_profile INT
SELECT @ik_profile=[ik_spclz] FROM [dbo].[Grup] Where Ik_grup = @ik_CurGroup

DECLARE @VidGos INT
SELECT @VidGos=[VidGos] FROM [dbo].[Relation_spec_fac]
INNER JOIN [dbo].[Grup] ON [Relation_spec_fac].ik_spec_fac=[Grup].ik_spec_fac
Where Ik_grup = @ik_CurGroup
	
INSERT INTO @Result
SELECT DISTINCT SUM(iHour_gos) GosHourCount, SUM(AuditHourCount) AuditHourCount, SUM(ZECount) ZECount
FROM 
	(select DISTINCT iK_disc, cName_disc, iHour_gos, AuditHourCount,ZECount
	FROM [dbo].[GetUchPlanContent](@CurrIk_uch_plan,@ik_profile,@VidGos,@GOSVidzaniat))uchPlan 

RETURN
END

go

--select * from [GrupInfo](2080)
ALTER FUNCTION [dbo].[GrupInfo](@ik_grup int)
RETURNS @Result TABLE
   (
    Ik_grup                 INT,
	ik_spec_fac				int,
	Cname_grup				VARCHAR(50),
	Ik_uch_plan				int,
	nYear_post				int,
	DateCreate				datetime,
	DateExit				datetime,
	ik_spclz				int,
	Cname_spec				varchar(300),
	id_parent				int,

	GosHourCount INT, 
	AuditHourCount INT, 
	ZECount  INT
   ) 
AS
BEGIN

declare @GOSVidzaniat int	--код гос экзамена (используется, чтобы исключить)
set @GOSVidzaniat=56

DECLARE @CurrIk_uch_plan INT
SELECT @CurrIk_uch_plan=Ik_uch_plan FROM Grup Where Ik_grup = @ik_grup

DECLARE @ik_profile INT
SELECT @ik_profile=[ik_spclz] FROM [dbo].[Grup] Where Ik_grup = @ik_grup

DECLARE @VidGos INT
SELECT @VidGos=[VidGos] FROM [dbo].[Relation_spec_fac]
INNER JOIN [dbo].[Grup] ON [Relation_spec_fac].ik_spec_fac=[Grup].ik_spec_fac
Where Ik_grup = @ik_grup
	
 


 INSERT INTO @Result(Ik_grup, ik_spec_fac, Cname_grup, Ik_uch_plan, nYear_post, DateCreate, DateExit, ik_spclz, Cname_spec, id_parent, GosHourCount,AuditHourCount,ZECount)
	select Grup.Ik_grup, ik_spec_fac, Cname_grup, Grup.Ik_uch_plan, nYear_post, DateCreate, DateExit, Grup.ik_spclz, cName_spclz, id_parent, GosHourCount,AuditHourCount,ZECount
	from Grup  left join
	(SELECT DISTINCT SUM(iHour_gos) GosHourCount, SUM(AuditHourCount) AuditHourCount, SUM(ZECount) ZECount
		FROM 
	(select DISTINCT iK_disc, cName_disc, iHour_gos, AuditHourCount,ZECount
	FROM [dbo].[GetUchPlanContent](@CurrIk_uch_plan,@ik_profile,@VidGos,@GOSVidzaniat))uchPlan )uchPlan
	ON Grup.Ik_grup = @ik_grup
	left join spclz on Grup.ik_spclz = spclz.iK_spclz left join Uch_pl on Grup.Ik_uch_plan=Uch_pl.ik_uch_plan
	WHERE Grup.Ik_grup = @ik_grup
  RETURN
END

