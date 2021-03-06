            USE [UGTU]
GO
/****** Object:  StoredProcedure [dbo].[ABIT_GetAbitListForZachisl]    Script Date: 22.03.2016 13:00:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--[ABIT_GetAbitListForZachisl] 2015
ALTER procedure [dbo].[ABIT_GetAbitListForZachisl] 
@nnyear int
as
BEGIN
	select 
	abit_sp.nn_abit,
	ik_kat_zach,
	abit_sp.nCode,
	RegNomer,
	fio,
	cname_spec,
	Cshort_name_fac,
	Cname_fac,
	Cshort_spec,
	Cshort_spec AS Sh_spec,
	cname_kat_zach,
	cname_zach,
	nnrecord,
	NNyear,
	ik_spec,ik_fac,
	abit_sp.ik_spec_fac, --тут
	Nn_zach,
	Zach.Ik_zach as BookKey,                      
	StudGrup.Ik_grup,
	StudGrup.Ik_prikazzach,
	StudGrup.Ik_priczach,
	Zach.Ik_zach as Ik_zachStud,
	Cname_grup,
	Cname_lang,
    CONVERT(VARCHAR(10),isnull(BallS.SummBall,0) + isnull(bonus_ball.balls,0))+'/ '+CONVERT(VARCHAR(10),isnull(EGEBallS.SummBall,0)) as SummBall, 
	convert(varchar(10),BallS.MinBall)+'/ '+CONVERT(VARCHAR(10),EGEBallS.MinBall) as MinBall,
	ISNULL(convert(varchar(10),BallS.SredBall), convert(varchar(10),SchoolAverMark))+'/ '+CONVERT(VARCHAR(10),EGEBallS.SredBall) SredBall,
	--isnull(EGEBallS.SummBall,0) as EGESummBall, 
	--convert(varchar(10),EGEBallS.MinBall) as EGEMinBall,
	--ISNULL(convert(varchar(10),EGEBallS.SredBall), convert(varchar(10),SchoolAverMark)) EGESredBall,
	ik_type_zach,
	ik_type_kat,
	bit_NotMinim,
	abit_sp.ik_zach, --тут
	abit_sp.ik_prikaz_zach,
	--CONVERT(VARCHAR(10),Prikaz.Dd_prikaz,104) Dd_prikaz,
	Dd_prikaz,
	--Prikaz.Nn_prikaz + ' от ' + CONVERT(VARCHAR(10),Prikaz.Dd_prikaz,104) Name_prikaz,
	--CONVERT(VARCHAR(10),Prikaz.Dd_prikaz,104) Dd_prikaz,
	ik_direction,
	ik_doc_edu,
	ik_doc_ident,
	notExam,
	[Zaved_stud].cName_zaved
	from
	(select ABIT_postup.nn_abit, ABIT_postup.ik_kat_zach, ABIT_postup.nCode, ABIT_postup.RegNomer, rtrim(clastname)+' '+rtrim(cfirstname)+' '+rtrim(isnull(cotch,'')) as fio,
	 cname_spec, Cshort_name_fac, Cname_fac, Cshort_spec, Cshort_spec AS Sh_spec, cname_kat_zach, cname_zach, ABIT_Diapazon_spec_fac.nnrecord, @NNyear as NNyear, EducationBranch.ik_spec,Fac.ik_fac,
	relation_spec_fac.ik_spec_fac, ABIT_sost_zach.ik_type_zach, ik_type_kat, ABIT_postup.ik_zach, ik_direction,SchoolAverMark, ik_prikaz_zach
	from GetSpecAbitPermissionsFromRelTable() as AbitPermissions, ABIT_Diapazon_spec_fac, relation_spec_fac, Fac, EducationBranch, ABIT_postup, ABIT_sost_zach, Kat_zach, 
	Person
	where AbitPermissions.ik_spec_fac = relation_spec_fac.ik_spec_fac and relation_spec_fac.ik_spec_fac = ABIT_Diapazon_spec_fac.ik_spec_fac
	and relation_spec_fac.ik_fac = Fac.Ik_fac and relation_spec_fac.ik_spec = EducationBranch.ik_spec
	and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord 
	and ABIT_postup.ik_zach = ABIT_sost_zach.ik_zach 
	and ABIT_postup.nCode = Person.nCode
	and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
	and NNyear=@NNyear
	and Realy_postup=1  
	and ik_type_zach<>3) abit_sp
left join Prikaz on  Prikaz.Ik_prikaz = abit_sp.ik_prikaz_zach
--ВЫБИРАЕМ СУММУ БАЛЛОВ
left JOIN
(SELECT SummBall, MinBall, SredBall, ABIT_Vstup_exam.NN_abit
	FROM 
	(select nn_abit, sum(cosenka) as SummBall, min(cosenka) as MinBall, AVG(cosenka) as SredBall 
	  from dbo.ABIT_Vstup_exam where ((ik_disc<>3) 
		AND nn_abit IN (SELECT nn_abit FROM ABIT_postup WHERE NNrecord IN
			(SELECT NNrecord FROM ABIT_Diapazon_spec_fac WHERE nnyear=@nnyear))
-- учитываем оценку по русскому языку для всех специальностей, у кот-х есть бит lrussian
			or (ik_disc=3 and nn_abit IN
		(SELECT nn_abit FROM ABIT_postup WHERE NNrecord IN
			(SELECT NNrecord FROM ABIT_Diapazon_spec_fac WHERE nnyear=@nnyear and lRussian=1))))
	  GROUP BY nn_abit)ABIT_Vstup_exam 
	)BallS
ON abit_sp.NN_abit=BallS.NN_abit

left JOIN
(SELECT SummBall, MinBall, SredBall, ABIT_Vstup_exam.NN_abit
	FROM 
	(select nn_abit, sum(cosenka) as SummBall, min(cosenka) as MinBall, AVG(cosenka) as SredBall 
	  from dbo.ABIT_Vstup_exam where ((ik_disc<>3) 
		AND ABIT_Vstup_exam.ik_sdach IN (5,8)
		AND nn_abit IN (SELECT nn_abit FROM ABIT_postup WHERE NNrecord IN
			(SELECT NNrecord FROM ABIT_Diapazon_spec_fac WHERE nnyear=@nnyear))
-- учитываем оценку по русскому языку для всех специальностей, у кот-х есть бит lrussian
			or (ik_disc=3 and nn_abit IN
		(SELECT nn_abit FROM ABIT_postup WHERE NNrecord IN
			(SELECT NNrecord FROM ABIT_Diapazon_spec_fac WHERE nnyear=@nnyear and lRussian=1))))
	  GROUP BY nn_abit)ABIT_Vstup_exam 
	)EGEBallS
ON abit_sp.NN_abit=EGEBallS.NN_abit

left join 
			(select sum(Abit_Bonuses.balls) balls, Abit_postup.NN_abit
		     from Abit_postup
			 inner join Doc_stud on Abit_postup.nCode = Doc_stud.nCode 
			 inner join Abit_Bonuses on Abit_Bonuses.ik_doc = Doc_stud.Ik_doc
			 where ((Abit_Bonuses.ik_disc is null)or(Abit_Bonuses.ik_disc in (select ik_disc from ABIT_Vstup_exam where NN_abit = Abit_postup.NN_abit)))
			 group by Abit_postup.NN_abit
			 ) bonus_ball
		     on bonus_ball.NN_abit = abit_sp.NN_abit
			-- and ((bonus_ball.ik_disc is null)or(bonus_ball.ik_disc in (select ik_disc from ABIT_Vstup_exam where NN_abit = abit_sp.NN_abit)))
--ищем несданные экзамены 
left join
(
  select NN_abit, count(ik_disc) as notExam
  from ABIT_postup ap,ABIT_Diapazon_Disc,ABIT_Diapazon_spec_fac
  where ap.NNrecord = ABIT_Diapazon_Disc.NNrecord
  and ABIT_Diapazon_spec_fac.NNrecord = ap.NNrecord
  and NNyear = @nnyear and ik_disc not in (select ik_disc from ABIT_Vstup_exam
										where NN_abit = ap.NN_abit and cosenka > 0)
  group by NN_abit

) hasExam on abit_sp.NN_abit=hasExam.NN_abit

--ВЫБИРАЕМ НЕОБЯЗАТЕЛЬНЫЕ ДАННЫЕ
--ИН. ЯЗЫК
LEFT JOIN
(SELECT MAX(Ik_lang) Ik_lang, nCode 
	FROM Lang_stud
	GROUP BY nCode)Lang_stud
ON Lang_stud.nCode=abit_sp.nCode 
LEFT JOIN 
Lang ON Lang_stud.Ik_lang=Lang.Ik_lang 

--

--№ ЗАЧЕТКИ И ГРУППУ
LEFT JOIN Zach ON Zach.ncode=abit_sp.ncode
LEFT JOIN 
(SELECT StudGrup.Ik_grup, StudGrup.Ik_zach, Ik_prikazZach, ik_pricZach
	FROM dbo.StudGrup, dbo.Prikaz,
		(SELECT MIN(Dd_prikaz) as Dd_prikaz, Ik_zach
		FROM StudGrup, dbo.Prikaz
		WHERE StudGrup.Ik_prikazZach=Prikaz.Ik_prikaz 
		GROUP BY Ik_zach)FirstGroup

	WHERE StudGrup.Ik_prikazZach=Prikaz.Ik_prikaz
		AND StudGrup.Ik_zach=FirstGroup.Ik_zach 
		AND Prikaz.Dd_prikaz=FirstGroup.Dd_prikaz
)StudGrup
 ON Zach.Ik_zach=StudGrup.Ik_zach
LEFT JOIN Grup ON Grup.Ik_grup=StudGrup.Ik_grup
LEFT JOIN (SELECT distinct NN_abit, 1 as bit_NotMinim FROM 
		   dbo.ABIT_postup 
		   WHERE NN_abit not in (select NN_abit from dbo.Abit_GetAbitListWithMinBall(@nnyear,0,0))) ABIT_Minimum
  on ABIT_Minimum.NN_abit=abit_sp.NN_abit

LEFT JOIN (select nCode,MIN(Doc_stud.Ik_doc) ik_doc_edu from Doc_stud, documents 
		   where Doc_stud.Ik_vid_doc = documents.ik_vid_doc and IsEducational = 1
		   GROUP BY nCode) eduDuc on eduDuc.nCode = abit_sp.nCode

LEFT JOIN (select nCode,MIN(Doc_stud.Ik_doc) ik_doc_ident from Doc_stud, documents 
		   where Doc_stud.Ik_vid_doc = documents.ik_vid_doc and IsIdentity = 1
		   GROUP BY nCode) identDuc on identDuc.nCode = abit_sp.nCode
		   

LEFT JOIN [dbo].[Student]
ON abit_sp.nCode=[Student].nCode
LEFT JOIN [dbo].[Zaved_stud]
ON [Student].Ik_zaved=[Zaved_stud].[ik_zaved]

--отфильтровываем те заявления, абитуриенты по которым уже зачислены на другие специальности
where 
	abit_sp.[ik_zach]=6 
	OR
	[Student].nCode NOT IN
		(SELECT [nCode] FROM [dbo].[ABIT_postup] 
			inner join [dbo].[TypeKatZach] 
			ON [ABIT_postup].ik_kat_zach=[TypeKatZach].ik_type_kat 
			WHERE [ik_zach]=6 and [ik_type_kat]<>3)
	OR [ik_type_kat]=3

order by Cname_fac,cname_spec,fio
END
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON


















/*GO

--[ABIT_GetAbitListForZachisl] 2015
ALTER procedure [dbo].[ABIT_GetAbitListForZachisl] 
@nnyear int
as
BEGIN
	select 
	abit_sp.nn_abit,
	ik_kat_zach,
	abit_sp.nCode,
	RegNomer,
	fio,
	cname_spec,
	Cshort_name_fac,
	Cname_fac,
	Cshort_spec,
	Cshort_spec AS Sh_spec,
	cname_kat_zach,
	cname_zach,
	nnrecord,
	NNyear,
	ik_spec,ik_fac,
	abit_sp.ik_spec_fac, --тут
	Nn_zach,
	Zach.Ik_zach as BookKey,                      
	StudGrup.Ik_grup,
	StudGrup.Ik_prikazzach,
	StudGrup.Ik_priczach,
	Zach.Ik_zach as Ik_zachStud,
	Cname_grup,
	Cname_lang,
    isnull(SummBall,0) + isnull(bonus_ball.balls,0) as SummBall, 
	convert(varchar(10),MinBall) as MinBall,
	ISNULL(convert(varchar(10),SredBall), convert(varchar(10),SchoolAverMark)) SredBall,
	ik_type_zach,
	ik_type_kat,
	bit_NotMinim,
	abit_sp.ik_zach, --тут
	abit_sp.ik_prikaz_zach,
	--CONVERT(VARCHAR(10),Prikaz.Dd_prikaz,104) Dd_prikaz,
	Dd_prikaz,
	--Prikaz.Nn_prikaz + ' от ' + CONVERT(VARCHAR(10),Prikaz.Dd_prikaz,104) Name_prikaz,
	--CONVERT(VARCHAR(10),Prikaz.Dd_prikaz,104) Dd_prikaz,
	ik_direction,
	ik_doc_edu,
	ik_doc_ident,
	notExam,
	[Zaved_stud].cName_zaved
	from
	(select ABIT_postup.nn_abit, ABIT_postup.ik_kat_zach, ABIT_postup.nCode, ABIT_postup.RegNomer, rtrim(clastname)+' '+rtrim(cfirstname)+' '+rtrim(isnull(cotch,'')) as fio,
	 cname_spec, Cshort_name_fac, Cname_fac, Cshort_spec, Cshort_spec AS Sh_spec, cname_kat_zach, cname_zach, ABIT_Diapazon_spec_fac.nnrecord, @NNyear as NNyear, EducationBranch.ik_spec,Fac.ik_fac,
	relation_spec_fac.ik_spec_fac, ABIT_sost_zach.ik_type_zach, ik_type_kat, ABIT_postup.ik_zach, ik_direction,SchoolAverMark, ik_prikaz_zach
	from GetSpecAbitPermissionsFromRelTable() as AbitPermissions, ABIT_Diapazon_spec_fac, relation_spec_fac, Fac, EducationBranch, ABIT_postup, ABIT_sost_zach, Kat_zach, 
	Person
	where AbitPermissions.ik_spec_fac = relation_spec_fac.ik_spec_fac and relation_spec_fac.ik_spec_fac = ABIT_Diapazon_spec_fac.ik_spec_fac
	and relation_spec_fac.ik_fac = Fac.Ik_fac and relation_spec_fac.ik_spec = EducationBranch.ik_spec
	and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord 
	and ABIT_postup.ik_zach = ABIT_sost_zach.ik_zach 
	and ABIT_postup.nCode = Person.nCode
	and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
	and NNyear=@NNyear
	and Realy_postup=1  
	and ik_type_zach<>3) abit_sp
left join Prikaz on  Prikaz.Ik_prikaz = abit_sp.ik_prikaz_zach
--ВЫБИРАЕМ СУММУ БАЛЛОВ
left JOIN
(SELECT SummBall, MinBall, SredBall, ABIT_Vstup_exam.NN_abit
	FROM 
	(select nn_abit, sum(cosenka) as SummBall, min(cosenka) as MinBall, AVG(cosenka) as SredBall 
	  from dbo.ABIT_Vstup_exam where ((ik_disc<>3) 
		AND nn_abit IN (SELECT nn_abit FROM ABIT_postup WHERE NNrecord IN
			(SELECT NNrecord FROM ABIT_Diapazon_spec_fac WHERE nnyear=@nnyear))
-- учитываем оценку по русскому языку для всех специальностей, у кот-х есть бит lrussian
			or (ik_disc=3 and nn_abit IN
		(SELECT nn_abit FROM ABIT_postup WHERE NNrecord IN
			(SELECT NNrecord FROM ABIT_Diapazon_spec_fac WHERE nnyear=@nnyear and lRussian=1))))
	  GROUP BY nn_abit)ABIT_Vstup_exam 
	)BallS
ON abit_sp.NN_abit=BallS.NN_abit
left join 
			(select sum(Abit_Bonuses.balls) balls, Abit_postup.NN_abit
		     from Abit_postup
			 inner join Doc_stud on Abit_postup.nCode = Doc_stud.nCode 
			 inner join Abit_Bonuses on Abit_Bonuses.ik_doc = Doc_stud.Ik_doc
			 where ((Abit_Bonuses.ik_disc is null)or(Abit_Bonuses.ik_disc in (select ik_disc from ABIT_Vstup_exam where NN_abit = Abit_postup.NN_abit)))
			 group by Abit_postup.NN_abit
			 ) bonus_ball
		     on bonus_ball.NN_abit = abit_sp.NN_abit
			-- and ((bonus_ball.ik_disc is null)or(bonus_ball.ik_disc in (select ik_disc from ABIT_Vstup_exam where NN_abit = abit_sp.NN_abit)))
--ищем несданные экзамены 
left join
(
  select NN_abit, count(ik_disc) as notExam
  from ABIT_postup ap,ABIT_Diapazon_Disc,ABIT_Diapazon_spec_fac
  where ap.NNrecord = ABIT_Diapazon_Disc.NNrecord
  and ABIT_Diapazon_spec_fac.NNrecord = ap.NNrecord
  and NNyear = @nnyear and ik_disc not in (select ik_disc from ABIT_Vstup_exam
										where NN_abit = ap.NN_abit and cosenka > 0)
  group by NN_abit

) hasExam on abit_sp.NN_abit=hasExam.NN_abit

--ВЫБИРАЕМ НЕОБЯЗАТЕЛЬНЫЕ ДАННЫЕ
--ИН. ЯЗЫК
LEFT JOIN
(SELECT MAX(Ik_lang) Ik_lang, nCode 
	FROM Lang_stud
	GROUP BY nCode)Lang_stud
ON Lang_stud.nCode=abit_sp.nCode 
LEFT JOIN 
Lang ON Lang_stud.Ik_lang=Lang.Ik_lang 

--

--№ ЗАЧЕТКИ И ГРУППУ
LEFT JOIN Zach ON Zach.ncode=abit_sp.ncode
LEFT JOIN 
(SELECT StudGrup.Ik_grup, StudGrup.Ik_zach, Ik_prikazZach, ik_pricZach
	FROM dbo.StudGrup, dbo.Prikaz,
		(SELECT MIN(Dd_prikaz) as Dd_prikaz, Ik_grup, Ik_zach
		FROM StudGrup, dbo.Prikaz
		WHERE StudGrup.Ik_prikazZach=Prikaz.Ik_prikaz 
		GROUP BY Ik_grup, Ik_zach)FirstGroup

	WHERE StudGrup.Ik_prikazZach=Prikaz.Ik_prikaz
		AND StudGrup.Ik_grup=FirstGroup.Ik_grup 
		AND StudGrup.Ik_zach=FirstGroup.Ik_zach 
		AND Prikaz.Dd_prikaz=FirstGroup.Dd_prikaz
)StudGrup
 ON Zach.Ik_zach=StudGrup.Ik_zach
LEFT JOIN Grup ON Grup.Ik_grup=StudGrup.Ik_grup
LEFT JOIN (SELECT distinct NN_abit, 1 as bit_NotMinim FROM 
		   dbo.ABIT_postup 
		   WHERE NN_abit not in (select NN_abit from dbo.Abit_GetAbitListWithMinBall(@nnyear,0,0))) ABIT_Minimum
  on ABIT_Minimum.NN_abit=abit_sp.NN_abit

LEFT JOIN (select nCode,Doc_stud.Ik_doc ik_doc_edu from Doc_stud, documents 
		   where Doc_stud.Ik_vid_doc = documents.ik_vid_doc and IsEducational = 1) eduDuc on eduDuc.nCode = abit_sp.nCode

LEFT JOIN (select nCode,Doc_stud.Ik_doc ik_doc_ident from Doc_stud, documents 
		   where Doc_stud.Ik_vid_doc = documents.ik_vid_doc and IsIdentity = 1) identDuc on identDuc.nCode = abit_sp.nCode
		   

LEFT JOIN [dbo].[Student]
ON abit_sp.nCode=[Student].nCode
LEFT JOIN [dbo].[Zaved_stud]
ON [Student].Ik_zaved=[Zaved_stud].[ik_zaved]




order by Cname_fac,cname_spec,fio
END*/
