unit uFindAbit;

{ #Author sergdev@ist.ugtu.net }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBCtrlsEh, StdCtrls, Mask, Buttons, GridsEh, DBGridEh,
  ActnList, ExtCtrls, uDMStudentData, uPostupdlg, ADODB, DB, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBAxisGridsEh, System.Actions;

type
  TfrmFindAbit = class(TfrmBaseDialog)
    dbgeAbit: TDBGridEh;
    SpeedButton1: TSpeedButton;
    rbFIO: TRadioButton;
    rbNum: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    elastname: TDBEditEh;
    emiddlename: TDBEditEh;
    eFirstName: TDBEditEh;
    eNum: TDBNumberEditEh;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Label4: TLabel;
    actFind: TAction;
    procedure rbFIOClick(Sender: TObject);
    procedure actFindExecute(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actOKUpdate(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure eNumButtonClick(Sender: TObject; var Handled: Boolean);
    procedure elastnameClick(Sender: TObject);
    procedure eNumClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    HasAddSpec: Boolean;
    IsOnline: Boolean;
    Year: integer;
    NNRecord: integer;
    { Public declarations }
  end;

var
  frmFindAbit: TfrmFindAbit;

implementation

uses uMain, uDMStudentSelectionProcs;

{$R *.dfm}

procedure TfrmFindAbit.actApplyExecute(Sender: TObject);
begin

  // ���������� ��������� �����������
  with dmStudentSelectionProcs.adoSelDocuments do
  begin
    Active := false;
    // Parameters.Clear;
    // Parameters.AddParameter;
    CommandText := 'select * from SelStudDocuments(' +
      IntToStr(dmStudentData.aspFindAbit.FieldByName('ncode').Value) + ')';
    // Parameters[0].Value:=dmStudentData.aspFindAbit.FieldByName('ncode').Value;;
    // ExecProc;
    Active := true;
  end;

  frmPostupDlg := TfrmpostupDlg.create(self);
  frmPostupDlg.NNRecord := self.NNRecord;
  frmPostupDlg.Year := self.Year;
  frmPostupDlg.IDStudent := dmStudentData.aspFindAbit.FieldByName
    ('ncode').Value;
  if IsOnline then
    frmPostupDlg.IsOnline := true
  else
    frmPostupDlg.IsAdditional := true;

  frmPostupDlg.HasAddSpec := HasAddSpec;
  frmPostupDlg.IDpostup := dmStudentData.aspFindAbit.FieldByName
    ('nn_abit').Value;
  frmPostupDlg.Num := dmStudentData.aspFindAbit.FieldByName('regnomer').Value;
  frmPostupDlg.IdCat := dmStudentData.aspFindAbit.FieldByName('IdCat').Value;
  self.Close;
  frmPostupDlg.ShowModal;
  frmPostupDlg.Free;
  frmMain.actTreeRefreshActionExecute(Sender);
end;

procedure TfrmFindAbit.actFindExecute(Sender: TObject);
begin
  dmStudentData.aspFindAbit.Active := false;

  if IsOnline then
    dmStudentData.aspFindAbit.ProcedureName := 'Abit_Search_OnlineAbit;1'
  else
    dmStudentData.aspFindAbit.ProcedureName := 'Abit_Search_Abit;1';

  dmStudentData.aspFindAbit.Parameters.Clear;
  { dmStudentData.aspFindAbit.Parameters.AddParameter;
    dmStudentData.aspFindAbit.Parameters.AddParameter;
    dmStudentData.aspFindAbit.Parameters.AddParameter;
    dmStudentData.aspFindAbit.Parameters.AddParameter; }

  if rbFIO.Checked then
    with dmStudentData.aspFindAbit.Parameters do
    begin
      CreateParameter('@regnomer', ftInteger, pdInput, 0, NULL);
      CreateParameter('@clastname', ftString, pdInput, 30, elastname.Text);
      CreateParameter('@Cfirstname', ftString, pdInput, 30, eFirstName.Text);
      CreateParameter('@Cotch', ftString, pdInput, 30, emiddlename.Text);

    end
  else
    with dmStudentData.aspFindAbit.Parameters do
    begin
      CreateParameter('@regnomer', ftInteger, pdInput, 0, eNum.Value);
      CreateParameter('@clastname', ftString, pdInput, 30, NULL);
      CreateParameter('@Cfirstname', ftString, pdInput, 30, NULL);
      CreateParameter('@Cotch', ftString, pdInput, 30, NULL);
    end;
  dmStudentData.aspFindAbit.Active := true;
end;

procedure TfrmFindAbit.actOKExecute(Sender: TObject);
begin
  actApplyExecute(self);
  Close;
end;

procedure TfrmFindAbit.actOKUpdate(Sender: TObject);
begin
  actOK.Enabled := (dbgeAbit.SelectedIndex > (-1)) and
    (dmStudentData.aspFindAbit.Active);
end;

procedure TfrmFindAbit.elastnameClick(Sender: TObject);
begin
  rbFIO.Checked := true;
  rbFIOClick(self);
end;

procedure TfrmFindAbit.eNumButtonClick(Sender: TObject; var Handled: Boolean);
begin
  rbNum.Checked := true;
  rbFIOClick(self);
end;

procedure TfrmFindAbit.eNumClick(Sender: TObject);
begin
  rbNum.Checked := true;
  rbFIOClick(Sender);
end;

procedure TfrmFindAbit.FormShow(Sender: TObject);
begin
  dmStudentData.aspFindAbit.Active := false;

  if IsOnline then
  begin
    rbNum.Caption := '����� �� ������� ������';
    Label4.Caption := '������ �����';
  end;

end;

procedure TfrmFindAbit.rbFIOClick(Sender: TObject);
begin
  if rbFIO.Checked then
  begin
    elastname.ReadOnly := false;
    emiddlename.ReadOnly := false;
    eFirstName.ReadOnly := false;
    eNum.ReadOnly := true;
  end
  else
  begin
    elastname.ReadOnly := true;
    emiddlename.ReadOnly := true;
    eFirstName.ReadOnly := true;
    eNum.ReadOnly := false;
  end;

end;

end.
