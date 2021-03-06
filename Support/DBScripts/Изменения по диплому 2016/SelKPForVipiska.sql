USE [UGTU]
GO
/****** Object:  StoredProcedure [dbo].[SelKPForVipisca]    Script Date: 15.06.2016 11:34:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--select * from studgrup where ik_zach=5497
--exec [SelKPForVipisca] 5463,8, 1052
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
	Dd_exam DATETIME
)

--вначале заносим предметы по текущей группе
if @ik_CurGroup is null
	SELECT @ik_CurGroup = ik_grup FROM dbo.StudGrup 
		WHERE ik_zach=@ik_zach AND ik_pricOtch IS NULL AND Ik_prikazOtch IS NULL

DECLARE @ik_grup int
SET @ik_grup=@ik_CurGroup

--вначале вносим все необходимые дисциплины
INSERT INTO @ResultTable(iK_disc, discName)
SELECT DISTINCT discpln.iK_disc, discpln.cName_disc 
FROM dbo.discpln INNER JOIN dbo.sv_disc ON discpln.iK_disc=sv_disc.ik_disc WHERE 
	ik_uch_plan = (SELECT ik_uch_plan FROM Grup WHERE Ik_grup = @ik_grup)
	AND ik_disc_uch_plan IN 
		(SELECT ik_disc_uch_plan FROM dbo.Content_UchPl WHERE ik_vid_zanyat BETWEEN 8 AND 9)

DECLARE @ik_disc INT


--пока есть незанесенные дисциплины
WHILE (@ik_grup IS NOT NULL) AND EXISTS(SELECT 'TRUE' FROM @ResultTable WHERE cOsenca is null)
BEGIN
	SELECT @ik_disc = MIN(iK_disc) FROM @ResultTable WHERE cOsenca is null
	--цикл по одной группе 
	WHILE @ik_disc IS NOT NULL
	BEGIN
		UPDATE @ResultTable
		SET cTema=null/*usp.cTema*/, cOsenca=usp.Name_osenca, semNum = MaxSem, Dd_exam=DiscInfo.Dd_exam FROM
--оценку выбираем по текущей группе	
			(SELECT MAX(Content_UchPl.n_sem) MaxSem, MAX(Dd_exam) Dd_exam
				FROM Uspev, dbo.Vedomost, dbo.sv_disc, dbo.Content_UchPl
				WHERE Uspev.ik_zach=@ik_zach AND Uspev.Cosenca>2 
					AND Uspev.ik_ved=Vedomost.ik_ved AND Vedomost.ik_grup=@ik_grup
					AND Vedomost.ik_upContent=Content_UchPl.ik_upContent
					AND Content_UchPl.ik_vid_zanyat BETWEEN 8 AND 9
					AND Content_UchPl.ik_disc_uch_plan=sv_disc.ik_disc_uch_plan
					AND sv_disc.ik_disc=@ik_disc) DiscInfo
			INNER JOIN
			(SELECT Name_osenca,Content_UchPl.n_sem
				FROM Uspev, dbo.Vedomost, dbo.sv_disc, dbo.Osenca, dbo.Content_UchPl
				/*LEFT JOIN dbo.UspevDocument
				ON Content_UchPl.ik_upContent=UspevDocument.ik_upContent
					AND UspevDocument.ik_zach=@ik_zach
				LEFT JOIN dbo.UspevKPTheme ON UspevDocument.idUspevDocs=UspevKPTheme.idUspevDocs*/
				WHERE Uspev.ik_zach=@ik_zach AND Uspev.Cosenca>2 
					AND Uspev.ik_ved=Vedomost.ik_ved AND Vedomost.ik_grup=@ik_grup
					AND Vedomost.ik_upContent=Content_UchPl.ik_upContent
					AND Content_UchPl.ik_vid_zanyat BETWEEN 8 AND 9
					AND Content_UchPl.ik_disc_uch_plan=sv_disc.ik_disc_uch_plan
					AND sv_disc.ik_disc=@ik_disc
					AND Uspev.Cosenca=Osenca.Cosenca) usp
			ON DiscInfo.MaxSem=usp.n_sem
			INNER JOIN
				@ResultTable result
				ON result.ik_disc=@ik_disc


		SELECT @ik_disc = MIN(iK_disc) FROM @ResultTable WHERE iK_disc>@ik_disc AND  cOsenca is null
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

select ik_disc, cTema, cOsenca, discName, Dd_exam from @ResultTable
where   cOsenca is not null
order by semNum


