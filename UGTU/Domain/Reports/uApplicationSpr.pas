unit uApplicationSpr;

interface

uses
  Classes, dialogs, SysUtils, ExcelXP, Barcode, Contnrs,
  XIntf, CommonIntf, ReportsBase, db, adodb, ExtCtrls,
  udmUspevaemost, ComCtrls, uAverageBalls, SpravkaHistory2014, Spravka2014,
  DateUtils, uDM, ConstantRepository, uDMDocuments;

type
  ApplSprReport = class(TExcelReportBase)
  private
    Fik_doc: integer;
  protected
    procedure Execute; override;
  public
    property ik_doc: integer read Fik_doc;

    constructor Create(_ik_doc: integer);

  end;

implementation

{ ApplSprReport }

constructor ApplSprReport.Create(_ik_doc: integer);
begin
  Fik_doc := _ik_doc;
end;

procedure ApplSprReport.Execute;
var
  sp_pers: TADOStoredProc;
  sp_doc: TADOStoredProc;
  dsAddr: TADODataSet;
  sp_hist: TADOStoredProc;
  addr, dir, dir_inst, copystr1, copystr2: string;
  posit: integer;
begin
  inherited;
  addr := '';
  dsAddr := TADODataSet.Create(nil);
  sp_pers := TADOStoredProc.Create(nil);
  sp_doc := TADOStoredProc.Create(nil);
  sp_hist := TADOStoredProc.Create(nil);
  try
    // ��������� ������ ��������
    sp_pers.ProcedureName := 'StudInfoSpravBuild;1';
    sp_pers.Connection := dm.DBConnect;
    sp_pers.Parameters.CreateParameter('@Ik_document', ftString, pdInput,
      50, ik_doc);
    sp_pers.Open;
    sp_pers.First;
    with sp_pers do
    begin
      Replace('#group#', FieldByName('Cname_grup').AsString);
      if FieldByName('Ik_kat_zach').AsInteger = 1 then
        Replace('#osn#', '������')
      else
        Replace('#osn#', FieldByName('Cname_kat_zach').AsString);
      Replace('#form_ed#', ansilowercase(FieldByName('Cname_form_ed')
        .AsString));
      Replace('#fio#', FieldByName('FIOrod').AsString);
      dir_inst := FieldByName('ManagerSmallName').AsString;
      posit := Pos(' ', dir_inst);
      copystr1 := Copy(dir_inst, posit + 1, Length(dir_inst));
      copystr2 := Copy(dir_inst, 1, posit - 1);
      copystr1 := copystr1 + ' ' + copystr2;
      Replace('#dir_inst#', copystr1); // ���������� ����� �������
    end;
    // ��������� ������ �� �������
    sp_doc.ProcedureName := 'DocInfoSpravBuild;1';
    sp_doc.Connection := dm.DBConnect;
    sp_doc.Parameters.CreateParameter('@Ik_document', ftString, pdInput,
      50, ik_doc);
    sp_doc.Open;
    sp_doc.First;
    with sp_doc do
    begin
      Replace('#reason#', ansilowercase(FieldByName('Cname_pric').AsString));
      if FieldByName('Ik_Transfer').AsInteger = 1 then
        Replace('#transp#', '������� ����� � ����')
      else
      begin
        Replace('#transp#', '��������� �� ����� �� ������');

        dsAddr.CommandText :=
          'select * from StudAddress where ik_personAddress=' +
          FieldByName('ik_personAddress').AsString;
        dsAddr.Connection := dm.DBConnect;
        dsAddr.Open;
        dsAddr.First;
        with dsAddr do
        begin
          if FieldByName('Cstrana').AsString <> '������' then
            addr := FieldByName('Cstrana').AsString + ', ';
          addr := addr + FieldByName('Cregion').AsString + ', ' +
            FieldByName('cshort_type_gorod').AsString + FieldByName('Cgorod')
            .AsString + ', ' + FieldByName('cshort_type_street').AsString +
            FieldByName('CStreet').AsString + ', �.' +
            FieldByName('BuildingNumber').AsString + ', ��.' +
            FieldByName('FlatNumber').AsString;
        end;
        Replace('#address#', addr);
      end;

    end;
    sp_hist.ProcedureName := 'StudHistForSpr;1';
    sp_hist.Connection := dm.DBConnect;
    sp_hist.Parameters.CreateParameter('@Ik_document', ftString, pdInput,
      50, ik_doc);
    sp_hist.Open;
    sp_hist.Last;
    if sp_hist.FieldByName('ikTypePric').AsInteger = 2 then
      if sp_pers.FieldByName('lSex').AsInteger = 0 then
        Replace('#type_stud#', '����� ����������� � ������')
      else
        Replace('#type_stud#', '����� ������������ � ������')
    else
      Replace('#type_stud#', '��������(��) ������');

  finally
    sp_pers.Free;
    sp_doc.Free;
    dsAddr.Free;
    sp_hist.Free;
  end;
end;

end.
