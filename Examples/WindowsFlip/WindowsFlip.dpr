program WindowsFlip;

{$APPTYPE CONSOLE}

uses
	SysUtils,
	Windows,
	SendInputHelper in '..\..\SendInputHelper.pas';

procedure Main;
var
	cc:Integer;
begin
	with TSendInputHelper.Create do
	begin
		AddShift([ssWin], TRUE, FALSE);
		for cc:=1 to 20 do
		begin
			AddVirtualKey(VK_TAB, TRUE, FALSE);
			AddDelay(100);
		end;
		AddVirtualKey(VK_TAB, FALSE, TRUE);
		AddVirtualKey(VK_ESCAPE);
		AddShift([ssWin], FALSE, TRUE);
		Flush;
		Free;
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
