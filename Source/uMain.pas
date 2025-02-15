unit uMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    lbRows: TLabel;
    eRowCount: TEdit;
    btnExport: TButton;
    eLog: TMemo;
    procedure btnExportClick(Sender: TObject);
  private
    procedure Make(const ARowCount: Integer);
  public
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  System.Math,
  System.Diagnostics,
  Excel4Delphi,
  Excel4Delphi.Stream;

{ TfrmMain }

function RandomString(const ALength: Integer): String;
var
  i: Integer;
  LCharType: Integer;
begin
  Result := '';
  for i := 1 to ALength do
  begin
    LCharType := Random(3);
    case LCharType of
      0: Result := Result + Chr(ord('a') + Random(26));
      1: Result := Result + Chr(ord('A') + Random(26));
      2: Result := Result + Chr(ord('0') + Random(10));
    end;
  end;
end;

procedure TfrmMain.btnExportClick(Sender: TObject);
begin
  Make(StrtoInt(eRowCount.Text));
end;

procedure TfrmMain.Make(const ARowCount: Integer);
var
  LStopWatch: TStopWatch;
  LWorkBook: TZWorkBook;
  LSheet: TZSheet;
  LFileName: string;
  i: Integer;
  j: Integer;
begin
  LFileName := 'XLS_' + ARowCount.ToString + '.xlsx';

  LWorkBook := TZWorkBook.Create(nil);
  try
    LStopWatch := TStopWatch.StartNew;

    LSheet := LWorkBook.Sheets.Add('Sheet1');
    LSheet.ColCount := 40;
    LSheet.RowCount := ARowCount+1;

    LSheet.Cell[0, 0].AsString := '이름';
    LSheet.Cell[1, 0].AsString := '전화번호';
    LSheet.Cell[2, 0].AsString := '주소';
    for j := 3 to 39 do
      LSheet.Cell[j, 0].AsString := '항목' + IntToStr(j-2);

    for i := 1 to ARowCount do
    begin
      LSheet.Cell[0, i].AsString := RandomString(12);
      LSheet.Cell[1, i].AsString := RandomString(15);
      LSheet.Cell[2, i].AsString := RandomString(80);
      for j := 3 to 39 do
        LSheet.Cell[j, i].AsInteger := 100000 + Random(1000000);
    end;

    LWorkBook.SaveToFile(LFileName);
    LStopWatch.Stop;

    eLog.Lines.Add('소요시간: ' + LStopWatch.ElapsedMilliseconds.ToString + ' msec');
  finally
    LWorkBook.Free;
  end;
end;

initialization
  Randomize();
end.
