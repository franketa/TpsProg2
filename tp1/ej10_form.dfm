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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 137
    Height = 15
    Caption = 'Mostrar datos de la tarjeta'
  end
  object Button1: TButton
    Left = 8
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
  object EditNroTarjeta: TEdit
    Left = 89
    Top = 145
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 272
    Top = 8
    Width = 342
    Height = 417
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Button2: TButton
    Left = 160
    Top = 8
    Width = 97
    Height = 33
    Caption = 'Mostrar '
    TabOrder = 3
    OnClick = Button2Click
  end
end
