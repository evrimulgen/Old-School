--поступающие /*из наших*/ колледжей
select curr_abit.cName_zaved,  curr_abit.count_abit, postup_abit.count_abit
from
 (select count(distinct nCode) count_abit,cName_zaved,ik_zaved  from
  (select distinct ltrim(rtrim(Clastname)) Clastname, 
		  ltrim(rtrim(Cfirstname)) Cfirstname, 
		  ltrim(rtrim(Cotch)) Cotch, 
		  dbo.Person.nCode,
     	  Zaved_stud.cName_zaved,
		  Zaved_stud.ik_zaved
  from dbo.Person, ABIT_postup, ABIT_Diapazon_spec_fac, dbo.Student, Zaved_stud, Doc_stud, documents
  where ABIT_postup.nCode = dbo.Person.nCode
    and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
	and dbo.Student.nCode = ABIT_postup.nCode
	and Person.nCode = Doc_stud.nCode
	and documents.ik_vid_doc = Doc_stud.Ik_vid_doc
	and documents.IsEducational = 1
	and Doc_stud.Ik_vid_doc in (7, 8)											  --нужного типа дипломы
	and Student.Ik_zaved = Zaved_stud.ik_zaved
	and NNyear=year(GETDATE())	
	/*and Student.Ik_zaved in (1684, 1926, 1993, 2288, 2651, 2706,2707,2708, 2715, 2721, 2811, 2871,
							 2952, 3095, 3204, 3247, 3267, 3277, 3408, 3416, 4876, 4878, 4882, 4893, 4954, 6196)  --504 - код города Ухты*/
	and ABIT_postup.ik_zach not in (2,3)) abit
group by cName_zaved, ik_zaved) curr_abit
left join
--поступившие из наших колледжей
 (select count(distinct nCode) count_abit,cName_zaved, ik_zaved  from
  (select distinct ltrim(rtrim(Clastname)) Clastname, 
		  ltrim(rtrim(Cfirstname)) Cfirstname, 
		  ltrim(rtrim(Cotch)) Cotch, 
		  dbo.Person.nCode,
     	  Zaved_stud.cName_zaved,
		  Zaved_stud.ik_zaved
  from dbo.Person, ABIT_postup, ABIT_Diapazon_spec_fac, dbo.Student, Zaved_stud, Doc_stud, documents
  where ABIT_postup.nCode = dbo.Person.nCode
    and ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
	and dbo.Student.nCode = ABIT_postup.nCode
	and Person.nCode = Doc_stud.nCode
	and documents.ik_vid_doc = Doc_stud.Ik_vid_doc
	and documents.IsEducational = 1
	and Doc_stud.Ik_vid_doc in (7, 8)											  --нужного типа дипломы
	and Student.Ik_zaved = Zaved_stud.ik_zaved
	and NNyear=year(GETDATE())	
	/*and Student.Ik_zaved in (1684, 1926, 1993, 2288, 2651, 2706,2707,2708, 2715, 2721, 2811, 2871,
							 2952, 3095, 3204, 3247, 3267, 3277, 3408, 3416, 4876, 4878, 4882, 4893, 4954, 6196)  --504 - код города Ухты*/
	and ABIT_postup.ik_zach = 6) cur_abit
group by cName_zaved, ik_zaved) postup_abit on postup_abit.ik_zaved = curr_abit.ik_zaved
order by curr_abit.cName_zaved


