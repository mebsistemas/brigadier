object FRMINGRESARINVENTARIO: TFRMINGRESARINVENTARIO
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'INVENTARIO'
  ClientHeight = 165
  ClientWidth = 352
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
    Top = 8
    Width = 51
    Height = 13
    Caption = 'ARTICULO'
  end
  object Label2: TLabel
    Left = 16
    Top = 54
    Width = 62
    Height = 13
    Caption = 'INVENTARIO'
  end
  object Edit1: TEdit
    Left = 16
    Top = 27
    Width = 313
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 16
    Top = 73
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit2'
  end
  object BitBtn1: TBitBtn
    Left = 48
    Top = 120
    Width = 75
    Height = 25
    Caption = 'ACEPTAR'
    ModalResult = 1
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 254
    Top = 120
    Width = 75
    Height = 25
    Caption = 'SALIR'
    ModalResult = 2
    TabOrder = 3
    OnClick = BitBtn2Click
  end
end
