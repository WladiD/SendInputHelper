program PingGoogle;

{$APPTYPE CONSOLE}

uses
	SysUtils,
	Windows,
	SendInputHelper in '..\..\SendInputHelper.pas';

procedure Main;
var
	SIH:TSendInputHelper;

	procedure SwitchWithTab;
	begin
		with SIH do
		begin
			AddShift([ssAlt], TRUE, FALSE);
			AddDelay(50);
			AddVirtualKey(VK_TAB, TRUE, FALSE);
			AddDelay(50);
			AddVirtualKey(VK_TAB, FALSE, TRUE);
			AddShift([ssAlt], FALSE, TRUE);
			AddDelay(50);
		end;
	end;

	procedure SendLine(Line:String; Delay:Integer = 100);
	begin
		SIH.AddText(Line, TRUE);
		SwitchWithTab;
		SIH.AddText(Line, TRUE);
		SwitchWithTab;
		SIH.AddDelay(Delay);
		SIH.Flush;
	end;

	function IsWin7OrAbove:Boolean;
	begin
		Result:=((Win32MajorVersion * 1000) + Win32MinorVersion) >= 6001;
	end;
begin
	Writeln('A command shell and a notepad-instance will be launched [ENTER]');
	Readln;

	SIH:=TSendInputHelper.Create;
	try
		with SIH do
		begin
			// Start command shell
			AddShortCut([ssWin], 'r');
			AddDelay(100);
			AddText('cmd', TRUE);
			AddDelay(500);
			// Align on the left screen side (shortcut available since Win 7)
			if IsWin7OrAbove then
			begin
				AddShortCut([ssWin], VK_LEFT);
				AddDelay(150);
			end;

			// Start notepad
			AddShortCut([ssWin], 'r');
			AddDelay(100);
			AddText('notepad', TRUE);
			AddDelay(500);
			// Align on the right screen side (shortcut available since Win 7)
			if IsWin7OrAbove then
			begin
				AddShortCut([ssWin], VK_RIGHT);
				AddDelay(150);
			end;

			Flush;
		end;

		SendLine('cls');
		SendLine('ping google.de', 1000);
		SendLine('ping gmail.com', 1000);
		{**
		 * Little promotion
		 *}
		with SIH do
		begin
			AddVirtualKey(VK_RETURN);
			AddText('This is a example, how it can be easy', TRUE);
			AddDelay(100);
			AddText('to use the Windows.SendInput-API. ', TRUE);
			AddVirtualKey(VK_RETURN);
			AddText('Test of Unicode: ');
			AddText('Привет! Cześć! 你好! !שלום', TRUE);
			AddDelay(100);
			AddVirtualKey(VK_RETURN);
			AddText('Simplified by the SendInputHelper (Unit for Delphi):', TRUE);
			AddDelay(100);
			AddText('http://sourceforge.net/projects/sendinputhelper/');

			Flush;
		end;
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
