update [dbo].[EducationBranch]
set ik_FinancingSource=1


update [dbo].[EducationBranch]
set ik_FinancingSource=2
where ([Cname_spec] like '%Мастер%' 
or [Cname_spec] like '%Продавец%'
or [Cname_spec] like '%Оператор%'
or [Cname_spec] like '%Бурильщик%'
or [Cname_spec] like '%Вышкомонтажник%'
or [Cname_spec] like '%Автомеханик%'
or [Cname_spec] like '%Лаборант%'
or [Cname_spec] like '%Повар%'
or [Cname_spec] like '%Сварщик%'
or [Cname_spec] like '%Электромонтажник%'
or [Cname_spec] like '%Слесарь%'
or [Cname_spec] like '%Машинист%')and 
--select * from [dbo].[EducationBranch] where
ik_direction=5  