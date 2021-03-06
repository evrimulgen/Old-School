--select * from [db-srv1\testlab].ugtu.dbo.Uspev
--select * from [UGTUSQL1].STUDPROGRESS.dbo.Uspev

GO
/****** Объект:  StoredProcedure [dbo].[ABIT_get_Abit_Filials]    Дата сценария: 11/19/2008 11:58:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--TransferUspev
alter procedure [dbo].TransferUspev
as

--BEGIN TRAN
BEGIN

--удаление прежних данных 
--успеваемость
delete from [UGTUSQL1].STUDPROGRESS.dbo.Uspev
--ведомость
delete from [UGTUSQL1].STUDPROGRESS.dbo.Vedomost
--зачетка
delete from [UGTUSQL1].STUDPROGRESS.dbo.Zach
--студент
delete from [UGTUSQL1].STUDPROGRESS.dbo.Stud

--перенос данных
--студент
insert into [UGTUSQL1].STUDPROGRESS.dbo.Stud(nCode, Clastname, Cfirstname, Cotch, Dd_birth, Cplacebirth, lSex, Lobchegit,  Photo)
select nCode, Clastname, Cfirstname, Cotch, Dd_birth, Cplacebirth, lSex, Lobchegit,  Photo
from stud
where nCode in (select nCode from zach)


--зачетка (выбираем ту группу, из которой студент не отчислен либо 
--с последней датой зачисления)
insert into [UGTUSQL1].STUDPROGRESS.dbo.Zach(Ik_zach, Nn_zach, nCode, Cname_grup)
select Zach.Ik_zach, convert(varchar(6),Nn_zach), nCode, Cname_grup
from Zach
	left join 
	(select max(Ik_grup) as Ik_grup, Ik_zach from StudGrup, Prikaz 
		where Prikaz.Ik_prikaz=StudGrup.Ik_prikazZach and 
			(Ik_prikazOtch is null or	--либо не отчислен
			(Dd_prikaz=			--либо макс дата приказа
				(select max(Dd_prikaz) from
					dbo.StudGrup as SG, dbo.Prikaz
					where SG.Ik_zach=StudGrup.Ik_zach and Prikaz.Ik_prikaz=SG.Ik_prikazZach)))
	group by Ik_zach)StudGrup
	on Zach.Ik_zach=StudGrup.Ik_zach
	left join
	dbo.Grup
	on StudGrup.Ik_grup=Grup.Ik_grup
group by  Zach.Ik_zach, Nn_zach, nCode, Cname_grup
having count(Nn_zach)<2


--ведомость
insert into [UGTUSQL1].STUDPROGRESS.dbo.Vedomost(Ik_ved, Dd_exam, cNumber_ved, 
					dD_vydano, lClose, lPriznak_napr, lVnosn, PrepName,
					n_sem, cName_disc, cName_vid_exam, cName_vid_zanyat)
select Ik_ved, Dd_exam, cNumber_ved, 
					dD_vydano, lClose, lPriznak_napr, lVnosn,
					RTRIM(clastname)+' '+CONVERT(VARCHAR(1), cfirstname)+'.'+CONVERT(VARCHAR(1), cotch)+'.'   PrepName,
					n_sem, cName_disc, cName_vid_exam, cName_vid_zanyat
from
(select Ik_ved, Dd_exam, cNumber_ved, 
					dD_vydano, lClose, lPriznak_napr, lVnosn, itab_n, 
					n_sem, cName_disc, cName_vid_exam, cName_vid_zanyat
from dbo.Vedomost, dbo.Content_UchPl, dbo.sv_disc,
		dbo.Vid_exam, dbo.vid_zaniat, dbo.discpln
where Vedomost.ik_upContent=Content_UchPl.ik_upContent 
	AND Content_UchPl.ik_disc_uch_plan=sv_disc.ik_disc_uch_plan
	AND Vedomost.Ik_vid_exam=Vid_exam.Ik_vid_exam
	AND Content_UchPl.ik_vid_zanyat=vid_zaniat.ik_vid_zanyat
	AND sv_disc.ik_disc=discpln.ik_disc) ved
left join dbo.Prepods
	on ved.itab_n=Prepods.itab_n


--успеваемоcть
insert into [UGTUSQL1].STUDPROGRESS.dbo.Uspev(Ik_ved, Ik_zach, Cosenca, cTema, PropCount)
select Ik_ved, Ik_zach, Cosenca, cTema, PropCount
from dbo.Uspev

END
--COMMIT TRAN