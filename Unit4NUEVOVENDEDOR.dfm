object NUEVOVENDEDOR: TNUEVOVENDEDOR
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'NUEVOVENDEDOR'
  ClientHeight = 191
  ClientWidth = 344
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
    Left = 24
    Top = 16
    Width = 180
    Height = 13
    Caption = 'APELLIDO Y NOMBRE DEL VENDEDOR'
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 52
    Height = 13
    Caption = 'COMISION'
  end
  object Label3: TLabel
    Left = 82
    Top = 84
    Width = 14
    Height = 16
    Caption = '%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 24
    Top = 35
    Width = 297
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 40
    TabOrder = 0
    Text = 'EDIT1'
  end
  object Edit2: TEdit
    Left = 24
    Top = 83
    Width = 52
    Height = 21
    TabOrder = 1
    Text = 'Edit2'
    OnKeyPress = Edit2KeyPress
  end
  object BitBtn1: TBitBtn
    Left = 32
    Top = 144
    Width = 75
    Height = 25
    Caption = 'GUARDAR'
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
    Left = 232
    Top = 144
    Width = 75
    Height = 25
    Caption = 'SALIR'
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
