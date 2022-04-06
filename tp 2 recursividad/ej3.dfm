object formej3: Tformej3
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 384
  ClientWidth = 441
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 8
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '0'
  end
  object Memo1: TMemo
    Left = 8
    Top = 39
    Width = 425
    Height = 334
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Button1: TButton
    Left = 358
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object UpDown1: TUpDown
    Left = 129
    Top = 8
    Width = 16
    Height = 21
    Associate = Edit1
    TabOrder = 3
  end
end
