unit uMagaizneDoc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseFrame, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ComCtrls, uDMUgtuStructure,
  Vcl.DBLookup, uDM,
  Vcl.Mask, DBCtrlsEh, DBLookupEh, uDMStudentData, uDMDocuments, EhLibADO,
  uReviewDoc,
  Vcl.Menus, Data.DB, Bde.DBTables, Vcl.ImgList, adodb, Vcl.ToolWin,
  uReviewCallSpr, uReviewApplication, uReviewAkadem,
  uReviewNotify;

type
  TfmDoc = class(TfmBase)
    dbgehMagazineDocs: TDBGridEh;
    Panel2: TPanel;
    Label1: TLabel;
    gridColumnSelectMenu: TPopupMenu;
    Label2: TLabel;
    ilMain: TImageList;
    ToolBar7: TToolBar;
    tbUtv: TToolButton;
    tbGot: TToolButton;
    tbPrint: TToolButton;
    bbReset: TBitBtn;
    dtpStart: TDateTimePicker;
    dtpEnd: TDateTimePicker;
    procedure dbcmbSpecChange(Sender: TObject);
    procedure dbcmbGroupChange(Sender: TObject);
    procedure bPrintClick(Sender: TObject);
    procedure gridColumnSelectMenuPopup(Sender: TObject);
    procedure bResetClick(Sender: TObject);
    procedure dtpStartCloseUp(Sender: TObject);
    procedure dtpEndCloseUp(Sender: TObject);
    procedure dbgehMagazineDocsDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumnEh;
      State: TGridDrawState);
    procedure Button1Click(Sender: TObject);
    procedure dbgehMagazineDocsCellClick(Column: TColumnEh);
    procedure dbgehMagazineDocsCellMouseClick(Grid: TCustomGridEh;
      Cell: TGridCoord; Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
      var Processed: Boolean);
    procedure dbgehMagazineDocsDblClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure tbUtvClick(Sender: TObject);
    procedure tbGotClick(Sender: TObject);
    procedure tbResetClick(Sender: TObject);
    procedure bbResetClick(Sender: TObject);

  private
    procedure OnMyMenuItemClick(Sender: TObject);
    // numColumn:integer;checked:boolean);
    { Private declarations }
  public
    Procedure AfterConstruction; Override;
    { Public declarations }
  end;

var
  fmDoc: TfmDoc;

  // pm : TPopupMenu;
implementation

{$R *.dfm}

Procedure TfmDoc.AfterConstruction;
var
  fld: TField;
