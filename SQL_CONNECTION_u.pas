unit SQL_CONNECTION_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DbxSqlite, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Vcl.StdCtrls, dmTAGTEAM_u;

type
  TDemonstration = class(TForm)
    executeButton: TButton;
    connectButton: TButton;
    outputMemo: TMemo;
    SQLConnection1: TSQLConnection;
    SQLQuery1: TSQLQuery;
    DataSource1: TDataSource;
    procedure connectButtonClick(Sender: TObject);
    procedure executeButtonClick(Sender: TObject);
    procedure ShowSelectResults();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Demonstration: TDemonstration;

implementation

{$R *.dfm}



procedure TDemonstration.connectButtonClick(Sender: TObject);
begin
  SQLConnection1.Params.Add('Database=tagteam.sqlite3');
  try
    SQLConnection1.Connected := true;            //test test
    executeButton.Enabled := true;
    outputMemo.Text := 'Connection Established!';
  except
    on E: EDatabaseError do
      ShowMessage('Exception raised with message' + E.Message);
  end;
end;

procedure TDemonstration.executeButtonClick(Sender: TObject);
var
  query: String;
begin
  outputMemo.ClearSelection;
  query := 'SELECT * from USER;';
  try
    SQLQuery1.SQL.Text := query;
    SQLQuery1.Active := true;
  except
    on E: Exception do
      outputMemo.Text := 'Exception raised with message: ' + E.Message;
  end;
  ShowSelectResults();
end;

procedure TDemonstration.ShowSelectResults();
var
  names: TStringList;
  i: Integer;
  currentField: TField;
  currentLine: string;
begin
  if not SQLQuery1.IsEmpty then
  begin
    SQLQuery1.First;
    names := TStringList.Create;
    try
      SQLQuery1.GetFieldNames(names);
      while not SQLQuery1.Eof do
      begin
        currentLine := '';
        for i := 0 to names.Count - 1 do
          begin
            currentField := SQLQuery1.FieldByName(names[i]);
            currentLine :=  currentLine + ' ' + currentField.AsString;
          end;
          outputMemo.Lines.Add(currentLine);
          SQLQuery1.Next;
      end;
    finally
      names.Free;
    end;
  end;
end;

end.
