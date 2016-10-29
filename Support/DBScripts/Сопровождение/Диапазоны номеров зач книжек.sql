/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [ik_fac]
      ,[ik_year]
      ,[BeginDiapazon]
      ,[EndDiapazon]
  FROM [UGTU].[dbo].[Abit_Zach_Diapazons]
  where ik_year=24
  and ik_fac=27

  go
  SELECT MAX([Nn_zach])
  FROM [UGTU].[dbo].[Zach]
  where [Nn_zach] between '160000' and '161700'