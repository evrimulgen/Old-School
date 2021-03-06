set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go




 
--exec GetAllVedNaprForGrup 4388, 5
--exec GetAllVedNaprForDisc 438, 6, 303, 6
--exec GetAllVedNaprForDisc 804,8,55,8

ALTER PROCEDURE [dbo].[GetAllVedNaprForDisc] 
	@ik_group	int,
	@n_sem	int,
	@ik_disc int,
	@iK_vid_zanyat int
as
	
    SELECT v.ik_ved, u.ik_zach, StudName, Nn_zach, cName_vid_exam, u.cosenca, Name_osenca, lClose
			, ctema, dD_vydano, Dd_exam
    From 
 dbo.GetGrupStud(@ik_group) as s 	

--(SELECT nCode, RTRIM(Clastname)+' '+CONVERT(VARCHAR(1),Cfirstname)+'.'
--		+CONVERT(VARCHAR(1),Cotch)+'.' as StudName FROM Stud) s 
--	INNER JOIN (SELECT Ik_zach, Nn_zach, nCode FROM dbo.Zach) z
--	ON s.nCode=z.nCode

	INNER JOIN (SELECT Ik_zach, Ik_ved, Cosenca, ctema FROM Uspev) u

	ON u.ik_zach=s.ik_zach
--	ON u.Ik_zach=z.Ik_zach

	INNER JOIN (SELECT Ik_ved, lClose, Ik_grup, Ik_vid_exam, ik_upContent, dD_vydano, Dd_exam FROM Vedomost
		 where lPriznak_napr = 1) v
	ON v.Ik_ved=u.Ik_ved
	INNER JOIN (SELECT ik_upContent, n_sem, ik_vid_zanyat, ik_disc_uch_plan FROM Content_UchPl
		 where ik_vid_zanyat=@ik_vid_zanyat and (n_sem = @n_sem)) cup
	ON v.ik_upContent=cup.ik_upContent
	INNER JOIN dbo.sv_disc sd
	ON cup.ik_disc_uch_plan = sd.ik_disc_uch_plan
	INNER JOIN (SELECT ik_vid_exam, cName_vid_exam FROM Vid_exam) ve
	ON v.ik_vid_exam=ve.ik_vid_exam
	INNER JOIN (SELECT Cosenca, Name_osenca FROM Osenca) o 
	ON u.Cosenca=o.Cosenca
	Where ( ik_grup = @ik_group) and (n_sem = @n_sem) and ik_disc=@ik_disc
order by StudName

	


