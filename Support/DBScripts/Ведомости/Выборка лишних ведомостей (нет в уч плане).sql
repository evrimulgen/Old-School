USE [UGTU]
GO
/****** Object:  StoredProcedure [dbo].[GetAllVedomostsForGrup]    Script Date: 13.05.2015 12:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[GetAllVedomostsForGrup] 1981,4
--SELECT * FROM [dbo].UspevGetAllUspevReportsForSemester(1981,4)


SELECT *  FROM
	(SELECT * FROM [dbo].UspevGetAllUspevReportsForSemester(1981,4)AllReports
		WHERE  n_module IS NULL AND i_balls IS NULL)AllReports
	    INNER JOIN 
	 (SELECT Ik_ved, ik_upContent, lPriznak_napr, lVnosn FROM dbo.Vedomost WHERE ik_grup=1981 and lPriznak_napr = 0) v
	 ON v.ik_upContent=AllReports.ik_upContent 


	 
SELECT *  FROM
	 [dbo].[Content_UchPl] inner join dbo.sv_disc 
	ON sv_disc.ik_uch_plan=1550 and [Content_UchPl].ik_disc_uch_plan=sv_disc.ik_disc_uch_plan		
	    INNER JOIN 
	 (SELECT Ik_ved, ik_upContent, lPriznak_napr, lVnosn FROM dbo.Vedomost WHERE ik_grup=1981 and lPriznak_napr = 0) v
	 ON v.ik_upContent=[Content_UchPl].ik_upContent 
WHERE  n_module IS NULL AND i_balls IS NULL and [Content_UchPl].n_sem=4


delved 
179776


ALTER      PROCEDURE [dbo].[GetAllVedomostsForGrup]
	@ik_group	int,
	@n_sem	int
as
	SELECT Ik_ved, cName_disc+', '+cName_vid_zanyat as COLUMN1, d.iK_disc, 
			AllReports.iK_vid_zanyat, cName_disc, AllReports.ik_upContent, lVnosn, n_module,AllReports.ik_disc_uch_plan  FROM
	(SELECT * FROM [dbo].UspevGetAllUspevReportsForSemester(@ik_group,@n_sem)AllReports
		WHERE  n_module IS NULL AND i_balls IS NULL)AllReports
	    INNER JOIN 
	 (SELECT Ik_ved, ik_upContent, lPriznak_napr, lVnosn FROM dbo.Vedomost WHERE ik_grup=@ik_group and lPriznak_napr = 0) v
	 ON v.ik_upContent=AllReports.ik_upContent 
	    INNER JOIN 
	 dbo.discpln d
	 ON d.iK_disc=AllReports.iK_disc
	    INNER JOIN 
	 (SELECT iK_vid_zanyat, cName_vid_zanyat FROM dbo.vid_zaniat where ik_vid_zanyat<>33) vz
	 ON vz.iK_vid_zanyat=AllReports.iK_vid_zanyat
	order by iK_vid_zanyat desc, cName_disc