Begin
  Inherited;
  // ilMain.GetBitmap(16, bbOk.Glyph);
  dbgehMagazineDocs.SelectedRows.CurrentRowSelected := true;

  // dtpStart.Date := StrToDate('10.03.2015');
  dtpStart.Date := Date - 31; // "���������� ����"
  dtpEnd.Date := Date; // ������� ����
  dtpStart.MaxDate := dtpEnd.Date - 1;
  dtpEnd.MinDate := dtpStart.Date + 1;

  // dbgehMagazineDocs.Options   := dbgehMagazineDocs.Options  + [dgAlwaysShowSelection];
  // dbgehMagazineDocs.OptionsEh:= dbgehMagazineDocs.OptionsEh + [dghRowHighlight];

  // dmDocs.adodsDocs.CommandText:=('select * from MagazineDocs where cName_direction='''+'�����������''');// + DateTimeToStr(dtpStart.Date)+'''';//+ 'and DateCreate <''' + DateTimeToStr(dtpEnd.Date)+''')or DateCreate=NULL';
  dmDocs.adodsDocs.CommandText :=
    ('select * from MagazineDocs where (DateCreate>''' +
    DateTimeToStr(dtpStart.Date) + '''and DateCreate <''' +
    DateTimeToStr(dtpEnd.Date) + ''')or DateCreate IS NULL');

  // ����������
  uDMDocuments.dmDocs.adodsDocs.Active := true; // ��������� ����
  uDMDocuments.dmDocs.adodsDocs.Filtered := true; // ������
  DBGridEhCenter.FilterEditCloseUpApplyFilter := true;
  // ����������
  self.dbgehMagazineDocs.OptionsEh := dbgehMagazineDocs.OptionsEh +
    [dghAutoSortMarking];

  // �������������� ����������
  // dbgehMagazineDocs.Columns[1].Title.SortMarker = smDownEh;   //�� ��������
  // dbgehMagazineDocs.OptionsEh := dbgehMagazineDocs.OptionsEh + [dghMultiSortMarking]; //���������� �� ���������� ��������
  dbgehMagazineDocs.SortLocal := true;
  // dmDocs.dsDocs.DataSet.Filter := 'DateCreate > ''' + DateTimeToStr(dtpStart.Date)+''''+ 'and DateCreate <''' + DateTimeToStr(dtpEnd.Date)+'''';


  // dmDocs.dsDocs.DataSet.Filter := 'DateCreate > ''' + DateTimeToStr(dtpStart.Date)+''''+ 'and DateCreate <''' + DateTimeToStr(dtpEnd.Date)+'''';
  // dmDocs.dsDocs.DataSet.Filtered:=true;

End;

procedure TfmDoc.bbOkClick(Sender: TObject);
var
  i, LastNum: Integer;
  datebegin: string;
  AYear, AMonth, ADay: word;
  sp_num: TADODataSet;
begin
  inherited;
  with dbgehMagazineDocs.DataSource.DataSet do
  begin

    First;
    DisableControls;
    try
      while not EOF do
      begin
        if (dbgehMagazineDocs.SelectedRows.CurrentRowSelected = true) then
        begin
          if (uDMDocuments.dmDocs.adodsDocs.FieldByName('NumberDoc')
            .AsString = '') then
          begin
            dm.DBConnect.BeginTrans;
            sp_num := TADODataSet.Create(nil);
            // ���� ������� �������� �� ������������
            try
              dbgehMagazineDocs.DataSource.DataSet.Edit;
              uDMDocuments.dmDocs.dsDocs.DataSet.FieldValues['DateCreate']
                := Date();
              dbgehMagazineDocs.DataSource.DataSet.Post;
              DecodeDate(Now, AYear, AMonth, ADay);

              if Date() > StrToDateTime('01.09.' + AYear.ToString()) then
                datebegin := '01.09.' + AYear.ToString()
              else
                datebegin := '01.09.' + (StrToInt(AYear.ToString()) - 1)
                  .ToString();
              sp_num.CommandText := 'select * from MaxNumDocument(''' +
                datebegin + '''' + ',' + '''' + DateTimeToStr(Date()) + ''')';
              sp_num.Connection := dm.DBConnect;
              sp_num.Open;
              sp_num.First;
              LastNum := sp_num.FieldByName('MaxNum').AsInteger + 1;
              dm.DBConnect.CommitTrans;
            except
              dm.DBConnect.RollbackTrans;
              sp_num.Free;
            end;
            dbgehMagazineDocs.DataSource.DataSet.Edit;
            uDMDocuments.dmDocs.dsDocs.DataSet.FieldValues['NumberDoc']
              := LastNum;
            dbgehMagazineDocs.DataSource.DataSet.Post;
          end;
        end;

        Next;
      end;
    finally
      EnableControls;

    end;
  end;

  // for i:=0 to dbgehMagazineDocs.SelectedRows.Count-1 do
  // begin
  // if (uDMDocuments.dmDocs.adodsDocs.FieldByName('DateCreate')<>nil) then
  // uDMDocuments.dmDocs.adodsDocs.FieldByName('DateCreate').AsDateTime;
  // dbgehMagazineDocs.DataSource.DataSet.Bookmark:=dbgehMagazineDocs.SelectedRows[i];
end;

procedure TfmDoc.bbResetClick(Sender: TObject);
begin
  inherited;
  self.dbgehMagazineDocs.ClearFilter;
  // dmDocs.dsDocs.DataSet.Filter := 'DateCreate > ''' + DateTimeToStr(dtpStart.Date)+''''+ 'and DateCreate <''' + DateTimeToStr(dtpEnd.Date)+'''';
  // dmDocs.dsDocs.DataSet.Filtered:=true;
  self.dbgehMagazineDocs.DefaultApplyFilter;
