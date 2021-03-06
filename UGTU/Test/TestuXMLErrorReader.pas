unit TestuXMLErrorReader;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested. Add some... ����������������������� �����������������   ���������������

}

interface

uses
  TestFramework, Windows, XMLIntf, Dialogs, Registry, SysUtils, XMLDoc, Variants, ComObj,
  uXMLErrorReader,  Classes;    
type
  // Test methods for class TErrorDescription

  TestTErrorDescription = class(TTestCase)
  strict private
    FErrorDescription: TErrorDescription;
  published
  end;
  // Test methods for class TXMLErrorReader

  TestTXMLErrorReader = class(TTestCase)
  private
    procedure TestException(ExceptionClass: ExceptClass; msg : string);
    procedure TestExceptionWithErrorCode(E: Exception);
    procedure TestExceptionWithWrongFile(fname:string);
    procedure TestExceptionWithEmptyFile(fname:string; ExceptionClass: ExceptClass);
  published
    procedure TestGetErrorDescriptionFromXML_AccessViolation;
    procedure TestGetErrorDescriptionFromXML_Exception;
    procedure TestGetErrorDescriptionFromXML_OleException;
    procedure TestGetErrorDescriptionFromXML_IncorrectFileName;
    procedure TestGetErrorDescriptionFromXML_IncorrectFile;
    procedure TestGetErrorDescriptionFromXML_EmptyFile;
  end;

implementation

procedure TestTXMLErrorReader.TestExceptionWithWrongFile(fname:string);
var
  FXMLErrorReader: TXMLErrorReader;
begin
  // Initialize
  FXMLErrorReader := TXMLErrorReader.Create(fname);
  try
  // Assert
  CheckNull(FXMLErrorReader.GetXML);
  //Cleanup;
  finally
     FXMLErrorReader.Free;
  end;

end;

procedure TestTXMLErrorReader.TestExceptionWithEmptyFile(fname: string; ExceptionClass: ExceptClass);
var
  ReturnValue: TErrorDescription;
  FXMLErrorReader: TXMLErrorReader;
  E:Exception;
begin
  // Initialize
  try
  FXMLErrorReader := TXMLErrorReader.Create(fname);
  E := ExceptionClass.Create('not to be displayed ever');
  ReturnValue := FXMLErrorReader.GetErrorDescriptionFromXML(E);
  // Assert
  CheckNull(ReturnValue);
  //Cleanup;
  finally
     FXMLErrorReader.Free;
     E.Free;
     ReturnValue.Free;
  end;

end;

procedure TestTXMLErrorReader.TestExceptionWithErrorCode(E: Exception);
var
  ReturnValue: TErrorDescription;
  FXMLErrorReader: TXMLErrorReader;
  xmlStream : TResourceStream;
begin
  // Initialize
  try
   xmlStream:=TResourceStream.Create(hInstance,'XML_Errors',RT_RCDATA);
//  (hinstance, 'XML_ERRORS' ,'RCDATA');
  FXMLErrorReader:=TXMLErrorReader.Create(xmlStream);
  // Execute
  ReturnValue := FXMLErrorReader.GetErrorDescriptionFromXML(E);
  // Assert
  CheckNotNull(ReturnValue);
  Check(ReturnValue.ErrorClass=E.ClassName);
  Check(ReturnValue.ErrorCode=(E as EOleException).ErrorCode);
  //Cleanup;
  finally
     FXMLErrorReader.Free;
     E.Free;
     ReturnValue.Free;
  end;

end;


procedure TestTXMLErrorReader.TestException(ExceptionClass: ExceptClass; msg:string);
var
  ReturnValue: TErrorDescription;
  E: Exception;
  FXMLErrorReader: TXMLErrorReader;
  XMLDoc : TXMLDocument;
  xmlStream : TResourceStream;

begin
  // Initialize

  xmlStream:=TResourceStream.Create(hInstance,'XML_Errors',RT_RCDATA);
//  (hinstance, 'XML_ERRORS' ,'RCDATA');
  FXMLErrorReader:=TXMLErrorReader.Create(xmlStream);
  //XMLReader:=TXMLErrorReader.Create('ErrorBase.xml');
   try
  E := ExceptionClass.Create(msg);
  // Execute
  ReturnValue := FXMLErrorReader.GetErrorDescriptionFromXML(E);
  // Assert
  CheckNotNull(ReturnValue);
  Check(ReturnValue.ErrorClass=E.ClassName);
  //Cleanup;
  finally
     FXMLErrorReader.Free;
     E.Free;
     ReturnValue.Free;
  end;

end;

procedure TestTXMLErrorReader.TestGetErrorDescriptionFromXML_AccessViolation;
begin
  TestException(EAccessViolation, 'Access Violation');
end;

procedure TestTXMLErrorReader.TestGetErrorDescriptionFromXML_EmptyFile;
begin
  TestExceptionWithEmptyFile('C:\Documents and Settings\serg.IST\������� ����\UGTU\ErrorBase_empty.xml',Exception);
end;

procedure TestTXMLErrorReader.TestGetErrorDescriptionFromXML_Exception;
begin
  TestException(Exception, 'Test exception');
end;

procedure TestTXMLErrorReader.TestGetErrorDescriptionFromXML_IncorrectFile;
begin
  TestExceptionWithWrongFile('C:\Documents and Settings\serg.IST\������� ����\UGTU\ErrorBase_incorrect.xml');
end;

procedure TestTXMLErrorReader.TestGetErrorDescriptionFromXML_IncorrectFileName;
begin
  TestExceptionWithWrongFile('C:\Documents and Settings\serg.IST\������� ����\UGTU\ErrorBas.xml');
end;

procedure TestTXMLErrorReader.TestGetErrorDescriptionFromXML_OleException;
begin
  TestExceptionWithErrorCode(EOleException.Create('test ole exception',-2147217911,'','',0));
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTErrorDescription.Suite);
  RegisterTest(TestTXMLErrorReader.Suite);
end.

