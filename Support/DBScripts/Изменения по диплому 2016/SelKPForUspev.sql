USE [UGTU]
GO
/****** Object:  StoredProcedure [dbo].[SelKPForVipisca]    Script Date: 06.06.2016 15:20:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--select * from studgrup where ik_zach=5497
--exec [SelKPForVipisca] 20289,8, 6161
--выбирает темы курсовых и оценки по ним в выписку к диплому
--входной параметр - вид занятий: =8, если КП, и 9, если КР
ALTER PROCEDURE [dbo].[SelKPForVipisca]
@ik_zach INT,
@iK_vid_zanyat int,				--код вида занятий
@ik_CurGroup INT				--код текущей группы 
AS

--объявляем временную таблицу, в которую будем вносить данные
DECLARE @ResultTable Table
(
	ik_disc				INT,
	discName			VARCHAR(500),
	cTema				VARCHAR(500),			--тема
	cOsenca				VARCHAR(20),				--оценка
	semNum				INT,
	Dd_exam DATETIME,
	[ik_upContent]      INT,
	[ik_vid_zanyat]		INT
)

--вначале заносим предметы по текущей группе
if @ik_CurGroup is null
	SELECT @ik_CurGroup = ik_grup FROM dbo.StudGrup 
		WHERE ik_zach=@ik_zach AND ik_pricOtch IS NULL AND Ik_prikazOtch IS NULL

DECLARE @ik_grup int
SET @ik_grup=@ik_CurGroup

--вначале вносим все необходимые дисциплины
INSERT INTO @ResultTable(iK_disc, discName, [ik_upContent], semNum, [ik_vid_zanyat])
SELECT DISTINCT discpln.iK_disc, discpln.cName_disc, [ik_upContent], Content_UchPl.[n_sem], [ik_vid_zanyat] FROM dbo.discpln 
	INNER JOIN dbo.sv_disc ON discpln.iK_disc=sv_disc.ik_disc 
	inner join dbo.Content_UchPl on sv_disc.ik_disc_uch_plan=Content_UchPl.ik_disc_uch_plan
	WHERE 
	ik_uch_plan = (SELECT ik_uch_plan FROM Grup WHERE Ik_grup = @ik_grup)
	AND Content_UchPl.ik_vid_zanyat BETWEEN 8 AND 9
ORDER BY iK_disc, [n_sem]

DECLARE @iK_disc INT, @ik_upContent INT


--пока есть незанесенные дисциплины
WHILE (@ik_grup IS NOT NULL) AND EXISTS(SELECT 'TRUE' FROM @ResultTable WHERE cOsenca is null)
BEGIN
	SELECT @ik_upContent = MIN(ik_upContent) FROM @ResultTable WHERE cOsenca is null
	SELECT @iK_disc = iK_disc FROM @ResultTable WHERE ik_upContent=@ik_upContent
	
	--цикл по одной группе 
	WHILE @iK_disc IS NOT NULL AND @ik_upContent IS NOT NULL
	BEGIN
		UPDATE @ResultTable
		SET cTema=usp.cTema, cOsenca=usp.Name_osenca, Dd_exam=usp.Dd_exam 
		FROM
--оценку выбираем по текущей группе	
			(SELECT KPTheme as cTema, 
				Name_osenca, MAX(Dd_exam) Dd_exam
				FROM Uspev, dbo.Osenca, dbo.Vedomost, dbo.sv_disc, dbo.Content_UchPl
				LEFT JOIN dbo.UspevDocument
				ON Content_UchPl.ik_upContent=UspevDocument.ik_upContent
					AND UspevDocument.ik_zach=@ik_zach
				LEFT JOIN dbo.UspevKPTheme ON UspevDocument.idUspevDocs=UspevKPTheme.idUspevDocs
				WHERE Uspev.ik_zach=@ik_zach AND Uspev.Cosenca>2 
					AND Uspev.ik_ved=Vedomost.ik_ved 
					AND Vedomost.ik_grup=@ik_grup
					AND Content_UchPl.ik_upContent=Vedomost.ik_upContent
					AND Content_UchPl.[ik_disc_uch_plan]=sv_disc.[ik_disc_uch_plan]
					AND Uspev.Cosenca=Osenca.Cosenca
					AND ((Content_UchPl.ik_upContent=@ik_upContent AND @ik_CurGroup=@ik_grup) OR (sv_disc.ik_disc=@ik_disc))
				GROUP BY KPTheme, Name_osenca) usp,
				@ResultTable result
				WHERE result.ik_upContent=@ik_upContent

		--oпределяем след код дисциплины 
		SELECT @ik_upContent = MIN(ik_upContent) FROM @ResultTable WHERE cOsenca is null AND ik_upContent>@ik_upContent
		SELECT @iK_disc = iK_disc FROM @ResultTable WHERE ik_upContent=@ik_upContent
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
END

UPDATE @ResultTable
SET cTema=LOWER(SUBSTRING(cTema,1,1))+ SUBSTRING(cTema,2,LEN(cTema)-1)
where cTema is not null and LEN(cTema)>1

select ik_disc, ik_upContent, cTema, cOsenca, discName, Dd_exam from @ResultTable
where   cOsenca is not null
order by semNum







/*



--select * from studgrup where ik_zach=5497
--exec [SelKPForVipisca] 20289,8, 6161
--выбирает темы курсовых и оценки по ним в выписку к диплому
--входной параметр - вид занятий: =8, если КП, и 9, если КР
ALTER PROCEDURE [dbo].[SelKPForVipisca]
@ik_zach INT,
@iK_vid_zanyat int,				--код вида занятий
@ik_CurGroup INT				--код текущей группы 
AS

--объявляем временную таблицу, в которую будем вносить данные
DECLARE @ResultTable Table
(
	ik_disc				INT,
	discName			VARCHAR(500),
	cTema				VARCHAR(500),			--тема
	cOsenca				VARCHAR(20),				--оценка
	semNum				INT,
	Dd_exam DATETIME,
	[ik_upContent]      INT
)

--вначале заносим предметы по текущей группе
if @ik_CurGroup is null
	SELECT @ik_CurGroup = ik_grup FROM dbo.StudGrup 
		WHERE ik_zach=@ik_zach AND ik_pricOtch IS NULL AND Ik_prikazOtch IS NULL

DECLARE @ik_grup int
SET @ik_grup=@ik_CurGroup

--вначале вносим все необходимые дисциплины
INSERT INTO @ResultTable(iK_disc, discName, [ik_upContent], semNum)
SELECT DISTINCT discpln.iK_disc, discpln.cName_disc, [ik_upContent], Content_UchPl.[n_sem] FROM dbo.discpln 
	INNER JOIN dbo.sv_disc ON discpln.iK_disc=sv_disc.ik_disc 
	inner join dbo.Content_UchPl on sv_disc.ik_disc_uch_plan=Content_UchPl.ik_disc_uch_plan
	WHERE 
	ik_uch_plan = (SELECT ik_uch_plan FROM Grup WHERE Ik_grup = @ik_grup)
	AND Content_UchPl.ik_vid_zanyat BETWEEN 8 AND 9

DECLARE @iK_disc INT, @semNum INT


--пока есть незанесенные дисциплины
WHILE (@ik_grup IS NOT NULL) AND EXISTS(SELECT 'TRUE' FROM @ResultTable WHERE cOsenca is null)
BEGIN
	SELECT @iK_disc = MIN(ik_upContent) FROM @ResultTable WHERE cOsenca is null
	--цикл по одной группе 
	WHILE @ik_upContent IS NOT NULL
	BEGIN
		UPDATE @ResultTable
		SET cTema=usp.cTema, cOsenca=usp.Name_osenca, Dd_exam=usp.Dd_exam FROM
--оценку выбираем по текущей группе	
			(SELECT KPTheme as cTema, 
				Name_osenca, MAX(Dd_exam) Dd_exam
				FROM Uspev, dbo.Osenca, dbo.Vedomost
				LEFT JOIN dbo.UspevDocument
				ON Vedomost.ik_upContent=UspevDocument.ik_upContent
					AND UspevDocument.ik_zach=@ik_zach
				LEFT JOIN dbo.UspevKPTheme ON UspevDocument.idUspevDocs=UspevKPTheme.idUspevDocs
				WHERE Uspev.ik_zach=@ik_zach AND Uspev.Cosenca>2 
					AND Uspev.ik_ved=Vedomost.ik_ved AND Vedomost.ik_grup=@ik_grup
					AND Vedomost.ik_upContent=@ik_upContent
					AND Uspev.Cosenca=Osenca.Cosenca
				GROUP BY KPTheme, Name_osenca) usp,
				@ResultTable result
				WHERE result.ik_upContent=@ik_upContent


		SELECT @ik_upContent = MIN(ik_upContent) FROM @ResultTable WHERE ik_upContent>@ik_upContent AND  cOsenca is null
	END
--выбираем следующую группу
	IF @ik_CurGroup=@ik_grup
	BEGIN
		SELECT @ik_grup = MIN(ik_grup) FROM dbo.StudGrup 
			WHERE ik_zach=@ik_zach AND ik_grup<>@ik_grup
	END
	ELSE
	BEGIN
		SELECT @ik_grup = MIN(ik_grup) FROM dbo.StudGrup 
			WHERE ik_zach=@ik_zach 
				AND ik_grup>@ik_grup AND ik_grup<>@ik_CurGroup
	END
END

UPDATE @ResultTable
SET cTema=LOWER(SUBSTRING(cTema,1,1))+ SUBSTRING(cTema,2,LEN(cTema)-1)
where cTema is not null and LEN(cTema)>1

select ik_disc, ik_upContent, cTema, cOsenca, discName, Dd_exam from @ResultTable
where   cOsenca is not null
order by semNum*/


