USE [UGTU]
GO
/****** Object:  StoredProcedure [dbo].[OKADRGetYears]    Script Date: 23.03.2016 10:45:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[OKADRGetYears] 
AS
select ik_year_uch_pl as  ik_year,
 year_value 
 from dbo.Year_uch_pl
ORDER BY year_value desc




