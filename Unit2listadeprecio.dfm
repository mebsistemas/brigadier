object listadeprecio: Tlistadeprecio
  Left = 0
  Top = 0
  Caption = 'LISTA DE PRECIO'
  ClientHeight = 388
  ClientWidth = 861
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 861
    Height = 41
    Align = alTop
    TabOrder = 0
    ExplicitLeft = 56
    ExplicitTop = 32
    ExplicitWidth = 185
    object Label1: TLabel
      Left = 8
      Top = 11
      Width = 43
      Height = 14
      Caption = 'FILTRO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 112
      Top = 8
      Width = 59
      Height = 13
      Caption = 'POR RUBRO'
    end
    object Label3: TLabel
      Left = 352
      Top = 8
      Width = 85
      Height = 13
      Caption = 'POR PROVEEDOR'
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 177
      Top = 8
      Width = 145
      Height = 21
      TabOrder = 0
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 443
      Top = 8
      Width = 145
      Height = 21
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 624
      Top = 3
      Width = 75
      Height = 25
      Caption = 'BitBtn1'
      TabOrder = 2
    end
  end
end