end;

procedure TfmDoc.bPrintClick(Sender: TObject);
begin
  inherited;

end;

// ����� �������
procedure TfmDoc.bResetClick(Sender: TObject);
begin
  inherited;
  self.dbgehMagazineDocs.ClearFilter;
  // dmDocs.dsDocs.DataSet.Filter := 'DateCreate > ''' + DateTimeToStr(dtpStart.Date)+''''+ 'and DateCreate <''' + DateTimeToStr(dtpEnd.Date)+'''';
  // dmDocs.dsDocs.DataSet.Filtered:=true;
  self.dbgehMagazineDocs.DefaultApplyFilter;
end;

procedure TfmDoc.Button1Click(Sender: TObject);
var
  i: Integer;
begin
  // for i:=0 to dbgehMagazineDocs.SelCount-1 do begin;
  // dbgehMagazineDocs.DataSource.DataSet.Bookmark:=dbgehMagazineDocs.SelectedRows[i];
  // end;

  inherited;
  with dbgehMagazineDocs.DataSource.DataSet do
  begin

    First;
    DisableControls;
    try
      while not EOF do
      begin
        if (dbgehMagazineDocs.SelectedRows.CurrentRowSelected = true) then
        begin
          if (uDMDocuments.dmDocs.adodsDocs.FieldByName('DateReady')
            .Value = Null) then
          begin
            dbgehMagazineDocs.DataSource.DataSet.Edit;
            uDMDocuments.dmDocs.dsDocs.DataSet.FieldValues['DateReady']
              := Date();
            dbgehMagazineDocs.DataSource.DataSet.Post;
          end;
        end;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;
end;

procedure TfmDoc.dbcmbGroupChange(Sender: TObject);
var
  group: string;
begin
  inherited;

end;

procedure TfmDoc.dbcmbSpecChange(Sender: TObject);
var
  spec: string;
begin
  inherited;
end;

procedure TfmDoc.dbgehMagazineDocsCellClick(Column: TColumnEh);
begin
  inherited;
  // dbgehMagazineDocs.Columns.Items[0].CheckboxState :=cbChecked;
  // dbgehMagazineDocs.Columns.Items[0].Checkboxes:= true;

end;

procedure TfmDoc.dbgehMagazineDocsCellMouseClick(Grid: TCustomGridEh;
  Cell: TGridCoord; Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  var Processed: Boolean);

begin
  inherited;

  // DataSet.FieldByName('��� ������ ����').value;
end;

procedure TfmDoc.dbgehMagazineDocsDblClick(Sender: TObject);
var
  editF: TfrmReviewDoc;
  pt: TPoint;
  dsDoc: TADODataSet;
  idDest: Integer;
  idDoc: Integer;
  fcallspr: Tfm�hallengeSpr;
  fapplication: TfrmReviewApplication;
  fneusp: TfrmReviewNeusp;
  fakadem: TfrmReviewAkadem;
  sp_pers: TADOStoredProc;
  sp_doc: TADOStoredProc;
begin
  inherited;
