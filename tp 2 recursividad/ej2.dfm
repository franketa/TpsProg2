object formej2: Tformej2
  Left = 0
  Top = 0
  Caption = 'formej2'
  ClientHeight = 297
  ClientWidth = 297
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 84
    Top = 20
    Width = 6
    Height = 13
    Caption = 'x'
  end
  object Memo1: TMemo
    Left = 8
    Top = 44
    Width = 281
    Height = 245
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 13
    Top = 17
    Width = 65
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 96
    Top = 17
    Width = 73
    Height = 21
    TabOrder = 2
    Text = 'Edit2'
  end
  object Button1: TButton
    Left = 214
    Top = 15
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    OnClick = Button1Click
  end
end
