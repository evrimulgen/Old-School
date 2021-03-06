{*
    ����� - ����� ������� � ������� �������� � Excel
    ������: 1.0.0.1
    �������: 02.04.2009
    ��������� ������:
    �����: ������� �.�.

    ����������:
    ���� ������� ���������� � ������� ���� � � ���� ���� ����������, �� ����
    ���������, ������� ������ �� ��������� � ������ ����.
    ��� ����� ������� ��������������� ����� ������:
    ���-�� ������=42 ������ � ����*���-�� ��� ��������

    ���-�� ������ �� �������� ���������� ����������� � �� �����.
    ��� ������� - ��������� ������.
    ��������� ���-�� ������ � ��� �������� �� ������.

    ��� ������������������� �� ������� �� ���� �������� ���������� � ��� ���������.
*}
unit D_DiplomVipRep;
  {#Author tanyav@ist.ugtu.net}

interface
uses
  Classes, SysUtils, ExcelXP, Barcode, Contnrs, ReportsBase, DB, ADODB, uDMDiplom,
    Variants, GeneralController, ApplicationController, ExceptionBase, uDiplOtdKardController,
    ConstantRepository;

type
   TDiplomVipExcelReport = class(TExcelReportBase)
  const MainpageNumber = 1;
  const strLength = 60;
  const DiscNextPageAddress = '$F$8';

  private
    FikZach: integer;
    FikGroup: integer;
    FStudName: string;
    Fik_direction: integer;
    FNameInDatPadez: boolean;
    Fik_VidGos: integer;
    Fik_fac: integer;
    CurrentDiskPageNumber: integer;
    function GetNextCellVert(cur: String; StrRest: string = ''): String;
    function GetPrevCellVert(cur: String): String;
    function GetNextCellHor(cur: String): String;
    function LastPos(subStr, str: string): integer;
    function StringFormat(var str: string; strMaxLen:integer): string;
    //function IsNapravl:boolean;
    procedure SelectNextCellVert(var cur: String; var ActRange: Variant; StrRest: string = '');
    procedure SelectPrevCellVert(var cur: String; var ActRange: Variant);
    procedure SelectNextCellHor(var cur: String; var ActRange: Variant);
    procedure SendToExcel;
    procedure SendStringToExcel(var str, cur: string; ActRange: Variant; StrMaxLength: integer = 0);
    procedure LoadData;
    procedure SendExamRowToExcel(Disc, HourCount, Mark: string; var cur: String;
        var ActRange: Variant);
  protected
    procedure Execute;override;
  public
    property ikZach:integer read FikZach write FikZach;
    property ikGroup:integer read FikGroup write FikGroup;
    property StudName:string read FStudName write FStudName;
    property ik_direction:integer read Fik_direction write Fik_direction;
    property ik_VidGos:integer read Fik_VidGos write Fik_VidGos;
    property ik_fac:integer read Fik_fac write Fik_fac;
    property NameInDatPadez:boolean read FNameInDatPadez write FNameInDatPadez;

  end;

  //#NG
  TCustom = class
  public
    Name: string;
    ZE: string;
    Mark: string;
  end;
  //#NG
implementation

{function TDiplomVipExcelReport.IsNapravl:boolean;
begin
  if ((ik_direction=1) or (ik_direction=3)) then
    result:= true
  else
    result:= false;
end;   }

function TDiplomVipExcelReport.LastPos(subStr, str: string): integer;
var poss: integer;
begin
  poss:= Pos(subStr, str);
  result:= poss;
  while (poss>0)  do
  begin
    str:= Copy(str,poss+1,Length(str)-(poss+1));
    poss:= Pos(subStr, str);
    result:= result+poss;
  end;
end;

procedure TDiplomVipExcelReport.LoadData;
begin
  dmDiplom.adospGetVipiscaForDiplom.Close;
  with dmDiplom.adospGetVipiscaForDiplom.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@ik_zach', ftInteger, pdInput, 4, FikZach);
    CreateParameter('@spec', ftInteger, pdInput, 4, 0);
    CreateParameter('@ik_CurGroup', ftInteger, pdInput, 4, FikGroup);
  end;
  dmDiplom.adospGetVipiscaForDiplom.Open;

  {if dmDiplom.adospGetVipiscaForDiplom.IsEmpty then
  begin
    raise EApplicationException.Create('� �������� '+FStudName+' ��� ������ �� �������.');
  end; }

  dmDiplom.adospSelUspevForVipisca.Close;
  with dmDiplom.adospSelUspevForVipisca.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@ik_zach', ftInteger, pdInput, 4, FikZach);
    CreateParameter('@ik_CurGroup', ftInteger, pdInput, 4, FikGroup);
  end;
  dmDiplom.adospSelUspevForVipisca.Open;
  dmDiplom.adospSelUspevForVipisca.First;

  dmDiplom.adospSelKPForVipisca.Close;
  with dmDiplom.adospSelKPForVipisca.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@ik_zach', ftInteger, pdInput, 4, FikZach);
    CreateParameter('@iK_vid_zanyat', ftInteger, pdInput, 4, 8);
    CreateParameter('@ik_CurGroup', ftInteger, pdInput, 4, FikGroup);
  end;
  dmDiplom.adospSelKPForVipisca.Open;

  {dmDiplom.adospSelKRForVipisca.Close;
  with dmDiplom.adospSelKRForVipisca.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@ik_zach', ftInteger, pdInput, 4, FikZach);
    CreateParameter('@iK_vid_zanyat', ftInteger, pdInput, 4, 9);
    CreateParameter('@ik_CurGroup', ftInteger, pdInput, 4, FikGroup);
  end;
  dmDiplom.adospSelKRForVipisca.Open;   }

  dmDiplom.adospSelPractForVipisca.Close;
  with dmDiplom.adospSelPractForVipisca.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@ik_zach', ftInteger, pdInput, 4, FikZach);
    CreateParameter('@ik_CurGroup', ftInteger, pdInput, 4, FikGroup);
  end;
  dmDiplom.adospSelPractForVipisca.Open;

  dmDiplom.adospSelGOSForVipisca.Close;
  with dmDiplom.adospSelGOSForVipisca.Parameters do
  begin
    Clear;
    CreateParameter('@RETURN_VALUE', ftInteger, pdReturnValue, 4, NULL);
    CreateParameter('@ik_zach', ftInteger, pdInput, 4, FikZach);
    CreateParameter('@ik_CurGroup', ftInteger, pdInput, 4, FikGroup);
  end;
  dmDiplom.adospSelGOSForVipisca.Open;
end;

function TDiplomVipExcelReport.GetNextCellVert(cur: String; StrRest: string = ''): String;
var
  num: Integer;
  i: Integer;
  nstr: String;
  bstr: String;
begin
  i := 1;
  while i<=Length(cur) do
  begin
    if (cur[i]<='9') and (cur[i]>='0') then
      break;
    Inc(i);
  end;
  nstr := Copy(cur, i, Length(cur)-i+1);
  bstr := Copy(cur, 1, i-1);
  num := StrToInt(nstr);
  num := num+1;
  //������� �� ��������� ��������
  if (num>57) or ((num>56) and (StrRest.Length >0 ))then
  begin
    CurrentDiskPageNumber:= CurrentDiskPageNumber + 1;
    Result := DiscNextPageAddress
  end
  else
    Result := bstr+IntToStr(num);
end;



function TDiplomVipExcelReport.GetPrevCellVert(cur: String): String;
var
  num: Integer;
  i: Integer;
  nstr: String;
  bstr: String;
begin
  i := 1;
  while i<=Length(cur) do
  begin
    if (cur[i]<='9') and (cur[i]>='0') then
      break;
    Inc(i);
  end;
  nstr := Copy(cur, i, Length(cur)-i+1);
  bstr := Copy(cur, 1, i-1);
  num := StrToInt(nstr);
  num := num-1;
  Result := bstr+IntToStr(num);
end;



function TDiplomVipExcelReport.GetNextCellHor(cur: String): String;
var
  i: Integer;
begin
  i := 2;
  while i<=Length(cur) do
  begin
    if (cur[i]<='A') or (cur[i]>='Z') then
      break;
    Inc(i);
  end;
  Dec(i);
  cur[i] := chr(ord(cur[i])+1);
  Result := cur;
end;



procedure TDiplomVipExcelReport.SelectNextCellHor(var cur: String;
  var ActRange: Variant);
begin
  cur := GetNextCellHor(cur);
  ActRange := Range[cur,cur];
  ActRange.Select;
end;


procedure TDiplomVipExcelReport.SelectNextCellVert(var cur: String; var ActRange: Variant; StrRest: string = '');
begin
  cur := GetNextCellVert(cur, StrRest);
  ActRange := Range[cur,cur];
  ActRange.Select;
end;

procedure TDiplomVipExcelReport.SelectPrevCellVert(var cur: String; var ActRange: Variant);
begin
  cur := GetPrevCellVert(cur);
  ActRange := Range[cur,cur];
  ActRange.Select;
end;

procedure TDiplomVipExcelReport.SendExamRowToExcel(Disc, HourCount,
  Mark: string; var cur: String;
        var ActRange: Variant);
begin

end;

procedure TDiplomVipExcelReport.SendStringToExcel(var str, cur: string; ActRange: Variant; StrMaxLength: integer = 0);
var i: integer;
  str1: string;
begin
  if (StrMaxLength = 0) then
    StrMaxLength:= strLength;
  while Length(str)>StrMaxLength do
  begin
    for i:= StrMaxLength downto 1 do
      if str[i]=' ' then
      begin
        str1 := Copy(str, 1, i);
        Delete(str, 1, i);
        ActRange.Value := str1;
        SelectNextCellVert(cur, ActRange);
        break;
      end;
  end;
  ActRange.Value := str;
end;

procedure TDiplomVipExcelReport.SendToExcel;
const maxDiscStr = 63;
  MaxKRCount = 6;
  MaxPractCount = 8;
var
  FindRange: Variant;
  ActRange: Variant;
  str, str1: String;   // ������, ������� ����� ��������� � ������ ����� � �������
  cur, cur1: String;
  i, weekCount: Integer;
  WithZachEd: boolean;

  //#NG
  FacList: TList;
  ElecList: TList;
  Custom: TCustom;
  varInt: integer;
  varInt2: integer;
  varCountZEFacult: integer;
  varCountAuditHourFacult: integer;
  //#NG
begin
  //Name:= dmDiplom.adospGetVipiscaForDiplomStudName.AsString;
  ActivateWorksheet(MainpageNumber);
  CurrentDiskPageNumber:= 1;

  //����������, �������� �� �������� ������� ��� ����
  WithZachEd:= (ik_direction=3) or (ik_VidGos=2);

  // ����� ����� ��������
  if (NameInDatPadez) then
  begin
    Replace('#�������#', dmDiplom.adospGetVipiscaForDiplomClastname.AsString);
    Replace('#���#', dmDiplom.adospGetVipiscaForDiplomFirstName.AsString);
    Replace('#��������#', dmDiplom.adospGetVipiscaForDiplomPatronymic.AsString);
    Replace('#���������#', dmDiplom.adospGetVipiscaForDiplomCplacebirth.AsString);
    Replace('#�������������#', dmDiplom.adospGetVipiscaForDiplomQualifShortName.AsString);
    Replace('#������#', dmDiplom.adospGetVipiscaForDiplomSpecategory.AsString);
    Replace('#������#', dmDiplom.adospGetVipiscaForDiplomattYear.AsString);
    Replace('#��������#', dmDiplom.adospGetVipiscaForDiplomAttSer.AsString);
    Replace('#��������#', dmDiplom.adospGetVipiscaForDiplomAttNumber.AsString);
    str1:= dmDiplom.adospGetVipiscaForDiplom.FieldByName('Cname_qualif').AsString;
    TDiplOtdKardController.Instance.ParseString(str1, str, 50);
    Replace('#������#', str1);
    Replace('#������2#', str);
  end
  else
  begin
    Replace('#�������#', dmDiplom.adospGetVipiscaForDiplom.FieldByName('iClastname').Value);
    Replace('#���#', dmDiplom.adospGetVipiscaForDiplomiFirstName.AsString);
    Replace('#��������#', dmDiplom.adospGetVipiscaForDiplomiPatronymic.AsString);
    Replace('#������#', dmDiplom.adospGetVipiscaForDiplomattYear.AsString);
    Replace('#DocumName#', dmDiplom.adospGetVipiscaForDiplomdocumName.AsString);
    Replace('#shifr#', dmDiplom.adospGetVipiscaForDiplomSh_spec.AsString);
    Replace('#������#', dmDiplom.adospGetVipiscaForDiplom.FieldByName('Cname_qualif').AsString);
    //Replace('#����#', dmDiplom.adospGetVipiscaForDiplomform.AsString);
    //Replace('#�����#', dmDiplom.adospGetVipiscaForDiplomManagerSmallName.AsString);
    {Replace('#���#', dmDiplom.adospGetVipiscaForDiplomStudName.AsString);
      }
  end;
  str:= GetFullDate(dmDiplom.adospGetVipiscaForDiplomDd_birth.AsDateTime)+' ����';
  Replace('#��������#', str);   //docum

  i:= dmDiplom.adospGetVipiscaForDiplomOchYearObuch.AsInteger;
  str1:= IntToStr(i);
  if (i >4) then
     str1:= str1 + ' ���'
  else
     str1:= str1 + ' ����';
  i:= dmDiplom.adospGetVipiscaForDiplomMonthObuch.AsInteger;
  if ((i > 0) and (i<5)) then
    str1:= str1 +' '+ dmDiplom.adospGetVipiscaForDiplomMonthObuch.AsString+' ������';
  if (i>4) then
    str1:= str1 +' '+ dmDiplom.adospGetVipiscaForDiplomMonthObuch.AsString+' �������';
  Replace('#���#', str1);


  {if dmDiplom.adospGetVipiscaForDiplomDd_VidDipl.Value>0 then
  begin
    str:= TGeneralController.Instance.GetFullDate(dmDiplom.adospGetVipiscaForDiplomDd_VidDipl.AsDateTime);
    Replace('#�������#', str);
  end; }

  if (ik_fac = 22) then
  begin
    Replace('#DocumName#', dmDiplom.adospGetVipiscaForDiplomdocumName.AsString);
    Replace('#�������������#', dmDiplom.adospGetVipiscaForDiplomCname_spec.AsString);
  end;

  Replace('#DateDelivery#', GetFullDate(dmDiplom.adospGetVipiscaForDiplom.FieldByName('DateDiplomDelivery').AsDateTime) +' ����');

  //���������� ����, � ������� � ������ ������ �.�. ����
  FindRange := Find('#������#');
  FindRange.Select;
  ActRange := Selection;
  ActRange.Value2:= dmDiplom.adospGetVipiscaForDiplomRegNumber.AsString;
  FindRange := Find('#������#');
  FindRange.Select;
  ActRange := Selection;
  ActRange.Value2:= dmDiplom.adospGetVipiscaForDiplomVipNumber.AsString;
  //Replace('##', );
  // ����� ���� � ������� (�������� �������������, ����. ����� ������ 80
  // ��������)
  if (ik_direction <> 5) then
  begin

    //if (ik_direction <> 3) then
      //Replace('#���������#', dmDiplom.adospGetVipiscaForDiplom.FieldByName('typeQualif').AsString);

    {if dmDiplom.adospGetVipiscaForDiplomDd_dipl.Value>0 then
    begin
      str:= TGeneralController.Instance.GetFullDate(dmDiplom.adospGetVipiscaForDiplomDd_dipl.AsDateTime);
    end
    else
      str:= '<�� �������>';
    Replace('#�������#', str); }
    //Replace('#������#', dmDiplom.adospGetVipiscaForDiplomyearPostup.AsString);
    //Replace('#�������#', dmDiplom.adospGetVipiscaForDiplomYearGrad.AsString);
    //Replace('#����#', dmDiplom.adospGetVipiscaForDiplomform.AsString);
    if (dmDiplom.adospGetVipiscaForDiplomIsExcellent.AsBoolean) then
      Replace('#���������#', '� ��������')
    else
      Replace('#���������#', '');
    str:= dmDiplom.adospGetVipiscaForDiplomCname_spec.AsString;
    str1:=StringFormat(str, 58);
    Replace('#�������������#', str);
    Replace('#�������������2#', str1);
    i:= 1;
    if (dmDiplom.adospGetVipiscaForDiplomcName_spclz.AsString<>'') then
    begin
      if ((WithZachEd)) then
      begin
        str:= '�������������� (�������) ��������������� ���������: '+dmDiplom.adospGetVipiscaForDiplomcName_spclz.AsString;
      end
      else
        str:= '�������������: '+dmDiplom.adospGetVipiscaForDiplomcName_spclz.AsString;
      str1:=StringFormat(str, 95);
      Replace('#���'+IntToStr(i), str);
      inc(i);
      if (str1<>'') then
      begin
        Replace('#���'+IntToStr(i), str1);
        inc(i);
      end;
    end;


    //������� �� ��� �������� �����������
    //��� ���������� ������ ��-�� ����, ��� ������ ������������
  if ((dmDiplom.adospGetVipiscaForDiplomik_direction.AsInteger = 9) or
      ((dmDiplom.adospGetVipiscaForDiplomik_direction.AsInteger = 2) and
      (dmDiplom.adospGetVipiscaForDiplomYearObuch.AsInteger < 5))
      or (dmDiplom.adospGetVipiscaForDiplomik_spec_fac.AsInteger=169)
      or (FikGroup=6244) ) then
  begin
      Replace('#���'+IntToStr(i), '�������� ���������� �������� �� ��������������� ���������.');
      inc(i);
  end;
  if (dmDiplom.adospGetVipiscaForDiplomOverVWeekCount.AsInteger>0) and
     (dmDiplom.adospGetVipiscaForDiplomOverVUZName.AsString<>'') then
  begin
     weekCount:= dmDiplom.adospGetVipiscaForDiplomOverVWeekCount.AsInteger;
     if (weekCount mod 10=1) and (weekCount <> 11) then
        str:= '����� ��������������� ��������� � ������ '+IntToStr(weekCount)+' ������'
     else
        str:= '����� ��������������� ��������� � ������ '+IntToStr(weekCount)+' ������';
     str:= str+' ������� � '+dmDiplom.adospGetVipiscaForDiplomOverVUZName.AsString+'.';
     str1:=StringFormat(str, 95);
     Replace('#���'+IntToStr(i), str);
     inc(i);
     Replace('#���'+IntToStr(i), str1);
     inc(i);
  end;
  while (i<6) do
  begin
    Replace('#���'+IntToStr(i),'');
    inc(i);
  end;

  FindRange := Find('#��#');
  FindRange.Select;
  ActRange := Selection;
  cur:= ActRange.Address;
  begin
    dmDiplom.adospSelKPForVipisca.First;
    ActRange := Range[cur,cur];
    repeat
    begin
      if (dmDiplom.adospSelKPForVipisca.Eof) then
        str:= ''
      else
      begin
        str := dmDiplom.adospSelKPForVipiscadiscName.AsString;
        if str = '' then str := '���� �� �������';
        //str :=  str+', '+ dmDiplom.adospSelKPForVipiscacOsenca.AsString;
      end;
      	str1:=StringFormat(str, maxDiscStr);   //���������� ������� ������
				ActRange.Value := str;
				if (str1<>'') then
				begin
				  SelectNextCellVert(cur, ActRange);
				  ActRange.Value := str1;    //���������� ������� ������
				end;

				cur1 := Selection.Address;

				SelectNextCellHor(cur1,ActRange);
				str := dmDiplom.adospSelKPForVipiscacOsenca.AsString;
				ActRange.Value := str;

      dmDiplom.adospSelKPForVipisca.Next;
      SelectNextCellVert(cur, ActRange);
    end;
    until dmDiplom.adospSelKPForVipisca.Eof;
  end;

  {
  //����� �������  #��������#
  dmDiplom.adospSelPractForVipisca.First;
  FindRange := Find('#��������#');
  FindRange.Select;
  ActRange := Selection;
  cur:= ActRange.Address;
  repeat
  begin
    if (dmDiplom.adospSelPractForVipisca.Eof) then
      str:= ''
    else
    begin
      str := dmDiplom.adospSelPractForVipisca.FieldByName('cName_disc').AsString;
      str :=  str+', '+ dmDiplom.adospSelPractForVipisca.FieldByName('weekCount').AsString;
      str :=  str +' ������, '+ dmDiplom.adospSelPractForVipisca.FieldByName('cOsenca').AsString;
    end;
    SendStringToExcel(str, cur, ActRange);
    dmDiplom.adospSelPractForVipisca.Next;
    SelectNextCellVert(cur, ActRange);
  end;
  until dmDiplom.adospSelPractForVipisca.Eof;

  //��� ������� #���#
  dmDiplom.adospSelGOSForVipisca.First;
  if (dmDiplom.adospSelPractForVipisca.RecordCount>MaxPractCount) then
    SelectNextCellVert(cur, ActRange)
  else
  begin
    FindRange := Find('#���#');
    FindRange.Select;
    ActRange := Selection;
    cur:= ActRange.Address;
  end;
  repeat
  begin
    if (dmDiplom.adospSelGOSForVipisca.Eof) then
      str:= ''
    else
    begin
      if ((ik_direction = 3) or (ik_direction = 1)) then
        str := '����������������� �� �����������'
      else
        str := '����������������� �� �������������';
      str :=  str +', '+ dmDiplom.adospSelGOSForVipisca.FieldByName('cOsenca').AsString;
    end;
    SendStringToExcel(str, cur, ActRange);
    dmDiplom.adospSelGOSForVipisca.Next;
    SelectNextCellVert(cur, ActRange);
  end;
  until dmDiplom.adospSelGOSForVipisca.Eof;
  }

  //********** ������   �������� *******************
  ActivateWorksheet(MainpageNumber+1);
  // ����� ������
  dmDiplom.adospSelUspevForVipisca.First;
  FindRange := Find('#���#');
  FindRange.Select;
  ActRange := Selection;
  cur:= ActRange.Address;
  SelectPrevCellVert(cur, ActRange);

  //#NG
  FacList:= TList.Create;
  ElecList:= TList.Create;
  varCountZEFacult:=0;
  varCountAuditHourFacult:=0;
  //#NG
  repeat
  begin
    str:= '';
    //
    {if (not dmDiplom.adospSelUspevForVipisca.Eof) then
    begin
      if (dmDiplom.adospSelUspevForVipisca.FieldByName('iK_disc').AsInteger > 0) then
        str := str+dmDiplom.adospSelUspevForVipisca.FieldByName('cName_disc').AsString;
    end;
    str1:=StringFormat(str, maxDiscStr);   //���������� ������� ������
    SelectNextCellVert(cur, ActRange, str1);
    ActRange.Value := str;

    if (str1<>'') then
    begin
      SelectNextCellVert(cur, ActRange);
      ActRange.Value := str1;    //���������� ������� ������
    end;

    cur1 := Selection.Address;
    SelectNextCellHor(cur1,ActRange);
    if (WithZachEd) then
    begin
      str := dmDiplom.adospSelUspevForVipisca.FieldByName('ZECount').AsString+' �.�.';
    end
    else
      str := dmDiplom.adospSelUspevForVipisca.FieldByName('HourCount').AsString+' ���.';
    ActRange.Value := str;

    SelectNextCellHor(cur1,ActRange);
    str := dmDiplom.adospSelUspevForVipisca.FieldByName('cOsenca').AsString;
    ActRange.Value := str;

    dmDiplom.adospSelUspevForVipisca.Next; }
    //inc(i);

    //#NG
    if (not dmDiplom.adospSelUspevForVipisca.Eof) then
    begin
      varInt := dmDiplom.adospSelUspevForVipisca.FieldByName('iK_disc').AsInteger;
      if (varInt > 0)
      then begin
        varInt2 := dmDiplom.adospSelUspevForVipisca.FieldByName('IdTypeDiscipline').AsInteger;
        if (varInt2 = 20)
        then begin
          if (varInt = 5211)
          then begin
            Custom := TCustom.Create;
            Custom.Name := dmDiplom.adospSelUspevForVipisca.FieldByName('cName_disc').AsString;
            Custom.ZE := dmDiplom.adospSelUspevForVipisca.FieldByName('ZECount').AsString;
            if (Custom.ZE = '0') then Custom.ZE := 'x'
            else Custom.ZE := Custom.ZE + ' �.�.';
            Custom.Mark := dmDiplom.adospSelUspevForVipisca.FieldByName('cOsenca').AsString;
            ElecList.Add(Custom);
            varCountZEFacult := varCountZEFacult + dmDiplom.adospSelUspevForVipisca.FieldByName('ZECount').AsInteger;
            //varCountAuditHourFacult := varCountAuditHourFacult + dmDiplom.adospSelUspevForVipisca.FieldByName('AuditHourCount').AsInteger;
          end
          else begin
            Custom := TCustom.Create;
            Custom.Name := dmDiplom.adospSelUspevForVipisca.FieldByName('cName_disc').AsString;
            Custom.ZE := dmDiplom.adospSelUspevForVipisca.FieldByName('ZECount').AsString;
            if (Custom.ZE = '0') then Custom.ZE := 'x'
            else Custom.ZE := Custom.ZE + ' �.�.';
            Custom.Mark := dmDiplom.adospSelUspevForVipisca.FieldByName('cOsenca').AsString;
            FacList.Add(Custom);
            varCountZEFacult := varCountZEFacult + dmDiplom.adospSelUspevForVipisca.FieldByName('ZECount').AsInteger;
            varCountAuditHourFacult := varCountAuditHourFacult + dmDiplom.adospSelUspevForVipisca.FieldByName('AuditHourCount').AsInteger;
          end;
        end
          else begin
            str := str+dmDiplom.adospSelUspevForVipisca.FieldByName('cName_disc').AsString;

            str1:=StringFormat(str, maxDiscStr);   //���������� ������� ������
            SelectNextCellVert(cur, ActRange, str1);
            ActRange.Value := str;

            if (str1<>'') then
            begin
              SelectNextCellVert(cur, ActRange);
              ActRange.Value := str1;    //���������� ������� ������
            end;

            cur1 := Selection.Address;
            SelectNextCellHor(cur1,ActRange);
            if (WithZachEd) then
            begin
              str := dmDiplom.adospSelUspevForVipisca.FieldByName('ZECount').AsString;
              if (StrToInt(str) = 0) then str := 'x'
              else str := str + ' �.�.'

            end
            else str := dmDiplom.adospSelUspevForVipisca.FieldByName('HourCount').AsString+' ���.';

            ActRange.Value := str;

            SelectNextCellHor(cur1,ActRange);
            str := dmDiplom.adospSelUspevForVipisca.FieldByName('cOsenca').AsString;
            ActRange.Value := str;
          end;
      end;
      dmDiplom.adospSelUspevForVipisca.Next;
    end;
    //#NG
  end;
  until (dmDiplom.adospSelUspevForVipisca.FieldByName('iK_disc').AsInteger <= 0);

  {SelectNextCellVert(cur, ActRange);
  str:=  '��������';
  SendStringToExcel(str, cur, ActRange); }



  //����� �������  #��������#
  dmDiplom.adospSelPractForVipisca.First;
  //������� �� ���� ��������, ���� ��� ��� �� ����
  if (CurrentDiskPageNumber = 2) then
  begin
    SelectNextCellVert(cur, ActRange);
    SelectNextCellVert(cur, ActRange);
  end
  else
  begin
    cur := DiscNextPageAddress;
    ActRange := Range[cur,cur];
    ActRange.Select;
  end;

  repeat
  begin
    if (dmDiplom.adospSelPractForVipisca.Eof) then
      str:= ''
    else
    begin
      str := dmDiplom.adospSelPractForVipisca.FieldByName('DiscName').AsString;
    end;
    SendStringToExcel(str, cur, ActRange);
    cur1 := Selection.Address;
    SelectNextCellHor(cur1,ActRange);
    if (WithZachEd {(dmDiplom.adospGetVipiscaForDiplomik_spec_fac.AsInteger=169)}) then
    begin
      str := dmDiplom.adospSelPractForVipisca.FieldByName('ZECount').AsString+' �.�.';
    end
    else
    begin
      str:= GetWeekCountName(dmDiplom.adospSelPractForVipisca.FieldByName('weekCount').AsString);
    end;
    ActRange.Value := str;

    SelectNextCellHor(cur1,ActRange);
    str := dmDiplom.adospSelPractForVipisca.FieldByName('cOsenca').AsString;
    ActRange.Value := str;
    if (dmDiplom.adospSelPractForVipisca.FieldByName('n_sem').AsInteger=0) then
    begin
      SelectNextCellVert(cur, ActRange);
      str:= '� ��� �����:';
      SendStringToExcel(str, cur, ActRange);
    end;
    dmDiplom.adospSelPractForVipisca.Next;
    SelectNextCellVert(cur, ActRange);
  end;
  until dmDiplom.adospSelPractForVipisca.Eof;


  SelectNextCellVert(cur, ActRange);
  str:=  '��������������� �������� ����������';
  SendStringToExcel(str, cur, ActRange);
  dmDiplom.adospSelGOSForVipisca.Last;

  cur1 := Selection.Address;
  SelectNextCellHor(cur1,ActRange);
  if ((dmDiplom.adospSelGOSForVipisca.FieldByName('iHour_gos').AsInteger>0)
    and (dmDiplom.adospSelGOSForVipisca.FieldByName('ik_vid_zanyat').AsInteger=31)) then
    if (WithZachEd) then
    begin
      str := dmDiplom.adospSelGOSForVipisca.FieldByName('ZECount').AsString+' �.�.';
    end
    else
    begin
      str:= GetWeekCountName(dmDiplom.adospSelGOSForVipisca.FieldByName('iHour_gos').AsString);
    end
  else
  begin
    str := 'x';
    ikZach:= -1;
  end;
  ActRange.Value := str;
  SelectNextCellHor(cur1,ActRange);
  str := 'x';

  ActRange.Value := str;
  SelectNextCellVert(cur, ActRange);
  str:= '� ��� �����:';
  SendStringToExcel(str, cur, ActRange);
  SelectNextCellVert(cur, ActRange);

  //��� ������� #���#
  dmDiplom.adospSelGOSForVipisca.First;
  if (not dmDiplom.adospSelGOSForVipisca.Eof) and (dmDiplom.adospSelGOSForVipisca.FieldByName('ik_vid_zanyat').AsInteger = 56) then
  begin
      //if (WithZachEd) then
    str := '�������� ��������������� �������';//'�������� ��������������� ����������������� �������';
    SendStringToExcel(str, cur, ActRange);
    cur1 := Selection.Address;
    SelectNextCellHor(cur1,ActRange);
    str := 'x';
    ActRange.Value := str;
    SelectNextCellHor(cur1,ActRange);
    str := dmDiplom.adospSelGOSForVipisca.FieldByName('cOsenca').AsString;
    ActRange.Value := str;
    SendStringToExcel(str, cur, ActRange);

    SelectNextCellVert(cur, ActRange);
  end;
  end;


  //������
  str:=  '��������� ���������������� ������';
  SendStringToExcel(str, cur, ActRange);
  SelectNextCellVert(cur, ActRange);
  str := dmDiplom.adospGetVipiscaForDiplomcdiplom.AsString;
  SendStringToExcel(str, cur, ActRange);
  cur1 := Selection.Address;
  SelectNextCellHor(cur1,ActRange);
  str := 'x';
  ActRange.Value := str;
  SelectNextCellHor(cur1,ActRange);
  str := dmDiplom.adospGetVipiscaForDiplomOcencaDiplom.AsString;
  ActRange.Value := str;

  //����� ���-�� �����
  SelectNextCellVert(cur, ActRange);
  SelectNextCellVert(cur, ActRange);

  repeat
  begin
    str:= '';
    if (not dmDiplom.adospSelUspevForVipisca.Eof) then
    begin
      str := dmDiplom.adospSelUspevForVipisca.FieldByName('cName_disc').AsString;
    end;
    //str1:=StringFormat(str, maxDiscStr);   //���������� ������� ������
    //ActRange.Value := str;
    SendStringToExcel(str, cur, ActRange);
    cur1 := Selection.Address;
    SelectNextCellHor(cur1,ActRange);
    if ((dmDiplom.adospSelUspevForVipisca.FieldByName('iK_disc').AsInteger<0) and (WithZachEd)) then
    begin
      dmDiplom.adospSelPractForVipisca.First;
      dmDiplom.adospSelGOSForVipisca.Last;
      varInt := dmDiplom.adospSelUspevForVipisca.FieldByName('ZECount').AsInteger
                + dmDiplom.adospSelPractForVipisca.FieldByName('ZECount').AsInteger
                + dmDiplom.adospSelGOSForVipisca.FieldByName('ZECount').AsInteger
                - varCountZEFacult;//�������� ������������
      str := IntToStr(varInt)+' �.�.';
    end
    else begin
      varInt := dmDiplom.adospSelUspevForVipisca.FieldByName('HourCount').AsInteger - varCountAuditHourFacult;
      str := IntToStr(varInt)+' ���.';
    end;

    ActRange.Value := str;

    SelectNextCellHor(cur1,ActRange);
    str := dmDiplom.adospSelUspevForVipisca.FieldByName('cOsenca').AsString;
    ActRange.Value := str;


    dmDiplom.adospSelUspevForVipisca.Next;
    inc(i);
    SelectNextCellVert(cur, ActRange);
  end;
  until (dmDiplom.adospSelUspevForVipisca.Eof);

  //#NG
  if(FacList.Count > 0)
  then begin
    SelectNextCellVert(cur, ActRange);
    str := '�������������� ����������';
    SendStringToExcel(str, cur, ActRange);

    SelectNextCellVert(cur, ActRange);
    str := '� ��� �����:';
    SendStringToExcel(str, cur, ActRange);

    while (FacList.Count > 0) do
    begin
      //��������
      Custom := FacList.First;
      str:= Custom.Name;
      str1:=StringFormat(str, maxDiscStr);   //���������� ������� ������
      SelectNextCellVert(cur, ActRange, str1);
      ActRange.Value := str;

      if (str1<>'') then
      begin
        SelectNextCellVert(cur, ActRange);
        ActRange.Value := str1;    //���������� ������� ������
      end;

      //���. ��.
      cur1 := Selection.Address;
      SelectNextCellHor(cur1,ActRange);
      str := Custom.ZE;
      ActRange.Value := str;

      //������
      SelectNextCellHor(cur1,ActRange);
      str := Custom.Mark;
      ActRange.Value := str;

      //SelectNextCellVert(cur, ActRange);
      FacList.Remove(FacList.First);
    end;
  end;

  SelectNextCellVert(cur, ActRange);
  while (ElecList.Count > 0) do
  begin
    //��������
    Custom := ElecList.First;
    str:= Custom.Name;
    str1:=StringFormat(str, maxDiscStr);   //���������� ������� ������
    SelectNextCellVert(cur, ActRange, str1);
    ActRange.Value := str;

    if (str1<>'') then
    begin
      SelectNextCellVert(cur, ActRange);
      ActRange.Value := str1;    //���������� ������� ������
    end;

    //���. ��.
    cur1 := Selection.Address;
    SelectNextCellHor(cur1,ActRange);
    str := Custom.ZE;
    ActRange.Value := str;

    //������
    SelectNextCellHor(cur1,ActRange);
    str := Custom.Mark;
    ActRange.Value := str;

    //SelectNextCellVert(cur, ActRange);
    ElecList.Remove(ElecList.First);
  end;
  //#NG
  ActivateWorksheet(MainpageNumber);
end;


//���������� ������� ������ ����� strMaxLen (����� ��������� �� ��������)
function TDiplomVipExcelReport.StringFormat(var str: string;
  strMaxLen: integer): string;
var
  CopyPos:integer;
begin
  result:= '';
  if (Length(str)>strMaxLen) then
  begin
    if (str[strMaxLen+1]=' ') then
    begin
      CopyPos:= strMaxLen+1;
    end
    else
    begin
      CopyPos:= LastPos(' ',Copy(str, 1, strMaxLen));
    end;
      result:= Copy(str, CopyPos + 1, Length(str) - CopyPos);
      str:=Copy(str, 1, CopyPos);
  end;
end;

procedure TDiplomVipExcelReport.Execute;
begin
  inherited;
  //�������� ������
  LoadData;

  //����� � Excel
  SendToExcel;
  {ActiveBarcodeApplet.AppletName := 'PDF417Ctrl1';
  ActiveBarcodeApplet.BarcodeHeader := TBarcodeReportHeader.Create;
  ActiveBarcodeApplet.BarcodeHeader.MajorVersion := 1;
  ActiveBarcodeApplet.BarcodeHeader.MinorVersion := 0;
  ActiveBarcodeApplet.BarcodeHeader.ObjectType := 1;
  ActiveBarcodeApplet.BarcodeHeader.OID := Fik_ved;
  ActiveBarcodeApplet.WriteToApplet; }
  Show;
end;

end.

