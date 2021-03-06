/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [xml_str]
      ,[Date_beg_import]
      ,[Date_end_import]
      ,[Import_result]
      ,[Is_actual]
      ,[Date_change]
      ,[nCode]
      ,[Registration_Date]
      ,[ErrorCode]
  FROM [UGTU].[dbo].[Export_FB_journal] where 
  order by Import_result
  
  select ABIT_postup.NN_abit,ABIT_postup.nCode,person.Clastname, person.Cfirstname, person.Cotch, Fac.Cname_fac, EducationBranch.Cname_spec,  
  Direction.cName_direction, Form_ed.Cname_form_ed, Import_result, ABIT_postup.ik_zach
  from person, Export_FB_journal, ABIT_postup, ABIT_Diapazon_spec_fac, Relation_spec_fac, Fac, EducationBranch, Form_ed, Direction
  where person.nCode = ABIT_postup.nCode 
  and ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
  and ABIT_postup.nCode = Export_FB_journal.nCode
  and ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
  and Relation_spec_fac.ik_spec = EducationBranch.ik_spec
  and Relation_spec_fac.ik_fac = Fac.Ik_fac
  and Relation_spec_fac.Ik_form_ed = Form_ed.Ik_form_ed
  and EducationBranch.ik_direction = Direction.ik_direction
  and ABIT_postup.ik_zach<>9
  and Import_result <> 'Is exported'
  and Export_FB_journal.ncode in (select nCode from ABIT_postup, ABIT_Diapazon_spec_fac
			  where ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
			  and ABIT_Diapazon_spec_fac.NNyear=2014)
  order by person.Clastname, person.Cfirstname, person.Cotch

--исправить ошибку "уже такой импортирован"
update Export_FB_journal set Is_actual=1, Import_result='Is exported', ErrorCode = NULL -- YEAR(Date_beg_import) = 2015
where ncode in (select nCode from ABIT_postup, ABIT_Diapazon_spec_fac
			  where ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
			  and ABIT_Diapazon_spec_fac.NNyear=2014)
and ErrorCode=86

--обнулить все результаты
update Export_FB_journal set Is_actual=0
where ncode in (select nCode from ABIT_postup, ABIT_Diapazon_spec_fac
			  where ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
			  and ABIT_Diapazon_spec_fac.NNyear=2014)

--найти ошибки
select * from Export_FB_journal where
ncode in (select distinct nCode from ABIT_postup, ABIT_Diapazon_spec_fac
			  where ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
			  and ABIT_Diapazon_spec_fac.NNyear=2014
			  --and ABIT_postup.ik_zach<>9
		  )
and statusid =1
--and Is_actual = 0
--and Date_beg_import is null
and Import_result <> 'Is exported' and Import_result is not null
order by Import_result

--найти заявления студента
select * from ABIT_postup where nCode = 70401
--удаление заявления - DelAbitPostum

--найти неимпортированных (поданы по сети)
select * from ABIT_postup
where ncode in (select nCode from ABIT_postup, ABIT_Diapazon_spec_fac
			  where ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
			  and ABIT_Diapazon_spec_fac.NNyear=2014)
and ncode not in (select nCode from Export_FB_journal)

select distinct ABIT_postup.nCode from ABIT_postup
where ncode in (select nCode from ABIT_postup, ABIT_Diapazon_spec_fac
			  where ABIT_postup.NNrecord = ABIT_Diapazon_spec_fac.NNrecord
			  and ABIT_Diapazon_spec_fac.NNyear=2014)
and ABIT_postup.ik_zach in (6)
and ncode not in (select nCode from Export_FB_journal where Export_FB_journal.NNYear = 2014)