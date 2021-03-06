/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [ID_Content]
      ,[ID_Campaign]
      ,[id_direction]
      ,[id_form]
      ,[id_eduSource]
      ,[stage]
      ,[Date_start]
      ,[Date_end]
      ,[Date_order]
  FROM [UGTU].[dbo].[Abit_Campaign_Content]
  order by id_direction, id_form, id_eduSource

  
declare @ik_direction	int
declare @Ik_form_ed		int
declare @MestBudjet		int
declare @MestCKP		int
declare @MestLgot		int
declare @ID_Campaign	varchar(50)
declare @stage			int

declare cur1 cursor for  
	  select Abit_Campaign.id, EducationBranch.ik_direction, Relation_spec_fac.Ik_form_ed, sum([MestBudjet]), sum([MestCKP]), sum([MestLgot])
	  from [dbo].[ABIT_Diapazon_spec_fac], Relation_spec_fac, EducationBranch,Abit_Campaign
	  where [dbo].[ABIT_Diapazon_spec_fac].ik_spec_fac = Relation_spec_fac.ik_spec_fac
	  and EducationBranch.ik_spec = Relation_spec_fac.ik_spec
	  and Abit_Campaign.year = year(GetDate())
	  and NNyear = year(GetDate())
	  group by Abit_Campaign.id,EducationBranch.ik_direction, Relation_spec_fac.Ik_form_ed
	  order by EducationBranch.ik_direction, Relation_spec_fac.Ik_form_ed
open cur1
fetch next from cur1 into @ID_Campaign, @ik_direction, @Ik_form_ed, @MestBudjet, @MestCKP, @MestLgot
while @@Fetch_Status = 0
  begin
  if @ik_direction in (1, 2, 10)  and (@Ik_form_ed = 1)
    set @stage = 1 else set @stage = NULL

  --контракт
  insert into Abit_Campaign_Content(ID_Campaign,id_direction,id_form, id_eduSource)
  values(@ID_Campaign, @ik_direction, @Ik_form_ed, 3)
  
  --бюджет
  if @MestBudjet > 0
  begin
    insert into Abit_Campaign_Content(ID_Campaign,id_direction,id_form, id_eduSource, stage)
    values(@ID_Campaign, @ik_direction, @Ik_form_ed, 1, @stage)
  end

  --ЦКП
  if @MestCKP > 0
  begin
    insert into Abit_Campaign_Content(ID_Campaign,id_direction,id_form, id_eduSource)
    values(@ID_Campaign, @ik_direction, @Ik_form_ed, 2)
  end

  --особое право
  if @MestLgot > 0
  begin
    insert into Abit_Campaign_Content(ID_Campaign,id_direction,id_form, id_eduSource)
    values(@ID_Campaign, @ik_direction, @Ik_form_ed, 12)
  end  

  FETCH NEXT FROM cur1 INTO @ID_Campaign, @ik_direction, @Ik_form_ed, @MestBudjet, @MestCKP, @MestLgot
END     
CLOSE cur1
DEALLOCATE cur1