unit CommandController;

interface

uses  Db, Data.Win.ADODB, SysUtils,System.Variants;

type
  TBaseSelectController = class
  private
    FDataSet: TADODataSet;
  protected
    procedure SetFilter(aFilter: string);
  public
    function Refresh: boolean; virtual;
    procedure Save; virtual;
  // function
    constructor Create(source: string); //source - �������� ������ � �� (����� � ����������� where)
    destructor Destroy; virtual;
  end;

  TBaseCommandController = class
  private
    FStoredProc: TADOStoredProc;
  protected
    procedure Refresh;
  public
    constructor Create(ProcName: string);
    destructor Destroy;
  end;

//-----------------����������---------------------------------------------------------------------------------

  TUchPlanController = class(TBaseSelectController)
  private
    FYear: integer;
    FGroup: integer;
    procedure SetGroup(const Value: integer);
    procedure SetYear(const Value: integer);
    function GetUchPlan: integer;
  public
    constructor Create; overload;
    property Group: integer write SetGroup;
    property Year: integer write SetYear;
    property UchPlan: integer read GetUchPlan;
  end;

  TGroupController = class(TBaseSelectController)
  private
    FikGroup: integer;
    FUchPlans: TUchPlanController;
    procedure SetGroup(const Value: integer);
  public
    function GetCurrentUchPlan: integer;                      //������� ����
    function UchPlanByYear(_year: integer):  integer;         //���� �� ���������� ���
    property Group: integer write SetGroup;
    property UchPlan: integer read GetCurrentUchPlan;

    constructor Create; overload;
    destructor Destroy; override;
  end;



  TBRSVedomostController = class(TBaseCommandController)
  public
    constructor Create(ik_grup, nsem, nomer_att: integer); overload;
  end;

  TnoBRSVedomostController = class(TBaseCommandController)
  public
  end;


implementation

uses {uDMUspevaemost,}GeneralController,DateUtils;



{ TBaseSelectController }

constructor TBaseSelectController.Create(source: string);
begin
  FDataSet := TGeneralController.Instance.GetNewADODataSet(false);
  FDataSet.CommandText := 'select * from '+source;
  FDataSet.Open;
end;

destructor TBaseSelectController.Destroy;
begin
  FDataSet.Close;
  FDataSet.Free;
end;

function TBaseSelectController.Refresh: boolean;
begin
  FDataSet.Close;
  FDataSet.Open;
end;

procedure TBaseSelectController.Save;
begin

end;

procedure TBaseSelectController.SetFilter(aFilter: string);
begin
  FDataSet.Filtered := false;
  FDataSet.Filter := aFilter;
  FDataSet.Filtered := true;
end;



{ TGroupController }

constructor TGroupController.Create;
begin
  inherited Create('Grup');
  FUchPlans := TUchPlanController.Create;
end;

destructor TGroupController.Destroy;
begin
  FUchPlans.Free;
  inherited;
end;

function TGroupController.GetCurrentUchPlan: integer;
begin
  Result := UchPlanByYear(YearOf(Now));  //����� ������� ���
end;

procedure TGroupController.SetGroup(const Value: integer);
begin
  SetFilter('ik_grup='+IntToStr(Value));
  FikGroup := Value;
  FUchPlans.Group := Value;
end;

function TGroupController.UchPlanByYear(_year: integer): integer;
begin
  FUchPlans.Year := _year;
  Result := FUchPlans.UchPlan;
  if Result = NULL then Result := 0;
end;

{ TBaseCommandController }

constructor TBaseCommandController.Create(ProcName: string);
begin
  FStoredProc := TGeneralController.Instance.GetNewADOStoredProc(ProcName,false);
end;

destructor TBaseCommandController.Destroy;
begin
  FStoredProc.Active := False;
  FStoredProc.Free;
end;

procedure TBaseCommandController.Refresh;
begin
  FStoredProc.Active := false;
  FStoredProc.ExecProc;
  FStoredProc.Active := true;
end;

{ TBRSVedomostController }

constructor TBRSVedomostController.Create(ik_grup, nsem, nomer_att: integer);
begin
  inherited Create('GetAllAttestForBRSGrup');
  with FStoredProc.Parameters do
  begin
    Clear;
    AddParameter;
    Items[0].Value := ik_grup;
    AddParameter;
    Items[1].Value := nsem;
    AddParameter;
    Items[2].Value := nomer_att;
  end;
  Refresh;
end;

{ TUchPlanController }

constructor TUchPlanController.Create;
begin
  inherited Create('UchPlanGrup');
end;

function TUchPlanController.GetUchPlan: integer;
begin
  Result := FDataSet.FieldByName('Ik_uch_plan').AsInteger;
end;

procedure TUchPlanController.SetGroup(const Value: integer);
begin
  FGroup := Value;
  SetFilter('ik_grup='+IntToStr(Value));
end;

procedure TUchPlanController.SetYear(const Value: integer);
var str: string;
begin
  str := 'year_value = ' + IntToStr(Value);
  if FGroup<>0 then
     str := 'ik_grup = ' + IntToStr(FGroup) + ' and ' + str;
  SetFilter(str);
end;

end.
