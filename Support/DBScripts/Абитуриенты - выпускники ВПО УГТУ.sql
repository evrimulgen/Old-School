/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [ik_zaved]
      ,[ik_typ_zaved]
      ,[Ik_gorod]
      ,[cName_zaved]
  FROM [UGTU].[dbo].[Zaved_stud] where Ik_gorod in (select Ik_gorod from Gorod where [Cgorod] like '%Ухта%')
  order by cName_zaved  --4954 2706 --2651


 select count(distinct nCode),cName_zaved  from
  (select distinct ltrim(rtrim(Clastname)) Clastname, 
		  ltrim(rtrim(Cfirstname)) Cfirstname, 
		  ltrim(rtrim(Cotch)) Cotch, 
		  dbo.Person.nCode,
     	  Zaved_stud.cName_zaved
  from dbo.Person, ABIT_postup, ABIT_Diapazon_spec_fac, dbo.Student, Zaved_stud, Doc_stud
  where ABIT_postup.nCode = dbo.Person.nCode
    and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
	and dbo.Student.nCode = ABIT_postup.nCode
	and Student.Ik_zaved = Zaved_stud.ik_zaved
	and NNyear=year(GETDATE())	
	and Student.Ik_zaved in (4954,2706,2651,)  --504 - код города Ухты
	and ABIT_postup.ik_zach not in (2,3)) cur_abit
left join 
  (select distinct ltrim(rtrim(Clastname)) Clastname, 
		  ltrim(rtrim(Cfirstname)) Cfirstname, 
		  ltrim(rtrim(Cotch)) Cotch, 
		  dbo.Person.Dd_birth,
		  Fac.Cshort_name_fac,
		  Spec_stud.Cname_spec,
		  Grup.Cname_grup,
		  Fac.ik_fac
   from dbo.Person, dbo.Student,Relation_spec_fac,Spec_stud,Fac, Grup, StudGrup, zach
   where dbo.Person.nCode = dbo.Student.nCode 
     and dbo.Person.nCode = zach.nCode
	 and zach.Ik_zach = StudGrup.Ik_zach
	 and StudGrup.Ik_grup = Grup.Ik_grup
	 and Grup.ik_spec_fac = Relation_spec_fac.ik_spec_fac
	 and Relation_spec_fac.ik_fac = Fac.Ik_fac 
	 and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
	 and ((StudGrup.ik_pricOtch is null) or (StudGrup.ik_pricOtch = 3 )) ) last_stud
on last_stud.Cfirstname = cur_abit.Cfirstname and last_stud.Clastname = cur_abit.Clastname and last_stud.Dd_birth = cur_abit.Dd_birth
where ((last_stud.Ik_fac is null)or(last_stud.Ik_fac not in (31)))
group by cName_zaved
order by cur_abit.Clastname, cur_abit.Cfirstname