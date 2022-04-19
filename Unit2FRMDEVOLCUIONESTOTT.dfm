object FRMDEVOLCUIONESTOTT: TFRMDEVOLCUIONESTOTT
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'DEVOLUCIONES'
  ClientHeight = 118
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 103
    Height = 13
    Caption = 'TIPO COMPROBANTE'
  end
  object Label2: TLabel
    Left = 188
    Top = 16
    Width = 43
    Height = 13
    Caption = 'NUMERO'
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 32
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    Items.Strings = (
      '0-TICKET'
      '1-FACTURA A'
      '2-FACTURA B'
      '3-FACTURA C')
  end
  object Edit1: TEdit
    Left = 192
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    OnKeyPress = Edit1KeyPress
  end
  object BitBtn1: TBitBtn
    Left = 40
    Top = 72
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
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 216
    Top = 72
    Width = 75
    Height = 25
    Caption = 'CANCELAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ModalResult = 2
    ParentFont = False
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object FDQuery1: TFDQuery
    Connection = Form1.FDConnection1
    Left = 152
    Top = 72
  end
end
