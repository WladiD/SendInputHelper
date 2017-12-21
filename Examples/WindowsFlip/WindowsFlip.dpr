program WindowsFlip;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows,
  SendInputHelper in '..\..\SendInputHelper.pas';

procedure Main;
var
  cc: Integer;
  SIH: TSendInputHelper;
begin
  SIH := TSendInputHelper.Create;
  try
    SIH.AddShift([ssWin], True, False);
    for cc := 1 to 20 do
    begin
      SIH.AddVirtualKey(VK_TAB, True, False);
      SIH.AddDelay(100);
    end;
    SIH.AddVirtualKey(VK_TAB, False, True);
    SIH.AddVirtualKey(VK_ESCAPE);
    SIH.AddShift([ssWin], False, True);
    SIH.Flush;
  finally
    SIH.Free;
  end;
end;

begin
  try
    Main;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
