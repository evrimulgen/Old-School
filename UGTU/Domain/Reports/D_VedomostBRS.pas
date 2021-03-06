unit D_VedomostBRS;
  {#Author sergdev@ist.ugtu.net}
interface

uses
  Classes, dialogs ,SysUtils, ExcelXP, Barcode, Contnrs, XIntf, CommonIntf, ReportsBase, db, adodb;

const TableBeg = 13;

type
    TBRSReport = class(TExcelReportBase)
    private
       FDataset:TADODataset;
       FFaculty:string;
       FGroup:string;
       FSemester:integer;
       FDiscipline:string;
       FExaminator:string;
       FDate:string;
       FNum:string;

    protected
       procedure Execute;override;
       function GetTotalSteps:Integer;override;
    public
       constructor Create (AOwner : TComponent; dsVed : TAdoDataset);
       constructor CreateFull (AOwner : TComponent; dsVed : TAdoDataset; fac,group,disc,exam, num, date:string;sem:integer);

    end;

    implementation

  constructor TBRSReport.Create (AOwner : TComponent; dsVed : TAdoDataset);
  begin
  inherited Create(AOwner);
  FDataset := dsVed;
  end;

  constructor TBRSReport.CreateFull (AOwner : TComponent; dsVed : TAdoDataset; fac,group,disc,exam, num, date:string;sem:integer);
  begin
  inherited Create(AOwner);
  FDataset := dsVed;
  FFaculty := fac;
  FGroup := group;
  FSemester := sem;
  FDiscipline := disc;
  FExaminator := exam;
  FDate:=date;
  FNum:=num;
  end;

  procedure TBRSReport.Execute;
  var
    i : Integer;
  begin
    inherited;
     if FDataset = nil then
     exit;

     if not FDataset.Active then
     begin
     showmessage('�������� ��������� ��� ������!');
     exit;
     end;
    FDataset.DisableControls;
    try
    FDataset.First;
    Range['B15','G23'].Copy(Range['K15','P23']);
    Range['B15','G23'].Clear;
    Range['K15','P23'].Copy(Range['B'+intToStr(15+FDataset.RecordCount-1),'G'+intToStr(23+FDataset.RecordCount-1)]);
    Range['K15','P23'].Clear;

    Items[2,1] := '��������� ��������� ��������� �'+Fnum;
    Items[4,3] := FFaculty;
    Items[5,3] := FGroup;
    Items[6,3] := FSemester;
    Items[7,3] := FDiscipline;
    Items[8,3] := FExaminator;
    Items[9,3] := FDate;

    for i := 0 to FDataset.RecordCount-1 do
    begin
      Range['A'+inttostr(TableBeg+i),'G'+inttostr(TableBeg+i)].NumberFormat := '@';
      Items[TableBeg+i,1] := i+1;
      Items[TableBeg+i,2] := FDataset.FieldByName('StudName').Value;
      Items[TableBeg+i,3] := FDataset.FieldByName('nn_zach').Value;
      Items[TableBeg+i,4] := FDataset.FieldByName('i_sumballs').Value;
      Items[TableBeg+i,5] := FDataset.FieldByName('i_balls').Value;
      Items[TableBeg+i,6] := FDataset.FieldByName('i_allballs').Value;
      Range['A'+inttostr(TableBeg+i),'G'+inttostr(TableBeg+i)].Font.Size:=10;
      Range['A'+inttostr(TableBeg+i),'G'+inttostr(TableBeg+i)].Font.Name := 'Times New Roman';
      Range['B'+inttostr(TableBeg+i),'B'+inttostr(TableBeg+i)].HorizontalAlignment:= xlLeft ;
      Range['C'+inttostr(TableBeg+i),'G'+inttostr(TableBeg+i)].HorizontalAlignment:= xlCenter ;
      NextStep(1, 'Progress '+ IntToStr(i+1));
      FDataset.Next;
    end;

    Range['A'+inttostr(TableBeg-1),'G'+intToStr(13+FDataset.RecordCount-1)].Borders.Weight:=2;

    finally
        FDataset.EnableControls;
    end;
  end;

  //��������� ����� ����� ����� � �������� �������
  //�������� ����� ����� ������ ����� ����� ����� ����������
  //�������, ������������ �������� ��� ������
  //Example: Result := MyDataSet.Recordscount;
  function TBRSReport.GetTotalSteps: Integer;
  begin
    Result := FDataset.RecordCount;
  end;

end.
