set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go

--SELECT dbo.GetOnlyDate('16.05.2008')
--[GetAllNaprForFac] 7, '16.05.2008','16.05.2008'
ALTER PROCEDURE [dbo].[GetAllNaprForFac]
@Ik_fac INT,
@dD_vydano1 datetime,
@dD_vydano2 datetime
AS

--Определяем четный ли семестр (зимняя, осенняя сессия)
set @dD_vydano1=dbo.GetOnlyDate(@dD_vydano1)
set @dD_vydano2=dbo.GetOnlyDate(@dD_vydano2)


    SELECT Vedomost.Ik_ved, Zach.Ik_zach, cNumber_ved,
			RTRIM(Clastname)+' '+CONVERT(VARCHAR(1),Cfirstname)+'.'+CONVERT(VARCHAR(1),Cotch)+'.' as StudName
			, Nn_zach, cName_vid_exam, Uspev.cosenca, Name_osenca, lClose
			, ctema, dD_vydano, Dd_exam, Vedomost.UserName, cName_disc+', '+cName_vid_zanyat as cName_disc
    From 
	dbo.Relation_spec_fac, dbo.Spec_stud, dbo.Grup,	 
	dbo.Vedomost, dbo.Uspev, 
	dbo.Zach, dbo.Stud,
	dbo.Content_UchPl, dbo.vid_zaniat, dbo.sv_disc, dbo.discpln, dbo.Osenca, dbo.Vid_exam
	 

WHERE	 Relation_spec_fac.Ik_fac=@Ik_fac 
	AND Relation_spec_fac.ik_spec=Spec_stud.ik_spec 
	AND Relation_spec_fac.ik_spec_fac=Grup.ik_spec_fac 
	AND Grup.Ik_grup=Vedomost.Ik_grup 
	AND Vedomost.lPriznak_napr=1
	AND Vedomost.dD_vydano between @dD_vydano1 and @dD_vydano2
	AND Vedomost.Ik_ved=Uspev.Ik_ved 
	AND Uspev.Ik_zach=Zach.Ik_zach 
	AND Zach.nCode=Stud.nCode 
	AND Vedomost.ik_upContent=Content_UchPl.ik_upContent 
	AND Content_UchPl.ik_disc_uch_plan=sv_disc.ik_disc_uch_plan 
	AND Content_UchPl.ik_vid_zanyat=vid_zaniat.ik_vid_zanyat 
	AND sv_disc.ik_disc= discpln.ik_disc
	AND Uspev.Cosenca= Osenca.Cosenca
	AND Vedomost.Ik_vid_exam=Vid_exam.Ik_vid_exam

order by cNumber_ved 

