/****** Script for SelectTopNRows command from SSMS  ******/
SELECT        dbo.Fac.Cname_fac, dbo.Fac.Cshort_name_fac,  MAX(dbo.Zach.Nn_zach) MinDiapNumber, dbo.Abit_Zach_Diapazons.BeginDiapazon, 
                         dbo.Abit_Zach_Diapazons.EndDiapazon
FROM            dbo.Fac INNER JOIN
    dbo.Abit_Zach_Diapazons ON dbo.Fac.Ik_fac = dbo.Abit_Zach_Diapazons.ik_fac INNER JOIN
    dbo.Relation_spec_fac 
	ON dbo.Fac.Ik_fac = dbo.Relation_spec_fac.ik_fac
	INNER JOIN
    dbo.ABIT_Diapazon_spec_fac
	ON dbo.ABIT_Diapazon_spec_fac.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac 
	INNER JOIN
    dbo.ABIT_postup  ON dbo.ABIT_postup.NNrecord = dbo.ABIT_Diapazon_spec_fac.NNrecord
	INNER JOIN
    dbo.Student ON dbo.Student.nCode = dbo.ABIT_postup.nCode 
	INNER JOIN					 
	dbo.Zach  
    ON dbo.Zach.nCode = dbo.Student.nCode                      

  where [ik_year]=23
  and ABIT_Diapazon_spec_fac.NNyear = 2015
  AND dbo.Zach.Nn_zach BETWEEN dbo.Abit_Zach_Diapazons.BeginDiapazon AND dbo.Abit_Zach_Diapazons.EndDiapazon
  GROUP BY  dbo.Fac.Cname_fac, dbo.Fac.Cshort_name_fac, dbo.Abit_Zach_Diapazons.BeginDiapazon, 
                         dbo.Abit_Zach_Diapazons.EndDiapazon