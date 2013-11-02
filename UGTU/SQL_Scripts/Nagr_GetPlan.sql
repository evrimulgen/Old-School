USE [ugtu]
GO
/****** Объект:  UserDefinedFunction [dbo].[Nagr_GetPlan]    Дата сценария: 10/30/2008 11:15:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from [dbo].[Nagr_GetPlan](30)
Alter FUNCTION [dbo].[Nagr_GetPlan]
(	
	@ik_plan_nagr	int
)
RETURNS @Result TABLE
(
	cName_disc		varchar(100),
	cName_potok		varchar(50),
	course			int,
	group_count		int,
	stud_count		int,
	v1				float,
	v2				float,
	v3				float,
	v4				float,
	v5				float,
	v6				float,
	v7				float,
	v8				float,
	v9				float,
	v10				float,
	v11				float,
	v12				float,
	v13				float,
	v14				float,
	v15				float,
	v16				float,
	v17				float,
	itog			float
)
AS
BEGIN 

Insert into @result 
	select *
	from [dbo].[Nagr_PlanForKaf](@ik_plan_nagr)


RETURN
END