USE [UGTU_ACTTEST]
GO
/****** Object:  Trigger [dbo].[trPRegionUpdate]    Script Date: 21.08.2015 12:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



Create      TRIGGER [dbo].[trPBaseDestUpdate] ON [dbo].[PBaseDestination]
INSTEAD OF UPDATE
AS
BEGIN
IF ((SELECT COUNT(*) FROM Inserted WHERE Назначение IS NOT NULL OR Основание IS NOT NULL) > 0 ) --AND ( Deleted.Регион IS NOT NULL)
   BEGIN
      UPDATE Base_Destination
        SET Ik_destination1=i.Ik_destination, 
            Ik_destination2=i.ik_osn
         FROM Inserted I JOIN Base_Destination bd
            ON I.ik_basedest=bd.ik_basedest
      commit tran
   END  
END




