object PIDECOMENTARIOS: TPIDECOMENTARIOS
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'COMPROBANTE Y COMENTARIOS DEVOLUCIONES'
  ClientHeight = 164
  ClientWidth = 441
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
  object RichEdit1: TRichEdit
    Left = 8
    Top = 8
    Width = 417
    Height = 105
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'RichEdit1')
    MaxLength = 100
    ParentFont = False
    TabOrder = 0
    Zoom = 100
  end
  object BitBtn1: TBitBtn
    Left = 176
    Top = 119
    Width = 75
    Height = 25
    Caption = 'ACEPTAR'
    ModalResult = 1
    TabOrder = 1
    OnClick = BitBtn1Click
  end
end
