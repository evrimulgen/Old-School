USE [UGTU]
GO
/****** Object:  UserDefinedFunction [dbo].[GetNextZachNumForNabor]    Script Date: 18.11.2016 11:00:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

select *
from dbo.Zach
where (Nn_zach >'152850' or Nn_zach < 151500) and Nn_zach like '15%' --between '150001' and '150700'
order by Nn_zach
go
--select [GetNextZachNumForFaculty](27, 2015)
CREATE FUNCTION [dbo].[GetNextZachNumForFaculty] 
(
	@ik_fac int,
	@year int
)
RETURNS VARCHAR(6)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @next int;
	DECLARE @ik_year int;
	DECLARE @yearValue int;
	DECLARE @CurNum int;
	DECLARE @End int;
	DECLARE @CurNumStr Varchar(6);
	DECLARE @ik_metafac Varchar(6);


select @CurNum = BeginDiapazon, @End = EndDiapazon
from dbo.Abit_Zach_Diapazons
inner join [dbo].[Year_uch_pl] on Abit_Zach_Diapazons.ik_year=[Year_uch_pl].[ik_year_uch_pl]
where [year_value]=@year

/*if @CurNum is Null 
BEGIN

	set @ik_metafac = (select ik_fac from dbo.Relation_spec_fac
	where ik_spec = (select ik_spec from dbo.Relation_spec_fac where ik_spec_fac =
	(select ik_spec_fac from dbo.ABIT_Diapazon_spec_fac where NNRecord=@NNrecord)
	) and ik_fac<>@ik_fac and ik_form_ed = 1)

		if @ik_metafac is Null set @ik_metafac = (select ik_fac from dbo.Relation_spec_fac
		where ik_spec = ((select ik_main_spec from ABIT_Diapazon_spec_fac,Relation_spec_fac, Spec_stud
																					  where ABIT_Diapazon_spec_fac.ik_spec_fac = Relation_spec_fac.ik_spec_fac
																					  and Relation_spec_fac.ik_spec = Spec_stud.ik_spec
																					  and NNRecord=@NNrecord)) 
		and ik_fac<>@ik_fac and ik_form_ed = 1)


	Set @CurNum = (select BeginDiapazon
	from dbo.Abit_Zach_Diapazons
	where (ik_fac=@ik_metafac) and (ik_year=@ik_year))

	Set @End = (select EndDiapazon
	from dbo.Abit_Zach_Diapazons
	where (ik_fac=@ik_metafac) and (ik_year=@ik_year))
End*/

Set @CurNumStr = (SELECT RIGHT('00000'+ CONVERT(VARCHAR,@CurNum),6));

-- Return the result of the function
if @CurNum is not null

While (@CurNumStr in (SELECT Zach.Nn_zach FROM dbo.ABIT_postup INNER JOIN
                         dbo.ABIT_Diapazon_spec_fac ON dbo.ABIT_postup.NNrecord = dbo.ABIT_Diapazon_spec_fac.NNrecord INNER JOIN
                         dbo.Zach ON dbo.ABIT_postup.[nCode] = dbo.Zach.[nCode] 
						 WHERE dbo.ABIT_Diapazon_spec_fac.NNyear=@yearValue))and(@CurNum<=@End)
begin
  Set @CurNum = @CurNum+1
  Set @CurNumStr = (SELECT RIGHT('00000'+ CONVERT(VARCHAR,@CurNum),6));
end

if @CurNum>@End return Null

return @CurNumStr

END
