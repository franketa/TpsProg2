object FormEj7: TFormEj7
  Left = 0
  Top = 0
  Caption = 'FormEj7'
  ClientHeight = 475
  ClientWidth = 826
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
    Left = 8
    Top = 263
    Width = 58
    Height = 19
    Caption = 'Desde...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 118
    Top = 263
    Width = 54
    Height = 19
    Caption = 'Hasta...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 128
    Width = 256
    Height = 19
    Caption = 'Fecha salida a consultar recaudaci'#243'n'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 238
    Width = 168
    Height = 19
    Caption = 'Consultar rango de d'#237'as'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 399
    Width = 173
    Height = 19
    Caption = 'Escribir datos en archivo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 8
    Width = 154
    Height = 19
    Caption = 'Definir tarifa por hora'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 8
    Top = 36
    Width = 9
    Height = 19
    Caption = '$'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 360
    Top = 8
    Width = 458
    Height = 459
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    TabOrder = 0
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 282
    Width = 104
    Height = 27
    Date = 44621.000000000000000000
    Time = 44621.000000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxDate = 44621.999988425920000000
    MinDate = 44621.000000000000000000
    ParentFont = False
    TabOrder = 1
  end
  object DateTimePicker2: TDateTimePicker
    Left = 118
    Top = 282
    Width = 115
    Height = 27
    Date = 44623.000000000000000000
    Time = 44623.000000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxDate = 44623.999988425920000000
    MinDate = 44621.000000000000000000
    ParentFont = False
    TabOrder = 2
  end
  object selectFechaConsulta: TDateTimePicker
    Left = 8
    Top = 153
    Width = 87
    Height = 27
    Date = 44621.000000000000000000
    Time = 44621.000000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxDate = 44623.999988425920000000
    MinDate = 44621.000000000000000000
    ParentFont = False
    TabOrder = 3
  end
  object btnConsultarFechaDada: TButton
    Left = 254
    Top = 153
    Width = 100
    Height = 55
    Caption = 'Consultar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = btnConsultarFechaDadaClick
  end
  object btnConsultarRangoDado: TButton
    Left = 254
    Top = 266
    Width = 100
    Height = 55
    Caption = 'Consultar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
  end
  object btnEscribirArchivo: TButton
    Left = 254
    Top = 399
    Width = 100
    Height = 55
    Caption = 'Escribir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object btnDefinirTarifa: TButton
    Left = 254
    Top = 36
    Width = 100
    Height = 55
    Caption = 'Definir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btnDefinirTarifaClick
  end
  object inputSetTarifa: TEdit
    Left = 23
    Top = 33
    Width = 87
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    TabOrder = 8
    TextHint = 'tarifa'
  end
end
