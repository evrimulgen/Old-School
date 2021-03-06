USE [ugtu]
GO
/****** Объект:  UserDefinedFunction [dbo].[Nagr_TeacherFact]    Дата сценария: 12/27/2008 14:07:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--select * from [dbo].[Nagr_TeacherFact](1,29,98,9,580)
alter FUNCTION [dbo].[Nagr_TeacherFact]
(
	@i_type			tinyint,
	@ik_plan_nagr	int,
	@ik_disc		int,
	@ik_potok		int,
	@ik_id_prepod	int
)
RETURNS @result TABLE
(
	ik_vid_zanyat     int,
	plan_hour		  float,
	fact_hour		  float
)
AS
Begin
--	процедура выполняет выборку фактической нагрузки по указанной дисциплине (параметры @ik_disc и @ik_potok) для указанного преподавателя (параметр @ik_id_prepod)

IF (@i_type = 1)
BEGIN
    insert into @result
	SELECT disc_fact_nagr.ik_vid_zanyat, sum(IsNull(disc_plan_nagr.cur_plan_hour, 0)) as plan_hour, 
			Sum(IsNull(disc_fact_nagr.cur_fact_hour, 0)) as fact_hour
	FROM 
		(Select Content_plan_nagr.ik_vid_zanyat, Sum(Prepod_fact_nagr.f_all_fact_hour) as cur_fact_hour
			From Prepod_plan_nagr INNER JOIN Content_plan_nagr ON Prepod_plan_nagr.ik_content_plan_nagr = Content_plan_nagr.ik_content_plan_nagr 
								  LEFT JOIN Prepod_fact_nagr ON Prepod_fact_nagr.ik_prepod_plan = Prepod_plan_nagr.ik_prepod_plan	
			Where (Content_plan_nagr.ik_plan_nagr = @ik_plan_nagr) and (Content_plan_nagr.ik_disc = @ik_disc)
				and (Content_plan_nagr.ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Potok_shema WHERE ik_potok = @ik_potok))
				and (Prepod_plan_nagr.ik_id_prepod = @ik_id_prepod)
			Group By Content_plan_nagr.ik_vid_zanyat) disc_fact_nagr
		FULL JOIN 
		(SELECT ik_vid_zanyat, sum(hour_unit + student_hour) as cur_plan_hour 
		 FROM GetTeacherPlanNagr(1, @ik_plan_nagr, @ik_disc, @ik_potok, @ik_id_prepod)
		 GROUP BY ik_vid_zanyat) disc_plan_nagr
		 ON (disc_fact_nagr.ik_vid_zanyat = disc_plan_nagr.ik_vid_zanyat) 
		GROUP BY disc_fact_nagr.ik_vid_zanyat
END

IF (@i_type = 2)
BEGIN
    insert into @result
	SELECT disc_plan_nagr.ik_vid_zanyat_plan,plan_hour,fact_hour FROM  		
		(Select Content_plan_nagr.ik_vid_zanyat as ik_vid_zanyat_fact, Sum(Prepod_fact_nagr.f_all_fact_hour) as fact_hour
			From Prepod_fact_nagr INNER JOIN Prepod_plan_nagr ON Prepod_fact_nagr.ik_prepod_plan = Prepod_plan_nagr.ik_prepod_plan
				INNER JOIN Content_plan_nagr ON Prepod_plan_nagr.ik_content_plan_nagr = Content_plan_nagr.ik_content_plan_nagr 
			Where (Content_plan_nagr.ik_plan_nagr = @ik_plan_nagr) and (Content_plan_nagr.ik_disc = @ik_disc)
				and (Content_plan_nagr.ik_shema_of_potok in (SELECT ik_shema_of_potok FROM Potok_shema WHERE ik_potok = @ik_potok))
				and (Prepod_fact_nagr.ik_id_prepod = @ik_id_prepod)
			Group By Content_plan_nagr.ik_vid_zanyat) disc_fact_nagr
	FULL JOIN 
		(SELECT ik_vid_zanyat as ik_vid_zanyat_plan, sum(hour_unit + student_hour) as plan_hour 
			FROM GetTeacherPlanNagr(1,@ik_plan_nagr, @ik_disc, @ik_potok, @ik_id_prepod)
			GROUP BY ik_vid_zanyat) disc_plan_nagr
		ON disc_fact_nagr.ik_vid_zanyat_fact = disc_plan_nagr.ik_vid_zanyat_plan
END

RETURN 
END
