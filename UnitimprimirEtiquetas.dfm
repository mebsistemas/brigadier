object frmimprimirEtiquetas: TfrmimprimirEtiquetas
  Left = 0
  Top = 0
  Caption = 'frmimprimirEtiquetas'
  ClientHeight = 399
  ClientWidth = 727
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 727
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 8
      Width = 116
      Height = 14
      Caption = 'CODIGO DE BARRA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 162
      Top = 5
      Width = 223
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      Text = 'EDIT1'
    end
    object BitBtn2: TBitBtn
      Left = 391
      Top = 3
      Width = 75
      Height = 25
      Caption = 'BUSCAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object CheckBox1: TCheckBox
      Left = 488
      Top = 8
      Width = 97
      Height = 17
      Caption = 'ES PROMOCION'
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 358
    Width = 727
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 614
      Top = 1
      Width = 112
      Height = 39
      Align = alRight
      Caption = 'SALIR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
    end
  end
  object Panel3: TPanel
    Left = 614
    Top = 41
    Width = 113
    Height = 317
    Align = alRight
    TabOrder = 2
    object BitBtn3: TBitBtn
      Left = 6
      Top = 70
      Width = 99
      Height = 43
      Caption = 'VISTA PREVIA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 6
      Top = 119
      Width = 99
      Height = 43
      Caption = 'IMPRIMIR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn4Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 614
    Height = 317
    Align = alClient
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 306
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PRECIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end>
  end
  object FDQuery1: TFDQuery
    Connection = Form1.FDConnection1
    Left = 248
    Top = 128
  end
  object DataSource1: TDataSource
    DataSet = RxMemoryData1
    Left = 88
    Top = 104
  end
  object RxMemoryData1: TRxMemoryData
    FieldDefs = <>
    Left = 368
    Top = 152
    object RxMemoryData1CODIGO: TStringField
      FieldName = 'CODIGO'
      Size = 40
    end
    object RxMemoryData1DESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object RxMemoryData1PRECIO: TStringField
      FieldName = 'PRECIO'
    end
  end
end
