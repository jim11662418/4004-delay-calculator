program ISZ;

uses
  Forms,
  Main in 'Main.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ISZ';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
