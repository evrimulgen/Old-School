select Gorod.Cgorod, count(distinct Person.nCode)  con
from Person left join [dbo].[PersonAddress] on [PersonAddress].nCode = Person.nCode
left join Address on PersonAddress.ik_address = Address.ik_address
left join Street on Address.Ik_street = Street.Ik_street
left join Gorod on Gorod.Ik_gorod = Street.ik_gorod
where Gorod.Latitude is null
group by Gorod.Cgorod

select Gorod.Cgorod, count(distinct Person.nCode)  con
from Person inner join Student on Student.nCode = Person.nCode
inner join Zaved_stud on Student.Ik_zaved = Zaved_stud.ik_zaved
inner join Gorod on Gorod.Ik_gorod = Zaved_stud.ik_gorod
where Gorod.Latitude is null
group by Gorod.Cgorod
order by con

--------------------------------------------------------------------------------------------------------

select Gorod.Cgorod, count(distinct Person.nCode) con
from Person left join [dbo].[PersonAddress] on [PersonAddress].nCode = Person.nCode
left join Address on PersonAddress.ik_address = Address.ik_address
left join Street on Address.Ik_street = Street.Ik_street
left join Gorod on Gorod.Ik_gorod = Street.ik_gorod
where (Gorod.Latitude < 0) or (Gorod.Longitude < 0)
group by Gorod.Cgorod
order by con

select Gorod.Cgorod, count(distinct Person.nCode) alum_count
from Person inner join Student on Student.nCode = Person.nCode
inner join Zaved_stud on Student.Ik_zaved = Zaved_stud.ik_zaved
inner join Gorod on Gorod.Ik_gorod = Zaved_stud.ik_gorod
where (Gorod.Latitude < 0) or (Gorod.Longitude < 0)
group by Gorod.Cgorod
order by alum_count

alter VIEW [dbo].[CitySchoolAlumni]
AS
select Gorod.Cgorod, count(distinct Person.nCode) alum_count, Gorod.Latitude, Gorod.Longitude,
  count(distinct Zach.nCode) zach_count, NNyear, bigSpec.Cshort_spec, pricina.Cname_pric 
from ABIT_postup inner join Person on ABIT_postup.nCode = Person.nCode
inner join Student on Student.nCode = Person.nCode
inner join ABIT_Diapazon_spec_fac on ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
inner join Relation_spec_fac on Relation_spec_fac.ik_spec_fac = ABIT_Diapazon_spec_fac.ik_spec_fac
inner join EducationBranch on EducationBranch.ik_spec = Relation_spec_fac.ik_spec
inner join Zaved_stud on Student.Ik_zaved = Zaved_stud.ik_zaved
inner join Gorod on Gorod.Ik_gorod = Zaved_stud.ik_gorod
left join Zach on Zach.nCode = Person.nCode
left join EducationBranch bigSpec on bigSpec.ik_spec = EducationBranch.id_parent
left join (select max(StudGrup.Ik_studGrup) Ik_studGrup,Ik_zach from StudGrup group by Ik_zach) last_gr on last_gr.Ik_zach = Zach.Ik_zach
left join studGrup on studGrup.Ik_studGrup = last_gr.Ik_studGrup
left join pricina on pricina.Ik_pric = studGrup.ik_pricOtch
/*left join (select count(distinct Zach.nCode) as kol,  
		   from Zach inner join StudGrup on StudGrup.Ik_zach = Zach.Ik_zach
			inner join Person on Zach.nCode = Person.nCode) otch on otch.*/
where (Gorod.Longitude is not null) and (Gorod.Latitude is not null) and NNyear<2015
group by Gorod.Cgorod, Gorod.Latitude, Gorod.Longitude, NNyear, bigSpec.Cshort_spec, pricina.Cname_pric  
GO

select * from CitySchoolAlumni order by NNyear, alum_count

select * from gorod
inner join 
(select cast(count(distinct ABIT_postup.nCode) as numeric(8,0))/addr.people * 100 as proce,count(distinct ABIT_postup.nCode) con, addr.people
from ABIT_postup inner join Person on ABIT_postup.nCode = Person.nCode
inner join Student on Student.nCode = Person.nCode
inner join ABIT_Diapazon_spec_fac on ABIT_Diapazon_spec_fac.NNrecord = ABIT_postup.NNrecord
inner join Zaved_stud on Student.Ik_zaved = Zaved_stud.ik_zaved
inner join Gorod on Gorod.Ik_gorod = Zaved_stud.ik_gorod
inner join 
	(select distinct Gorod.Latitude, Gorod.Longitude,min(Gorod.People) people
	from Gorod
	where Ik_raion in (select ik_raion from Raion where Ik_region = 1)
	and Gorod.People is not null
	group by Gorod.Latitude, Gorod.Longitude) addr 
	  on addr.Latitude = Gorod.Latitude and addr.Longitude = Gorod.Longitude
where ABIT_Diapazon_spec_fac.NNyear = 2014
group by addr.people) proc_adr on proc_adr.people = gorod.people
order by gorod.Cgorod

select Gorod.Cgorod, count(distinct Person.nCode) as per_count
from Person inner join Student on Student.nCode = Person.nCode
inner join Zaved_stud on Student.Ik_zaved = Zaved_stud.ik_zaved
inner join Gorod on Gorod.Ik_gorod = Zaved_stud.ik_gorod
inner join zach on zach.nCode = Person.nCode
inner join StudGrup on StudGrup.Ik_zach = zach.Ik_zach
inner join grup on grup.Ik_grup = StudGrup.Ik_grup
inner join Relation_spec_fac on grup.ik_spec_fac = Relation_spec_fac.ik_spec_fac
where ik_spec = 354569 and StudGrup.Ik_prikazOtch is null
GROUP BY Gorod.Cgorod
order by per_count