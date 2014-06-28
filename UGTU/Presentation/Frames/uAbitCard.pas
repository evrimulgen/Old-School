unit uAbitCard;
  {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uStudent, DBGridEh, ExtDlgs, ImgList, StdCtrls, Buttons, ADODB,
  ExtCtrls, DBCtrlsEh, DBCtrls, Mask, DBLookupEh, Grids, ComCtrls, ToolWin,
  GridsEh, ActnList, Menus, uDMAbiturientAction;

type
  TfmAbitCard = class(TfmStudent)
    TabSheet8: TTabSheet;
    GroupBox2: TGroupBox;
    dbgeExams: TDBGridEh;
    eBenefits: TDBEditEh;
    Label61: TLabel;
    GroupBox5: TGroupBox;
    dbgeAdditionalSpec: TDBGridEh;
    procedure dbgeListsCellClick(Column: TColumnEh);
    procedure dbcbeSexChange(Sender: TObject);
    procedure eFamChange(Sender: TObject);
    procedure BbSaveclick(Sender: TObject);
    procedure dbgeFamExit(Sender: TObject);
    procedure dbgeLangColExit(Sender: TObject);
    procedure dbgeFamColExit(Sender: TObject);
    procedure dbgeDocumentsCellClick(Column: TColumnEh);
    procedure actPropToFactExecute(Sender: TObject);
  private
    { Private declarations }
    protected
    procedure DoRefreshFrame;override;
    function DoApply:boolean; override;
  public
      Floaded:boolean;
      constructor CreateFrame(AOwner:TComponent; AObject:TObject; AConn:TADOConnection);override;
    { Public declarations }
  end;

var
  fmAbitCard: TfmAbitCard;

implementation

uses uDM,db, Umain, DBTVObj, DBTVGroupObj, ComObj,
  DBTVStudAbitObj,DBTVStudObj,DBTVspecRecObj, DBTVRecruitobj, uDipl,jpeg, VarfileUtils,
  uBaseFrame, uDMStudentSelectionProcs, uDMStudentData, uDMAdress, uDMCauses,
  uDMPrikaz;



{$R *.dfm}

{ TfmAbitCard }



procedure TfmAbitCard.DoRefreshFrame;
//var  stream: TMemoryStream;
  //i:integer;
  //ndGroup:TDBNodeGroupObject;
  var year:integer;
begin
tsUspevStat.Visible:=false;

floaded:=false;
   PageControl1.ActivePageIndex := 0;

   with dmStudentData do begin

  adodsDocType.Active:=false;
   adodsZaved_Stud.Active:=false;
  adodsMedal.Active:=false;
  adodsKatZach.Active:=false;
  adodsMilSt.Active:=false;

adodsDocType.Active:=true;
adodsZaved_Stud.Active:=true;
 adodsZaved_Stud.Sort:='[cName_zaved]';
  adodsMedal.Active:=true;
  adodsKatZach.Active:=true;
  adodsMilSt.Active:=true;

  adodsNat.Active:=false;
  adodsCitizen.Active:=false;
  adodsCount.Active:=false;
  adodsJob.Active:=false;
   adodsPrep.Active:=false;

     adodsSempol.Active:=false;
     dmPrikaz.adodsPrikaz.Active:=false;

  adodsNat.Active:=true;
     adodsCitizen.Active:=true;
     adodsCount.Active:=true;
     adodsJob.Active:=true;
     adodsPrep.Active:=true;

     adodsSempol.Active:=true;
     dmPrikaz.adodsPrikaz.Active:=true;

     Modified:=false;
     bbSave.Enabled:=false;
     bbUndo.Enabled:=false;

  //PageControl2.TabIndex:=0;

  adodsLang.Active:=false;
  adodsStepVlad.Active:=false;
  adodsEnterprise.Active:=false;
  adodsRelative.Active:=false;

  adodsLang.Active:=true;
  adodsStepVlad.Active:=true;
  adodsEnterprise.Active:=true;
  adodsRelative.Active:=true;
   end;

   with dmAdress do begin
   adodsStrana.Active:=false;
 adodsSignStrana.Active:=false;
 adodsStrana.Active:=true;
 adodsSignStrana.Active:=true;
   end;
   with dmCauses do begin
    adodsExile.Active:=false;
     adodsExile.Active:=true;
   end;

  obj:=FrameObject as TDBNodeAbitStudObject;
  ik:=obj.id;

  if not Assigned(obj) then exit;

  eName.Text:=obj.FirstName;
  eMid.Text:=obj.MiddleName;
  eFam.Text:=obj.LastName;
  eYearFinished.Text:=inttostr(obj.YearFinished);
  eBirthPlace.Text:=obj.BirthPlace;
  eAddInfo.Text:=obj.AddInform;
  eNum.Text:=obj.RecordbookNum;
  eEmail.Text:=obj.Email;
  eBenefits.Text:=obj.benefits;

  ePhone.Text:=obj.Phone;
  eCellphone.Text:=obj.CellPhone;

  dbdteBirthDate.Value:=obj.BirthDate;

  if obj.Sex then  dbcbeSex.Text:='�������' else
  dbcbeSex.Text:='�������';

  dbcbeSchool.Text:=obj.Finished;
  dbcbeCat.Text:=obj.Category;
  dbcbeCitizenship.Text:=obj.Citizenship;
  dbcbeSocWork.Text:=obj.SocJob;
  dbcbePreparation.Text:=obj.Preparation;
  dbcbeSpecCount.Text:=obj.SpecCount;
  dbcbeOrder.KeyValue:=obj.OrderEnterID;
  dbcbeFamState.Text:=obj.FamState;
  dbcbeMedal.Text:=obj.Medal;
  dbcbeMilitaryState.keyValue:=obj.MilitaryStateKey;
  dbcbeEnterprise.Value:=obj.EnterpriseID;
  eDuty.text:=obj.Duty;
  if obj.xpYears<>0 then
  eXpYear.Value:=obj.xpYears;
   if obj.xpMonths<>0 then
  eXpMonth.Value:=obj.xpMonths;

if obj.Photo<>nil then begin
    obj.photo.Position:=0;
    //iPhoto.Picture.Graphic:=TBitmap.Create;
    iPhoto.Picture.Graphic:=TJPEGImage.Create;
    try
      iPhoto.Picture.Graphic.LoadFromStream(obj.photo);
    except
    end;
  end;

  cbJob.Checked:=obj.Job;
  cbChildren.Checked:=obj.Children;
  cbInvalid.Checked:=obj.Invalid;
  cbAppNeed.Checked:=obj.AppartmentNeed;

  with dmStudentSelectionProcs.aspSelLanguage do
  begin
    Active:=false;
   dmStudentSelectionProcs.aspSelLanguagenCode.DefaultExpression:=inttostr(obj.ID);
   Parameters.Clear;
   Parameters.AddParameter;
   Parameters[0].Value:=obj.ID;
   ExecProc;
   Active:=true;
  end;

  with dmStudentSelectionProcs.aspSelDocuments do
  begin
  Active:=false;
   Parameters.Clear;
   Parameters.AddParameter;
   Parameters[0].Value:=obj.ID;
   ExecProc;
   Active:=true;

  end;

    with dmStudentSelectionProcs.aspGetPersonAddress do
  begin
    Active:=false;
    Parameters.Clear;
    Parameters.AddParameter;
    Parameters[0].Value:=obj.ID;
    ExecProc;
    Active:=true;
  end;

  with dmStudentSelectionProcs.aspSelFamily do
  begin
   Active:=false;
    Parameters.Clear;
    Parameters.AddParameter;
    Parameters[0].Value:=obj.ID;
    ExecProc;
    Active:=true;
  end;


  dm.adodsPostupView.Active:=false;
  dm.adodsPostupView.CommandType:=cmdText;
  year:= TDBNodeRecruitObject(TDBNodeAbitStudObject(FrameObject).Node.Parent.Parent.Parent.Data).ik;
  dm.adodsPostupView.CommandText:='select * from Abit_Postup_View where (ncode='''+inttostr(obj.ik)+''') and (NNyear='''+
      inttostr(year)+''') order by dd_pod_zayav desc, RegNomer desc,NN_abit desc';
  dm.adodsPostupView.Active:=true;

dm.adodsPostupView.First;

dm.adodsAbitExamView.Active:=false;
dm.adodsAbitExamView.CommandType:=cmdText;
dm.adodsAbitExamView.CommandText:='select * from Abit_Exam_View where (ncode='''+inttostr(obj.ik)+''')and(NN_abit='''+inttostr((obj as TDBNodeAbitStudObject).NNAbit)+''')';
dm.adodsAbitExamView.Active:=true;

with dmAbiturientAction.aspGetOtherspec do
begin
 Active:=false;
 Parameters[1].Value:=dm.adodsPostupView.FieldValues['NN_abit'];
 open;
end;

  Modified:=false;
  bbSave.Enabled:=false;
 bbUndo.Enabled:=false;
 Floaded:=true;

 if (obj as TDBNodeAbitStudObject).RecruitState=3 then
 frmMain.actAbitReturn.Enabled:=true else
 frmMain.actAbitReturn.Enabled:=false;

 if ((obj as TDBNodeAbitStudObject).RecruitState=5)or((obj as TDBNodeAbitStudObject).RecruitState=6) then
 begin
 frmMain.actAbitMove.Enabled:=false;
 frmMain.actDocsRetrieve.Enabled:=false;
 end
 else
 begin
 frmMain.actAbitMove.Enabled:=true;
 frmMain.actDocsRetrieve.Enabled:=true;
 end;

 if (TDBNodeAbitStudObject(FrameObject).OnlyReading) then
begin
TabSheet1.Caption:='������ ������ (������ ��������)';
Toolbutton1.Enabled:=false;
TabSheet3.Enabled:=false;
TabSheet5.Enabled:=false;
TabSheet4.Enabled:=false;
TabSheet6.Enabled:=false;
TabSheet7.Enabled:=false;
TabSheet8.Enabled:=false;
frmMain.actAbitMove.Enabled:=false;
frmMain.actDocsRetrieve.Enabled:=false;
end else
begin
Toolbutton1.Enabled:=true;
TabSheet1.Caption:='������ ������';
TabSheet3.Enabled:=true;
TabSheet5.Enabled:=true;
TabSheet4.Enabled:=true;
TabSheet6.Enabled:=true;
TabSheet7.Enabled:=true;
TabSheet8.Enabled:=true;
end;
end;


function TfmAbitCard.DoApply: boolean;
var
  stream: TMemoryStream;
  //i:integer;
  ndspec:TDBNodeSpecRecObject;
begin
if obj.ID<>ik then begin
modified:=false;
RefreshFrame;
exit;
end;

if (eName.Text='')or(eFam.Text='')
or(dbdteBirthDate.Text='  .  .    ')or(dbcbeCitizenship.Text='')or(dbcbeMedal.Text='') then
begin
  showmessage('���� ��� ��������� ������������ ��� ����� ����� �� ���������!');
  // RefreshFrame;
  Result := true;
  exit;
end;
if (TDBNodeAbitStudObject(FrameObject).OnlyReading) then
begin
  showmessage('�� �� ������ ������������� ������ ����� �����������! ��������� ����� ��������');
  RefreshFrame;
  Result := true;
  exit;
end;

  Result := true;
  try
  with dmStudentSelectionProcs.aspSelLanguage do
  begin
    Edit;
    UpdateRecord;
    Post;
    Open;
  end;
  except
  end;
  try
  with
    dmStudentSelectionProcs.aspSelFamily do
    begin
    Edit;
    UpdateRecord;
    Post;
    Open;
    end;
  except
  end;
  try
  with dmStudentSelectionProcs.aspSelDocuments do
    begin
    Edit;
    UpdateRecord;
    Post;
    Open;
    end;
  except
  end;
  with dmAbiturientAction.aspAppendAbit.Parameters do
  begin
    clear;
    CreateParameter('@RETURN_VALUE',ftInteger,pdReturnValue,0,1);
    CreateParameter('@flag',ftInteger,pdInput,0,0);
    CreateParameter('@clastn',ftString,pdInput,40,eFam.Text);
    CreateParameter('@firstn',ftString,pdInput,40,eName.Text);

    if not (eMid.Text='') then
    CreateParameter('@otch',ftString,pdInput,40,eMid.Text)
    else
    CreateParameter('@otch',ftString,pdInput,40,null);

    if not (DateToStr(dbdteBirthDate.Value)='  .  .    ') then
      CreateParameter('@birth',ftDateTime,pdInput,0,dbdteBirthDate.Value)
    else
      CreateParameter('@birth',ftDateTime,pdInput,0,null);

    CreateParameter('@placebirth',ftString,pdInput,300,eBirthPlace.Text);
    if cbInvalid.Checked then
      CreateParameter('@inval',ftBoolean,pdInput,0,1)
    else
      CreateParameter('@inval',ftBoolean,pdInput,0,0);
    if cbChildren.Checked then
      CreateParameter('@deti',ftBoolean,pdInput,0,1)
    else
      CreateParameter('@deti',ftBoolean,pdInput,0,0);
    if  cbJob.Checked then
      CreateParameter('@rab',ftBoolean,pdInput,0,1)
    else
      CreateParameter('@rab',ftBoolean,pdInput,0,0);
    if  dbcbeSex.text='�������' then
      CreateParameter('@sex',ftBoolean,pdInput,0,1)
    else
      CreateParameter('@sex',ftBoolean,pdInput,0,0);
    if  cbAppNeed.Checked then
      CreateParameter('@obchegit',ftBoolean,pdInput,0,1)
    else
      CreateParameter('@obchegit',ftBoolean,pdInput,0,0);

    CreateParameter('@ik_medal',ftInteger,pdInput,0,dbcbeMedal.KeyValue);
    CreateParameter('@ik_voen_zvanie',ftInteger,pdInput,0,dbcbeMilitaryState.KeyValue);
    CreateParameter('@Sottel',ftString,pdInput,50,eCellphone.Text);
    CreateParameter('@telefon',ftString,pdInput,20,ePhone.text);
    CreateParameter('@Email',ftString,pdInput,50,eEmail.Text);

    if (iphoto.Picture.Graphic<>nil) then
      if (odPhoto.FileName<>'') then
        CreateParameter('@Photo',ftVarBytes,pdInput,2147483647,CreateVariantByFile(odPhoto.FileName))
      else
      begin
        stream:=TMemoryStream.Create;
        iPhoto.Picture.Graphic.SaveToStream(stream);
        CreateParameter('@Photo',ftVarBytes,pdInput,2147483647,CreateVariantByStream(stream))
      end
    else
      CreateParameter('@Photo',ftVarBytes,pdInput,2147483647,NULL);

    CreateParameter('@Pens',ftInteger,pdInput,0,Null);
    CreateParameter('@grazd',ftInteger,pdInput,0,dbcbeCitizenship.KeyValue);
    CreateParameter('@podg',ftInteger,pdInput,0,dbcbePreparation.KeyValue);
    CreateParameter('@nac',ftInteger,pdInput,0,NULL);
    CreateParameter('@ob_rab',ftInteger,pdInput,0,dbcbeSocWork.KeyValue);
    CreateParameter('@sempol',ftInteger,pdInput,0,dbcbeFamState.KeyValue);
    CreateParameter('@spec_uch',ftInteger,pdInput,0,dbcbeSpecCount.KeyValue);
    CreateParameter('@zaved',ftInteger,pdInput,0,dbcbeSchool.KeyValue);
    CreateParameter('@godokon',ftInteger,pdInput,0,eYearFinished.Value);
    CreateParameter('@ind_f',ftString,pdInput,10,Null);
    CreateParameter('@street_f',ftInteger,pdInput,0,Null);
    CreateParameter('@Build_f',ftString,pdInput,10,'');
    CreateParameter('@Stroen_f',ftString,pdInput,10,Null);
    CreateParameter('@Kvart_f',ftString,pdInput,10,'');
    CreateParameter('@ind_pr',ftString,pdInput,10,'');
    CreateParameter('@street_pr',ftInteger,pdInput,0,Null);
    CreateParameter('@Build_pr',ftString,pdInput,10,'');
    CreateParameter('@Stroen_pr',ftString,pdInput,10,Null);
    CreateParameter('@Kvart_pr',ftString,pdInput,10,'');
    CreateParameter('@dopsved',ftString,pdInput,1000,eAddInfo.text);
    CreateParameter('@code',ftInteger,pdInput,0,obj.id);
    CreateParameter('@StazYear',ftInteger,pdInput,0,eXpyear.Value);
CreateParameter('@StazMonth',ftInteger,pdInput,0,eXpMonth.Value);
CreateParameter('@cDolgnost',ftString,pdInput,150,eDuty.Text);
if not(dbcbeEnterprise.KeyValue=-1) then
CreateParameter('@ik_pred',ftInteger,pdInput,0,dbcbeEnterprise.KeyValue) else
CreateParameter('@ik_pred',ftInteger,pdInput,0,NULL);
CreateParameter('@CLgot',ftString,pdInput,500,eBenefits.text);
  end;
  dmAbiturientAction.aspAppendAbit.ExecProc;
  Modified:=false;

  ndspec:=( frmMain.DBDekTreeView_TEST1.selected.Parent.Data);

  obj.AdoDataset:=ndspec.SetADODataset(dm.DBConnect);

  TDBNodeAbitStudObject(obj).loaddata;
  RefreshFrame;

end;

procedure TfmAbitCard.dbgeListsCellClick(Column: TColumnEh);
begin
dm.adodsAbitExamView.Active:=false;
dm.adodsAbitExamView.CommandType:=cmdText;
dm.adodsAbitExamView.CommandText:='select * from Abit_Exam_View where (ncode='''+inttostr(obj.ik)+''')and(NN_abit='''+inttostr(dm.adodsPostupView.FieldValues['NN_abit'])+''')';
dm.adodsAbitExamView.Active:=true;

with dmAbiturientAction.aspGetOtherspec do
begin
 Active:=false;
 Parameters[1].Value:=dm.adodsPostupView.FieldValues['NN_abit'];
 open;
end;

end;

procedure TfmAbitCard.dbcbeSexChange(Sender: TObject);
begin
dbcbeSex.ReadOnly:=true;
eFamChange(sender);
end;

procedure TfmAbitCard.eFamChange(Sender: TObject);
begin
Modified:=true;
bbSave.Enabled:=true;
bbUndo.Enabled:=true;
end;



procedure TfmAbitCard.actPropToFactExecute(Sender: TObject);
begin
  dmAdress.aspPropToFact.Parameters[1].Value := obj.ID;
  dmAdress.aspPropToFact.ExecProc;
  dmStudentSelectionProcs.aspGetPersonAddress.Active:=false;
  dmStudentSelectionProcs.aspGetPersonAddress.Active:=true;
end;

procedure TfmAbitCard.BbSaveclick(Sender: TObject);
begin
DoApply;

end;

procedure TfmAbitCard.dbgeFamExit(Sender: TObject);
begin
Modified:=true;
bbSave.Enabled:=true;
bbUndo.Enabled:=true;

end;

procedure TfmAbitCard.dbgeLangColExit(Sender: TObject);
begin
 Modified:=true;
bbSave.Enabled:=true;
bbUndo.Enabled:=true;

end;

procedure TfmAbitCard.dbgeDocumentsCellClick(Column: TColumnEh);
begin
  inherited;
frmMain.ActiveFrame.Modified:=true;
end;

procedure TfmAbitCard.dbgeFamColExit(Sender: TObject);
begin
Modified:=true;
bbSave.Enabled:=true;
bbUndo.Enabled:=true;
end;

constructor TfmAbitCard.CreateFrame(AOwner: TComponent; AObject: TObject;
  AConn: TADOConnection);
begin
  inherited;
  Self.PageControl2.ActivePage:=TabSheet1;
end;

end.
