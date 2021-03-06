USE [UGTU_ACTTEST]
GO
/****** Object:  StoredProcedure [dbo].[DocInfoSpravBuild]    Script Date: 29.07.2015 14:26:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






--EXEC	[dbo].[DocInfoSpravBuild] @Ik_document = 83
ALTER   procedure [dbo].[DocInfoSpravBuild](@Ik_document INT)
as
	SELECT Document.Ik_Document,TransferMethod.Ik_Transfer,Destination.Ik_destination,Document.Ik_studGrup,
	Document.DateReady,Document.NumberDoc, Document.DateCreate,Document.Num_podrazd,Destination.cNameDestination,
	Content_UchPl.ik_upContent,DateEndPeriod,DateStartPeriod,n_sem,vid_zaniat.iK_vid_zanyat,cName_vid_zanyat,
	reason_call,cNameTransfer,Document2.Ik_Document[Ik_DocumentBase],Destination2.cNameDestination[cNameDestinationBase],
	Pricina.Cname_pric,Addressee_Doc.ik_personAddress,DAY(an.Deduction) as dayotch,Month(an.Deduction) as monthotch,
	Year(an.Deduction) as yearotch ,an.NamePric,Document.DatePod
		FROM Document inner join Destination
		on Document.Ik_destination=Destination.Ik_destination
			left join CallSpr 
			on Document.Ik_Document=CallSpr.Ik_Document
				left join Content_UchPl 
				on  CallSpr.Ik_upContent=Content_UchPl.ik_upContent
					left join  vid_zaniat
					on vid_zaniat.iK_vid_zanyat= Content_UchPl.ik_vid_zanyat
						left join AkademNeuspev 
						on Document.Ik_Document=AkademNeuspev.Ik_Document
							inner join TransferMethod
							on Document.Ik_Transfer=TransferMethod.Ik_Transfer
								 left join DocumentBase
								 on Document.Ik_Document=DocumentBase.Ik_Document_base
									left join Document Document2
									on Document2.Ik_Document=DocumentBase.Ik_Document_reference
									left join Destination Destination2
										on Document2.Ik_destination=Destination2.Ik_destination
										left join ReasonIssuing
										on Document.Ik_reason_issuing=ReasonIssuing.Ik_reason_issuing
											left join Pricina
											on ReasonIssuing.ik_pric=Pricina.Ik_pric
												left join Addressee_Doc
												on Document.Ik_Document=Addressee_Doc.Ik_Document
												left join AkademNeuspev an
												on Document.Ik_Document=  an.Ik_Document

			WHERE  Document.[Ik_document]=@Ik_document






