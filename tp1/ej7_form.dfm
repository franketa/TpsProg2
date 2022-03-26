object FormEj7: TFormEj7
  Left = 0
  Top = 0
  Caption = 'FormEj7'
  ClientHeight = 314
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
    Left = 16
    Top = 183
    Width = 42
    Height = 13
    Caption = 'Desde...'
  end
  object Label2: TLabel
    Left = 126
    Top = 183
    Width = 40
    Height = 13
    Caption = 'Hasta...'
  end
  object Label3: TLabel
    Left = 16
    Top = 110
    Width = 146
    Height = 13
    Caption = 'Fecha a consultar recaudaci'#243'n'
  end
  object Label4: TLabel
    Left = 16
    Top = 164
    Width = 114
    Height = 13
    Caption = 'Consultar rango de d'#237'as'
  end
  object Label5: TLabel
    Left = 16
    Top = 247
    Width = 117
    Height = 13
    Caption = 'Escribir datos en archivo'
  end
  object Label6: TLabel
    Left = 16
    Top = 11
    Width = 104
    Height = 13
    Caption = 'Definir tarifa por hora'
  end
  object Label7: TLabel
    Left = 16
    Top = 30
    Width = 6
    Height = 13
    Caption = '$'
  end
  object Memo1: TMemo
    Left = 325
    Top = 105
    Width = 388
    Height = 201
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object DateTimePicker1: TDateTimePicker
    Left = 16
    Top = 202
    Width = 87
    Height = 21
    Date = 44621.000000000000000000
    Time = 44621.000000000000000000
    MaxDate = 44621.999988425920000000
    MinDate = 44621.000000000000000000
    TabOrder = 1
  end
  object DateTimePicker2: TDateTimePicker
    Left = 126
    Top = 202
    Width = 88
    Height = 21
    Date = 44623.000000000000000000
    Time = 44623.000000000000000000
    MaxDate = 44623.999988425920000000
    MinDate = 44621.000000000000000000
    TabOrder = 2
  end
  object DateTimePicker3: TDateTimePicker
    Left = 16
    Top = 129
    Width = 87
    Height = 21
    Date = 44621.000000000000000000
    Time = 44621.000000000000000000
    MaxDate = 44623.999988425920000000
    MinDate = 44621.000000000000000000
    TabOrder = 3
  end
  object Button1: TButton
    Left = 232
    Top = 125
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 4
  end
  object btnConsultarRangoDado: TButton
    Left = 232
    Top = 198
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 5
  end
  object btnEscribirArchivo: TButton
    Left = 232
    Top = 242
    Width = 75
    Height = 25
    Caption = 'Escribir'
    TabOrder = 6
  end
  object Button4: TButton
    Left = 232
    Top = 25
    Width = 75
    Height = 25
    Caption = 'Definir'
    TabOrder = 7
  end
  object Edit1: TEdit
    Left = 28
    Top = 27
    Width = 87
    Height = 21
    NumbersOnly = True
    TabOrder = 8
    TextHint = 'tarifa'
  end
end