//  sp_doc := TADOStoredProc.Create(nil);
//  sp_pers := TADOStoredProc.Create(nil);
//  dsDoc := TADODataSet.Create(nil);
//  pt := dbgehMagazineDocs.ScreenToClient(Mouse.CursorPos);
//  try
//    if self.dbgehMagazineDocs.MouseCoord(pt.X, pt.Y).X <> -1 then
//    begin
//      idDoc := uDMDocuments.dmDocs.adodsDocs.FieldByName('Ik_Document')
//        .AsInteger;
//      idDest := uDMDocuments.dmDocs.adodsDocs.FieldByName('ik_destination')
//        .AsInteger;
//      if (dbgehMagazineDocs.SelectedRows.CurrentRowSelected = true) then
//      begin
//        sp_pers.ProcedureName := 'StudInfoSpravBuild;1';
//        sp_pers.Connection := dm.DBConnect;
//        sp_pers.Parameters.CreateParameter('@Ik_document', ftString, pdInput,
//          50, idDoc);
//        sp_pers.Open;
//        sp_pers.First;
//        sp_doc.ProcedureName := 'DocInfoSpravBuild;1';
//        sp_doc.Connection := dm.DBConnect;
//        sp_doc.Parameters.CreateParameter('@Ik_document', ftString, pdInput,
//          50, idDoc);
//        sp_doc.Open;
//        sp_doc.First;
//
//        case (idDest) of
//          1:
//            begin
//              editF := TfrmReviewDoc.Create(self);
//              editF.dtGot.Format := #32;
//              editF.dtUtv.Format := #32;
//              if (sp_doc.FieldByName('DateCreate').Value <> Null) then
//              begin
//                editF.dtUtv.Format := '';
//                editF.dtUtv.Date := sp_doc.FieldByName('DateCreate').AsDateTime;
//                if (sp_doc.FieldByName('DateReady').Value <> Null) then
//                begin
//                  editF.dtGot.Format := '';
//                  editF.dtGot.Date := sp_doc.FieldByName('DateReady')
//                    .AsDateTime;
//                  editF.BitBtn1.Enabled := false;
//                  editF.bbOk.Enabled := false;
//                end
//                else
//                begin
//                  editF.dtGot.Enabled := true;
//                  editF.BitBtn1.Enabled := false;
//                  editF.bbOk.Enabled := false;
//                end;
//              end
//              else
//              begin
//                editF.dtUtv.Enabled := true;
//                editF.BitBtn1.Enabled := false;
//                editF.bbOk.Enabled := false;
//              end;
//
//              editF.eDest.Text :=
//                sp_doc.FieldByName('cNameDestination').AsString;
//              editF.eNum.Text := sp_doc.FieldByName('NumberDoc').AsString;
//              editF.eInd.Text := sp_doc.FieldByName('Num_podrazd').AsString;
//              editF.Caption := sp_pers.FieldByName('PersName').AsString + ' (' +
//                sp_pers.FieldByName('CName_grup').AsString + ')';
//
//              editF.ShowModal;
//            end;
//          2:
//            begin
//              editF := TfrmReviewDoc.Create(self);
//              editF.dtGot.Format := #32;
//              editF.dtUtv.Format := #32;
//              if (sp_doc.FieldByName('DateCreate').Value <> Null) then
//              begin
//                editF.dtUtv.Format := '';
//                editF.dtUtv.Date := sp_doc.FieldByName('DateCreate').AsDateTime;
//                if (sp_doc.FieldByName('DateReady').Value <> Null) then
//                begin
//                  editF.dtGot.Format := '';
//                  editF.dtGot.Date := sp_doc.FieldByName('DateReady')
//                    .AsDateTime;
//                end
//                else
//                begin
//                  editF.dtGot.Enabled := true;
//                  editF.BitBtn1.Enabled := false;
//                  editF.bbOk.Enabled := false;
//                end;
//              end
//              else
//              begin
//                editF.dtUtv.Enabled := true;
//                editF.BitBtn1.Enabled := false;
//                editF.bbOk.Enabled := false;
//              end;
//
//              editF.eDest.Text :=
//                sp_doc.FieldByName('cNameDestination').AsString;
//              editF.eNum.Text := sp_doc.FieldByName('NumberDoc').AsString;
//              editF.eInd.Text := sp_doc.FieldByName('Num_podrazd').AsString;
//              editF.Caption := sp_pers.FieldByName('PersName').AsString + ' (' +
//                sp_pers.FieldByName('CName_grup').AsString + ')';
//              editF.ShowModal;
//            end;
//
//          3:
//            begin
//              fcallspr := Tfm�hallengeSpr.Create(self);
//              fcallspr.dtGot.Format := #32;
//              fcallspr.dtUtv.Format := #32;
//              if (sp_doc.FieldByName('DateCreate').Value <> Null) then
//              begin
//                fcallspr.dtUtv.Format := '';
//                fcallspr.dtUtv.Date := sp_doc.FieldByName('DateCreate')
//                  .AsDateTime;
//                if (sp_doc.FieldByName('DateReady').Value <> Null) then
//                begin
//                  fcallspr.dtGot.Format := '';
//                  fcallspr.dtGot.Date := sp_doc.FieldByName('DateReady')
//                    .AsDateTime;
//                end
//                else
//                begin
//                  editF.dtGot.Enabled := true;
//                  editF.BitBtn1.Enabled := false;
//                  editF.bbOk.Enabled := false;
//                end;
//              end
//              else
//              begin
//                editF.dtUtv.Enabled := true;
//                editF.BitBtn1.Enabled := false;
//                editF.bbOk.Enabled := false;
//              end;
//
//              fcallspr.eDest.Text :=
//                sp_doc.FieldByName('cNameDestination').AsString;
//              fcallspr.eNum.Text := sp_doc.FieldByName('NumberDoc').AsString;
//              fcallspr.eInd.Text := sp_doc.FieldByName('Num_podrazd').AsString;
//              fcallspr.Caption := sp_pers.FieldByName('PersName').AsString +
//                ' (' + sp_pers.FieldByName('CName_grup').AsString + ')';
//              fcallspr.ShowModal;
//            end;
//
//          4:
//            begin
//              fapplication := TfrmReviewApplication.Create(self);
//              fapplication.dtGot.Format := #32;
//              fapplication.dtUtv.Format := #32;
//              if (sp_doc.FieldByName('DateCreate').Value <> Null) then
//              begin
//                fapplication.dtUtv.Format := '';
//                fapplication.dtUtv.Date := sp_doc.FieldByName('DateCreate')
//                  .AsDateTime;
//                if (sp_doc.FieldByName('DateReady').Value <> Null) then
//                begin
//                  fapplication.dtGot.Format := '';
//                  fapplication.dtGot.Date := sp_doc.FieldByName('DateReady')
//                    .AsDateTime;
//                end
//                else
//                begin
//                  editF.dtGot.Enabled := true;
//                  editF.BitBtn1.Enabled := false;
//                  editF.bbOk.Enabled := false;
//                end;
//              end
//              else
//              begin
//                editF.dtUtv.Enabled := true;
//                editF.BitBtn1.Enabled := false;
//                editF.bbOk.Enabled := false;
//              end;
//
//              fapplication.eDest.Text :=
//                sp_doc.FieldByName('cNameDestination').AsString;
//              fapplication.eNum.Text := sp_doc.FieldByName('NumberDoc')
//                .AsString;
//              fapplication.eInd.Text :=
//                sp_doc.FieldByName('Num_podrazd').AsString;
//              fapplication.Caption := sp_pers.FieldByName('PersName').AsString +
//                ' (' + sp_pers.FieldByName('CName_grup').AsString + ')';
//              fapplication.ShowModal;
//            end;
//          5:
//            begin
//              fcallspr := Tfm�hallengeSpr.Create(self);
//              fcallspr.dtGot.Format := #32;
//              fcallspr.dtUtv.Format := #32;
//              if (sp_doc.FieldByName('DateCreate').Value <> Null) then
//              begin
//                fcallspr.dtUtv.Format := '';
//                fcallspr.dtUtv.Date := sp_doc.FieldByName('DateCreate')
//                  .AsDateTime;
//                if (sp_doc.FieldByName('DateReady').Value <> Null) then
//                begin
//                  fcallspr.dtGot.Format := '';
//                  fcallspr.dtGot.Date := sp_doc.FieldByName('DateReady')
//                    .AsDateTime;
//                end
//                else
//                begin
//                  editF.dtGot.Enabled := true;
//                  editF.BitBtn1.Enabled := false;
//                  editF.bbOk.Enabled := false;
//                end;
//              end
//              else
//              begin
//                editF.dtUtv.Enabled := true;
//                editF.BitBtn1.Enabled := false;
//                editF.bbOk.Enabled := false;
//              end;
//
//              fcallspr.eDest.Text :=
//                sp_doc.FieldByName('cNameDestination').AsString;
//              fcallspr.eNum.Text := sp_doc.FieldByName('NumberDoc').AsString;
//              fcallspr.eInd.Text := sp_doc.FieldByName('Num_podrazd').AsString;
//              fcallspr.Caption := sp_pers.FieldByName('PersName').AsString +
//                ' (' + sp_pers.FieldByName('CName_grup').AsString + ')';
//              fcallspr.ShowModal;
//            end;
//          6:
//            begin
//              fneusp := TfrmReviewNeusp.Create(self);
//              fneusp.dtGot.Format := #32;
//              fneusp.dtUtv.Format := #32;
//              if (sp_doc.FieldByName('DateCreate').Value <> Null) then
//              begin
//                fneusp.dtUtv.Format := '';
//                fneusp.dtUtv.Date := sp_doc.FieldByName('DateCreate')
//                  .AsDateTime;
//                if (sp_doc.FieldByName('DateReady').Value <> Null) then
//                begin
//                  fneusp.dtGot.Format := '';
//                  fneusp.dtGot.Date := sp_doc.FieldByName('DateReady')
//                    .AsDateTime;
//                end
//                else
//                begin
//                  editF.dtGot.Enabled := true;
//                  editF.BitBtn1.Enabled := false;
//                  editF.bbOk.Enabled := false;
//                end;
//              end
//              else
//              begin
//                editF.dtUtv.Enabled := true;
//                editF.BitBtn1.Enabled := false;
//                editF.bbOk.Enabled := false;
//              end;
//
//              fneusp.eDest.Text :=
//                sp_doc.FieldByName('cNameDestination').AsString;
//              fneusp.eNum.Text := sp_doc.FieldByName('NumberDoc').AsString;
//              fneusp.eInd.Text := sp_doc.FieldByName('Num_podrazd').AsString;
//              fneusp.Caption := sp_pers.FieldByName('PersName').AsString + ' ('
//                + sp_pers.FieldByName('CName_grup').AsString + ')';
//              fneusp.ShowModal;
//            end;
//
//          7:
//            begin
//              fakadem := TfrmReviewAkadem.Create(self);
//              fakadem.dtGot.Format := #32;
//              fakadem.dtUtv.Format := #32;
//              if (sp_doc.FieldByName('DateCreate').Value <> Null) then
//              begin
//                fakadem.dtUtv.Format := '';
//                fakadem.dtUtv.Date := sp_doc.FieldByName('DateCreate')
//                  .AsDateTime;
//                if (sp_doc.FieldByName('DateReady').Value <> Null) then
//                begin
//                  fakadem.dtGot.Format := '';
//                  fakadem.dtGot.Date := sp_doc.FieldByName('DateReady')
//                    .AsDateTime;
//                end
//                else
//                begin
//                  editF.dtGot.Enabled := true;
//                  editF.BitBtn1.Enabled := false;
//                  editF.bbOk.Enabled := false;
//                end;
//              end
//              else
//              begin
//                editF.dtUtv.Enabled := true;
//                editF.BitBtn1.Enabled := false;
//                editF.bbOk.Enabled := false;
//              end;
//
//              fakadem.eDest.Text :=
//                sp_doc.FieldByName('cNameDestination').AsString;
//              fakadem.eNum.Text := sp_doc.FieldByName('NumberDoc').AsString;
//              fakadem.eInd.Text := sp_doc.FieldByName('Num_podrazd').AsString;
//              fakadem.Caption := sp_pers.FieldByName('PersName').AsString + ' ('
//                + sp_pers.FieldByName('CName_grup').AsString + ')';
//              fakadem.ShowModal;
//            end;
//          8:
//            begin
//              editF := TfrmReviewDoc.Create(self);
//              editF.dtGot.Format := #32;
//              editF.dtUtv.Format := #32;
//              if (sp_doc.FieldByName('DateCreate').Value <> Null) then
//              begin
//                editF.dtUtv.Format := '';
//                editF.dtUtv.Date := sp_doc.FieldByName('DateCreate').AsDateTime;
//                if (sp_doc.FieldByName('DateReady').Value <> Null) then
//                begin
//                  editF.dtGot.Format := '';
//                  editF.dtGot.Date := sp_doc.FieldByName('DateReady')
//                    .AsDateTime;
//                end
//                else
//                begin
//                  editF.dtGot.Enabled := true;
//                  editF.BitBtn1.Enabled := false;
//                  editF.bbOk.Enabled := false;
//                end;
//              end
//              else
//              begin
//                editF.dtUtv.Enabled := true;
//                editF.BitBtn1.Enabled := false;
//                editF.bbOk.Enabled := false;
//              end;
//
//              editF.eDest.Text :=
//                sp_doc.FieldByName('cNameDestination').AsString;
//              editF.eNum.Text := sp_doc.FieldByName('NumberDoc').AsString;
//              editF.eInd.Text := sp_doc.FieldByName('Num_podrazd').AsString;
//              editF.Caption := sp_pers.FieldByName('PersName').AsString + ' (' +
//                sp_pers.FieldByName('CName_grup').AsString + ')';
//              editF.ShowModal;
//            end;
//
//        end;
//      end;
//    end;
//  finally
//    dsDoc.Free;
//    sp_doc.Free;
//    sp_pers.Free;
//  end;
end;

