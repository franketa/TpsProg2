object Formej5: TFormej5
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 475
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 8
    Top = 47
    Width = 467
    Height = 420
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 290
    Top = 8
    Width = 185
    Height = 33
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 97
    Height = 33
    TabOrder = 2
    Text = 'Edit1'
  end
end
