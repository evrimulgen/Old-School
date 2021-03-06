USE UGTU_ACTTEST
GO
/****** Object:  UserDefinedFunction [dbo].[ABIT_GetSpecList]    Script Date: 22.03.2016 10:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


alter table [dbo].[ABIT_Diapazon_spec_fac]
add ik_profile int

GO

ALTER TABLE [dbo].[ABIT_Diapazon_spec_fac]  WITH CHECK ADD  CONSTRAINT [FK_ABIT_Diapazon_spec_fac_EducationBranch] FOREIGN KEY([ik_profile])
REFERENCES [dbo].[EducationBranch] ([ik_spec])
GO

ALTER TABLE [dbo].[ABIT_Diapazon_spec_fac] CHECK CONSTRAINT [FK_ABIT_Diapazon_spec_fac_EducationBranch]
GO
go



go
--SELECT * FROM [dbo].[ABIT_GetProfileList](2015,156, 12)
--Возвращает список профилей, по которым в заданном году еще не созданы наборы 
--соответственно используется для создания/редактирования наборов
create    FUNCTION [dbo].[ABIT_GetProfileList](@nnyear int, @ik_parentSpec int, @currentProfile int = null)
RETURNS  TABLE

AS

RETURN (
select ik_spec,isnull(Sh_spec,'')+ ' ' +
	RTRIM(Cname_spec) +ISNULL(' ('+Direction.cName_direction+')',' ') Cname_spec,
	Cshort_spec, Direction.ik_direction, Sortorder from 
[dbo].[EducationBranch] left join dbo.Direction on [EducationBranch].ik_direction=Direction.ik_direction
 
WHERE 
	(not ik_spec in (select [ik_profile]
		from dbo.ABIT_Diapazon_spec_fac spd where nnyear=@nnyear)
		or ik_spec=ISNULL(@currentProfile,0))

	  and ((spDateExit is null)or(year(spDateExit)>@nnyear)) --грузим только современные специальности
)
