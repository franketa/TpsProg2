object FormEj6: TFormEj6
  Left = 0
  Top = 0
  Caption = 'FormEj6'
  ClientHeight = 302
  ClientWidth = 829
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
  object Memo1: TMemo
    Left = 402
    Top = 8
    Width = 423
    Height = 283
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
  object btnVerTarifaAPagar: TButton
    Left = 194
    Top = 113
    Width = 202
    Height = 43
    Caption = 'Ver tarifa a pagar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object inputPatente: TEdit
    Left = 8
    Top = 119
    Width = 180
    Height = 27
    HelpType = htKeyword
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 2
    TextHint = 'N'#186' patente '
  end
  object btnVerAutos: TButton
    Left = 194
    Top = 64
    Width = 202
    Height = 43
    Caption = 'Ver cantidad de Autos ingresados'
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
    Top = 21
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
    Left = 194
    Top = 15
    Width = 202
    Height = 43
    Caption = 'Definir tarifa por hora'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = btnDefinirTarifaClick
  end
end
