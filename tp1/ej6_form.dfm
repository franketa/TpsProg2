object FormEj6: TFormEj6
  Left = 0
  Top = 0
  Caption = 'FormEj6'
  ClientHeight = 586
  ClientWidth = 1001
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 21
  object Label1: TLabel
    Left = 121
    Top = 242
    Width = 93
    Height = 21
    Caption = 'Fecha Salida'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 486
    Width = 132
    Height = 21
    Caption = 'Ver datos de auto'
  end
  object Label3: TLabel
    Left = 8
    Top = 243
    Width = 107
    Height = 21
    Caption = 'Fecha Entrada'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 44
    Top = 321
    Width = 6
    Height = 21
    Caption = ':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 170
    Top = 321
    Width = 6
    Height = 21
    Caption = ':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 16
    Width = 239
    Height = 21
    Caption = 'Definir precio de tarifa por hora:'
  end
  object Label7: TLabel
    Left = 8
    Top = 409
    Width = 245
    Height = 21
    Caption = 'Ver cantidad de autos ingresador'
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 155
    Width = 561
    Height = 224
    Caption = 'Cargar auto al sistema'
    TabOrder = 14
  end
  object Memo1: TMemo
    Left = 567
    Top = 35
    Width = 426
    Height = 543
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btnVerTarifaAPagar: TButton
    Left = 359
    Top = 507
    Width = 202
    Height = 43
    Caption = 'Ver'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnVerTarifaAPagarClick
  end
  object inputPatenteVer: TEdit
    Left = 8
    Top = 513
    Width = 180
    Height = 27
    HelpType = htKeyword
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    TextHint = 'N'#186' patente '
  end
  object btnVerAutos: TButton
    Left = 359
    Top = 401
    Width = 202
    Height = 43
    Caption = 'Ver'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnVerAutosClick
  end
  object inputSetTarifa: TEdit
    Left = 8
    Top = 43
    Width = 180
    Height = 27
    HelpType = htKeyword
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    NumbersOnly = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 4
    TextHint = 'Tarifa'
  end
  object btnDefinirTarifa: TButton
    Left = 359
    Top = 37
    Width = 202
    Height = 43
    Caption = 'Definir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnDefinirTarifaClick
  end
  object btnCargar: TButton
    Left = 359
    Top = 231
    Width = 202
    Height = 49
    Caption = 'Cargar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = btnCargarClick
  end
  object InputFechaSalidaCargar: TDateTimePicker
    Left = 121
    Top = 261
    Width = 112
    Height = 29
    Date = 44651.000000000000000000
    Time = 44651.000000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object inputPatenteCargarAuto: TLabeledEdit
    Left = 8
    Top = 207
    Width = 180
    Height = 29
    EditLabel.Width = 57
    EditLabel.Height = 21
    EditLabel.Caption = 'Patente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 6
    ParentFont = False
    TabOrder = 8
  end
  object InputFechaEntradaCargar: TDateTimePicker
    Left = 8
    Top = 261
    Width = 107
    Height = 29
    Date = 44651.000000000000000000
    Time = 44651.000000000000000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
  end
  object InputHorasEntradaCargar: TLabeledEdit
    Left = 7
    Top = 318
    Width = 31
    Height = 29
    EditLabel.Width = 116
    EditLabel.Height = 21
    EditLabel.Caption = 'Horario entrada'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 2
    NumbersOnly = True
    ParentFont = False
    TabOrder = 10
  end
  object inputHorasSalidaCargar: TLabeledEdit
    Left = 133
    Top = 318
    Width = 31
    Height = 29
    EditLabel.Width = 102
    EditLabel.Height = 21
    EditLabel.Caption = 'Horario salida'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 2
    NumbersOnly = True
    ParentFont = False
    TabOrder = 11
  end
  object inputMinutosEntradaCargar: TEdit
    Left = 56
    Top = 318
    Width = 33
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 2
    NumbersOnly = True
    ParentFont = False
    TabOrder = 12
  end
  object inputMinutosSalidaCargar: TEdit
    Left = 181
    Top = 318
    Width = 33
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 2
    NumbersOnly = True
    ParentFont = False
    TabOrder = 13
  end
end
