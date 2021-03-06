set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go


/*
select * from dbo.discpln
where ik_disc IN (2,10,1133)
*/
--exec [CheckVedClose] 3,494
--Проверяет созданы ли все ведомости зачетной недели
--и все ли они созданы
ALTER    PROCEDURE [dbo].[CheckVedClose]
@n_sem INT,
@ik_grup INT
AS
DECLARE @checkVed bit		--признак закрытия всех созданных экз. ведомостей
DECLARE @allZachVed bit		--признак того, что созданы все зач. ведомости из уч плана

--проверяет есть ли открытые ведомости
	IF (EXISTS(SELECT 'TRUE' FROM
		(SELECT distinct ik_upContent FROM dbo.Content_UchPl INNER JOIN 
		(SELECT * FROM dbo.sv_disc WHERE ik_disc IN (SELECT ik_disc FROM dbo.discpln WHERE lPract=0)) svd
		ON dbo.Content_UchPl.ik_disc_uch_plan = svd.ik_disc_uch_plan
		Where ((ik_uch_plan = (Select ik_uch_plan From Grup Where ik_grup = @ik_grup)) and (n_sem = @n_sem) and (ik_vid_zanyat in (Select ik_vid_zanyat From vid_zaniat Where ikTypeZanyat in (Select ikTypeZanyat From TypeZanyat Where bitOtchetnost = 1 AND bitExam=0))))) cont
		inner JOIN
		(SELECT ik_upContent FROM dbo.Vedomost WHERE lPriznak_napr=0 AND lClose=0 AND ik_grup=@ik_grup)v
		ON v.ik_upContent=cont.ik_upContent)) 
	BEGIN
			SET @checkVed=0	
	END

	ELSE
			SET @checkVed=1

--Проверяет, все ли зачетные ведомости созданы
	IF (EXISTS(SELECT 'TRUE' FROM
		(SELECT distinct ik_upContent FROM dbo.Content_UchPl INNER JOIN 
		(SELECT * FROM dbo.sv_disc WHERE ik_disc IN (SELECT ik_disc FROM dbo.discpln WHERE lPract=0)) svd
		ON dbo.Content_UchPl.ik_disc_uch_plan = svd.ik_disc_uch_plan
		Where ((ik_uch_plan = (Select ik_uch_plan From Grup Where ik_grup = @ik_grup)) and (n_sem = @n_sem) and (ik_vid_zanyat in (Select ik_vid_zanyat From vid_zaniat Where ikTypeZanyat in (Select ikTypeZanyat From TypeZanyat Where bitOtchetnost = 1 AND bitExam=0))))) cont
		left JOIN
		(SELECT ik_upContent FROM dbo.Vedomost WHERE lPriznak_napr=0 AND ik_grup=@ik_grup)v
		ON v.ik_upContent=cont.ik_upContent
		WHERE v.ik_upContent IS NULL))
			SET @allZachVed=0
	ELSE
			SET @allZachVed=1
	 
	SELECT @checkVed as checkved, @allZachVed as allZachVed


