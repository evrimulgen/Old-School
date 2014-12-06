
select distinct cshort_name_kaf,cName_disc,Cshort_spec, ceiling((n_sem+1)/2) curs, ISNULL(FIO, '-')

from dbo.kafedra
inner join dbo.Content_UchPl on dbo.kafedra.ik_kaf = dbo.Content_UchPl.ik_kaf
inner join dbo.sv_disc on dbo.Content_UchPl.ik_disc_uch_plan = dbo.sv_disc.ik_disc_uch_plan
inner join dbo.discpln on dbo.sv_disc.ik_disc = dbo.discpln.iK_disc
inner join dbo.Grup on dbo.Grup.Ik_uch_plan = dbo.sv_disc.ik_uch_plan
inner join dbo.Relation_spec_fac on dbo.Grup.ik_spec_fac = dbo.Relation_spec_fac.ik_spec_fac
inner join dbo.Spec_stud on dbo.Relation_spec_fac.ik_spec=dbo.Spec_stud.ik_spec
inner join dbo.Uch_pl on dbo.Grup.Ik_uch_plan = dbo.Uch_pl.ik_uch_plan  
left join (select distinct Clastname  + ' ' +Cfirstname+ ' ' +Cotch FIO,dbo.Relation_kafedra_prep.ik_kaf,dbo.Content_plan_nagr.ik_disc,
		   dbo.Potok.ik_uch_plan
		   from dbo.Person,dbo.Prepod,dbo.Relation_kafedra_prep,dbo.Prepod_plan_nagr,
		dbo.Content_plan_nagr,dbo.Potok_shema,dbo.Potok
		where dbo.Person.nCode = dbo.Prepod.nCode
		and dbo.Relation_kafedra_prep.itab_n = dbo.Prepod.itab_n --dbo.Relation_kafedra_prep.ik_kaf
		and dbo.Prepod_plan_nagr.ik_id_prepod = dbo.Relation_kafedra_prep.ik_id_prepod
		and dbo.Content_plan_nagr.ik_content_plan_nagr = dbo.Prepod_plan_nagr.ik_content_plan_nagr --dbo.Content_plan_nagr.ik_disc
		and dbo.Potok_shema.ik_shema_of_potok = dbo.Content_plan_nagr.ik_shema_of_potok
		and dbo.Potok.ik_potok = dbo.Potok_shema.ik_potok ) prepods
on prepods.ik_disc = dbo.discpln.iK_disc 
and prepods.ik_kaf=dbo.kafedra.ik_kaf
and prepods.ik_uch_plan = dbo.Grup.Ik_uch_plan

where kDateExit is NULL and dbo.kafedra.ik_kaf not in (1,417) --���������� �������  
and dbo.Uch_pl.ik_year_uch_pl=15

order by cshort_name_kaf,Cshort_spec,curs








