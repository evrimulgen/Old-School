USE [ugtu]
GO
/****** Объект:  UserDefinedFunction [dbo].[Abit_StatisticPlan]    Дата сценария: 01/29/2009 13:09:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--select * from [dbo].[Abit_Statistic] (2007,0,'2007-08-01')
--select * from [dbo].[Abit_StatisticPlan] (2009,0)
alter FUNCTION [dbo].[Abit_StatisticPlan] 
(@nnyear int,
@idreport int)
RETURNS @Result TABLE
   (nnrecord        int             NULL,
    cShort_spec		varchar(100)	NULL,
	CShort_name_fac varchar(100)	NULL,
	[1]      		INT				NULL,
	[2]     		INT				NULL,
	[3]     		INT				NULL
   ) 
AS
BEGIN
	INSERT INTO @Result(nnrecord,cShort_spec,CShort_name_fac,[1],[2],[3])
	select distinct ADSF1.nnrecord,
       rtrim(cShort_spec) as cShort_spec,
       rtrim(CShort_name_fac) as CShort_name_fac,
--общий конкурс
ISNULL((select MestBudjet 
	 from (SELECT nnrecord,MestBudjet FROM ABIT_Diapazon_spec_fac WHERE NNyear=@NNyear)ABIT_postup
  where ABIT_postup.nnrecord=ADSF1.nnrecord
),0) as [1],
--ЦКП
ISNULL((select MestCKP
	 from (SELECT nnrecord,MestCKP FROM ABIT_Diapazon_spec_fac WHERE NNyear=@NNyear)ABIT_postup
  where ABIT_postup.nnrecord=ADSF1.nnrecord),0) as [2], 0 as [3]

from ABIT_Diapazon_spec_fac ADSF1 
  RIGHT join 
	(SELECT ik_spec_fac,cShort_spec,CShort_name_fac
	 FROM
		Relation_spec_fac RSF1
		INNER JOIN
		 Spec_stud SS1 on SS1.ik_spec=RSF1.ik_spec
		INNER JOIN fac F1 on F1.ik_fac=RSF1.ik_fac)RSF1
   on RSF1.ik_spec_fac=ADSF1.ik_spec_fac
  
where ADSF1.nnyear=@nnyear and 
RSF1.ik_spec_fac in (select ik_spec_fac
                     from dbo.ABIT_Report_spec
                     where IDReport=@idreport)
group by ADSF1.nnrecord,cShort_spec,CShort_name_fac
order by cShort_spec

RETURN
END
