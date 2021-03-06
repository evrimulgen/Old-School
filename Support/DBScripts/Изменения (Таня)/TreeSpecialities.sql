create VIEW [dbo].[AllSpecialties]
AS
SELECT     TOP (100) PERCENT '(' +cShort_name_direction+ ') ' +dbo.Spec_stud.Cname_spec  Cname_spec , dbo.Spec_stud.Sh_spec, dbo.Relation_spec_fac.ik_spec_fac, dbo.Relation_spec_fac.ik_fac, 
                      dbo.Spec_stud.Cshort_spec, dbo.Relation_spec_fac.YearObuch AS nn_studyyears, dbo.Direction.cName_direction, dbo.Relation_spec_fac.Ik_form_ed, 
                      dbo.Form_ed.Cname_form_ed, Relation_spec_fac.YearObuch, dbo.Spec_stud.ik_spec,sortorder, spDateExit,
					  Relation_spec_fac.VidGos, Spec_stud.ik_direction
FROM         dbo.Relation_spec_fac INNER JOIN
                      dbo.Spec_stud ON dbo.Relation_spec_fac.ik_spec = dbo.Spec_stud.ik_spec INNER JOIN
                      dbo.Direction ON dbo.Spec_stud.ik_direction = dbo.Direction.ik_direction INNER JOIN
                      dbo.Form_ed ON dbo.Relation_spec_fac.Ik_form_ed = dbo.Form_ed.Ik_form_ed
WHERE     Relation_spec_fac.Ik_form_ed=1
union
SELECT     TOP (100) PERCENT '(З) (' +cShort_name_direction+ ') ' +dbo.Spec_stud.Cname_spec Cname_spec, dbo.Spec_stud.Sh_spec, dbo.Relation_spec_fac.ik_spec_fac, dbo.Relation_spec_fac.ik_fac, 
                      dbo.Spec_stud.Cshort_spec, dbo.Relation_spec_fac.YearObuch AS nn_studyyears, dbo.Direction.cName_direction, dbo.Relation_spec_fac.Ik_form_ed, 
                      dbo.Form_ed.Cname_form_ed, Relation_spec_fac.YearObuch, dbo.Spec_stud.ik_spec,sortorder, spDateExit,
					  Relation_spec_fac.VidGos, Spec_stud.ik_direction
FROM         dbo.Relation_spec_fac INNER JOIN
                      dbo.Spec_stud ON dbo.Relation_spec_fac.ik_spec = dbo.Spec_stud.ik_spec INNER JOIN
                      dbo.Direction ON dbo.Spec_stud.ik_direction = dbo.Direction.ik_direction INNER JOIN
                      dbo.Form_ed ON dbo.Relation_spec_fac.Ik_form_ed = dbo.Form_ed.Ik_form_ed
WHERE     Relation_spec_fac.Ik_form_ed<>1

ORDER BY Form_ed.Cname_form_ed, Cname_spec

GO

ALTER VIEW [dbo].[TREE_specialties]
AS
SELECT     TOP (100) PERCENT Cname_spec , Sh_spec, ik_spec_fac,ik_fac, 
                      Cshort_spec, nn_studyyears, cName_direction, Ik_form_ed, 
                      Cname_form_ed, YearObuch, ik_spec,sortorder, spDateExit,
					  VidGos, ik_direction
FROM         [AllSpecialties]
WHERE     (ik_spec_fac IN
                          (SELECT     ik_spec
                            FROM          dbo.GetSpecPermissionsFromRelTable() AS GetSpecPermissionsFromRelTable_1))