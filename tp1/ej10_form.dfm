object Formej10: TFormej10
  Left = 0
  Top = 0
  Caption = 'Form10'
  ClientHeight = 433
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 15
  object Button1: TButton
    Left = 72
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object EditNroTarjeta: TEdit
    Left = 176
    Top = 73
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 312
    Top = 272
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Button2: TButton
    Left = 128
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Mostrar Tarjeta'
    TabOrder = 3
    OnClick = Button2Click
  end
end
