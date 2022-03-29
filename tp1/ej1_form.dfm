object FormEj1: TFormEj1
  Left = 0
  Top = 0
  Caption = 'FormEj1'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 33
    Top = 11
    Width = 46
    Height = 13
    Caption = 'Numero 1'
  end
  object Label2: TLabel
    Left = 128
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Numero 2'
  end
  object btnSumar: TButton
    Left = 192
    Top = 8
    Width = 129
    Height = 25
    Caption = 'Sumar'
    TabOrder = 0
    OnClick = btnSumarClick
  end
  object Memo1: TMemo
    Left = 354
    Top = 8
    Width = 273
    Height = 193
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object Enum1: TEdit
    Left = 33
    Top = 30
    Width = 41
    Height = 21
    TabOrder = 2
  end
  object eden1: TEdit
    Left = 33
    Top = 57
    Width = 41
    Height = 21
    TabOrder = 3
  end
  object eden2: TEdit
    Left = 128
    Top = 54
    Width = 41
    Height = 21
    TabOrder = 4
  end
  object enum2: TEdit
    Left = 128
    Top = 27
    Width = 41
    Height = 21
    TabOrder = 5
  end
  object Button1: TButton
    Left = 192
    Top = 39
    Width = 129
    Height = 25
    Caption = 'Restar'
    TabOrder = 6
  end
  object CheckBox1: TCheckBox
    Left = 111
    Top = 81
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 7
  end
  object CheckBox2: TCheckBox
    Left = 8
    Top = 84
    Width = 97
    Height = 17
    Caption = 'CheckBox2'
    TabOrder = 8
  end
end
