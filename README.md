# SendInputHelper
SendInputHelper is a unit for Delphi, that contains a class for simple and safe usage 
for the SendInput-API of Windows. With it you can pass any chars, strings, "shift"-keys 
and shortcuts as regular keyboard strokes.

## Example
```delphi
uses
  ..., SendInputHelper;

procedure TForm1.Button1Click(Sender: TObject);
var
  SIH: TSendInputHelper;
begin
  SIH := TSendInputHelper.Create;
  try
    // Start command shell
    SIH.AddShortCut([ssWin], 'r'); // Win+R
    SIH.AddDelay(100);
    SIH.AddText('cmd', True); // Second parameter True means AppendReturn
    SIH.AddDelay(500);

    SIH.AddText('ping google.de', True); // Perform a ping.

    SIH.Flush; // Isn't it easy?
  finally
    SIH.Free;
  end;
end;
```
