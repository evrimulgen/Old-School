USE [UGTU]
GO
/****** Object:  UserDefinedFunction [dbo].[LastNumDocument]    Script Date: 14.04.2017 12:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON

GO




GO
--select * from [FindFirstNum](8)
ALTER function [dbo].[FindFirstNum]( @ik_dest int )
--RETURNS @Result TABLE
--(
--	MaxNum int
--)
returns int
AS
BEGIN
DECLARE @LastNum int = 0
	--insert into @Result(MaxNum)
Select @LastNum=iif (MAX(Distinct Num) is null,0,MAX(Num))  
from  Destination d
inner join TypeDest td
on d.Ik_TypeDest = td.Ik_TypeDest
inner join BeginNumDoc bnd
on td.Ik_TypeDest=bnd.Ik_TypeDest
inner join Room r
on bnd.ik_room = r.ik_room
inner join Relation_spec_fac rsf
on  r.ik_room=rsf.ik_room
where rsf.ik_spec_fac in (select * from [GetSpecPermissionsFromRelTable]()) 
and yearD=Year(GetDate()) and Ik_destination=@ik_dest

RETURN @LastNum
END


GO
ALTER function [dbo].[LastNumDocument](@DateBegin Datetime,@DateEnd Datetime, @numpodrazd varchar(10),@ik_dest int, @ik_fromEd int)
--RETURNS @Result TABLE(	MaxNum int
--)
Returns int
AS
BEGIN
DECLARE @Num int = 0

	--insert into @Result(MaxNum)
	if @ik_dest<>7
	begin   
	Select @Num =  iif (MAX(NumberDoc)is null, 0,MAX(NumberDoc))From Document
	inner join Destination 
	on Document.Ik_destination=Destination.Ik_destination
	inner join [dbo].[StudGrup] on Document.[Ik_studGrup]=[StudGrup].[Ik_studGrup]
	inner join dbo.[Grup] on [StudGrup].Ik_grup=[Grup].Ik_grup
	inner join dbo.Relation_spec_fac on [Grup].ik_spec_fac=Relation_spec_fac.ik_spec_fac
	 where Document.DateCreate >=@DateBegin and Document.DateCreate<=@DateEnd 
		and Relation_spec_fac.[Ik_form_ed]=@ik_fromEd
		and Document.Num_podrazd=@numpodrazd
	and [Ik_TypeDest] in (Select [Ik_TypeDest] from Destination where Ik_destination = @ik_dest );
	end
	else
	begin
		Select @Num =  iif (MAX(NumberDoc)is null, 0,MAX(NumberDoc))From Document
	inner join Destination 
	on Document.Ik_destination=Destination.Ik_destination
	 where DateCreate >=@DateBegin and DateCreate<=@DateEnd
	and [Ik_TypeDest] in (Select [Ik_TypeDest] from Destination where Ik_destination = @ik_dest );
	end;
RETURN @Num
END
go



--dbo.[MaxNumDocument]('01.09.2015','01.10.2015','60/01',2)
ALTER function [dbo].[MaxNumDocument](@DateBegin Datetime,@DateEnd Datetime, @numpodrazd varchar(10),@ik_dest int, @ik_fromEd int )
RETURNS @Result TABLE
(	MaxNum int
)
--RETURNS int 
AS
BEGIN
--DECLARE @Num int = 0
if  dbo.[LastNumDocument](@DateBegin,@DateEnd , @numpodrazd,@ik_dest, @ik_fromEd) = 0 
begin
insert into @Result(MaxNum)
Select  dbo.[FindFirstNum](@ik_dest) 
end
else
begin
insert into @Result(MaxNum)
Select dbo.[LastNumDocument](@DateBegin,@DateEnd , @numpodrazd,@ik_dest, @ik_fromEd)  
end
RETURN 
END

