object MESYANIO: TMESYANIO
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'MES Y A'#209'O'
  ClientHeight = 123
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 26
    Height = 14
    Caption = 'MES'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 176
    Top = 16
    Width = 26
    Height = 14
    Caption = 'A'#209'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ComboBox1: TComboBox
    Left = 16
    Top = 35
    Width = 146
    Height = 22
    Style = csDropDownList
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    Items.Strings = (
      'ENERO'
      'FEBRERO'
      'MARZO'
      'ABRIL '
      'MAYO'
      'JUNIO'
      'JULIO'
      'AGOSTO'
      'SETIEMBRE'
      'OCTUBRE'
      'NOVIEMBRE'
      'DICIEMBRE')
  end
  object Edit1: TEdit
    Left = 168
    Top = 35
    Width = 81
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Text = 'Edit1'
    OnKeyPress = Edit1KeyPress
  end
  object BitBtn1: TBitBtn
    Left = 16
    Top = 80
    Width = 75
    Height = 25
    Caption = 'ACEPTAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 1
    ParentFont = False
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 168
    Top = 80
    Width = 75
    Height = 25
    Caption = 'CERRAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 3
  end
end
