USE [UGTU]
GO
/****** Object:  StoredProcedure [dbo].[OKADRGetQualifications]    Script Date: 03.03.2016 11:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SELECT distinct
  Spec_stud.ik_spec, Cname_spec Cname_spec, Form_ed.Cname_form_pril, Cname_qualif, [Direction].cName_direction [Cshort_spec],  [Direction].cName_direction cName_direction,
	[SpecСategory], [QualifShortName], Sh_spec, Spec_stud.[YearNormObuch], Relation_spec_fac.YearObuch, Relation_spec_fac.ik_spec_fac
FROM         
 [dbo].[Direction] INNER JOIN
 dbo.Spec_stud
	ON Spec_stud.ik_direction=[Direction].ik_direction	
 INNER JOIN dbo.Relation_spec_fac 
	ON Spec_stud.ik_spec=Relation_spec_fac.ik_spec
		AND Relation_spec_fac.ik_spec_fac IN
			(SELECT Realik_spec_fac FROM dbo.[OKADRGetExitGroup_inline](YEAR(GETDATE())))
 INNER JOIN [dbo].[GetFacDiplomPermissionsFromRelTable]() perm
	ON Relation_spec_fac.ik_fac=perm.ik_fac
 INNER JOIN dbo.Form_ed ON Relation_spec_fac.Ik_form_ed=Form_ed.Ik_form_ed
WHERE
 spDateExit IS NULL OR spDateExit<GETDATE()
and Relation_spec_fac.ik_fac=15
order by Cname_spec

/*
update dbo.Relation_spec_fac
set YearObuch=5
where ik_spec_fac=315


update dbo.Spec_stud
set [YearNormObuch]=4
where ik_spec=354440
*/