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
    Top = 337
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
  object Label3: TLabel
    Left = 8
    Top = 144
    Width = 92
    Height = 15
    Caption = 'Autorizar compra'
  end
  object Label4: TLabel
    Left = 17
    Top = 165
    Width = 91
    Height = 15
    Caption = 'Fecha de compra'
  end
  object Label5: TLabel
    Left = 17
    Top = 215
    Width = 36
    Height = 15
    Caption = 'Monto'
  end
  object Label6: TLabel
    Left = 8
    Top = 239
    Width = 6
    Height = 23
    Caption = '$'
  end
  object ca: TLabel
    Left = 8
    Top = 58
    Width = 116
    Height = 15
    Caption = 'Fecha de vencimiento'
  end
  object Label7: TLabel
    Left = 8
    Top = 384
    Width = 139
    Height = 15
    Caption = 'Mostrar l'#237'mites de compra'
  end
  object Label8: TLabel
    Left = 17
    Top = 265
    Width = 102
    Height = 15
    Caption = 'Cantidad de cuotas'
  end
  object btnCargar: TButton
    Left = 169
    Top = 21
    Width = 97
    Height = 40
    Caption = 'Cargar'
    TabOrder = 0
    OnClick = btnCargarClick
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
  object btnMostrarDatos: TButton
    Left = 169
    Top = 326
    Width = 97
    Height = 40
    Caption = 'Mostrar '
    TabOrder = 2
    OnClick = btnMostrarDatosClick
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
  object inputFechaCompra: TDateTimePicker
    Left = 20
    Top = 186
    Width = 88
    Height = 23
    Date = 44653.000000000000000000
    Time = 0.666625902777013800
    TabOrder = 4
  end
  object inputMontoCompra: TEdit
    Left = 20
    Top = 236
    Width = 88
    Height = 23
    NumbersOnly = True
    TabOrder = 5
  end
  object inputFechaVencimiento: TDatePicker
    Left = 8
    Top = 79
    Width = 68
    Height = 26
    Date = 44682.000000000000000000
    DateFormat = 'MM/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 6
  end
  object btnAutorizar: TButton
    Left = 169
    Top = 190
    Width = 97
    Height = 40
    Caption = 'Autorizar'
    TabOrder = 7
    OnClick = btnAutorizarClick
  end
  object btnMostrarLimites: TButton
    Left = 169
    Top = 373
    Width = 97
    Height = 40
    Caption = 'Mostrar'
    TabOrder = 8
    OnClick = btnMostrarLimitesClick
  end
  object inputCantCuotas: TEdit
    Left = 20
    Top = 286
    Width = 88
    Height = 23
    TabOrder = 9
  end
end
