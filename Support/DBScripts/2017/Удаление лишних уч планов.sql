--GetAllVedNaprForDisc;1
--GetAllNaprStud;1

GO

/*

--исправление запросов вывода направлений
 

--exec GetAllVedNaprForDisc 953, 4,92,8
--exec GetAllVedNaprForDisc 438, 6, 213, 6

ALTER PROCEDURE [dbo].[GetAllVedNaprForDisc] 
	@ik_group	int,
	@n_sem	int,
	@ik_disc int,
	@iK_vid_zanyat int
as
	
    SELECT v.ik_ved, u.ik_zach, StudName, Nn_zach, cName_vid_exam, u.cosenca, Otsenca, Name_osenca, lClose
			,KPTheme as ctema, dD_vydano, Dd_exam 
    From 
	dbo.Grup inner join
 dbo.GetGrupStud(@ik_group) as s 	ON Grup.ik_grup=@ik_group

--(SELECT nCode, RTRIM(Clastname)+' '+CONVERT(VARCHAR(1),Cfirstname)+'.'
--		+CONVERT(VARCHAR(1),Cotch)+'.' as StudName FROM Stud) s 
--	INNER JOIN (SELECT Ik_zach, Nn_zach, nCode FROM dbo.Zach) z
--	ON s.nCode=z.nCode

	INNER JOIN (SELECT Ik_zach, Ik_ved, Cosenca FROM Uspev) u

	ON u.ik_zach=s.ik_zach
--	ON u.Ik_zach=z.Ik_zach

	INNER JOIN (SELECT Ik_ved, lClose, Ik_grup, Ik_vid_exam, ik_upContent, dD_vydano, Dd_exam  FROM Vedomost
		 where lPriznak_napr = 1) v
	ON v.Ik_ved=u.Ik_ved and ( V.ik_grup = @ik_group)
	INNER JOIN (SELECT ik_upContent, n_sem, ik_vid_zanyat, ik_disc_uch_plan FROM Content_UchPl
		 where ik_vid_zanyat=@ik_vid_zanyat and (n_sem = @n_sem)) cup
	ON v.ik_upContent=cup.ik_upContent
	INNER JOIN dbo.sv_disc sd
	ON cup.ik_disc_uch_plan = sd.ik_disc_uch_plan AND sd.ik_uch_plan=Grup.Ik_uch_plan
	INNER JOIN (SELECT ik_vid_exam, cName_vid_exam FROM Vid_exam) ve
	ON v.ik_vid_exam=ve.ik_vid_exam
	INNER JOIN (SELECT Cosenca, CONVERT(VARCHAR(1),Cosenca)+' ('
		+RTRIM(ShortName)+')' as Otsenca, Name_osenca FROM Osenca) o 
	ON u.Cosenca=o.Cosenca
	left join dbo.UspevDocument on u.ik_zach=UspevDocument.ik_zach AND v.ik_upContent=UspevDocument.ik_upContent
	left join dbo.UspevKPTheme on UspevDocument.idUspevDocs=UspevKPTheme.idUspevDocs	
	Where  (n_sem = @n_sem) and ik_disc=@ik_disc

order by StudName




go
GO

--[GetAllNaprStud] 2, 36869
ALTER          PROCEDURE [dbo].[GetAllNaprStud]
@n_sem INT,
@ik_zach INT
AS

DECLARE @ResultTable Table
(
	cName_disc			VARCHAR(100),			--наименование
	cName_vid_zanyat	VARCHAR(50),
	ShortName			VARCHAR(20),			--оценка
	dD_vydano			DATETIME,
	cName_vid_exam		VARCHAR(40),
	Dd_exam				DATETIME,				--дата экзамена
	PrepName			VARCHAR(100),
	n_sem 				INT,
	iK_vid_zanyat 		INT,
	Osenca				INT
)



  INSERT INTO @ResultTable(cName_disc,cName_vid_zanyat,	ShortName,dD_vydano,cName_vid_exam,Dd_exam,
							PrepName,n_sem,iK_vid_zanyat, Osenca)
  SELECT cName_disc,				--название дисциплины 
	cName_vid_zanyat, 				--вид отчеиности
	ShortName,  					--оценка
	dD_vydano,
    cName_vid_exam,
	Dd_exam, 						--дата экзамена
	RTRIM(LastName)+' '+CONVERT(VARCHAR(1),FirstName)+'.'
		+CONVERT(VARCHAR(1),Otch)+'.' as PrepName,						--преподаватель
	@n_sem as n_sem,
	iK_vid_zanyat,
	vedUsp.Cosenca
	 FROM
	(SELECT Cosenca, Dd_exam, Ik_vid_exam, dD_vydano, id_teacher, ik_upContent, Ik_grup, Ik_uch_plan FROM 
		(SELECT Ik_ved, Cosenca FROM dbo.Uspev WHERE ik_zach=@ik_zach AND Cosenca>-1) u
		INNER JOIN
		(SELECT Ik_ved, ik_upContent, lPriznak_napr, Dd_exam, Ik_vid_exam, dD_vydano, id_teacher, Grup.Ik_grup, Grup.Ik_uch_plan FROM dbo.Vedomost 
		inner join dbo.StudGrup ON ik_zach=@ik_zach
		inner join dbo.Grup on StudGrup.Ik_grup=Grup.ik_grup
		and lPriznak_napr = 1)v
		ON u.Ik_ved=v.Ik_ved)vedUsp
	INNER  JOIN 
	(SELECT Cosenca, ShortName FROM dbo.Osenca WHERE Cosenca>-1)os
		ON vedUsp.Cosenca=os.Cosenca

--выбираем виды отчетности в данном семестре
	  INNER JOIN
	(SELECT contup.iK_vid_zanyat, ik_upContent, cName_vid_zanyat,  cName_disc, Ik_uch_plan 
	FROM 
 	      (SELECT distinct ik_upContent, iK_disc, ik_vid_zanyat, Ik_uch_plan From
		dbo.Content_UchPl INNER JOIN dbo.sv_disc ON dbo.Content_UchPl.ik_disc_uch_plan = dbo.sv_disc.ik_disc_uch_plan
		Where --((ik_uch_plan IN (Select ik_uch_plan From Grup Where ik_grup IN (SELECT ik_grup FROM dbo.StudGrup WHERE ik_zach=@ik_zach)))
		-- and 
		 ((n_sem = @n_sem or @n_sem<1) and (ik_vid_zanyat in (Select ik_vid_zanyat From vid_zaniat Where ikTypeZanyat in (SELECT ikTypeZanyat FROM dbo.TypeZanyat WHERE bitOtchetnost = 1)))))contup
	INNER JOIN 
	(SELECT iK_vid_zanyat, cName_vid_zanyat FROM dbo.vid_zaniat)vz
		ON vz.ik_vid_zanyat=contup.ik_vid_zanyat
	INNER  JOIN	  
	  (SELECT iK_disc, cName_disc FROM dbo.discpln) d
		ON d.iK_disc=contup.iK_disc) cont
		ON vedUsp.ik_upContent=cont.ik_upContent AND cont.Ik_uch_plan=vedUsp.Ik_uch_plan
	INNER JOIN 
	  (SELECT ik_vid_exam, cName_vid_exam FROM Vid_exam) ve
		ON vedUsp.ik_vid_exam=ve.ik_vid_exam
	LEFT JOIN
	(select distinct idEmployee,LastName, FirstName, Otch from Import.KafTeachers )p
		ON p.idEmployee = vedUsp.id_teacher


  SELECT cName_disc, cName_vid_zanyat, ShortName, dD_vydano, cName_vid_exam, Dd_exam,	PrepName,n_sem
  FROM @ResultTable
  ORDER BY Dd_exam

go
*/

