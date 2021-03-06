unit uNaprClose;
   {#Author sergdev@ist.ugtu.net}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uBaseDialog, DBGridEh, DBCtrlsEh, StdCtrls, Mask, DBLookupEh,
  ActnList, Buttons, ExtCtrls, ApplicationController, comObj, ExceptionBase, ADODB,
  System.Actions;

type
  TftmNaprclose = class(TfrmBaseDialog)
    Label1: TLabel;
    dbcbeNapr: TDBLookupComboboxEh;
    dbcbeMark: TDBLookupComboboxEh;
    Label2: TLabel;
    Label3: TLabel;
    dbdteExam: TDBDateTimeEditEh;
    dbcbeEx: TDBLookupComboboxEh;
    Label4: TLabel;
    Label13: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    eTema: TDBEditEh;
    Label9: TLabel;
    procedure FormShow(Sender: TObject);
    procedure dbcbeNaprChange(Sender: TObject);
    procedure actApplyExecute(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
  private
    FCloseNapr:boolean;
  public
    procedure LoadNapr;
    property CloseNapr:boolean read FCloseNapr write FCloseNapr;
  end;

var
  ftmNaprclose: TftmNaprclose;

implementation

uses uDm, uDMUspevaemost, db;
{$R *.dfm}
function ChangeMonthDayPlaces(date:TDateTime):string;
var s1:string;
begin
result:=DatetoStr(date);
s1:=result;
result[1]:=s1[4];
result[2]:=s1[5];
result[4]:=s1[1];
result[5]:=s1[2];
end;

function CheckFields:boolean;
begin
result:=true;
with ftmNaprclose do
begin
if (dbcbeNapr.Text='') 
or(dbcbeMark.Text='')
or(dbcbeEx.Text='')
or(dbdteExam.Text='')
then result:=false
end;
end;


procedure TftmNaprclose.FormShow(Sender: TObject);
begin
try
dmUspevaemost.adodsNapravl.Active:=false;
dmUspevaemost.adodsNapravl.CommandText:='select * from Napr_View where ik_zach='''+inttostr(Tag)+''''+' order by Outcolumn';
dmUspevaemost.adodsNapravl.Active:=true;
dmUspevaemost.adodsmark.Active:=true;
if not CloseNapr then dbdteExam.Value:=Date;
finally

end;
try
dmUspevaemost.adospPrepodVed.Active:=false;
dmUspevaemost.adospPrepodVed.Active:=true;
finally

end;
end;

procedure TftmNaprclose.LoadNapr;
begin
  dmUspevaemost.adodsNapravl.Locate('ik_ved',dbcbeNapr.KeyValue, [loPartialKey]);


  if dmUspevaemost.adodsNapravl.FieldByName('dd_exam').AsDateTime = 0 then
    dbdteExam.Value:=date
  else
    dbdteExam.Value:=dmUspevaemost.adodsNapravl.FieldByName('dd_exam').AsDateTime;

  dbcbeEx.KeyValue:= dmUspevaemost.adodsNapravl.FieldByName('id_teacher').AsInteger;
  dbcbeMark.KeyValue:= dmUspevaemost.adodsNapravl.FieldByName('cosenca').AsInteger;
  eTema.Text:= dmUspevaemost.adodsNapravl.FieldByName('ctema').AsString;
end;

procedure TftmNaprclose.dbcbeNaprChange(Sender: TObject);
begin
if checkFields then
begin
bbOk.Enabled:=true;
bbApply.Enabled:=true;
end else
begin
bbOk.Enabled:=false;
bbApply.Enabled:=false;
end;

end;

procedure TftmNaprclose.actApplyExecute(Sender: TObject);
begin


dm.DBConnect.BeginTrans;

try
with dmUspevaemost.adospAppendUspev.Parameters do
begin
 clear;
 AddParameter;
 items[0].Value:=0;
 AddParameter;
 items[1].Value:=dbcbeNapr.KeyValue;
 AddParameter;
 items[2].Value:=Tag;
 AddParameter;
 items[3].Value:=dbcbeMark.KeyValue;
 AddParameter;
 items[4].Value:='';
end;
dmUspevaemost.adospAppendUspev.ExecProc;

	with dmUspevaemost.adospAppendUspevKPTheme.Parameters do
	begin
		Clear;
		CreateParameter('@flag', ftInteger, pdInput, 0, 1);
		CreateParameter('@Ik_zach', ftInteger, pdInput, 0, Tag);
		CreateParameter('@Ik_ved', ftInteger, pdInput, 0, dbcbeNapr.KeyValue);
		CreateParameter('@KPTheme', ftString, pdInput, 2000, eTema.Text);
	end;
	dmUspevaemost.adospAppendUspevKPTheme.ExecProc;



with dmUspevaemost.adospCloseNapr.Parameters do
begin
 clear;
 AddParameter;
 items[0].Value:=dbcbeNapr.KeyValue;
 AddParameter;
 items[1].Value:=(dbdteExam.Value);
 AddParameter;
 items[2].Value:=dbcbeEx.KeyValue;
end;


 dmUspevaemost.adospCloseNapr.ExecProc;
 dm.DBConnect.CommitTrans;

except
 on E:EOleException do
 begin
   dm.DBConnect.RollbackTrans;
   raise EApplicationException.Create('���������� ��������� ������ � ������� �����������! ��������, ������ �� ���� ���������� ��� ����������.',EOleException.Create(E.Message, E.ErrorCode,'','',0));
 end;
 on E:Exception do
 begin
   dm.DBConnect.RollbackTrans;
   raise EApplicationException.Create('���������� ��������� ������!',Exception.Create(E.Message));
 end;

end;


dmUspevaemost.adodsNapravl.Active:=false;
dmUspevaemost.adospPrepodVed.Parameters.clear;
dmUspevaemost.adospPrepodVed.ExecProc;
dmUspevaemost.adodsNapravl.Active:=true;

end;

procedure TftmNaprclose.actOKExecute(Sender: TObject);
begin
actApplyExecute(Sender);
close;
end;


end.
