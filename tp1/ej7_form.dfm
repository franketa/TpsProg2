object FormEj7: TFormEj7
  Left = 0
  Top = 0
  Caption = 'FormEj7'
  ClientHeight = 216
  ClientWidth = 730
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 85
    Width = 42
    Height = 13
    Caption = 'Desde...'
  end
  object Label2: TLabel
    Left = 134
    Top = 85
    Width = 40
    Height = 13
    Caption = 'Hasta...'
  end
  object Label3: TLabel
    Left = 24
    Top = 12
    Width = 146
    Height = 13
    Caption = 'Fecha a consultar recaudaci'#243'n'
  end
  object Label4: TLabel
    Left = 24
    Top = 66
    Width = 114
    Height = 13
    Caption = 'Consultar rango de d'#237'as'
  end
  object Label5: TLabel
    Left = 24
    Top = 138
    Width = 117
    Height = 13
    Caption = 'Escribir datos en archivo'
  end
  object Memo1: TMemo
    Left = 333
    Top = 7
    Width = 388
    Height = 201
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object DateTimePicker1: TDateTimePicker
    Left = 24
    Top = 104
    Width = 87
    Height = 21
    Date = 44621.000000000000000000
    Time = 44621.000000000000000000
    MaxDate = 44621.999988425920000000
    MinDate = 44621.000000000000000000
    TabOrder = 1
  end
  object DateTimePicker2: TDateTimePicker
    Left = 134
    Top = 104
    Width = 88
    Height = 21
    Date = 44623.000000000000000000
    Time = 44623.000000000000000000
    MaxDate = 44623.999988425920000000
    MinDate = 44621.000000000000000000
    TabOrder = 2
  end
  object DateTimePicker3: TDateTimePicker
    Left = 24
    Top = 31
    Width = 87
    Height = 21
    Date = 44621.000000000000000000
    Time = 44621.000000000000000000
    MaxDate = 44623.999988425920000000
    MinDate = 44621.000000000000000000
    TabOrder = 3
  end
  object Button1: TButton
    Left = 240
    Top = 27
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 4
  end
  object Button2: TButton
    Left = 240
    Top = 100
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 5
  end
  object Button3: TButton
    Left = 24
    Top = 157
    Width = 75
    Height = 25
    Caption = 'Escribir'
    TabOrder = 6
  end
end
