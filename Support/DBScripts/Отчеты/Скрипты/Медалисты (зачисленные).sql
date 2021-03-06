select distinct Cname_form_ed, Cshort_name_fac, Cname_spec, cName_direction, Cname_kat_zach, FIO,cmedal, ctelefon, cSotTel 
		 from
(
select distinct  

Clastname + ' ' + Cfirstname + ' ' + Cotch FIO,Fac.Cshort_name_fac,
	   dbo.Person.nCode,grazd.Ik_grazd,c_grazd,NNyear,cshort_sdach,Cname_kat_zach,Spec_stud.Cname_spec,
	   cName_direction,Cname_form_ed,cSotTel,ctelefon, cmedal
from dbo.Person,ABIT_postup,ABIT_Diapazon_spec_fac,Student,Fac,ABIT_Vstup_exam,
	 ABIT_VidSdachi,grazd,Kat_zach,TypeKatZach,Spec_stud, Direction,Relation_spec_fac, Form_ed, medal_abit
where ABIT_postup.nCode = dbo.Person.nCode and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
and ABIT_postup.NN_abit = ABIT_Vstup_exam.NN_abit
and ABIT_Vstup_exam.ik_sdach = ABIT_VidSdachi.ik_sdach
and ABIT_postup.ik_kat_zach = Kat_zach.Ik_kat_zach
and Kat_zach.ik_type_kat = TypeKatZach.ik_type_kat
and Person.Ik_grazd = grazd.ik_grazd
and Spec_stud.ik_direction = Direction.ik_direction
and Relation_spec_fac.ik_fac = Fac.Ik_fac and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
and Form_ed.Ik_form_ed=Relation_spec_fac.Ik_form_ed 
and Relation_spec_fac.ik_spec_fac = ABIT_Diapazon_spec_fac.ik_spec_fac
and ik_zach in (select ik_zach from ABIT_sost_zach where ik_type_zach = 2) --�����������
and dbo.Student.nCode = ABIT_postup.nCode
and Student.ik_medal = medal_abit.ik_medal
and Student.ik_medal in (2,3,4) --������ ��� ������ � ��������

and NNyear=2015
) stud
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=2
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) pr
on stud.nCode = pr.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=1
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) fac
on stud.nCode = fac.nCode
left join (select nCode,FlatNumber,StructNumber,BuildingNumber,CStreet,Cgorod,Cregion,Cstrana,Strana.Ik_strana
		   from dbo.PersonAddress,dbo.Address,dbo.Street,dbo.Gorod,dbo.Raion,dbo.Region,dbo.Strana
		   where ik_AddressType=3
		   and dbo.Address.ik_address = dbo.PersonAddress.ik_address
		   and dbo.Address.Ik_street = dbo.Street.Ik_street
		   and dbo.Street.ik_gorod = dbo.Gorod.Ik_gorod
		   and dbo.Gorod.Ik_raion = dbo.Raion.Ik_raion
		   and dbo.Raion.Ik_region = dbo.Region.Ik_region
		   and dbo.Region.Ik_strana = dbo.Strana.Ik_strana) vrem
on stud.nCode = vrem.nCode
order by Cname_form_ed desc, Cshort_name_fac, Cname_spec, cName_direction, Cname_kat_zach, cmedal