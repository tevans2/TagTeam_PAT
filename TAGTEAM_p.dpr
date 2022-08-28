program TAGTEAM_p;

uses
  Vcl.Forms,
  SQL_CONNECTION_u in 'SQL_CONNECTION_u.pas' {Demonstration},
  dmTAGTEAM_u in 'dmTAGTEAM_u.pas' {dmTAGTEAM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDemonstration, Demonstration);
  Application.CreateForm(TdmTAGTEAM, dmTAGTEAM);
  Application.Run;
end.
