object FRMBUSCAFACTPARANC: TFRMBUSCAFACTPARANC
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'BUSCAR COMPROBATE  FACTURA'
  ClientHeight = 108
  ClientWidth = 236
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
    Top = 8
    Width = 72
    Height = 13
    Caption = 'NRO FACTURA'
  end
  object Edit1: TEdit
    Left = 24
    Top = 24
    Width = 201
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
    OnKeyPress = Edit1KeyPress
  end
  object BitBtn1: TBitBtn
    Left = 72
    Top = 64
    Width = 75
    Height = 25
    Caption = 'ACEPTAR'
    ModalResult = 1
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end
