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
  object Label1: TLabel
    Left = 8
    Top = 93
    Width = 137
    Height = 15
    Caption = 'Mostrar datos de la tarjeta'
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 71
    Height = 15
    Caption = 'Cargar tarjeta'
  end
  object Button1: TButton
    Left = 169
    Top = 21
    Width = 97
    Height = 40
    Caption = 'Cargar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 272
    Top = 8
    Width = 342
    Height = 417
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Button2: TButton
    Left = 169
    Top = 82
    Width = 97
    Height = 40
    Caption = 'Mostrar '
    TabOrder = 2
    OnClick = Button2Click
  end
  object inputNroTarjeta: TMaskEdit
    Left = 8
    Top = 29
    Width = 114
    Height = 23
    EditMask = '0000000000000000;0;-'
    MaxLength = 16
    TabOrder = 3
    Text = ''
  end
end
