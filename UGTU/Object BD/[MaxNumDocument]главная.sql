USE [UGTU_ACTTEST]
GO
/****** Object:  UserDefinedFunction [dbo].[MaxNumDocument]    Script Date: 31.08.2015 11:44:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








--select * from dbo.[MaxNumDocument]('01.09.2014','01.10.2015','60/01',2)
Alter function [dbo].[MaxNumDocument](@DateBegin Datetime,@DateEnd Datetime, @numpodrazd varchar(10),@ik_dest int )
RETURNS @Result TABLE
(	MaxNum int
)
--RETURNS int 
AS
BEGIN
--DECLARE @Num int = 0
if  dbo.[LastNumDocument](@DateBegin,@DateEnd , @numpodrazd,@ik_dest) = 0 
begin
insert into @Result(MaxNum)
Select  dbo.[FindFirstNum](@ik_dest) 
end
else
begin
insert into @Result(MaxNum)
Select dbo.[LastNumDocument](@DateBegin,@DateEnd , @numpodrazd,@ik_dest)  
end
RETURN 
END






