USE [UGTU_ACTTEST]
GO
/****** Object:  StoredProcedure [dbo].[DocInfoSpravBuild]    Script Date: 01.08.2015 11:22:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






--EXEC	[dbo].[DocInfoSpravBuild] @Ik_document = 83
Create   procedure [dbo].[StudAddressProc](@Ik_studGrup INT)
as
	SELECT *
		FROM StudAddress

			WHERE  Ik_studGrup=@Ik_studGrup






