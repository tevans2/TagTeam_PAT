unit dmTAGTEAM_u;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DbxSqlite, Data.DB,
  Data.SqlExpr;

type
  TdmTAGTEAM = class(TDataModule)
    SQLQuery1: TSQLQuery;
    SQLConnection1: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmTAGTEAM: TdmTAGTEAM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
