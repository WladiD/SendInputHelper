object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 411
  ClientWidth = 852
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RelativeClickTestButton: TButton
    Left = 184
    Top = 72
    Width = 137
    Height = 33
    Caption = 'Click here (relative)'
    TabOrder = 0
    OnClick = RelativeClickTestButtonClick
  end
  object TargetTestClickButton: TButton
    Left = 352
    Top = 72
    Width = 393
    Height = 249
    Caption = 'Not here'
    TabOrder = 1
    OnClick = TargetTestClickButtonClick
  end
  object AbsoluteClickTestButton: TButton
    Left = 184
    Top = 128
    Width = 137
    Height = 33
    Caption = 'Click here (absolute)'
    TabOrder = 2
    OnClick = AbsoluteClickTestButtonClick
  end
end
