USE [UGTU_COPY]
GO
/****** Object:  UserDefinedFunction [dbo].[LastNumDocument]    Script Date: 09.09.2015 13:17:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER function [dbo].[LastNumDocument](@DateBegin Datetime,@DateEnd Datetime, @numpodrazd varchar(10),@ik_dest int )
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
	 where DateCreate >=@DateBegin and DateCreate<=@DateEnd
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