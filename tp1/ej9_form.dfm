object Formej9: TFormej9
  Left = 0
  Top = 0
  Caption = 'Formej9'
  ClientHeight = 474
  ClientWidth = 673
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 7
    Width = 33
    Height = 13
    Caption = 'Billetes'
  end
  object Label2: TLabel
    Left = 110
    Top = 8
    Width = 120
    Height = 13
    Caption = 'Ingresar billetes a la caja'
  end
  object Label3: TLabel
    Left = 110
    Top = 389
    Width = 54
    Height = 13
    Caption = 'Cerrar caja'
  end
  object Label4: TLabel
    Left = 110
    Top = 141
    Width = 6
    Height = 13
    Caption = '$'
  end
  object Memo1: TMemo
    Left = 336
    Top = 8
    Width = 329
    Height = 394
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object UpDown1: TUpDown
    Left = 71
    Top = 43
    Width = 16
    Height = 21
    Associate = inputMonUn
    TabOrder = 1
  end
  object UpDown2: TUpDown
    Left = 71
    Top = 89
    Width = 16
    Height = 21
    Associate = InputMonDos
    TabOrder = 2
  end
  object UpDown3: TUpDown
    Left = 71
    Top = 132
    Width = 16
    Height = 21
    Associate = inputMonCinco
    TabOrder = 3
  end
  object UpDown5: TUpDown
    Left = 71
    Top = 177
    Width = 16
    Height = 21
    Associate = inputBilDiez
    TabOrder = 4
  end
  object UpDown6: TUpDown
    Left = 71
    Top = 225
    Width = 16
    Height = 21
    Associate = inputBilVeinte
    TabOrder = 5
  end
  object UpDown7: TUpDown
    Left = 71
    Top = 270
    Width = 16
    Height = 21
    Associate = inputBilCincuenta
    TabOrder = 6
  end
  object UpDown8: TUpDown
    Left = 71
    Top = 315
    Width = 16
    Height = 21
    Associate = inputBilCien
    TabOrder = 7
  end
  object UpDown9: TUpDown
    Left = 71
    Top = 358
    Width = 16
    Height = 21
    Associate = inputBilDoscientos
    TabOrder = 8
  end
  object UpDown10: TUpDown
    Left = 71
    Top = 401
    Width = 16
    Height = 21
    Associate = inputBilQuinientos
    TabOrder = 9
  end
  object UpDown11: TUpDown
    Left = 71
    Top = 444
    Width = 16
    Height = 21
    Associate = inputBilMil
    TabOrder = 10
  end
  object btnIngresar: TButton
    Left = 110
    Top = 26
    Width = 202
    Height = 58
    Caption = 'Ingresar'
    TabOrder = 11
    OnClick = btnIngresarClick
  end
  object btnCobrar: TButton
    Left = 110
    Top = 160
    Width = 202
    Height = 56
    Caption = 'Cobrar'
    TabOrder = 12
    OnClick = btnCobrarClick
  end
  object inputMontoACobrar: TLabeledEdit
    Left = 122
    Top = 138
    Width = 104
    Height = 21
    EditLabel.Width = 77
    EditLabel.Height = 13
    EditLabel.Caption = 'Monto a cobrar:'
    EditLabel.Layout = tlBottom
    NumbersOnly = True
    TabOrder = 13
    Text = '0'
  end
  object inputMonUn: TLabeledEdit
    Left = 16
    Top = 43
    Width = 55
    Height = 21
    EditLabel.Width = 58
    EditLabel.Height = 13
    EditLabel.Caption = 'Monedas $1'
    NumbersOnly = True
    TabOrder = 14
    Text = '0'
  end
  object InputMonDos: TLabeledEdit
    Left = 16
    Top = 89
    Width = 55
    Height = 21
    EditLabel.Width = 58
    EditLabel.Height = 13
    EditLabel.Caption = 'Monedas $2'
    NumbersOnly = True
    TabOrder = 15
    Text = '0'
  end
  object inputMonCinco: TLabeledEdit
    Left = 16
    Top = 132
    Width = 55
    Height = 21
    EditLabel.Width = 58
    EditLabel.Height = 13
    EditLabel.Caption = 'Monedas $5'
    NumbersOnly = True
    TabOrder = 16
    Text = '0'
  end
  object inputBilDiez: TLabeledEdit
    Left = 16
    Top = 177
    Width = 55
    Height = 21
    EditLabel.Width = 54
    EditLabel.Height = 13
    EditLabel.Caption = 'Billetes $10'
    NumbersOnly = True
    TabOrder = 17
    Text = '0'
  end
  object inputBilVeinte: TLabeledEdit
    Left = 16
    Top = 225
    Width = 55
    Height = 21
    EditLabel.Width = 54
    EditLabel.Height = 13
    EditLabel.Caption = 'Billetes $20'
    NumbersOnly = True
    TabOrder = 18
    Text = '0'
  end
  object inputBilCincuenta: TLabeledEdit
    Left = 16
    Top = 270
    Width = 55
    Height = 21
    EditLabel.Width = 54
    EditLabel.Height = 13
    EditLabel.Caption = 'Billetes $50'
    NumbersOnly = True
    TabOrder = 19
    Text = '0'
  end
  object inputBilCien: TLabeledEdit
    Left = 16
    Top = 315
    Width = 55
    Height = 21
    EditLabel.Width = 60
    EditLabel.Height = 13
    EditLabel.Caption = 'Billetes $100'
    NumbersOnly = True
    TabOrder = 20
    Text = '0'
  end
  object inputBilDoscientos: TLabeledEdit
    Left = 16
    Top = 358
    Width = 55
    Height = 21
    EditLabel.Width = 60
    EditLabel.Height = 13
    EditLabel.Caption = 'Billetes $200'
    NumbersOnly = True
    TabOrder = 21
    Text = '0'
  end
  object inputBilQuinientos: TLabeledEdit
    Left = 16
    Top = 401
    Width = 55
    Height = 21
    EditLabel.Width = 60
    EditLabel.Height = 13
    EditLabel.Caption = 'Billetes $500'
    NumbersOnly = True
    TabOrder = 22
    Text = '0'
  end
  object inputBilMil: TLabeledEdit
    Left = 16
    Top = 444
    Width = 55
    Height = 21
    EditLabel.Width = 66
    EditLabel.Height = 13
    EditLabel.Caption = 'Billetes $1000'
    NumbersOnly = True
    TabOrder = 23
    Text = '0'
  end
  object btnCerrar: TButton
    Left = 110
    Top = 408
    Width = 202
    Height = 57
    Caption = 'Cerrar'
    TabOrder = 24
    OnClick = btnCerrarClick
  end
  object btnVerSaldo: TButton
    Left = 336
    Top = 408
    Width = 329
    Height = 58
    Caption = 'Ver saldo'
    TabOrder = 25
    OnClick = btnVerSaldoClick
  end
end
