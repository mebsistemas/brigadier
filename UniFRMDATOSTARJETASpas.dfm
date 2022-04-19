object FRMDATOSTARJETAS: TFRMDATOSTARJETAS
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'DATOS TARJETA'
  ClientHeight = 184
  ClientWidth = 457
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 425
    Height = 121
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 44
      Height = 13
      Caption = 'TARJETA'
    end
    object Label2: TLabel
      Left = 16
      Top = 62
      Width = 43
      Height = 13
      Caption = 'NUMERO'
    end
    object Label3: TLabel
      Left = 150
      Top = 62
      Width = 107
      Height = 13
      Caption = 'COD. AUTORIZACION'
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 16
      Top = 35
      Width = 382
      Height = 21
      TabOrder = 0
    end
    object Edit1: TEdit
      Left = 16
      Top = 81
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 150
      Top = 81
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'Edit2'
    end
  end
  object BitBtn1: TBitBtn
    Left = 64
    Top = 144
    Width = 75
    Height = 25
    Caption = 'ACEPTAR'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 304
    Top = 148
    Width = 75
    Height = 25
    Caption = 'CERRAR'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
end
