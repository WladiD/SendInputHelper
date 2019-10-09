program MouseTest;

uses
  Vcl.Forms,
  Main in 'Main.pas' {MainForm},
  SendInputHelper in '..\..\SendInputHelper.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
