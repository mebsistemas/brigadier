object frmCrearPromociones: TfrmCrearPromociones
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'CREAR PROMOCIONES'
  ClientHeight = 433
  ClientWidth = 762
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
    Width = 457
    Height = 161
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 3
      Width = 89
      Height = 13
      Caption = 'FECHA CREACION'
    end
    object Label2: TLabel
      Left = 152
      Top = 3
      Width = 78
      Height = 13
      Caption = 'CODIGO BARRA'
    end
    object Label3: TLabel
      Left = 16
      Top = 53
      Width = 42
      Height = 13
      Caption = 'NOMBRE'
    end
    object Label4: TLabel
      Left = 13
      Top = 99
      Width = 45
      Height = 13
      Caption = 'IMPORTE'
    end
    object Label5: TLabel
      Left = 132
      Top = 99
      Width = 37
      Height = 13
      Caption = 'ACTIVA'
    end
    object Label6: TLabel
      Left = 253
      Top = 99
      Width = 33
      Height = 13
      Caption = 'STOCK'
    end
    object Edit1: TEdit
      Left = 16
      Top = 21
      Width = 121
      Height = 21
      Enabled = False
      MaxLength = 10
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 152
      Top = 21
      Width = 217
      Height = 21
      Enabled = False
      MaxLength = 15
      TabOrder = 1
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 16
      Top = 72
      Width = 353
      Height = 21
      MaxLength = 40
      TabOrder = 2
      Text = 'Edit3'
    end
    object Edit4: TEdit
      Left = 13
      Top = 118
      Width = 100
      Height = 21
      MaxLength = 10
      TabOrder = 3
      Text = 'Edit4'
      OnKeyPress = Edit4KeyPress
    end
    object ComboBox1: TComboBox
      Left = 132
      Top = 118
      Width = 45
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 4
      Text = 'SI'
      Items.Strings = (
        'SI'
        'NO')
    end
    object Edit5: TEdit
      Left = 253
      Top = 118
      Width = 92
      Height = 21
      TabOrder = 5
      Text = 'Edit5'
      OnKeyPress = Edit5KeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 175
    Width = 617
    Height = 194
    Caption = 'ARTICULOS'
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 2
      Top = 15
      Width = 613
      Height = 177
      Align = alClient
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'IDARTICULO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CODIGOBARRA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'CODIGO BARRA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 127
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 218
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MARCA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 147
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'CANTIDAD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
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
  end
  object Panel1: TPanel
    Left = 0
    Top = 392
    Width = 762
    Height = 41
    Align = alBottom
    TabOrder = 2
    ExplicitWidth = 730
    object BitBtn1: TBitBtn
      Left = 657
      Top = 1
      Width = 104
      Height = 39
      Align = alRight
      Caption = 'CERRAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtn1Click
      ExplicitLeft = 625
    end
    object BitBtn2: TBitBtn
      Left = 1
      Top = 1
      Width = 104
      Height = 39
      Align = alLeft
      Caption = 'CREAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn2Click
    end
  end
  object BitBtn3: TBitBtn
    Left = 631
    Top = 190
    Width = 123
    Height = 25
    Caption = 'AGREGAR'
    TabOrder = 3
    OnClick = BitBtn3Click
  end
  object Edit6: TEdit
    Left = 544
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Edit6'
    Visible = False
  end
  object RxMemoryData1: TRxMemoryData
    FieldDefs = <>
    Left = 200
    Top = 255
    object RxMemoryData1IDARTICULO: TIntegerField
      FieldName = 'IDARTICULO'
    end
    object RxMemoryData1CODIGOBARRA: TStringField
      FieldName = 'CODIGOBARRA'
      Size = 40
    end
    object RxMemoryData1DESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object RxMemoryData1MARCA: TStringField
      FieldName = 'MARCA'
      Size = 30
    end
    object RxMemoryData1CANTIDAD: TStringField
      FieldName = 'CANTIDAD'
      Size = 10
    end
  end
  object DataSource1: TDataSource
    DataSet = RxMemoryData1
    Left = 288
    Top = 263
  end
  object FDQuery1: TFDQuery
    Connection = Form1.FDConnection1
    Left = 504
    Top = 128
  end
  object FDQuery2: TFDQuery
    Connection = Form1.FDConnection1
    Left = 584
    Top = 128
  end
end
