object REALIZARDEVOLUCIONES: TREALIZARDEVOLUCIONES
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'BUSCAR COMPROBANTE'
  ClientHeight = 108
  ClientWidth = 354
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 354
    Height = 49
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 377
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 85
      Height = 13
      Caption = 'Nro Comprobante'
    end
    object Edit1: TEdit
      Left = 9
      Top = 22
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object ComboBox1: TComboBox
      Left = 136
      Top = 19
      Width = 193
      Height = 24
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Items.Strings = (
        '0-TICKET'
        '1-FACTURA A'
        '2-FACTURA B'
        '3-FACTURA C')
    end
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 64
    Width = 161
    Height = 25
    Caption = 'ASOCIAR A DEVOLUCION'
    ModalResult = 1
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 224
    Top = 64
    Width = 122
    Height = 25
    Caption = 'NO ASOCIAR'
    ModalResult = 2
    TabOrder = 2
    OnClick = BitBtn2Click
  end
  object FDQuery1: TFDQuery
    Connection = Form1.FDConnection1
    Left = 136
    Top = 16
  end
end
