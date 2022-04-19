object PRPRECIOVARIABLE: TPRPRECIOVARIABLE
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'PRECIO UNIT. VENTA'
  ClientHeight = 94
  ClientWidth = 174
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
  object Edit1: TEdit
    Left = 16
    Top = 16
    Width = 137
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'Edit1'
    OnKeyPress = Edit1KeyPress
  end
  object BitBtn1: TBitBtn
    Left = 43
    Top = 56
    Width = 75
    Height = 25
    Caption = 'ACEPTAR'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end
