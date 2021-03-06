USE [UGTU_ACTTEST]
GO
/****** Object:  UserDefinedFunction [dbo].[StudAction]    Script Date: 18.08.2015 9:46:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[StudAction](@Ik_Grup INT,  @nsem int)
RETURNS @Result TABLE
(
	iK_vid_zanyat int,
	ik_upContent int,
	mask_week1 char(6),
	mask_week2 char(6),
	Num1 int,
	Num2 int 
) 
AS
BEGIN
	insert into @Result(iK_vid_zanyat,ik_upContent, mask_week1,mask_week2,Num1,Num2)
	Select vid_zaniat.iK_vid_zanyat, Content_UchPl.ik_upContent , nw.mask_week1,nw.mask_week2,nw.Num1,nw.Num2 
	From dbo.Grup INNER JOIN
                         dbo.Uch_pl ON dbo.Grup.Ik_uch_plan = dbo.Uch_pl.ik_uch_plan INNER JOIN
                         dbo.sv_disc ON dbo.Uch_pl.ik_uch_plan = dbo.sv_disc.ik_uch_plan INNER JOIN
                         dbo.Content_UchPl ON dbo.sv_disc.ik_disc_uch_plan = dbo.Content_UchPl.ik_disc_uch_plan 
						 inner join vid_zaniat ON  Content_UchPl.ik_vid_zanyat=vid_zaniat.iK_vid_zanyat
						 inner join discpln ON  discpln.iK_disc=sv_disc.ik_disc
						 inner join nWeek nw ON Content_UchPl.ik_upContent=nw.ik_upContent
						 Where Grup.Ik_grup=@Ik_Grup and Content_UchPl.n_sem=@nsem and
						 (vid_zaniat.ik_vid_zanyat=56 or
						 vid_zaniat.ik_vid_zanyat=31 or
						 vid_zaniat.ik_vid_zanyat=55)
RETURN
END

