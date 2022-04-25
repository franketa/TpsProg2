object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 585
  ClientWidth = 635
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
    Left = 18
    Top = 31
    Width = 188
    Height = 18
    Caption = 'Total adeudado por  patente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 18
    Top = 55
    Width = 201
    Height = 18
    Caption = 'Multa m'#225's antigua por patente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 18
    Top = 83
    Width = 205
    Height = 18
    Caption = 'Multa m'#225's reciente por patente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 6
    Top = 7
    Width = 50
    Height = 18
    Caption = 'Patente'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 153
    Width = 219
    Height = 18
    Caption = 'Auto con m'#225's cantidad de multas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 184
    Width = 136
    Height = 18
    Caption = 'Auto con m'#225's deuda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 8
    Top = 216
    Width = 97
    Height = 18
    Caption = 'Auto sin deuda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 8
    Top = 272
    Width = 315
    Height = 305
    ReadOnly = True
    TabOrder = 0
  end
  object btnTotalPatente: TButton
    Left = 240
    Top = 29
    Width = 75
    Height = 25
    Caption = 'Ver'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnTotalPatenteClick
  end
  object btnMasAntigua: TButton
    Left = 240
    Top = 55
    Width = 75
    Height = 25
    Caption = 'Ver'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnMasAntiguaClick
  end
  object btnMasReciente: TButton
    Left = 240
    Top = 81
    Width = 75
    Height = 25
    Caption = 'Ver'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnMasRecienteClick
  end
  object inPatentePunto1: TEdit
    Left = 62
    Top = 8
    Width = 81
    Height = 21
    TabOrder = 4
  end
  object btnAutoMasMultas: TButton
    Left = 240
    Top = 151
    Width = 75
    Height = 25
    Caption = 'Ver'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnAutoMasMultasClick
  end
  object Memo2: TMemo
    Left = 329
    Top = 8
    Width = 296
    Height = 513
    Lines.Strings = (
      '')
    ReadOnly = True
    TabOrder = 6
  end
  object btnVerTodasMultas: TButton
    Left = 331
    Top = 554
    Width = 296
    Height = 25
    Caption = 'Ver todas las multas'
    TabOrder = 7
    OnClick = btnVerTodasMultasClick
  end
  object inVerTodasMultas: TEdit
    Left = 416
    Top = 527
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object btnAutoMasDeuda: TButton
    Left = 240
    Top = 182
    Width = 75
    Height = 25
    Caption = 'Ver'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = btnAutoMasDeudaClick
  end
  object Button1: TButton
    Left = 240
    Top = 215
    Width = 75
    Height = 25
    Caption = 'Ver'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = Button1Click
  end
end
