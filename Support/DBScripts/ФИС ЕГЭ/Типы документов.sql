/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [ik_vid_doc]
      ,[cvid_doc]
      ,[IsDefault]
      ,[IsIdentity]
      ,[IsEducational]
      ,[ik_FB]
      ,[ik_subFB]
      ,[ik_type_grazd]
  FROM [UGTU].[dbo].[documents]

  --справка о смерти родителя - справочник 42
  update [dbo].[documents]
  set [ik_subFB]=1, [ik_FB]=30
  where ik_vid_doc=49

    --Документ о лишении родительских прав
  update [dbo].[documents]
  set [ik_subFB]=5, [ik_FB]=30
  where ik_vid_doc=50

      --Диплом победителя первенства мира - справочник 43
  update [dbo].[documents]
  set [ik_subFB]=23, [ik_FB]=23
  where ik_vid_doc=60

  
      --Диплом первенства Европы по видам спорта, включенным в программы Олимпийских игр, Паралимпийских игр и Сурдлимпийских игр
  update [dbo].[documents]
  set [ik_subFB]=24, [ik_FB]=24
  where ik_vid_doc=61

  
      --Участие в летней школе и иных интеллектуальных и (или) творческих конкурсах, физкультурных мероприятиях и спортивных мероприятиях, проводимых УГТУ --36
  update [dbo].[documents]
  set [ik_subFB]=15, [ik_FB]=11
  where ik_vid_doc=62

