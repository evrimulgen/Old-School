use ugtu

insert into dbo.ABIT_sost_zach( cname_zach, ik_type_zach)
values('восстановлен', 1)


set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go



--процедура восстанавливает абитуриента 
--переписывает при этом все старые экзамены на новое заявление
alter procedure [dbo].[ABIT_Vosstan]
		    @nn_abit int,
			@NewNNrecord int,			--новый код набора
			@NewRegNomer int,			--рег номер
			@Newik_kat_zach int,		--кат зачисления
			@Newdd_pod_zayav DATETIME	--дата подачи нового заявления и возврата старого
		
as
IF @Newdd_pod_zayav IS NULL
	SELECT @Newdd_pod_zayav=CONVERT(DATETIME,CONVERT(VARCHAR(10),GETDATE(),101))
ELSE
	SELECT @Newdd_pod_zayav=CONVERT(DATETIME,CONVERT(VARCHAR(10),@Newdd_pod_zayav,101))

if @NewRegNomer is null
	set @NewRegNomer=0

DECLARE @Newnn_abit int

 
begin transaction
begin

--добавляем новое заявление
insert into dbo.ABIT_postup(RegNomer, nCode, NNrecord, ik_zach, ik_kat_zach, dd_pod_zayav, Realy_postup)
select @NewRegNomer, nCode, @NewNNrecord, 
8, @Newik_kat_zach, @Newdd_pod_zayav, Realy_postup
from ABIT_postup
 where nn_abit=@nn_abit


SELECT @Newnn_abit=@@IDENTITY

--если абитуриент не добавился, возвращаем ошибку
if (@Newnn_abit=0) or (@Newnn_abit is null)
BEGIN
  RAISERROR('При восстановлении произошла ошибка. Операция отменена.', 16,1)
  ROLLBACK TRAN 
END

--переносим экзамены
INSERT INTO dbo.ABIT_Vstup_exam(cosenka, NN_abit, ik_disc, ik_sdach, id_rasp_kab, NNvedom)
SELECT cosenka, @Newnn_abit, ik_disc, ik_sdach, id_rasp_kab, NNvedom
from ABIT_Vstup_exam
 where nn_abit=@nn_abit

end
commit transaction