SELECT        Uch_pl.ik_uch_plan,Vedomost.Ik_grup, Grup.*
FROM            dbo.sv_disc INNER JOIN
                         dbo.Content_UchPl ON dbo.sv_disc.ik_disc_uch_plan = dbo.Content_UchPl.ik_disc_uch_plan INNER JOIN
                         dbo.Uch_pl ON dbo.sv_disc.ik_uch_plan = dbo.Uch_pl.ik_uch_plan INNER JOIN
                         dbo.Vedomost ON dbo.Content_UchPl.ik_upContent = dbo.Vedomost.ik_upContent INNER JOIN
                         dbo.Uspev ON dbo.Vedomost.Ik_ved = dbo.Uspev.Ik_ved


						  LEFT JOIN
                         dbo.Grup ON dbo.Uch_pl.ik_uch_plan = dbo.Grup.Ik_uch_plan AND dbo.Grup.Ik_grup = dbo.Vedomost.Ik_grup 
			where Grup.Ik_uch_plan is null



SELECT        *
FROM           dbo.Uch_pl 
--inner join dbo.Grup on Uch_pl.grup_comment=Grup.Cname_grup
where Uch_pl.ik_uch_plan not in (select  ISNULL(Grup.Ik_uch_plan,0) from Grup)

and Uch_pl.is_main=0


update
 dbo.Potok 
 set ik_uch_plan=null
where Potok.ik_uch_plan not in (select  ISNULL(Grup.Ik_uch_plan,0) from Grup)


delete from [dbo].[Content_Graphic]

where ik_uch_plan not in (select  ISNULL(Grup.Ik_uch_plan,0) from Grup)

delete from 

 dbo.Uch_pl 
where Uch_pl.ik_uch_plan not in (select  ISNULL(Grup.Ik_uch_plan,0) from Grup)
and Uch_pl.is_main=0