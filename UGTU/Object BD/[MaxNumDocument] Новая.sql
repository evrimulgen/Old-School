USE [UGTU_ACTTEST]
GO
/****** Object:  UserDefinedFunction [dbo].[MaxNumDocument]    Script Date: 31.08.2015 11:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








--select * from  [MaxNumDocument]('01.09.2015','01.10.2015','60/01',2)
ALTER function [dbo].[MaxNumDocument](@DateBegin Datetime,@DateEnd Datetime, @numpodrazd varchar(10),@ik_dest int )
RETURNS @Result TABLE
(
	MaxNum int
)
AS
BEGIN
	insert into @Result(MaxNum)
	Select iif (MAX(NumberDoc)is null,0,MAX(NumberDoc))[MaxNum] From Document
	inner join Destination 
	on Document.Ik_destination=Destination.Ik_destination
	 where DateCreate >=@DateBegin and DateCreate<=@DateEnd
	and Document.Num_podrazd=@numpodrazd
	and [Ik_TypeDest] in (Select [Ik_TypeDest] from Destination where Ik_destination = @ik_dest )
	



RETURN
END






