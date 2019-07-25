program PingGoogle;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  Windows,
  SendInputHelper in '..\..\SendInputHelper.pas';

procedure Main;
var
  SIH: TSendInputHelper;

  procedure SwitchWithTab;
  begin
    SIH.AddShift([ssAlt], True, False);
    SIH.AddDelay(50);
    SIH.AddVirtualKey(VK_TAB, True, False);
    SIH.AddDelay(50);
    SIH.AddVirtualKey(VK_TAB, False, True);
    SIH.AddShift([ssAlt], False, True);
    SIH.AddDelay(50);
  end;

  procedure SendLine(Line: string; Delay: Integer = 100);
  begin
    SIH.AddText(Line, True);
    SwitchWithTab;
    SIH.AddText(Line, True);
    SwitchWithTab;
    SIH.AddDelay(Delay);
    SIH.Flush;
  end;

  function IsWin7OrAbove: Boolean;
  begin
    Result := ((Win32MajorVersion * 1000) + Win32MinorVersion) >= 6001;
  end;
begin
  Writeln('A command shell and a notepad-instance will be launched [ENTER]');
  Readln;

  SIH := TSendInputHelper.Create;
  try
    // Start command shell
    SIH.AddShortCut([ssWin], 'r');
    SIH.AddDelay(100);
    SIH.AddText('cmd', True);
    SIH.AddDelay(500);
    // Align on the left screen side (shortcut available since Win 7)
    if IsWin7OrAbove then
    begin
      SIH.AddShortCut([ssWin], VK_LEFT);
      SIH.AddDelay(150);
    end;

    // Start notepad
    SIH.AddShortCut([ssWin], 'r');
    SIH.AddDelay(100);
    SIH.AddText('notepad', True);
    SIH.AddDelay(500);
    // Align on the right screen side (shortcut available since Win 7)
    if IsWin7OrAbove then
    begin
      SIH.AddShortCut([ssWin], VK_RIGHT);
      SIH.AddDelay(150);
    end;

    SIH.Flush;

    SendLine('cls');
    SendLine('ping google.de', 1000);
    SendLine('ping gmail.com', 1000);

    // Some self promo ;-)
    SIH.AddVirtualKey(VK_RETURN);
    SIH.AddText('This is a example, how it can be easy', True);
    SIH.AddDelay(100);
    SIH.AddText('to use the Windows.SendInput-API. ', True);
    SIH.AddVirtualKey(VK_RETURN);
    SIH.AddText('Test of Unicode: ');
    SIH.AddText('Привет! Cześć! 你好! !שלום éèáà', True);
    SIH.AddDelay(100);
    SIH.AddVirtualKey(VK_RETURN);
    SIH.AddText('Simplified by the SendInputHelper (Unit for Delphi):', True);
    SIH.AddDelay(100);
    SIH.AddText('https://github.com/WladiD/SendInputHelper');

    SIH.Flush;
  finally
    SIH.Free;
  end;

  WriteLn('All keystrokes was flushed. Press [Enter] to exit.');
  Readln;
end;

begin
  try
    Main;
  except
    on E:Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
