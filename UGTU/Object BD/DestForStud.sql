USE [UGTU_ACTTEST]
GO
/****** Object:  StoredProcedure [dbo].[DestForStud]    Script Date: 27.07.2015 10:14:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from [StudHistForSpr](96)
ALTER procedure [dbo].[DestForStud](@ik_stud INT)

AS
declare @ik_f_e int
SET @ik_f_e  = (	Select Ik_form_ed From
	StudInfoForDocs  where Ik_studGrup = @ik_stud)
IF @ik_f_e = 1 
BEGIN
	Select Destination.ik_destination,[cShortNameDestination] From Destination where Ik_destination <> 3 and  Ik_destination <> 5
END
ELSE 
BEGIN
	Select Destination.ik_destination, [cShortNameDestination]From Destination 
END
--RETURN 