procedure TfmDoc.dbgehMagazineDocsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if (dbgehMagazineDocs.DataSource.DataSet.FieldByName('DateCreate')
    .AsString = '') then
    self.dbgehMagazineDocs.Canvas.Font.Style := [fsBold];
  dbgehMagazineDocs.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfmDoc.dtpEndCloseUp(Sender: TObject);
begin
  inherited;
  dtpStart.MaxDate := dtpEnd.Date - 1;
  dmDocs.adodsDocs.Active := false;
  dmDocs.adodsDocs.CommandText :=
    ('select * from MagazineDocs where (DateCreate>''' +
    DateTimeToStr(dtpStart.Date) + '''and DateCreate <''' +
    DateTimeToStr(dtpEnd.Date) + ''')or DateCreate IS NULL');
  dmDocs.adodsDocs.Active := true;
end;

procedure TfmDoc.dtpStartCloseUp(Sender: TObject);
begin
  inherited;
  dtpEnd.MinDate := dtpStart.Date + 1;
  dmDocs.adodsDocs.Active := false;
  dmDocs.adodsDocs.CommandText :=
    ('select * from MagazineDocs where (DateCreate>''' +
    DateTimeToStr(dtpStart.Date) + '''and DateCreate <''' +
    DateTimeToStr(dtpEnd.Date) + ''')or DateCreate IS NULL');
  dmDocs.adodsDocs.Active := true;
end;

procedure TfmDoc.gridColumnSelectMenuPopup(Sender: TObject);
var
  mi: TMenuItem;
  pm: TPopupMenu;
  col: TColumnEh;
  i: Integer;
begin
  inherited; // ���� ������� ������������ ������
  // if pm<>nil then
  // pm.CloseMenu;
  pm := Sender as TPopupMenu;
  pm.Items.Clear;
  for i := 0 to self.dbgehMagazineDocs.Columns.Count - 3 do
  begin
    mi := TMenuItem.Create(pm);
    col := dbgehMagazineDocs.Columns.Items[i];
    mi.Caption := col.Title.Caption;
    mi.Tag := i;
    mi.OnClick := OnMyMenuItemClick;
    mi.Checked := col.Visible;
    pm.Items.Add(mi);
  end;

end;

procedure TfmDoc.OnMyMenuItemClick(Sender: TObject);
begin
  if Sender is TMenuItem Then
    with Sender as TMenuItem do
    // ����� Sender - ����� ���� �� ������� ��������
    begin
      if Checked then
        self.dbgehMagazineDocs.Columns.Items[Tag].Visible := false
      else
      begin
        self.dbgehMagazineDocs.Columns.Items[Tag].Visible := true;
        self.dbgehMagazineDocs.Columns.Items[Tag].Width := 130;
      end;
    end;
end;

procedure TfmDoc.tbGotClick(Sender: TObject);
var
  i: Integer;
begin
  // for i:=0 to dbgehMagazineDocs.SelCount-1 do begin;
  // dbgehMagazineDocs.DataSource.DataSet.Bookmark:=dbgehMagazineDocs.SelectedRows[i];
  // end;

  inherited;
  with dbgehMagazineDocs.DataSource.DataSet do
  begin

    First;
    DisableControls;
    try
      while not EOF do
      begin
        if (dbgehMagazineDocs.SelectedRows.CurrentRowSelected = true) then
        begin
          if (uDMDocuments.dmDocs.adodsDocs.FieldByName('DateReady')
            .Value = Null) and
            (uDMDocuments.dmDocs.adodsDocs.FieldByName('DateCreate').Value <>
            Null) then
          begin
            dbgehMagazineDocs.DataSource.DataSet.Edit;
            uDMDocuments.dmDocs.dsDocs.DataSet.FieldValues['DateReady']
              := Date();
            dbgehMagazineDocs.DataSource.DataSet.Post;
          end;
        end;
        Next;
      end;
    finally
      EnableControls;
    end;
  end;
end;

procedure TfmDoc.tbUtvClick(Sender: TObject);
var
  i, LastNum: Integer;
  datebegin: string;
  AYear, AMonth, ADay: word;
  sp_num: TADODataSet;
begin
  inherited;
  with dbgehMagazineDocs.DataSource.DataSet do
  begin

    First;
    DisableControls;
    try
      while not EOF do
      begin
        if (dbgehMagazineDocs.SelectedRows.CurrentRowSelected = true) then
        begin
          if (uDMDocuments.dmDocs.adodsDocs.FieldByName('NumberDoc')
            .AsString = '') then
          begin
            dm.DBConnect.BeginTrans;
            sp_num := TADODataSet.Create(nil);
            // ���� ������� �������� �� ������������
            try
              dbgehMagazineDocs.DataSource.DataSet.Edit;
              uDMDocuments.dmDocs.dsDocs.DataSet.FieldValues['DateCreate']
                := Date();
              dbgehMagazineDocs.DataSource.DataSet.Post;
              DecodeDate(Now, AYear, AMonth, ADay);

              if Date() > StrToDateTime('01.09.' + AYear.ToString()) then
                datebegin := '01.09.' + AYear.ToString()
              else
                datebegin := '01.09.' + (StrToInt(AYear.ToString()) - 1)
                  .ToString();
              sp_num.CommandText := 'select * from MaxNumDocument(''' +
                datebegin + '''' + ',' + '''' + DateTimeToStr(Date()) + '''' +
                ',' + '''' + uDMDocuments.dmDocs.adodsDocs.FieldByName
                ('Ik_Document').AsString + ''',''' +
                uDMDocuments.dmDocs.adodsDocs.FieldByName('Ik_destination')
                .AsString + ''')';
              sp_num.Connection := dm.DBConnect;
              sp_num.Open;
              sp_num.First;
              LastNum := sp_num.FieldByName('MaxNum').AsInteger + 1;
              dm.DBConnect.CommitTrans;
            except
              dm.DBConnect.RollbackTrans;
              sp_num.Free;
            end;
            dbgehMagazineDocs.DataSource.DataSet.Edit;
            uDMDocuments.dmDocs.dsDocs.DataSet.FieldValues['DateCreate']
              := Date();
            uDMDocuments.dmDocs.dsDocs.DataSet.FieldValues['NumberDoc']
              := LastNum;
            dbgehMagazineDocs.DataSource.DataSet.Post;
          end;
        end;

        Next;
      end;
    finally
      EnableControls;

    end;
  end;

  // for i:=0 to dbgehMagazineDocs.SelectedRows.Count-1 do
  // begin
  // if (uDMDocuments.dmDocs.adodsDocs.FieldByName('DateCreate')<>nil) then
  // uDMDocuments.dmDocs.adodsDocs.FieldByName('DateCreate').AsDateTime;
  // dbgehMagazineDocs.DataSource.DataSet.Bookmark:=dbgehMagazineDocs.SelectedRows[i];
end;

procedure TfmDoc.tbResetClick(Sender: TObject);
begin
  inherited;
  self.dbgehMagazineDocs.ClearFilter;
  // dmDocs.dsDocs.DataSet.Filter := 'DateCreate > ''' + DateTimeToStr(dtpStart.Date)+''''+ 'and DateCreate <''' + DateTimeToStr(dtpEnd.Date)+'''';
  // dmDocs.dsDocs.DataSet.Filtered:=true;
  self.dbgehMagazineDocs.DefaultApplyFilter;
end;

end.
