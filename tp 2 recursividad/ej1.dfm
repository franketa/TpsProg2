object FormEj1: TFormEj1
  Left = 0
  Top = 0
  Caption = 'FormEj1'
  ClientHeight = 347
  ClientWidth = 343
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
    Left = 8
    Top = 5
    Width = 110
    Height = 13
    Caption = 'Ingrese la palabra aqu'#237
  end
  object Memo1: TMemo
    Left = 8
    Top = 51
    Width = 323
    Height = 283
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 256
    Top = 20
    Width = 75
    Height = 25
    Caption = 'Ingresar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 24
    Width = 242
    Height = 21
    TabOrder = 2
  end
end
