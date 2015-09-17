USE [UGTU_ACTTEST]
GO
/****** Object:  StoredProcedure [dbo].[FindBaseDoc]    Script Date: 20.08.2015 14:12:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC	[dbo].[FindBaseDoc] @Ik_destination = 3 ,@Ik_StudGrup=33948
--select * from [BaseDest]
Alter  View [dbo].[BaseDest] -- справочник оснований
as
select  d1.cNameDestination,d2.cNameDestination [osn],d1.Ik_destination ,d2.Ik_destination [ik_osn]
from Destination d1
		inner join Base_Destination 
		on d1.Ik_destination=Base_Destination.Ik_destination1
				inner join Destination d2
				on Base_Destination.Ik_destination2=d2.Ik_destination


--select cNameDestination+' (№'+ NumberDoc+' - '+Num_podrazd+' '+ iif(DAY(DateReady)>9,'0'+DAY(DateReady),DAY(DateReady))+
--'.'+ iif(Month(DateReady)>9,'0'+Month(DateReady),Month(DateReady))+'.'+Year(DateReady)+')'[cNameOsn],Ik_Document

--select cNameDestination+' (№'+ CAST(NumberDoc as varchar(10))+' - '+ CAST(Num_podrazd as varchar(10))+' '+ CAST(DateReady as varchar(10))
--+')'[cNameOsn],Ik_Document
