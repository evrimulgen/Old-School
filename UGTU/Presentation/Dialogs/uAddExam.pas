unit uAddExam;

{ #Author sergdev@ist.ugtu.net }
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, ActnList, StdCtrls, Buttons, ExtCtrls, DBGridEh,
  DBCtrlsEh, Mask, DBLookupEh, uDm, System.Actions;

type
  TfrmAddExamDialog = class(TfrmBaseDialog)
    dbcbeDisc: TDBLookupComboboxEh;
    dbcbeVid: TDBLookupComboboxEh;
    eVedNum: TDBEditEh;
    Label3: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    eMark: TDBNumberEditEh;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure dbcbeDiscChange(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
  private
    { Private declarations }
  public
    Year: integer;
    KatZachIK: integer;
    EditMode: boolean;
    { Public declarations }
  end;

var
  frmAddExamDialog: TfrmAddExamDialog;

implementation

uses uPostupdlg;

function CheckFields: boolean;
begin
  result := true;
  with frmAddExamDialog do
  begin
    if (dbcbeDisc.Text = '') or (dbcbeVid.Text = '') then
      result := false;
  end;
end;
{$R *.dfm}

procedure TfrmAddExamDialog.FormShow(Sender: TObject);
begin

  dm.aspAbitExamType.Active := false;
  dm.aspAbitExamType.Parameters[1].Value := Year;
  {if EditMode then
    dm.aspAbitExamType.Parameters[2].Value := }
  dm.aspAbitExamType.Parameters[2].Value := KatZachIK;
  dm.aspAbitExamType.Active := true;

  dm.aspAbitDisc.Active := false;
  dm.aspAbitDisc.Parameters[1].Value := Year;
  dm.aspAbitDisc.Active := true;

  if EditMode then
    bbApply.Caption := '��������';

end;

procedure TfrmAddExamDialog.dbcbeDiscChange(Sender: TObject);
begin
  if (dbcbeDisc <> nil) then
    if CheckFields then
    begin
      bbOK.Enabled := true;
      bbApply.Enabled := true;
    end
    else
    begin
      bbOK.Enabled := false;
      bbApply.Enabled := false;
    end;
  if (dbcbeVid.KeyValue = 7) then
  begin
    Label5.Visible := true;
    Label4.Visible := false;
    Label9.Visible := false;
  end
  else if (dbcbeVid.KeyValue = 2) or (dbcbeVid.KeyValue = 4) or
    (dbcbeVid.KeyValue = 5) then
  begin
    Label5.Visible := false;
    Label4.Visible := true;
    Label9.Visible := false;
  end
  else
  begin
    Label5.Visible := false;
    Label4.Visible := false;
    Label9.Visible := true;
  end;
end;

procedure TfrmAddExamDialog.actApplyExecute(Sender: TObject);
var
  new: TExam;
begin
  try
    new := TExam.Create;
    new.new := true;
    new.IkDisc := dbcbeDisc.KeyValue;
    new.IkVidSdachi := dbcbeVid.KeyValue;
    new.VidSdachi := dbcbeVid.Text;
    new.Disc := dbcbeDisc.Text;
    if eMark.Value = Null then
      new.Mark := -1
    else
      new.Mark := eMark.Value;
    new.NVed := eVedNum.Text;

    frmPostupDlg.ExamList.Add(new);
    if EditMode then
      frmPostupDlg.sbDelExamClick(Sender);

  except
    showmessage('�������� ������!');
  end;

  dbcbeDisc.KeyValue := 0;
  eMark.Text := '';

  frmPostupDlg.Sync;
  if EditMode then
    Close;
end;

procedure TfrmAddExamDialog.actOKExecute(Sender: TObject);
begin
  actApplyExecute(Sender);
  Close;
end;

end.
