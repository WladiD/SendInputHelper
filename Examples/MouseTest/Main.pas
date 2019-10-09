unit Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.UITypes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,

  SendInputHelper;

type
  TMainForm = class(TForm)
    RelativeClickTestButton: TButton;
    TargetTestClickButton: TButton;
    AbsoluteClickTestButton: TButton;
    procedure TargetTestClickButtonClick(Sender: TObject);
    procedure RelativeClickTestButtonClick(Sender: TObject);
    procedure AbsoluteClickTestButtonClick(Sender: TObject);
  private
    SIH: TSendInputHelper;
  public
    { Public-Deklarationen }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.RelativeClickTestButtonClick(Sender: TObject);
begin
  if not Assigned(SIH) then
    SIH := TSendInputHelper.Create;

  SIH.AddRelativeMouseMove(100, 80);
  SIH.AddMouseClick(mbLeft);
  SIH.Flush;
end;

procedure TMainForm.AbsoluteClickTestButtonClick(Sender: TObject);
var
  TargetPos: TPoint;
begin
  if not Assigned(SIH) then
    SIH := TSendInputHelper.Create;

  TargetPos := TargetTestClickButton.BoundsRect.Location;
  TargetPos.X := TargetPos.X + (TargetTestClickButton.Width div 2);
  TargetPos.Y := TargetPos.Y + (TargetTestClickButton.Height div 2);
  TargetPos := ClientToScreen(TargetPos);

  SIH.AddAbsoluteMouseMove(TargetPos.X, TargetPos.Y);
  SIH.AddMouseClick(mbLeft);
  SIH.Flush;
end;

procedure TMainForm.TargetTestClickButtonClick(Sender: TObject);
begin
  if Assigned(SIH) then
  begin
    ShowMessage('Yeah it has clicked through TSendInputHelper!');
    FreeAndNil(SIH);
  end
  else
    ShowMessage('You should not click here manually');
end;

end.
