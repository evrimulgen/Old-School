USE [UGTU_ACTTEST]
GO
/****** Object:  StoredProcedure [dbo].[SelUspevForStud]    Script Date: 30.07.2015 12:58:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC	[dbo].[SelUspevForStud] @n_sem=2, @ik_zach=18465
ALTER          PROCEDURE [dbo].[SelUspevForStud]
@n_sem INT,
@ik_zach INT
AS

DECLARE @ResultTable Table
(
	cName_disc			VARCHAR(500),			--наименование
	cName_vid_zanyat	VARCHAR(50),
	ShortName			VARCHAR(20),			--оценка
	Dd_exam				DATETIME,				--дата экзамена
	PrepName				VARCHAR(100),
	n_sem 				INT,
	iK_vid_zanyat 		INT,
	Osenca				INT,
	HourCount			FLOAT,
	[ViborGroup]		INT
)




insert into @ResultTable(cName_disc,cName_vid_zanyat,ShortName,Dd_exam,PrepName,n_sem,iK_vid_zanyat, Osenca, HourCount, [ViborGroup])
  SELECT cName_disc,				--название дисциплины 
	cName_vid_zanyat, 				--вид отчеиности
	'',  					--оценка
	Dd_exam, 						--дата экзамена
	RTRIM(LastName)+' '+CONVERT(VARCHAR(1),FirstName)+'.'
		+CONVERT(VARCHAR(1),Otch)+'.' as PrepName,						--преподаватель
	contup.n_sem,
	contup.iK_vid_zanyat,
	vedUsp.Cosenca,
	CONVERT(INT,(SemAuditHourCount+(contup.iHour_gos-AllAuditHourCount)*(SemWeekCount/AllWeekCount))) as HourCount,
--	(SemAuditHourCount+((contup.iHour_gos-AllAuditHourCount-contup.iIndivid)*SemWeekCount)/AllWeekCount
--			+contup.iIndivid/AllSemCount) as HourCount
	[ViborGroup]
	 FROM
	(SELECT iK_vid_zanyat, ik_upContent, sv_disc.ik_disc_uch_plan, n_sem, CONVERT(FLOAT,iHour_gos) iHour_gos, 
				CONVERT(FLOAT,iIndivid) iIndivid, ik_uch_plan, iK_disc, [ViborGroup] FROM 
		dbo.sv_disc, dbo.Content_UchPl 
		Where /* (sv_disc.ik_uch_plan IN (Select ik_uch_plan From Grup Where ik_grup IN (SELECT ik_grup FROM dbo.StudGrup WHERE ik_zach=@ik_zach)))
		   AND */((n_sem = @n_sem) or (@n_sem = 0)) and 
			(ik_vid_zanyat in (Select ik_vid_zanyat From vid_zaniat Where ikTypeZanyat in (SELECT ikTypeZanyat FROM dbo.TypeZanyat WHERE bitOtchetnost = 1)))
			AND Content_UchPl.ik_disc_uch_plan = dbo.sv_disc.ik_disc_uch_plan)contup 
	INNER JOIN 
	dbo.vid_zaniat
		ON vid_zaniat.ik_vid_zanyat=contup.ik_vid_zanyat
	INNER  JOIN	  
	  dbo.discpln
		ON discpln.iK_disc=contup.iK_disc
	LEFT JOIN
	(SELECT MAX(Cosenca) Cosenca,  MAX(Dd_exam) Dd_exam, MAX(itab_n) itab_n, ik_upContent FROM 
		dbo.Uspev  u
		INNER JOIN
		dbo.Vedomost v
		ON u.Ik_ved=v.Ik_ved
		WHERE ik_zach=@ik_zach AND Cosenca>-1
		GROUP BY ik_upContent)vedUsp
	on contup.ik_upContent=vedUsp.ik_upContent
	--LEFT  JOIN 
	--(SELECT Cosenca, ShortName FROM dbo.Osenca WHERE Cosenca>-1)os
	--	ON vedUsp.Cosenca=os.Cosenca
	LEFT JOIN
	(select distinct itab_n,LastName, FirstName, Otch from Import.KafTeachers )p
		ON p.itab_n=vedUsp.itab_n

	
	left JOIN

--(SELECT (SemAuditHourCount+((contup.iHour_gos-AllAuditHourCount-contup.iIndivid)*SemWeekCount/AllWeekCount)
--			+sv_disc.iIndivid/AllSemCount) as HourCount, ik_disc_uch_plan    FROM 
		(SELECT  CONVERT(FLOAT,sum(i_hour_per_week * kol_ned)) AS AllAuditHourCount, 
					CONVERT(FLOAT,sum(kol_ned)) AS AllWeekCount, 
					CONVERT(FLOAT,count(kol_ned)) AS AllSemCount,ik_disc_uch_plan, ik_uch_plan 
				FROM 
				dbo.Content_UchPl, dbo.sem_uch_pl
					WHERE i_hour_per_week is not NULL 
--						AND ik_disc_uch_plan = contup.ik_disc_uch_plan
--						and ik_uch_plan = contup.ik_uch_plan
						and sem_uch_pl.n_sem=Content_UchPl.n_sem
				group by ik_disc_uch_plan, ik_uch_plan
				)AllCount
	on  AllCount.ik_disc_uch_plan=contup.ik_disc_uch_plan and AllCount.ik_uch_plan = contup.ik_uch_plan
	left join
		(SELECT  CONVERT(FLOAT,sum(i_hour_per_week * kol_ned)) AS SemAuditHourCount, 
					CONVERT(FLOAT,sum(kol_ned)) AS SemWeekCount, ik_disc_uch_plan, sem_uch_pl.n_sem, ik_uch_plan 
				FROM 
				dbo.Content_UchPl, dbo.sem_uch_pl
					WHERE i_hour_per_week is not NULL
						and sem_uch_pl.n_sem=Content_UchPl.n_sem 
--						AND ik_disc_uch_plan = contup.ik_disc_uch_plan
--						AND sem.n_sem=contup.n_sem
--						and ik_uch_plan = contup.ik_uch_plan 
			group by ik_disc_uch_plan, sem_uch_pl.n_sem, ik_uch_plan 
)SemCount 
		on SemCount.ik_disc_uch_plan=contup.ik_disc_uch_plan AND SemCount.n_sem=contup.n_sem
			and SemCount.ik_uch_plan = contup.ik_uch_plan
Where (contup.ik_uch_plan IN (Select ik_uch_plan From Grup Where ik_grup IN (SELECT ik_grup FROM dbo.StudGrup WHERE ik_zach=@ik_zach)))
		   OR Cosenca>-1
 

SELECT cName_disc,cName_vid_zanyat,	ShortName,Dd_exam,
							PrepName,n_sem, HourCount
FROM
	(SELECT cName_disc,cName_vid_zanyat,n_sem,	MAX(Dd_exam) Dd_exam,
								MAX(PrepName) PrepName, MAX(HourCount) HourCount, MAX(Osenca) Osenca
		 FROM @ResultTable
	WHERE [ViborGroup] =0 OR ShortName IS NOT NULL 
	GROUP BY cName_disc,cName_vid_zanyat, n_sem) Uspev
	LEFT JOIN
	dbo.Osenca ON Uspev.Osenca=Osenca.Cosenca
ORDER BY  n_sem, Dd_exam

