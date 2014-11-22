program ugtu;
uses
  Forms,
  SysUtils,
  uMain in 'Presentation\Forms\uMain.pas' {frmMain},
  uLogin in 'Presentation\Dialogs\uLogin.pas' {frmLogin},
  uDM in 'Data\uDM.pas' {dm: TDataModule},
  AbiturientOrderProcs in 'Domain\Controllers\AbiturientOrderProcs.pas',
  AbiturientBaseProcs in 'Domain\Controllers\AbiturientBaseProcs.pas',
  AbiturientBaseTables in 'Domain\Controllers\AbiturientBaseTables.pas',
  AbiturientBeforeZachislenieListProcs in 'Domain\Controllers\AbiturientBeforeZachislenieListProcs.pas',
  uBaseFrame in 'Presentation\Frames\uBaseFrame.pas' {fmBase: TFrame},
  uStudent in 'Presentation\Frames\uStudent.pas' {fmStudent: TFrame},
  uFac in 'Presentation\Frames\uFac.pas' {fmFacultet: TFrame},
  uGroup in 'Presentation\Frames\uGroup.pas' {fmGroup: TFrame},
  uSpec in 'Presentation\Frames\uSpec.pas' {fmSpec: TFrame},
  uUni in 'Presentation\Frames\uUni.pas' {fmUni: TFrame},
  uSpravFram in 'Presentation\Frames\uSpravFram.pas' {fmSprav: TFrame},
  uUchPlan in 'Presentation\Frames\uUchPlan.pas' {fmUchPlan: TFrame},
  uBaseDialog in 'Presentation\dialogs\uBaseDialog.pas' {frmBaseDialog},
  uUchPlanAddNew in 'Presentation\dialogs\uUchPlanAddNew.pas' {frmUchPlanAddNew},
  uPrikDlg in 'Presentation\dialogs\uPrikDlg.pas' {ftmPrikaz},
  uLangDlg in 'Presentation\dialogs\uLangDlg.pas' {ftmLangDialog},
  uRelativeDlg in 'Presentation\dialogs\uRelativeDlg.pas' {ftmAddRelative},
  uGroupEdtDlg in 'Presentation\dialogs\uGroupEdtDlg.pas' {frmGroupEdt},
  uPrik in 'Presentation\Frames\uPrik.pas' {fmPrik: TFrame},
  uAbout in 'Presentation\Forms\uAbout.pas' {frmAbout},
  uNapr in 'Presentation\dialogs\uNapr.pas' {ftmNapr},
  uRaports in 'Presentation\dialogs\uRaports.pas' {frmRaporsDlg},
  uSpravForm in 'Presentation\Forms\uSpravForm.pas' {frmSprav},
  uNaprClose in 'Presentation\dialogs\uNaprClose.pas' {ftmNaprclose},
  uVosstStud in 'Presentation\dialogs\uVosstStud.pas' {frmStudVosst},
  uOtchislStud in 'Presentation\dialogs\uOtchislStud.pas' {frmOtchislStud},
  uPerevStud in 'Presentation\dialogs\uPerevStud.pas' {frmPerevStud},
  uRestoreConn in 'Domain\Controllers\uRestoreConn.pas',
  uError in 'Presentation\Forms\uError.pas' {frmError},
  uNagruzkaAddPotok in 'Presentation\dialogs\uNagruzkaAddPotok.pas' {frmAddPotok},
  uNagruzka in 'Presentation\Frames\uNagruzka.pas' {fmNagruzkaMain: TFrame},
  uNagruzkaFac in 'Presentation\Frames\uNagruzkaFac.pas' {fmNagruzkaFac: TFrame},
  uNagruzkaDep in 'Presentation\Frames\uNagruzkaDep.pas' {fmNagruzkaDep: TFrame},
  uNagruzkaAddPrep in 'Presentation\dialogs\uNagruzkaAddPrep.pas' {frmNagruzkaAddPrep},
  uStudInfo in 'Presentation\dialogs\uStudInfo.pas' {frmStudInfo},
  uNagruzkaAddKaf in 'Presentation\dialogs\uNagruzkaAddKaf.pas' {frmNagruzkaAddKaf},
  uNagruzkaAddPlan in 'Presentation\dialogs\uNagruzkaAddPlan.pas' {frmNagruzkaAddPlan},
  uNagruzkaAddDiscToPlan in 'Presentation\dialogs\uNagruzkaAddDiscToPlan.pas' {frmNagruzkaAddDiscToPlan},
  uNagruzkaAddFact in 'Presentation\dialogs\uNagruzkaAddFact.pas' {frmNagruzkaAddFact},
  uAcadem in 'Presentation\dialogs\uAcadem.pas' {frmAcademStud},
  uChangeLastName in 'Presentation\dialogs\uChangeLastName.pas' {frmChangeLastName},
  uSpecAddSpclz in 'Presentation\dialogs\uSpecAddSpclz.pas' {frmSpecAddSpclz},
  uChangePassport in 'Presentation\dialogs\uChangePassport.pas' {frmChangePassport},
  uVinEkz in 'Presentation\dialogs\uVinEkz.pas' {frmVinEkz},
  uUserFrame in 'Presentation\Frames\uUserFrame.pas' {fmUsers: TFrame},
  uAcademReturn in 'Presentation\dialogs\uAcademReturn.pas' {frmAcademReturn},
  AbiturientFacade in 'Domain\Controllers\AbiturientFacade.PAS',
  ABIT_add_nabor_dialog in 'Presentation\dialogs\ABIT_add_nabor_dialog.pas' {frmNewNabor},
  ABIT_add_rasp_dialog in 'Presentation\dialogs\ABIT_add_rasp_dialog.pas' {frmDialRasp},
  ABIT_rasp_frame in 'Presentation\Frames\ABIT_rasp_frame.pas' {fmAbitRasp: TFrame},
  ABIT_zachislenie_frame in 'Presentation\Frames\ABIT_zachislenie_frame.pas' {fmZach: TFrame},
  uDipl in 'Presentation\dialogs\uDipl.pas' {frmDiplom},
  ABIT_select_stat_year in 'Presentation\dialogs\ABIT_select_stat_year.pas' {frmBaseDialog2},
  uLevelUp in 'Presentation\dialogs\uLevelUp.pas' {frmLevelUp},
  uabitDialog in 'Presentation\dialogs\uabitDialog.pas' {frmAbitCardDialog},
  uAbitCard in 'Presentation\Frames\uAbitCard.pas' {fmAbitCard: TFrame},
  ABIT_year_frame in 'Presentation\Frames\ABIT_year_frame.pas' {fmAbitYears: TFrame},
  ABIT_select_stat_ALL in 'Presentation\dialogs\ABIT_select_stat_ALL.pas' {frmBaseDialog1},
  ABIT_panel in 'Presentation\Forms\ABIT_panel.pas' {FrmPanel},
  uAbitDinamica in 'Presentation\Frames\uAbitDinamica.pas' {fmABITDinamica: TFrame},
  uAddExam in 'Presentation\dialogs\uAddExam.pas' {frmAddExamDialog},
  uPrintNapr in 'Presentation\dialogs\uPrintNapr.pas' {frmPrintNaprDialog},
  Abit_nabor_frame in 'Presentation\Frames\Abit_nabor_frame.pas' {fmAbitNabor: TFrame},
  ABIT_zhurnal in 'Presentation\Dialogs\ABIT_zhurnal.pas' {frmAbitZhurnal: TfrmAbitZhurnal},
  uUniteGroups in 'Presentation\dialogs\uUniteGroups.pas' {frmGroupManager},
  StoHTMLHelp in 'Domain\Controllers\StoHTMLHelp.pas',
  uAbitMove in 'Presentation\dialogs\uAbitMove.pas' {frmAbitMove},
  uJoinGroup in 'Presentation\dialogs\uJoinGroup.pas' {frmJoinGroup},
  uQMController in 'Domain\Controllers\uQMController.pas',
  uQueryMaster in 'Presentation\dialogs\uQueryMaster.pas',
  VarFileUtils in 'Utils\ShareAPG\VarFileUtils.pas',
  NagruzkaController in 'Domain\Controllers\NagruzkaController.pas',
  FactNagruzkaController in 'Domain\Controllers\FactNagruzkaController.pas',
  GeneralController in 'Domain\Controllers\GeneralController.pas',
  PlanNagruzkaController in 'Domain\Controllers\PlanNagruzkaController.pas',
  UchPlanController in 'Domain\Controllers\UchPlanController.pas',
  AbiturientNaborProcs in 'Domain\Controllers\AbiturientNaborProcs.pas',
  AbiturientAbitProcs in 'Domain\Controllers\AbiturientAbitProcs.PAS',
  AbiturientRaspisanieProcs in 'Domain\Controllers\AbiturientRaspisanieProcs.pas',
  ABIT_add_raspkab_dialog in 'Presentation\Dialogs\ABIT_add_raspkab_dialog.pas' {frmRaspkab: TfrmRaspkab},
  AbiturientExamProcs in 'Domain\Controllers\AbiturientExamProcs.pas',
  AbiturientListsBeforeExamProcs in 'Domain\Controllers\AbiturientListsBeforeExamProcs.pas',
  AbiturientAbitTables in 'Domain\Controllers\AbiturientAbitTables.pas',
  AppConst in 'Utils\ShareAPG\AppConst.pas',
  ClUtils in 'Utils\ShareAPG\ClUtils.pas',
  CSB in 'Utils\ShareAPG\CSB.pas',
  csdbg in 'Utils\ShareAPG\csdbg.pas',
  DbgUtils in 'Utils\ShareAPG\DbgUtils.pas',
  DBUtils in 'Utils\ShareAPG\DBUtils.pas',
  DlgUtils in 'Utils\ShareAPG\DlgUtils.pas',
  EditsEx in 'Utils\ShareAPG\EditsEx.pas',
  ExUtils in 'Utils\ShareAPG\ExUtils.pas',
  FileCls in 'Utils\ShareAPG\FileCls.pas',
  FileUtils in 'Utils\ShareAPG\FileUtils.pas',
  ggautil in 'Utils\ShareAPG\ggautil.pas',
  Iterators in 'Utils\ShareAPG\Iterators.PAS',
  MapFile in 'Utils\ShareAPG\MapFile.pas',
  OleUtils in 'Utils\ShareAPG\OleUtils.pas',
  OsUtils in 'Utils\ShareAPG\OsUtils.pas',
  PrnUtils in 'Utils\ShareAPG\PrnUtils.pas',
  QParser in 'Utils\ShareAPG\QParser.pas',
  RegUtils in 'Utils\ShareAPG\RegUtils.pas',
  SBS in 'Utils\ShareAPG\SBS.pas',
  secutils in 'Utils\ShareAPG\secutils.pas',
  StringUtils in 'Utils\ShareAPG\StringUtils.pas',
  VCLUtils in 'Utils\ShareAPG\VCLUtils.pas',
  win2000 in 'Utils\ShareAPG\win2000.pas',
  uUchPlanSemLength in 'Presentation\Dialogs\uUchPlanSemLength.pas',
  uUchPlanEditControlVZ in 'Presentation\Dialogs\uUchPlanEditControlVZ.pas',
  uUchPlanEditAuditorVZ in 'Presentation\Dialogs\uUchPlanEditAuditorVZ.pas',
  uNagruzkaAddNorm in 'Presentation\Dialogs\uNagruzkaAddNorm.pas',
  SheduleController in 'Domain\Controllers\SheduleController.pas',
  uNagruzkaEditPotokShemes in 'Presentation\Dialogs\uNagruzkaEditPotokShemes.pas',
  uNagruzkaDiscToTeacher in 'Presentation\Dialogs\uNagruzkaDiscToTeacher.pas',
  uDMStudentSelectionProcs in 'Data\uDMStudentSelectionProcs.pas' {dmStudentSelectionProcs: TDataModule},
  uDMCauses in 'Data\uDMCauses.pas' {dmCauses: TDataModule},
  uDMAdress in 'Data\uDMAdress.pas' {dmAdress: TDataModule},
  uDMStudentActions in 'Data\uDMStudentActions.pas' {dmStudentActions: TDataModule},
  uDMStudentData in 'Data\uDMStudentData.pas' {dmStudentData: TDataModule},
  uDMPrikaz in 'Data\uDMPrikaz.pas' {dmPrikaz: TDataModule},
  uDMFacultetStatistic in 'Data\uDMFacultetStatistic.pas' {dmFacultetStatistic: TDataModule},
  uDMUgtuStructure in 'Data\uDMUgtuStructure.pas' {dmUgtuStructure: TDataModule},
  uDMGroupActions in 'Data\uDMGroupActions.pas' {dmGroupActions: TDataModule},
  uDMRecordBook in 'Data\uDMRecordBook.pas' {dmRecordBook: TDataModule},
  uDMAbiturientAction in 'Data\uDMAbiturientAction.pas' {dmAbiturientAction: TDataModule},
  uDMAbiturientOtchety in 'Data\uDMAbiturientOtchety.pas' {dmAbiturientOtchety: TDataModule},
  uDMUspevaemost in 'Data\uDMUspevaemost.pas' {dmUspevaemost: TDataModule},
  uNagruzkaUchOtdelMaster in 'Presentation\Dialogs\uNagruzkaUchOtdelMaster.pas' {frmNagruzkaUchOtdelMaster},
  uNagruzkaKafedraMaster in 'Presentation\Dialogs\uNagruzkaKafedraMaster.pas' {frmNagruzkaKafedraMaster},
  uVisualDBObjectsForQM in 'Domain\Controllers\uVisualDBObjectsForQM.pas',
  uQMDataModule in 'Data\uQMDataModule.pas' {QMDataModule: TDataModule},
  uDMAbiturientZachisl in 'Data\uDMAbiturientZachisl.pas' {DMAbiturientZachisl: TDataModule},
  uNagruzkaFillTakeNagr in 'Presentation\Dialogs\uNagruzkaFillTakeNagr.pas' {frmNagruzkaFillTakeNagr},
  uNagruzkaConflictOnAvtoBuild in 'Presentation\Dialogs\uNagruzkaConflictOnAvtoBuild.pas' {frmNagruzkaConflictOnAvtoBuild},
  uNagruzkaFillFactNagrByCU in 'Presentation\Dialogs\uNagruzkaFillFactNagrByCU.pas' {frmNagruzkaFillFactNagrByCU},
  uNagruzkaFillFactNagrByVZ in 'Presentation\Dialogs\uNagruzkaFillFactNagrByVZ.pas' {frmNagruzkaFillFactNagrByVZ},
  uAbitZachislenieController in 'Domain\Controllers\uAbitZachislenieController.pas',
  uQMView in 'Presentation\Dialogs\uQMView.pas' {frmQMView},
  uDMAbiturientRasp in 'Data\uDMAbiturientRasp.pas' {DMAbiturientRasp: TDataModule},
  uNagruzkaDistributedDuty in 'Presentation\Dialogs\uNagruzkaDistributedDuty.pas' {frmNagruzkaDistributedDuty},
  uAbitRaspisanieController in 'Domain\Controllers\uAbitRaspisanieController.pas',
  uQMAddEntity in 'Presentation\Dialogs\uQMAddEntity.pas' {frmQMAddEntity},
  uNagruzkaPrepAllInfo in 'Presentation\Frames\uNagruzkaPrepAllInfo.pas' {fmNagruzkaPrepAllInfo: TFrame},
  uErrorInfo in 'Presentation\Dialogs\uErrorInfo.pas' {frmErrorInfo},
  uDMMethodWork in 'Data\uDMMethodWork.pas' {dmMethodWork: TDataModule},
  MethodWorkController in 'Domain\Controllers\MethodWorkController.pas',
  uMethodWork in 'Presentation\Frames\uMethodWork.pas' {fmMethodWork: TFrame},
  uMethodWorkDep in 'Presentation\Frames\uMethodWorkDep.pas' {fmMethodWorkDep: TFrame},
  uMethodWorkFac in 'Presentation\Frames\uMethodWorkFac.pas' {fmMethodWorkFac: TFrame},
  uMethodWorkPrep in 'Presentation\Frames\uMethodWorkPrep.pas' {fmMethodWorkPrep: TFrame},
  uMethodWorkAddNorm in 'Presentation\Dialogs\uMethodWorkAddNorm.pas' {frmMethodWorkAddNorm},
  uNagruzkaSelTeacherForFactEdit in 'Presentation\Dialogs\uNagruzkaSelTeacherForFactEdit.pas' {frmNagruzkaSelTeacherForFactEdit},
  uUspevGroupController in 'Domain\Controllers\uUspevGroupController.pas',
  uShedule in 'Presentation\Frames\uShedule.pas' {fmShedule: TFrame},
  uSheduleFac in 'Presentation\Frames\uSheduleFac.pas' {fmSheduleFac: TFrame},
  uSheduleDep in 'Presentation\Frames\uSheduleDep.pas' {fmSheduleDep: TFrame},
  uQMAdminTable in 'Presentation\Dialogs\uQMAdminTable.pas' {frmQMAdminTable},
  uQMAdminField in 'Presentation\Dialogs\uQMAdminField.pas' {frmQMAdminField},
  uMethodWorkAddPlan in 'Presentation\Dialogs\uMethodWorkAddPlan.pas' {frmMethodWorkAddPlan},
  uQMAdminRelation in 'Presentation\Dialogs\uQMAdminRelation.pas' {frmQMAdminRelation},
  SheduleTestController in 'Domain\Controllers\SheduleTestController.pas',
  SheduleAccountController in 'Domain\Controllers\SheduleAccountController.pas',
  SheduleClasses in 'Domain\Controllers\SheduleClasses.pas',
  SheduleConstraintController in 'Domain\Controllers\SheduleConstraintController.pas',
  uSheduleSetRoomConstraints in 'Presentation\Dialogs\uSheduleSetRoomConstraints.pas' {frmSheduleSetRoomConstraints},
  uSheduleAddRooms in 'Presentation\Dialogs\uSheduleAddRooms.pas' {frmSheduleAddRooms},
  uSheduleConflictLog in 'Presentation\Dialogs\uSheduleConflictLog.pas' {frmConflictEventLog},
  uLessonShedule in 'Presentation\Frames\uLessonShedule.pas' {fmLessonShedule: TFrame},
  uSheduleSemester in 'Presentation\Frames\uSheduleSemester.pas' {fmSheduleSemester: TFrame},
  uAbitOtchetsController in 'Domain\Controllers\uAbitOtchetsController.pas',
  uNagruzkaCalcUnitsContingent in 'Presentation\Dialogs\uNagruzkaCalcUnitsContingent.pas' {frmNagruzkaCalcUnitsContingent},
  uAbitNaborController in 'Domain\Controllers\uAbitNaborController.pas',
  uMethodWorkAddPlanDep in 'Presentation\Dialogs\uMethodWorkAddPlanDep.pas' {frmMethodWorkAddPlanDep},
  uMethodWorkPlanCurrentMW in 'Presentation\Dialogs\uMethodWorkPlanCurrentMW.pas' {frmMethodWorkPlanCurrentMW},
  uSelOrder in 'Presentation\Dialogs\uSelOrder.pas' {frmOrderPick},
  uExaminationShedule in 'Presentation\Frames\uExaminationShedule.pas' {fmExaminationShedule: TFrame},
  uDiplomOtdKadr in 'Presentation\Frames\uDiplomOtdKadr.pas' {fmDiplomOtdKadr: TFrame},
  uDiplOtdKardController in 'Domain\Controllers\uDiplOtdKardController.pas',
  uEnterprisePick in 'Presentation\Dialogs\uEnterprisePick.pas' {frmEnterprisePick},
  uDMOtdKadrDiplom in 'Data\uDMOtdKadrDiplom.pas' {dmOtdKadrDiplom: TDataModule},
  uMethodWorkAddGos in 'Presentation\Dialogs\uMethodWorkAddGos.pas' {frmMethodWorkAddGos},
  uMethodWorkAddContentItemGos in 'Presentation\Dialogs\uMethodWorkAddContentItemGos.pas' {frmMethodWorkAddContentItemGos},
  uMethodWorkAddContentDiscOnGos in 'Presentation\Dialogs\uMethodWorkAddContentDiscOnGos.pas' {frmMethodWorkAddContentDiscOnGos},
  DataProcessingSplashDialog in 'Presentation\Dialogs\DataProcessingSplashDialog.pas' {DataProcessingSplashDlg},
  uAddDocument in 'Presentation\Dialogs\uAddDocument.pas' {frmAddDocument},
  uAddSpecAbit in 'Presentation\Dialogs\uAddSpecAbit.pas' {frmAdditionalSpec},
  MW_PrepodPlanRep in 'Domain\Reports\MW_PrepodPlanRep.pas',
  Parser in 'Utils\Parser.pas',
  Conditions in 'Utils\Conditions.pas',
  CorrectDatatypeChecks in 'Utils\CorrectDatatypeChecks.pas',
  uLocalLogController in 'Domain\Controllers\uLocalLogController.pas',
  uNagruzkaAddCalcUnit in 'Presentation\Dialogs\uNagruzkaAddCalcUnit.pas' {frmNagruzkaAddCalcUnit},
  uLessonSheduleOnForm in 'Presentation\Forms\uLessonSheduleOnForm.pas' {LessonSheduleForm},
  uExaminationSheduleOnForm in 'Presentation\Forms\uExaminationSheduleOnForm.pas' {ExaminationSheduleOnForm},
  uAbitReturn in 'Presentation\Dialogs\uAbitReturn.pas' {frmAbitReturn},
  D_StudUspevRep in 'Domain\Reports\D_StudUspevRep.pas',
  D_GroupListRep in 'Domain\Reports\D_GroupListRep.pas',
  Barcode in 'Domain\Reports\Barcode.pas',
  ReportsBpl in 'Domain\Reports\ReportsBpl.pas',
  ReportUI in 'Domain\Reports\ReportUI.pas',
  RptColEd in 'Domain\Reports\RptColEd.pas',
  ReportsBase in 'Domain\Reports\ReportsBase.pas',
  uWaitingForm in 'Presentation\Forms\uWaitingForm.pas' {frmWaiting},
  RegularEx in 'Domain\Common\RegularEx.pas',
  uNaprRegisterDialog in 'Presentation\Dialogs\uNaprRegisterDialog.pas' {frmNaprRegister},
  uNotError in 'Presentation\Forms\uNotError.pas' {frmNotError},
  NewClientVersionDetectedFrm in 'Presentation\Forms\NewClientVersionDetectedFrm.pas' {NewClientVersionDetectedForm},
  VersionController in 'Domain\Controllers\VersionController.pas',
  DetailsFrm in 'Presentation\Forms\DetailsFrm.pas' {DetailsForm},
  uNagruzkaSemester in 'Presentation\Frames\uNagruzkaSemester.pas' {fmNagruzkaSemester: TFrame},
  uNagruzkaSelectTeacher in 'Presentation\Dialogs\uNagruzkaSelectTeacher.pas' {frmNagruzkaSelectTeacher},
  uNagruzkaSetNormException in 'Presentation\Dialogs\uNagruzkaSetNormException.pas' {frmNagruzkaSetNormException},
  uSheduleManageBookmarks in 'Presentation\Dialogs\uSheduleManageBookmarks.pas' {frmSheduleManageBookmarks},
  D_FacItogiRep in 'Domain\Reports\D_FacItogiRep.pas',
  uXMLErrorReader in 'Domain\Controllers\uXMLErrorReader.pas' {/uMethodWorkAddWorkuMethodWorkAddWork in 'Presentation\Dialogs\uMethodWorkAddWork.pas' {frmMethodWorkAddWork},
  uMethodWorkAddWorkInNorm in 'Presentation\Dialogs\uMethodWorkAddWorkInNorm.pas' {frmMethodWorkAddWorkInNorm},
  uMethodWorkAddWork in 'Presentation\Dialogs\uMethodWorkAddWork.pas' {frmMethodWorkAddWork},
  ApplicationController in 'Domain\Controllers\ApplicationController.pas',
  uMailer in 'Domain\Controllers\uMailer.pas',
  uMethodWorkTreeView in 'Presentation\Frames\uMethodWorkTreeView.pas' {fmMethodWorkTreeView: TFrame},
  uAppTweaks in 'Presentation\Dialogs\uAppTweaks.pas' {frmAppTweaks},
  CommonNagruzkaController in 'Domain\Controllers\CommonNagruzkaController.pas',
  NagruzkaClasses in 'Domain\Controllers\NagruzkaClasses.pas',
  PreparationNagruzkaController in 'Domain\Controllers\PreparationNagruzkaController.pas',
  SheduleMainController in 'Domain\Controllers\SheduleMainController.pas',
  uNagruzkaSetVidZanyatTaskCount in 'Presentation\Dialogs\uNagruzkaSetVidZanyatTaskCount.pas' {frmNagruzkaSetVidZanyatTaskCount},
  uNagruzkaShowCalculationScheme in 'Presentation\Dialogs\uNagruzkaShowCalculationScheme.pas' {frmNagruzkaShowCalculationScheme},
  uSheduleAddAudEventWithPrefetch in 'Presentation\Dialogs\uSheduleAddAudEventWithPrefetch.pas' {frmSheduleAddAudEventWithPrefetch},
  uSheduleAddExaminationWithPrefetch in 'Presentation\Dialogs\uSheduleAddExaminationWithPrefetch.pas' {frmSheduleAddExaminationWithPrefetch},
  uDMDiplom in 'Data\uDMDiplom.pas' {dmDiplom: TDataModule},
  uDiplomController in 'Domain\Controllers\uDiplomController.pas',
  D_DiplomVipRep in 'Domain\Reports\D_DiplomVipRep.pas',
  uAbitConfirm in 'Presentation\Dialogs\uAbitConfirm.pas' {frmAbitConfirm},
  uWaitingController in 'Domain\Controllers\uWaitingController.pas',
  uNagruzkaPotokManager in 'Presentation\Dialogs\uNagruzkaPotokManager.pas' {frmNagruzkaPotokManager},
  NagruzkaDirectory in 'Domain\Controllers\NagruzkaDirectory.pas',
  SheduleGrids in 'Domain\Controllers\SheduleGrids.pas',
  CommonIntf in 'Domain\Interfaces\CommonIntf.pas',
  XIntf in 'Domain\Interfaces\XIntf.pas',
  CommonIntfImpl in 'Domain\Interfaces\DefImpl\CommonIntfImpl.pas',
  uDMAbiturientNabor in 'Data\uDMAbiturientNabor.pas' {DMAbiturientNabor: TDataModule},
  uDMAdmin in 'Data\uDMAdmin.pas' {DMAdmin: TDataModule},
  uMethodWorkAddItemGos in 'Presentation\Dialogs\uMethodWorkAddItemGos.pas' {frmBaseDialog3},
  ExceptionBase in 'Utils\ExceptionBase.pas',
  MW_PrepodPlanEditionRep in 'Domain\Reports\MW_PrepodPlanEditionRep.pas',
  MW_PrepodFactRep in 'Domain\Reports\MW_PrepodFactRep.pas',
  AbitPredvSpisokZachisl in 'Domain\Reports\AbitPredvSpisokZachisl.pas',
  AbitDinamica in 'Domain\Reports\AbitDinamica.pas',
  D_GrupUspevForStipend in 'Domain\Reports\D_GrupUspevForStipend.pas',
  ReportDataSet in 'Domain\Reports\ReportDataSet.pas',
  uDMUchPlan in 'Data\uDMUchPlan.pas' {dmUchPlan: TDataModule},
  uExtendSession in 'Presentation\Dialogs\uExtendSession.pas' {frmExtendSession},
  D_VedomostBRS in 'Domain\Reports\D_VedomostBRS.pas',
  D_AcademReport in 'Domain\Reports\D_AcademReport.pas',
  uAcademFrame in 'Presentation\Frames\uAcademFrame.pas' {fmAcadem: TFrame},
  uMethodWorkHyperLink in 'Presentation\Dialogs\uMethodWorkHyperLink.pas' {frmMethodWorkHyperLink},
  uAddress in 'Presentation\Dialogs\uAddress.pas' {frmAddress},
  uPerson in 'Presentation\Frames\uPerson.pas' {fmPerson: TFrame},
  D_BRSAllModules in 'Domain\Reports\D_BRSAllModules.pas',
  uMethodWorkDateFilter in 'Presentation\Dialogs\uMethodWorkDateFilter.pas' {frmMethodWorkDateFilter},
  uStudDlg in 'Presentation\Dialogs\uStudDlg.pas' {ftmStudent},
  uMethodWorkAutoPlan in 'Presentation\Dialogs\uMethodWorkAutoPlan.pas' {frmMethodWorkAutoPlan},
  uAverageBalls in 'Presentation\Frames\uAverageBalls.pas' {fmAverageBalls: TFrame},
  uHOST in 'Data\uHOST.pas' {dmHOST: TDataModule},
  HOST_NaznRoom in 'Presentation\Dialogs\HOST_NaznRoom.pas' {NaznRoom},
  HOST_UtvZayav in 'Presentation\Dialogs\HOST_UtvZayav.pas' {UtvZayav},
  HOST_ReportController in 'Domain\Controllers\HOST_ReportController.pas',
  HOST_ZayavlenieController in 'Domain\Controllers\HOST_ZayavlenieController.pas',
  HOST_Order in 'Domain\Reports\HOST_Order.pas',
  HOST_Zaselenie in 'Presentation\Frames\HOST_Zaselenie.pas' {fmHOST_Zaselenie: TFrame},
  HOST_UkazPrikaz in 'Presentation\Dialogs\HOST_UkazPrikaz.pas' {PrikazOZas},
  HOST_ZamenaRoom in 'Presentation\Dialogs\HOST_ZamenaRoom.pas' {ZamenaRoom},
  HOST_AddZayav in 'Presentation\Dialogs\HOST_AddZayav.pas' {AddZayav},
  HOST_Projivaysh in 'Presentation\Frames\HOST_Projivaysh.pas' {fmHOST_Projivaysh: TFrame},
  HOST_ProjivayushieController in 'Domain\Controllers\HOST_ProjivayushieController.pas' {/,},
  HOST_AddRoom in 'Presentation\Dialogs\HOST_AddRoom.pas' {AddRoom},
  HOST_PrikazNaZas in 'Domain\Reports\HOST_PrikazNaZas.pas',
  HOST_Viselit in 'Presentation\Dialogs\HOST_Viselit.pas' {Viselit},
  HOST_ZayavNaZas in 'Domain\Reports\HOST_ZayavNaZas.pas',
  HOST_Persona in 'Presentation\Frames\HOST_Persona.pas' {fmHOSTPerson: TFrame},
  MethodWorkComboboxFilter in 'Domain\Classes\MethodWorkComboboxFilter.pas',
  HOST_Kartochka in 'Domain\Reports\HOST_Kartochka.pas',
  HOST_ZasPersona in 'Presentation\Frames\HOST_ZasPersona.pas' {PersonForZas: TFrame},
  HOST_AddNarush in 'Presentation\Dialogs\HOST_AddNarush.pas' {AddNarush},
  HOST_ProdlProzh in 'Presentation\Dialogs\HOST_ProdlProzh.pas' {frmProdlProzh},
  D_BRSExamVedomost in 'Domain\Reports\D_BRSExamVedomost.pas',
  uBRSBallCounter in 'Domain\Classes\uBRSBallCounter.pas',
  D_BRSRankReport in 'Domain\Reports\D_BRSRankReport.pas',
  D_BRSRankAverageReport in 'Domain\Reports\D_BRSRankAverageReport.pas',
  N_YearsComparison in 'Domain\Reports\N_YearsComparison.pas',
  N_DepsSemester in 'Domain\Reports\N_DepsSemester.pas',
  N_FullDepsSemester in 'Domain\Reports\N_FullDepsSemester.pas',
  N_PlanDepsCompare in 'Domain\Reports\N_PlanDepsCompare.pas',
  N_PlanDepsSemesters in 'Domain\Reports\N_PlanDepsSemesters.pas',
  N_FactDeps in 'Domain\Reports\N_FactDeps.pas',
  N_YearsCommonComparison in 'Domain\Reports\N_YearsCommonComparison.pas',
  N_YearsStaffComparison in 'Domain\Reports\N_YearsStaffComparison.pas',
  N_YearsLectComparison in 'Domain\Reports\N_YearsLectComparison.pas',
  N_PFODeps in 'Domain\Reports\N_PFODeps.pas',
  uNagruzkaAddPotokSemester in 'Presentation\Dialogs\uNagruzkaAddPotokSemester.pas' {frmAddPotokSemester},
  uNagruzkaEditPotokSemesterShemes in 'Presentation\Dialogs\uNagruzkaEditPotokSemesterShemes.pas' {frmNagruzkaEditPotokSemShemes},
  uPostupdlg in 'Presentation\dialogs\uPostupdlg.pas' {frmPostupDlg},
  uFindAbit in 'Presentation\Dialogs\uFindAbit.pas' {frmFindAbit},
  uNagruzkaCalcUnits in 'Presentation\Dialogs\uNagruzkaCalcUnits.pas' {frmNagruzkaCalcUnits},
  AbitVstupExams in 'Domain\Reports\AbitVstupExams.pas',
  AbitVstupExamStatistic in 'Domain\Reports\AbitVstupExamStatistic.pas' {/,},
  uFgosController in 'Domain\Controllers\uFgosController.pas',
  uFgos in 'Presentation\Frames\uFgos.pas' {fmFgos: TFrame},
  uDMFgos in 'Data\uDMFgos.pas' {dmFgos: TDataModule},
  uChangeKatZach in 'Presentation\Dialogs\uChangeKatZach.pas' {frmChangeKatZach},
  N_FactPrepodsExecute in 'Domain\Reports\N_FactPrepodsExecute.pas',
  uNagruzkaAdditionFactNagr in 'Presentation\Dialogs\uNagruzkaAdditionFactNagr.pas' {frmAdditionFactNagr},
  ConstantRepository in 'Domain\Classes\ConstantRepository.pas',
  Fgos_Application12Report in 'Domain\Reports\Fgos_Application12Report.pas',
  Fgos_Application1Report in 'Domain\Reports\Fgos_Application1Report.pas',
  Fgos_Application2Report in 'Domain\Reports\Fgos_Application2Report.pas',
  Fgos_Application3Report in 'Domain\Reports\Fgos_Application3Report.pas',
  Fgos_Application4Report in 'Domain\Reports\Fgos_Application4Report.pas',
  Fgos_Application5Report in 'Domain\Reports\Fgos_Application5Report.pas',
  uUchPlanAddDisc in 'Presentation\dialogs\uUchPlanAddDisc.pas' {frmUchPlanAddDisc},
  uAddDiscRelation in 'Presentation\Dialogs\uAddDiscRelation.pas' {frmAddDiscRelation},
  uAddDiscStrCompetence in 'Presentation\Dialogs\uAddDiscStrCompetence.pas' {frmAddDiscStrCompetence},
  uFgosAddCompetence in 'Presentation\Dialogs\uFgosAddCompetence.pas' {frmFgosAddCompetence},
  uFgosAddNew in 'Presentation\Dialogs\uFgosAddNew.pas' {frmFgosAddNew},
  uFgosAddStructCompetence in 'Presentation\Dialogs\uFgosAddStructCompetence.pas' {frmFgosAddStructCompetence},
  uFgosEditCompetence in 'Presentation\Dialogs\uFgosEditCompetence.pas' {frmFgosEditCompetence},
  uFgosException in 'Presentation\Dialogs\uFgosException.pas' {frmFgosException},
  uFgosExceptionTable in 'Presentation\Dialogs\uFgosExceptionTable.pas' {frmFgosExceptionTable},
  uFgosSformyrCompetence in 'Presentation\Dialogs\uFgosSformyrCompetence.pas' {frmFgosSformyrCompetence},
  uAddDiscCompetence in 'Presentation\Dialogs\uAddDiscCompetence.pas' {frmAddDiscCompetence},
  uNagruzkaDividePotok in 'Presentation\Dialogs\uNagruzkaDividePotok.pas' {frmDividePotok},
  uDiplomStudSelect in 'Presentation\Dialogs\uDiplomStudSelect.pas' {Form1},
  uCertificateDialog in 'Presentation\Dialogs\uCertificateDialog.pas' {frmEGECertificateCheck},
  EgeCheckService in 'ExternalServicesConsuming\EgeCheckService.pas',
  uXMLEGEReader in 'Domain\Controllers\uXMLEGEReader.pas',
  A_EGECertReport in 'Domain\Reports\A_EGECertReport.pas',
  DateFormat in 'Domain\Classes\DateFormat.pas',
  DiscClasses in 'Domain\Classes\DiscClasses.pas',
  MW_DepFactRep in 'Domain\Reports\MW_DepFactRep.pas',
  MW_DepPlanEditionRep in 'Domain\Reports\MW_DepPlanEditionRep.pas',
  MW_DepPlanRep in 'Domain\Reports\MW_DepPlanRep.pas',
  D_AVGBalls in 'Domain\Reports\D_AVGBalls.pas',
  D_VedomostBRSLast in 'Domain\Reports\D_VedomostBRSLast.pas',
  ProcessUtils in 'Utils\ProcessUtils.pas',
  uPhotoBooth in 'Utils\uPhotoBooth.pas',
  ImageFullSizeShowFrm in 'Presentation\Forms\ImageFullSizeShowFrm.pas' {ImageFullSizeShowForm},
  DBDekTreeView_TEST in 'Domain\DBTV\DBDekTreeView_TEST.pas',
  DBTV in 'Domain\DBTV\DBTV.pas',
  DBTVAbitobj in 'Domain\DBTV\DBTVAbitobj.pas',
  DBTVAbitYearObj in 'Domain\DBTV\DBTVAbitYearObj.pas',
  DBTVAdminObj in 'Domain\DBTV\DBTVAdminObj.pas',
  DBTVBusinessobj in 'Domain\DBTV\DBTVBusinessobj.pas',
  DBTVDekanat in 'Domain\DBTV\DBTVDekanat.pas',
  DBTVdepobj in 'Domain\DBTV\DBTVdepobj.pas',
  DBTVDepScheduleObj in 'Domain\DBTV\DBTVDepScheduleObj.pas',
  DBTVDictObj in 'Domain\DBTV\DBTVDictObj.pas',
  DBTVFacDepobj in 'Domain\DBTV\DBTVFacDepobj.pas',
  DBTVFacMethodWorkObj in 'Domain\DBTV\DBTVFacMethodWorkObj.pas',
  DBTVFacobj in 'Domain\DBTV\DBTVFacobj.pas',
  DBTVFacRecObj in 'Domain\DBTV\DBTVFacRecObj.pas',
  DBTVFacScheduleobj in 'Domain\DBTV\DBTVFacScheduleobj.pas',
  DBTVFacZachObj in 'Domain\DBTV\DBTVFacZachObj.pas',
  DBTVgroupobj in 'Domain\DBTV\DBTVgroupobj.pas',
  DBTVHabitatsFloorObj in 'Domain\DBTV\DBTVHabitatsFloorObj.pas',
  DBTVHabitatsHostObj in 'Domain\DBTV\DBTVHabitatsHostObj.pas',
  DBTVHabitatsObj in 'Domain\DBTV\DBTVHabitatsObj.pas',
  DBTVHabitatsPersonObj in 'Domain\DBTV\DBTVHabitatsPersonObj.pas',
  DBTVHabitatsRoomObj in 'Domain\DBTV\DBTVHabitatsRoomObj.pas',
  DBTVHostelRequestObj in 'Domain\DBTV\DBTVHostelRequestObj.pas',
  DBTVHostelRootobj in 'Domain\DBTV\DBTVHostelRootobj.pas',
  DBTVHostelRootPersonobj in 'Domain\DBTV\DBTVHostelRootPersonobj.pas',
  DBTVInviteHostObj in 'Domain\DBTV\DBTVInviteHostObj.pas',
  DBTVInviteObj in 'Domain\DBTV\DBTVInviteObj.pas',
  DBTVMethodWorkdepobj in 'Domain\DBTV\DBTVMethodWorkdepobj.pas',
  DBTVMethodWorkInNormobj in 'Domain\DBTV\DBTVMethodWorkInNormobj.pas',
  DBTVMethodWorkobj in 'Domain\DBTV\DBTVMethodWorkobj.pas',
  DBTVMethodWorkTeacherobj in 'Domain\DBTV\DBTVMethodWorkTeacherobj.pas',
  DBTVObj in 'Domain\DBTV\DBTVObj.pas',
  DBTVOKobj in 'Domain\DBTV\DBTVOKobj.pas',
  DBTVPrikObj in 'Domain\DBTV\DBTVPrikObj.pas',
  DBTVRecruitobj in 'Domain\DBTV\DBTVRecruitobj.pas',
  DBTVRIOObj in 'Domain\DBTV\DBTVRIOObj.pas',
  DBTVRIOPlanObj in 'Domain\DBTV\DBTVRIOPlanObj.pas',
  DBTVRIOPrintOrderObj in 'Domain\DBTV\DBTVRIOPrintOrderObj.pas',
  DBTVRIOYearObj in 'Domain\DBTV\DBTVRIOYearObj.pas',
  DBTVRootobj in 'Domain\DBTV\DBTVRootobj.pas',
  DBTVRootScheduleobj in 'Domain\DBTV\DBTVRootScheduleobj.pas',
  DBTVScheduleObj in 'Domain\DBTV\DBTVScheduleObj.pas',
  DBTVSemesterNagrObj in 'Domain\DBTV\DBTVSemesterNagrObj.pas',
  DBTVSemesterScheduleobj in 'Domain\DBTV\DBTVSemesterScheduleobj.pas',
  DBTVSpecObj in 'Domain\DBTV\DBTVSpecObj.pas',
  DBTVSpecRecObj in 'Domain\DBTV\DBTVSpecRecObj.pas',
  DBTVSpecZachObj in 'Domain\DBTV\DBTVSpecZachObj.pas',
  DBTVStudAbitobj in 'Domain\DBTV\DBTVStudAbitobj.pas',
  DBTVStudobj in 'Domain\DBTV\DBTVStudobj.pas',
  DBTVTeacherObj in 'Domain\DBTV\DBTVTeacherObj.pas',
  DBTVWorkTypeObj in 'Domain\DBTV\DBTVWorkTypeObj.pas',
  DBTVZachobj in 'Domain\DBTV\DBTVZachobj.pas',
  ShEvent in 'Domain\DBTV\ShEvent.PAS',
  CommandController in 'Domain\Controllers\CommandController.pas',
  BRSVedom2014 in 'Domain\Reports\BRSVedom2014.pas',
  Vedomost2014 in 'Domain\Classes\Vedomost2014.pas',
  VedomostItem2014 in 'Domain\Classes\VedomostItem2014.pas',
  Assemly_Report2014 in 'Domain\Classes\Assemly_Report2014.pas';

//MW_DepPlanRep in 'Domain\Reports\MW_DepPlanRep.pas',
  //MW_DepPlanEditionRep in 'Domain\Reports\MW_DepPlanEditionRep.pas',
  //MW_DepFactRep in 'Domain\Reports\MW_DepFactRep.pas';

{$R *.res}
{$R xml_res.res}

begin
  Application.Initialize;
  Application.Title := '�� "����"';
  Application.HelpFile := '';
  Application.OnException := ExceptionHandler.ExceptionHandler;

  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmStudentSelectionProcs, dmStudentSelectionProcs);
  Application.CreateForm(TdmCauses, dmCauses);
  Application.CreateForm(TdmAdress, dmAdress);
  Application.CreateForm(TdmStudentActions, dmStudentActions);
  Application.CreateForm(TdmStudentData, dmStudentData);
  Application.CreateForm(TdmPrikaz, dmPrikaz);
  Application.CreateForm(TdmFacultetStatistic, dmFacultetStatistic);
  Application.CreateForm(TdmUgtuStructure, dmUgtuStructure);
  Application.CreateForm(TdmGroupActions, dmGroupActions);
  Application.CreateForm(TdmRecordBook, dmRecordBook);
  Application.CreateForm(TdmAbiturientAction, dmAbiturientAction);
  Application.CreateForm(TdmAbiturientOtchety, dmAbiturientOtchety);
  Application.CreateForm(TdmUspevaemost, dmUspevaemost);
  Application.CreateForm(TQMDataModule, QMDataModule);
  Application.CreateForm(TDMAbiturientZachisl, DMAbiturientZachisl);
  Application.CreateForm(TDMAbiturientRasp, DMAbiturientRasp);
  Application.CreateForm(TdmMethodWork, dmMethodWork);
  Application.CreateForm(TLessonSheduleForm, LessonSheduleForm);
  Application.CreateForm(TExaminationSheduleOnForm, ExaminationSheduleOnForm);
  Application.CreateForm(TNewClientVersionDetectedForm, NewClientVersionDetectedForm);
  Application.CreateForm(TdmDiplom, dmDiplom);
  Application.CreateForm(TDMAbiturientNabor, DMAbiturientNabor);
  Application.CreateForm(TDMAdmin, DMAdmin);
  Application.CreateForm(TdmUchPlan, dmUchPlan);
  Application.CreateForm(TfrmAddress, frmAddress);
  Application.CreateForm(TfmPerson, fmPerson);
  Application.CreateForm(TftmStudent, ftmStudent);
  Application.CreateForm(TdmHOST, dmHOST);
  Application.CreateForm(TImageFullSizeShowForm, ImageFullSizeShowForm);
  Application.Run;
end.
