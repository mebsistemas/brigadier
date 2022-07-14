object disenioimprimirFactura58: TdisenioimprimirFactura58
  Left = 0
  Top = 0
  Caption = 'disenioimprimirFactura58'
  ClientHeight = 744
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QRPQuickrep1: TQRPQuickrep
    AlignWithMargins = True
    Left = -8
    Top = 0
    Width = 215
    Height = 763
    ShowingPreview = False
    BeforePrint = QRPQuickrep1BeforePrint
    DataSet = RxMemoryData1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = Custom
    Page.Continuous = False
    Page.Values = (
      100.000000000000000000
      2018.770833333333000000
      10.000000000000000000
      570.000000000000000000
      0.000000000000000000
      0.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = True
    PrinterSettings.CustomBinCode = 15
    PrinterSettings.ExtendedDuplex = 1
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 257
    PrinterSettings.PrintMetaFile = False
    PrinterSettings.MemoryLimit = 1000000
    PrinterSettings.PrintQuality = 203
    PrinterSettings.Collate = 0
    PrinterSettings.ColorOption = 1
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
    PreviewWidth = 500
    PreviewHeight = 500
    PrevInitialZoom = qrZoomToFit
    PreviewDefaultSaveType = stPDF
    PreviewLeft = 0
    PreviewTop = 0
    LabelSettings.FirstLabel = 0
    LabelSettings.LabelCount = 0
    PrepareAutomatically = False
    object DetailBand1: TQRBand
      Left = 0
      Top = 327
      Width = 215
      Height = 14
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        37.041666666666670000
        568.854166666666700000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 8
        Top = -1
        Width = 51
        Height = 14
        Size.Values = (
          37.041666666666670000
          21.166666666666670000
          -2.645833333333333000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Color = clWhite
        DataSet = RxMemoryData1
        DataField = 'DESCRIPCION'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRDBText2: TQRDBText
        Left = 48
        Top = -1
        Width = 42
        Height = 14
        Size.Values = (
          37.041666666666670000
          127.000000000000000000
          -2.645833333333333000
          111.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = RxMemoryData1
        DataField = 'PUNITARIO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRDBText3: TQRDBText
        Left = 118
        Top = 0
        Width = 13
        Height = 14
        Size.Values = (
          37.041666666666670000
          312.208333333333300000
          0.000000000000000000
          34.395833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = RxMemoryData1
        DataField = 'IVA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRDBText4: TQRDBText
        Left = 152
        Top = 0
        Width = 24
        Height = 14
        Size.Values = (
          37.041666666666670000
          402.166666666666700000
          0.000000000000000000
          63.500000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Color = clWhite
        DataSet = RxMemoryData1
        DataField = 'TOTAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        VerticalAlignment = tlTop
        FontSize = 7
      end
    end
    object PageHeaderBand1: TQRBand
      Left = 0
      Top = 4
      Width = 215
      Height = 204
      Frame.DrawBottom = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        539.750000000000000000
        568.854166666666700000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageHeader
      object QRLabel1: TQRLabel
        Left = 8
        Top = 95
        Width = 147
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          251.354166666666700000
          388.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'RAZON SOCIAL: ARASU S.R.L.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel2: TQRLabel
        Left = 8
        Top = 111
        Width = 96
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          293.687500000000000000
          254.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CUIT 30-71741457-4'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 8
        Top = 127
        Width = 106
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          336.020833333333300000
          280.458333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Responsable Inscripto'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel4: TQRLabel
        Left = 8
        Top = 143
        Width = 114
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          378.354166666666700000
          301.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Ing.Brutos: 0118450843'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel5: TQRLabel
        Left = 8
        Top = 159
        Width = 105
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          420.687500000000000000
          277.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Inic.Activ: 01/12/2021'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRShape4: TQRShape
        Left = 92
        Top = 6
        Width = 44
        Height = 45
        Size.Values = (
          119.062500000000000000
          243.416666666666700000
          15.875000000000000000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel24: TQRLabel
        Left = 106
        Top = 8
        Width = 14
        Height = 27
        Size.Values = (
          71.437500000000000000
          280.458333333333300000
          21.166666666666670000
          37.041666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'A'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 16
      end
      object QRLabel25: TQRLabel
        Left = 98
        Top = 35
        Width = 32
        Height = 12
        Size.Values = (
          31.750000000000000000
          259.291666666666700000
          92.604166666666670000
          84.666666666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'COD. 01'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRLabel26: TQRLabel
        Left = 12
        Top = 4
        Width = 48
        Height = 15
        Size.Values = (
          39.687500000000000000
          31.750000000000000000
          10.583333333333330000
          127.000000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FACTURA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel27: TQRLabel
        Left = 12
        Top = 21
        Width = 59
        Height = 15
        Size.Values = (
          39.687500000000000000
          31.750000000000000000
          55.562500000000000000
          156.104166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '16/06/2021'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel28: TQRLabel
        Left = 12
        Top = 36
        Width = 77
        Height = 15
        Size.Values = (
          39.687500000000000000
          31.750000000000000000
          95.250000000000000000
          203.729166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '0000-00000000'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel7: TQRLabel
        Left = 8
        Top = 174
        Width = 121
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          460.375000000000000000
          320.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Domicilio: 9 de Julio 1515'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel29: TQRLabel
        Left = 11
        Top = 57
        Width = 74
        Height = 19
        Size.Values = (
          50.270833333333330000
          29.104166666666670000
          150.812500000000000000
          195.791666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'PANADERIA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
      object QRLabel30: TQRLabel
        Left = 10
        Top = 73
        Width = 76
        Height = 19
        Size.Values = (
          50.270833333333330000
          26.458333333333330000
          193.145833333333300000
          201.083333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'MARIA JOSE'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 11
      end
    end
    object PageFooterBand1: TQRBand
      Left = 0
      Top = 341
      Width = 215
      Height = 352
      Frame.DrawTop = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        931.333333333333300000
        568.854166666666700000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbPageFooter
      object QRLabel14: TQRLabel
        Left = 64
        Top = 8
        Width = 53
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          21.166666666666670000
          140.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'GRAVADO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel15: TQRLabel
        Left = 64
        Top = 24
        Width = 42
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          63.500000000000000000
          111.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'IVA 21%'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel16: TQRLabel
        Left = 64
        Top = 41
        Width = 51
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          108.479166666666700000
          134.937500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'IVA 10.5%'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel17: TQRLabel
        Left = 64
        Top = 59
        Width = 33
        Height = 17
        Size.Values = (
          44.979166666666670000
          169.333333333333300000
          156.104166666666700000
          87.312500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'TOTAL'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel18: TQRLabel
        Left = 121
        Top = 8
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          320.145833333333300000
          21.166666666666670000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '100000.00'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel19: TQRLabel
        Left = 121
        Top = 24
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          320.145833333333300000
          63.500000000000000000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '100000.00'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel20: TQRLabel
        Left = 121
        Top = 41
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          320.145833333333300000
          108.479166666666700000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '100000.00'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel21: TQRLabel
        Left = 121
        Top = 59
        Width = 52
        Height = 17
        Size.Values = (
          44.979166666666670000
          320.145833333333300000
          156.104166666666700000
          137.583333333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taRightJustify
        AlignToBand = False
        Caption = '100000.00'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel22: TQRLabel
        Left = 8
        Top = 92
        Width = 102
        Height = 14
        Size.Values = (
          37.041666666666670000
          21.166666666666670000
          243.416666666666700000
          269.875000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CAE: 1234567890123'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel23: TQRLabel
        Left = 7
        Top = 107
        Width = 119
        Height = 14
        Size.Values = (
          37.041666666666670000
          18.520833333333330000
          283.104166666666700000
          314.854166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'FECHA VENC:01/07/2021'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRORIGINAL: TQRLabel
        Left = 13
        Top = 18
        Width = 37
        Height = 12
        Size.Values = (
          31.750000000000000000
          34.395833333333330000
          47.625000000000000000
          97.895833333333330000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'ORIGINAL'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Calibri'
        Font.Style = []
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 7
      end
      object QRQRBarcode1: TQRQRBarcode
        Left = 39
        Top = 128
        Width = 134
        Height = 120
        Size.Values = (
          317.500000000000000000
          103.187500000000000000
          338.666666666666700000
          354.541666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        BarcodeText = 'unset'
        BarcodeEncoding = qrAuto
        QuietZone = 0
      end
      object QRImage1: TQRImage
        Left = 22
        Top = 248
        Width = 140
        Height = 27
        Size.Values = (
          71.437500000000000000
          58.208333333333330000
          656.166666666666700000
          370.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Center = True
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D49484452000000A60000
          0039080200000033DAC7B6000000017352474200AECE1CE90000000467414D41
          0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000021
          314944415478DAED5C77601445DB9FBDBB74124AA802414253290149C0060849
          8040020821C12EA280A0D2449A888A2002222A108A1405D1000A42206848A4A4
          102C8852138A80A125802124A4DCDD7ECFCEEC4EE666662FC1EFFDEBFBDE55E3
          DDEEECB4DFF3FC9E3233A7389D4E8490AAAAF0575114C45CDC4D69992A2FF216
          B9AAF9AE9B86A0B7168BA53A25B90AB9325C3DD2326E1ED13BE4035B40BCE3A6
          5137CD4161055F6E3A63D667DA07F82CB6A810C8A5BDF977F32BC549DA7BB3C1
          902E496787EB92B4E4DD024CC60565AC56ABB480F83ABD433ED0AF2ABED83BE2
          EC71DD63A58714E0EA34EB0C6DCB3DF6A690730363C5A49A189B8930DB4537B5
          B14FC5CFF42B273D6E94499C4AB376E960AB946F87C3016558D8CCB4C28DD889
          522BCE0F1D26D578B115FA3A48AA54284955EE2097CEDAFF1E72B680B4071C49
          A2AA344C545029EB4A0950FC6086040B9ED88458D83D038B1D933E9536644690
          55A25305B1239996BB997133293604101EA9B26E4834409C74AE27ECBBAEADB8
          BBC3EA3A6827216DAE0916574ECBE115B84FEA216558F8A55A48C74E0627AA2F
          DB31E9A809426C9DF017BE42E7B979201DE6CAEB5FF1ECD3D97367CB456912E7
          450A1EDC86F7AA63AADDB8369C661B138A7087EFDA7BF81717216DDA01D6AEDF
          D5E57482ACB84855755CB6FFE4A5AA4E8C14695A9C6A857AEC62E74427056139
          72955F85A072F9E6EDBFAEDDD23E6115C7B2A6A8887846A86E804F9BC6B5E1BE
          53AD1A400A3FF97BFC6241617105E163A42A2A6900A94643F084FC45B8394230
          DA4D3240159705F9C1EFEBF483FBA0E8A35495F6CD02FD7DBC60AEC84D4C0CCE
          23E7F34BCB1D16850C46AB003789ABC5772A1B2342A3AA8135BCEE6B12482646
          9B254C14F0E8C8B9FCE2B27205599062B020992044B051F06491A931AA255F55
          FC5F655BAAF12E7EA097D0B50E5A0CF0F36A175417199C81AA6FCB59C8A534CB
          CA0E7C9EBBE5E7B569476F959459AC56681AA916DC11984C0B74D689FF79353A
          E4ADD887AA893AA9F664DE8D191BD20F1CBF0243B5E83A4F9408BA61C143D6A0
          85E1AB869021FC055914AB363398819105C0205FA12F78F2E05DA78197C5E174
          34AAED37FFB9C7FA746A4EA4EDF7BFAE8DFB7CEF89BC1B1605378B60384E2C6B
          F09FC590214D97543C128BD619A71DBE3A9DAFF7EB34331E0FD3E184D93878F2
          D25B5F671E395F60D5668C080EA25C4706A2899AD6170B9E17A72114F036708F
          A6B308CB9D2124543254325CC40A37420FB76AF4C1738FDEDF2450AAC62E908B
          EE80E8C210CA25F342440F0439E3E4A5618B76D5F0B4298C3D53151D095CA153
          752AA515151F3CD3EDC96E6D380321D17284C788D0884F53528F5DACE9E355CB
          CF13865EEE8059D1D51A9A287738F5AA8CFA60F815769D8A6C1A58AA1D5AD6E6
          50D709A2B1BA2A63A50150A1E3B7EED89BD6F34B9D3504865052667FFEB3E45F
          4E5FF3F3F2C06AA563AE1A3463082C5150D255A28B1668ACD46E5FF07CF7C10F
          B582A725651511B3BEBD7CB3C4C7D3EA05CD2015BAE7540D94F499A52C455903
          7979589D180A054F200C54512BE984B486E796C28D8768514BCB1CD068DBA0BA
          3BDF1A4418BE8AB8DC2C00550DDB40B982DC2724387AF99E9DBF9E8BE810B478
          C4E336AB26B30CDD697F60B40BB7FDF269D2EF9D5B36D8317DA0A601CE2A7C72
          B87331FFD6E0F93B6E1657AC1FDFE7E1D68DCA2B1CAAAB4BA8AA121711DEF5F6
          B425FD7276FCEA7DBDDA37FD6878772F9BD5692E64BE5E1E5FEF3F3575FD8106
          B57CF7BE1FEBEBE579E566F180B9DB414057BE1219DAB241B9DD510D4AD2F001
          3DFE70DBCFAB528EC53DD26AE10BDDE0DEDEA317872D4C0EAAE79F3839AA4960
          809DCAA8FBAA9062B3296F7E919E98710A3863EA90B03BE5F6EAF4C1D366F9F3
          7CC190F93BC12FF9FDE3676AF9794BC3A84A5B8EAA118AD0E151608E5D2878EA
          E364BBDDB9EAD58847DA3436EB4DDECDA21ED3B794D91D1B2744757BA0318D1A
          DD409E937763E8C25DF0CA2FF39FACE1E3499E20438C68D9CA3B1A3DEAF56C3B
          787ADC9A7D8FB76BBC7A6C6F9042830C7149BD58A5CEC4CEDF919D7B35BC7D93
          75AFF785AFE09444BFFF3D98A66F27C734AF5F9312295BBF59BB5FA41D7B6B63
          667458F36523C36180DB0E9D7E79D99E3E21CD364C8832DE52981A5CED9B4E40
          FACDB12BD2B664E74E8CEE3C6570A8EB7895CAF22E6AAE5DFF14973D34756371
          A9E3E7F9C31AD6AE21871C240209D18E348921C609507EF2BAFD1B0F9CECD9BE
          E986F17D89CB21CA31F1E75F5CFAE3EE5FCF0D7DB4CD27231E67EB9246A81AE4
          976EC42D4C2EA9A8383877581D7F6F12AE20C31F11F3B87478F0756B56EEF8B5
          007913D0542F1B2646261C676DD3AEDFCE011F78582C6B5E8DE8DAE61E28035A
          AE418E1C8993635A36AC45DAE5BC5F2E72A34FC1A199F975D6C0B0E0A52FF742
          3AE4A97D3A056D18174568569A38E21C23C29DAFAE4CDB02A388E93C7570281D
          2CFB810BDEE0FF56ABE5C089BC21F3931A04F8FCF9C9B3045C31F45048006A96
          4861359B4659E43ED4F5D7B5C26E3336D92C96CD6F4687B668C0161021FCE9CF
          8B60028039BF9ED8F73EEC5C8883A770122D8FFF28B9B4C29E31379E404E1F71
          DD93423E61EDFE1E1AE4116017695B6CF00A66A9BC421DB1F487F41397223B04
          AD1C13499C6502B953716C7A43839C0DDEC48B9D370DF23D476726660D0A6BB1
          E4E59E04F291CBF6F4EED86CC3F8286E72D8C81E71EE30FE3E5683FCF484688D
          D8B9B91253555A5409DD5094A8F7B71E399BFF74F7FB16BCD0DD2C57E38ED8B9
          1C02DB0049537CB6EBF09CCD87DA37AB9BF2CE10525E2A3AD8D556CAEDF6F885
          BB7E3B9BFF5ABF9037068512B74AAC9CD5F278ACE5598696736ACD8D9F0DED08
          E4DDDB36593526C2CB063E399F15D1ADD2C50230DB50F3DC671F7DF2B1FB490D
          1CE454A1A590B3990602F95BDF640DEA52A9E52397A5F6EE18842177B24CEE26
          1B4FB57C7366EE84010F4E1DCC43CE6699A89B051A7832EFFAC079DB6DC8BA6E
          5C4458CB7B081C77A7E5D43F677314BA4C59AD7F5F2F1A3C6F07B8A38B867703
          BAE686C44F0DF6EDBF3F7406829F7A01BEC93307D5ADE9C3FAFF222BE45CBE11
          B720B9ACBC227DDEB0C01ADEA4B09B0435AD44833CFBF4F8D57B7B7568BA6254
          84A78785F51659B919959092FCDBF9E086017B67C7411D108BC3B830E4DB202A
          4B34209766B9D99EB390BF9D98358021F651CBD2223B82D58BA284E966C9CE05
          F255695B3272C763C859B113878CA74B8B00A7AFCFD870E0244818701B4927B8
          0BD2CC484074D9C857A868C3FE13D3BE4C6FDDA4CEA649FD02FD7DAAF44571B0
          E1EC3173534E5EE1DB715D5FEDD79133633CE458CBEF945764CE1B56A7863721
          58B37E7204AB41BE665F6487A6CB4685831F4B06CF9687C2570B8B1F99FACD9D
          72E75B43BB8CE91B4232983077970D2DDFCC10BB3449CCC90125F681612D961A
          C4AEB96F3AB13BB1BF656A4379C857A66DCACA9914130AEE1BF127CCDE228F8E
          5FCC7F66F18F45A5E509237B458434A3DA2F77DF588B52A5EB4E6BE93163D389
          BC1BB3E21F1A1BD5D10C6F97DA60D62C9684DD47666FCE6E5E2F2063DE3064F2
          1A63CB77417C92F9814EEC66697F19E4B913D6EC8F0C095A313ADC6CA6B4B831
          F9F76681FE5BA70DA8EBEF83E7C142208F01F74D71B05ACEB522CD1CBBB7E5C8
          C8E956B9B65BE9BE6582966BEE1BABE592E5223CB173BF3DB43CF9C87D4D037F
          9C3518EE38CCD3BDBAC74E9EB1C97A396CC6D8BEDA7FE28D75079AD6F3CF9E17
          0F3345FB245D04336C8FA643E0F10DFD7067FEEDD2E5A37BF6EDD45C6A290D62
          BF19BF606749B93D8B815CCCF34BB4046BF9442D486B32FFF96E1E563E2EF7B0
          5A7E3B7B6DEA97FB0B8ACA405EC7C774A22A08D76583D8892DE772125237823E
          5A937A74D63759034283978EA4B63CAD372676DA84B8AACB7FC0496C20F6CD19
          60CB259023C69BC6918276A3E6334BFCBCBC16BDD07D58B73644B6F4DC897BF7
          0DB93A416603B33B9CCF2CDE75E0C4E511BDDABEF7D423C44D604D292B2B1442
          EC0180042893BFD8B72923273AACE5672FF6B05815A753126E814DCDBD7C336E
          C1CEE272FB414CECAC5471008BA40D5A3EF5CBF45A7EDE81FEDE7623C14BD3DB
          300F376EDDB95D66F7F5B4AD1F07E1431D4275E45D4DCBE76C037C364D8E2690
          8B711492F9B69A96A71E9DF98D6B909690A2C5E5E3FB49032D64E4B5D8FA2D38
          A8D5DCB7ACDC89319DA71890D3D669791A1C6ECB3EFDE2D29436F7D4DA3F67A8
          87D5C64637EE20E7C230E945F460F76F67C7ACDAEBEFE391347D60D3BA019CFE
          89295B57D4ADC7CE173CFDE96EF0F6D6BDD6BB53707DD650D1200A2A012D8F5B
          B8AB14B47C6E7C6DC663E730163D76787DDBC1D35337A47B795ACB2B1C3830C0
          696CB23487573ABC3D6CB74BCBA34383170DEF413AC0421E3D672B944E9CD49F
          D37271AD969D2EB84F201F1416BCA4D27D4B8DD43D7617A4A56BA92E5ABE3275
          B3968A099DF2840BE41C31C05566B73FBD28F950EED59722DB839344FC68D6EB
          9240CECD206252AAEC1A1A0ECCB4FEBCB62A0D98734097E0652323A82D106744
          2A43F0F46671E9A00FB65F2828EAFE40932F5EEFC3CE385B2CE71240BEB3B4DC
          99352FAE760D6FA7B0FCA3BAEE3840C6E2B1A6E5077327AD3B10D6AA01F86540
          E32CB1FB7B7BAC493BFEC3EFE7F30B4BB2E6C5B7BEA70E5B33D5725583BC1F81
          9CA2AE986C63227F31E47FCEFC3A7BA016A4F5940669662BD12EA283B55C8BCB
          0FE64C880EA5C42EB202813CE9973393D7A5070678AD1E1BD9A67120A781725B
          CE068852FC2899C0D7937FDF887CF75B8BD5B2634A4C87E6F5590EE112F2E2B6
          2A22BFDB0F9D990E2AE861FB2BFFD6DF9FBFECE369E3FC1AD696839667181E3B
          2B8B5242C2ADC053ABE6B1AFDDDB37E4DE15AF44885C357CC98F697F5C80A81D
          581D581BB946B758CBB741589938B93FCDBE719A2DD9E9A668FF8096BFFDCDC1
          819A961B9027ECE91D52998A41AE66989DDBCA51E059D220CFCC993850D77216
          455A0FD1C0E73E4DDE73E4E2C8DEEDDE897F84F388DDB96FC8D5F9926EC822EF
          8F5BBDF79BF4534089205388493DB2DA865C0D1EBD03574585FDB9CF7E387C2E
          DFAA28C565F69111EDA60FED2AA519DD7DAB706431D9374EBCA4DE1FB6E56726
          ACFD29BC7D50C2A8080F2BCD5E6B57FA89BC312BD3C01D593CA247EF907BD9DC
          00B13BBAC76E245C55E322AF9326444E26EF62C8B340CB97BC24A46218D9E266
          9B13263DFBA6C5E5A7270EE83405A762A4096668F1CFF3F97D676F2BBA537E7A
          D9F0FA357D45B130B5E5ECC5EE90610D0F3470FCC2F5A10B92ECAA73C5E888C7
          DB35E5249753382438A5309E8C93179FFF2CA5A6AF57DCC32DBF4A3F55DBD727
          715254C3DA35D89C28A1132D15B370D71D807C0E0F39D9E0C74E13ABF49A2DCF
          3E337ECD4FE11D34C83DADFAC239711E27AEDDB7E5606EDF90A0A523C33D6C56
          56CF485557B096436F12DFE82F8DCBA543C6646C59B3E7E8DB9BB0FBF612CDB1
          435C1E44DD37DA1CC7CF9C45B7102DD7DCB707A718D937D1EAC387573FFFE9DB
          ACD3A12DEBEF983650EAD857E1BE21F38B6C5098BD296B55CAB19EED9AAE7BBD
          37E73ABAF7E0E8D8C011FDF6E0E947DB34DA3225266AF65630D83362BBBC18DE
          8E9D3E225E9A2DFF6857594545C61C2D48A34E352758146C16F2AD0781D8F745
          80968FEEE569D59755E07EFEAD92E8F7B7E7DD285AF14A78FFCEC1E25E814AC8
          0D62A7ED2AAEFB06E81D3603BDF2873F676F39C866DFA896D30D521CA589CE20
          E1576CCBF59534D16122C5AEFE53DC73E6E6A252FBF251BDFA870673CB01B498
          04722954EC457A5670ABE4C945C9397937DF8AEBFA72647BAE1FECDC897788B8
          5D2C28EAFDDE77E0BE6D9E18DDAD6DE384E423EF7E9BDDBE499D1D3306810B4D
          558DE831401EBF1088DD2EE6D8A53DA4AB1406E47B31E4E104721205AC4B3B3A
          6363969FA72D67D9703229A277A9DB72A426BE114D73EC5C439CCF5809F98F7F
          CEDE4C6CB90179426AEF904A8F9D65085667A8E690B1EB9067E64E18D879EA13
          A1D2A8013E2CDB7D64C1D65F3A34AFFBC5AB7D6A19094A4ED92490DBED76560B
          B9C7EC76E879DF1EFA64D791D6F7D4DA377B2872CD25899BA5B83190026F7F9D
          B926F5584487A0B5AFF52605825F59535AE158F0EC634FF7B89FCD66EB41DA02
          2D48CB9C174FE272AA5254AA28C6D423810B9ADB7AE8CCF8D57B71C255277632
          BE47A7259EBD5A38E7E94708AF700E2369FAEACDE2FE9AC78E4890C605C1ECB4
          522F8CF687403EA04B8B252FF554F4B83CB58F013997D412F368AC7A689067E7
          4CEC1F4AB5BCD26DC45EFDB5C292D8F94917AF172D78BE7BECC3AD804588BA71
          A8BB83DC2CDD8DEF6BBB7CDA8D5F0F8A3E6B68D75770869533DE2CCCA2EF060D
          E75D2F8A5DB0F3CACDDB1F3ED72D4E5B86D18A4DFE72FF867D271F685227F5DD
          58F20295CD5318F2B2F28AAC0F86D5F677F1D8A5CDB16D6DCBD6B64844860425
          8CECE561C5BB012D96E45FCF8D599556C3DB2369C6A066F502B8409F4A8F01B9
          1EA4B10645F4AEB97657A6FC397B1310BB9670552AB748046D98D04F5C2F1733
          3CBC2DCFCC993030D4D07255A5928BFFACD9736C566266E3C01A69EF0EF5F5B2
          D17D0F9C5575B745424A5FE41B843D3098995F65B46E5C7BF7DB83FDBC3CD894
          1E4756EC9068820534EFE31DBF2E4E3ADCF1DE7AA03DDE3830839BE7AE160E5D
          B013A87ED5D8885EED8248F0AADBF2CB242ED7889D402EEEE09039109A74425C
          0EB63CAA63B3E5AF4492A7B7CB2A9E5D9C7CF86CFED8A80E93078511C9E21C28
          9C6257386267B36F5C2C4A3D6764A48F6096DEDB747010E3B1E3544C5370DF10
          1E1B328FCB2BE70AAF7C8F5D990AEEDB9B4F844D1AD05914AFE317AF3FFBC9EE
          8B05B7A73D110AE4CFD1006520535BCEB5CD292E5CB7EF943FB378F791F3D7DE
          1C14F60A5E7442C24E679627D9600661A685BF8F4D0752BD357D48185E4353B1
          2469FA07519F96D8090D5E3A2A9C6E8B23C41EBF003CF68A4C6CCB5563319EC5
          490C5D682A66F29707EEAD57B347BBC64078369BF554DEF5ECDCAB3E1ED64D6F
          F46FDDB832FDC2D206AA4CC5E0204DB6782A6E1D60FD679DD8B99534B211CA68
          469AB072091431E4E0E726FD76AE6BCB869D5BD42F2977105921627A21BF28FD
          C425BB536D58C737ED9D217EDE9EDC9621C4ACA95701B99887219F538E9C1FBF
          669F87CDB26E6CEF8EC1F5C91E4D31F5C8B105EB8B1D389E376C515280B757FA
          DCB8C0005F07346AC8E0C15397206CF3F3B2AD1FD7A76D505DD558D8D7B51CDC
          B7399A9653911237217172061FC07D9BFE553AD4FE4F7129D9446DB32825658E
          C10FB55A352642C533C4EA37EDAD1E97CFC12B6993623862E748D8C512236D13
          B206F916ECBEBD140E8D6A5A9EB02712A7625879E5285D75ED0CD9FD0E90EFF9
          E3025472ABB84CD537DFE17DAD4E6D6B7769B9F391FB1A7DF8EC6330635C6EAE
          6A2D67895D449128E8D0F949E927F3C6F4ED3833AE2B47035C2C282670F0965F
          CBD0F93B324E5D79AD5FC8B4215D38571FAE9797A5ECF8E56C7468F3CFC7F426
          BB65A09EDC4B78BB63B92303BB6FD496539DE0221CAA2804F237D783960784B5
          6A0001330618750E6E30E4E15688E17356BDA8945FC1B61CB9265C592D24BCC5
          DEA70CA17BEC5D83978C20C47EE6E5843DC47DE37845315F1FA2CB2A49BFFDD5
          F1DEC0F6CDEA955760E7946C5F77AAFEBE1EC37BB56B1258834E3597201157BA
          4DB55CB45230B6F3F9853D666CC92F2A39B5E4852681FE62C020424ED99E3CCA
          3A79E9B9CF7EF0F2B07E352E2AA4793D6AB0916102334FE40DFE68A78F872D7B
          DE309242829B18F2E45270DFE60DABEDBA92C6422E769B403E6EEDDEE8CEDA4E
          53D7F1922458654A8405DBD57D53132745B390B322CEED43A2B24BB45C8BCB0D
          2D1FB934B57727DD63E74E81B1A77F680D2CB16FCECC9916DB657CF483487611
          948DAD082AD5722E1070B78F5DD454D289B88549603962C25AAC181DCE254CD8
          8C3AEBA557C62D7828C397EC4E3E7CE1C55E0FCC7DFA31E2B8B2DD22950C9AB7
          E3D7B357C7F40D993EA40BA999429EE9BA782A6E9F7249C06182DD7A48DB0885
          E3722DE14AD767C52C29913936FB6640EE24C44E872CDD01CCE50300F2F7705C
          BEF46503729A633712AE9C62703831EE9B968A9910ADEF70259862EF478F1539
          E79C5533562CDCA562D8A09096CEC9BBF1C48749607A378CEF1BDAB221C766AC
          C0723050853B7DE566D4EC6D2565F6ED53623AB76AC8B90E8A71ADDE0393951D
          543760DBD4E8407F5F78CA6D84E22067279DA577A467DF7227ACDD17DEA159C2
          282D15E3142894459165F8CAEC9BA1E5D24584AA2067DDB7D43EC24A1A72F53D
          390FAE7287AB967DD312AEDC5E0145F61B1342E4E21672CEF7D6E7029BFEE9EB
          D337A69F7CBC6D9365A3237C8D252FB6243BD71C4390E63FD872E8B3E4C3202E
          DBA70D24FE387B3A0797D434EDE6ED3B4F2D4E3EF1F78D77E31F7DBEE7FD1AE4
          E0B12FDC0590D3208D521F1D2D1F6555265C7371C2B569C2E8484F9B42B73B4A
          9743581157F420ED7B9898C489D12D1BD562E35D960CC4B4846ECB5DDCB73323
          97A5908D50AC56706685470B6F6CD2D6CBF5EC5B189B866267584A3C88F1CCDC
          05692C33D3515D2B2C19F4C1F62BFF942C19D9B3DF83CD39B78BDB5ACBA55FC8
          60AE1616C77EB8F342C1ADF9CF778B7FB40D4B272E920ECD69EEEE1FB3BEC97A
          30B881769E0A431EB740F3D8B5BD6F35E42B69529ED4B26FD9A727ACD9171ED2
          3461A446ECEC4235A713ACEAB35AEE54D02626FBC6F92EDC1A3135101097BF9F
          787040173DE1BA558BCBE93E76275DD0E380E73C03DD7D5BF5D3E6AC1CA2E534
          2AE6620751DDB9E4FFDDA46270C3CB7FF863EE96EC7A01BEBF7CF49462CC9A34
          14A6FCC61988D5A947DFDF7430B861ADEFA70DACE1ED81DC5E47FFCAEFFFC1F6
          7AFEDE3F2F780ADE3DF9F78DF88F7656D89DBF2D7ACADBA38A77B96BF7E173A3
          13527BB66FBA7C74B876A4CF7553B3E8F3B37EFB951BB7FBCDFD1E6E7F3F6560
          E340FFBB6A77FDBEE3D3BECA8879B0F9B251BDB48C10863CAAD3BD5F8CEB7B57
          F5C0356EF54F89193963A33ACE341697596753C49E0E8D53C2EA420E5F8B4ACA
          1E7B6BF3951BC56B5F8FECF760B0596E59EAC1929E9594573C3E7373C1ADB249
          033A3DDFF381C2E2725C35624E58D2E690D5A22C4E3ABC71DFC9F6CDEA26612D
          07821DFCE1F682A2D2B7E31EEAD2AA41293E8AA7C922309371B81CD7A7B0C711
          AD8A02C4F0C9CE23E927F262BBB65A30BC3BE77223574AE33803AF1EDD193C7F
          07FC1DDB3704DA2DD78EB2AA4CBF2BABD14EDA3A547CEA593BC17AA7C2BE2AE5
          6876CE9511116D67C4768512E0F6C62FDC794F1DBF5943BB06F879D9698A573F
          B68AE8514DD63A7A79D872F2FE49483972F64AE17793A3BBB76BCA39409CF5E4
          2E5633DDED7D739D0E6DE9776DDAB1595F6735A8E59BF65EACBF8FA7983D40B2
          C421BDA0B14D99A7805DEB07F8D6F0F5B4E8E7A68D43D24887894007FFC2745C
          BF5D5E5852F6E13360CBDB92022F2E4DF9F1C8F99A3E5E361BC4A3FA2F05D09E
          EBE7FF1427FCA3272AB4E3BE1A06C5772A4ACAEDDF4F89E9D2BA91D926708E9C
          F4D9C4831FB322756BF699DA35BC2CE414B9D67B7C901D9163E6460D48FF5103
          BCC95473CFCAB403D068E384BE0FE3E36D150E47D8E48DD78BCA7C6104DAC64E
          A46F0E52E83621BC0713278BB48DC2DAC17C6D8C650EB5A4B4AC7E80DFEF1F3F
          A3879542D6448A373BB4BB801CCADD282A8D9D9F74EEDAAD19B15D5E8A6CC745
          62E267C45B35ADE67EB3BF831ABC6D368776100474821C43A687B5C9CF26C06B
          881CD006645F8A683BAA7708D9860D26F942FEAD399BB38F9C2FC0FB8135ED46
          165D3F74F520FB18AD483F068EF483ED60FB5F8A6817FB486BD5F5CC149725A5
          F44E27915C65158E295FEEFFFD5C819625548CD3E8FA6F3B182E160EEF916264
          CDB100D4F4F51A17D331A243334A7EC72F5C9FFFFDCFE7AF156965305E2CCDE9
          756104F4D3ABAA2600368BA5738BBA6F3ED135D0C83423C181504DC210162053
          5BCE810785B4F3D96BF6D6F1F3FE6E4A4C93BAFEF8F7124C17C2453E01B4328E
          E78D4848F1B459DF1BF650B37A35ED0E27438CC6EE62E60E7C023EB8B7414D72
          5088B543E7AE1692142F42FC695D2410AE8AFF6D5CDBCFC7CB8364ECD94961ED
          9CD48343C6093AF870ED9F92723067C66668D2490BFEDD06A2A02C76E4D7091A
          D5F6E5C4880CE15A61B12E9112B326EA28F2F6B4D6F2F346C6AF14B1302BAE4B
          D5DCBAA2C8C4F2C5534E09E0352D3F7AF272FC636D3E7EB107F51DC42D91DC7C
          19C9486DBFD194F5E9DF1C3811D5B9F9F251920D876617B7A0A96A195F0B323F
          EAE6E632A69DDFAC8DEBB4B2EB72B2CD9324EF71F73FEBA3EACB9C6C98440CE5
          BFEA3F1FDA70AE199D76CE8B428CD972A7E5D4B0FD7CFAF280B93B2014DE373B
          16DC753607C2E589382F9D86B6C72E5E8F5B08CEB623715274A7E07A742D01B9
          E617E95F36DE759D3D8410129B10FD2F5A98D306822E3B41F41505FF3818BBC1
          813DAB254DE52261FD90DDEB28E6A9C4E886765271CD55B3F8D16C01EB9FD3DC
          3EAB156CEBD29D9FAAD91689CABB2409B04ADB8213FB70AB25237BDDB598E36B
          C29ABD8999B9ED9AD6F971D610F6C4253BE9A29C8ADD15059F6539244B53B3C3
          66E111E75D4CE4B1AD98A56E38D912F3399CD0B0A3E610A5C5B8E560455CA673
          E57651B2B946AB809C265C69AB51EF6DFB2BBFF09DF8873A34AB4B7FA5840B53
          8CAF344CC275617FC4CB6A8D9AB30D629BEDD363C25A36926EBB14FD413179C4
          69B0346BE1E612194F1516FAC43521698E0121D3D884039ED5362E3DC5CE3E07
          12D70AFB97A56B7103BF3486E214A6CABD6F9AD5097F7B4BDE8DDBE070955438
          0C2F92E2AD56FE82111D8E52E983691D75204F4F4B8B86B577CD18E0E961E3A6
          805508A95E22865445D9E776B08BF3C5418E04AE73A34C669073D687ED15859C
          D5728E2A906BE24C916D91900A3DD722CB6DDCBC89911BBB5029D1726E5969E3
          FE131F6D3FEC615190224B4020FAFB724698E1AAFB76076AD13060E6D0AE74BF
          03DB511639B68B8A6B52534AA7ECFCAAAE3967715D875374DA34957D4E5DC4AA
          A4CB6E5C3129122CF6AC207234234A2A451A999C11A3DD464CFA8B9B4F96444D
          21E77A400A41A484D8DF3F52647FD947C8E07A55B1592B99994EB728CBEC20B9
          40805541D1368BF4CE9124F788ED809412A4B3EFC69940AE96557CD78D0DAA8E
          55E2E85D548C2A2F4E1C79C8910B23117A5768E3A4024497E3D99B424FE992BD
          D3F5B764913969236611935FCD33F19639A71DB97A096EB453BA73CD0C57B305
          4A4E83CD788B05491408915D582CC551702683EDA4748DC75D2A46DCFB26520D
          878A482FA2E08B2F4A2F291E9C828AF22B16E06C9E3804161BB680D88434B862
          7D498EBDCD3492931833AF531C20E7C4703D148D1732B114D5825C1A2C994983
          9B5639EF945D8F110BBB99026EF05C01AE12D121372379F6A6B4AB5221969A67
          4EA4CC66C98C90A52E37152F2A6A9CDC48051AC9D44C75B3784ADF37DB7C29F6
          55EAEE22C1C89985E034B7C0EE6314CB73746231CE8B288AC29E16330BB744F7
          07C91695C5B9135D7AC5758B045B0FD755AA36E264B26916164E699DA2E072E4
          641601B10D550D79F5C553DA15F76FB17E32E7F8B0B6504A9514782E3C754398
          EE3D9D2ADF153B59FD8658DB6766653890A4C871ED5639CFE29D2A88DD0DB4EE
          EF57D39394B2BA74546EB84BEAC8FC6BC8ABECF3BF835CECF37F04F26AF653EC
          89CB9DEA0FFBBFD7FF8DEBBF90FFBFBBFE07D4774A6F416B0860000000004945
          4E44AE426082}
        Stretch = True
      end
      object QRLabel8: TQRLabel
        Left = 22
        Top = 281
        Width = 151
        Height = 17
        Size.Values = (
          44.979166666666670000
          58.208333333333330000
          743.479166666666700000
          399.520833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'COMPROBANTE AUTORIZADO'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 9
      end
      object QRLabel32: TQRLabel
        Left = 21
        Top = 300
        Width = 121
        Height = 17
        Size.Values = (
          44.979166666666670000
          55.562500000000000000
          793.750000000000000000
          320.145833333333300000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'GRACIAS POR SU COMPRA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel33: TQRLabel
        Left = 13
        Top = 324
        Width = 186
        Height = 17
        Size.Values = (
          44.979166666666670000
          34.395833333333330000
          857.250000000000000000
          492.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = '*************************************'
        Color = clWhite
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 10
      end
    end
    object TitleBand1: TQRBand
      Left = 0
      Top = 208
      Width = 215
      Height = 119
      Frame.DrawTop = True
      AlignToBottom = False
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        314.854166666666700000
        568.854166666666700000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbTitle
      object QRLabel9: TQRLabel
        Left = 8
        Top = 3
        Width = 35
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          7.937500000000000000
          92.604166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'Cliente'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrrazonsocial: TQRLabel
        Left = 8
        Top = 19
        Width = 62
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          50.270833333333330000
          164.041666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrrazonsocial'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrcuitdni: TQRLabel
        Left = 8
        Top = 36
        Width = 44
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          95.250000000000000000
          116.416666666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrcuitdni'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object qrivacliente: TQRLabel
        Left = 8
        Top = 53
        Width = 57
        Height = 17
        Size.Values = (
          44.979166666666670000
          21.166666666666670000
          140.229166666666700000
          150.812500000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'qrivacliente'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRShape2: TQRShape
        Left = 1
        Top = 73
        Width = 197
        Height = 39
        Size.Values = (
          103.187500000000000000
          2.645833333333333000
          193.145833333333300000
          521.229166666666700000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Shape = qrsRectangle
        VertAdjust = 0
      end
      object QRLabel10: TQRLabel
        Left = 8
        Top = 94
        Width = 42
        Height = 14
        Size.Values = (
          37.041666666666670000
          21.166666666666670000
          248.708333333333300000
          111.125000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'DESCRIP.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel11: TQRLabel
        Left = 61
        Top = 79
        Width = 35
        Height = 14
        Size.Values = (
          37.041666666666670000
          161.395833333333300000
          209.020833333333300000
          92.604166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'P.UNIT.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel12: TQRLabel
        Left = 115
        Top = 80
        Width = 18
        Height = 14
        Size.Values = (
          37.041666666666670000
          304.270833333333300000
          211.666666666666700000
          47.625000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'IVA'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel13: TQRLabel
        Left = 148
        Top = 80
        Width = 30
        Height = 14
        Size.Values = (
          37.041666666666670000
          391.583333333333300000
          211.666666666666700000
          79.375000000000000000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'TOTAL'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
      object QRLabel6: TQRLabel
        Left = 8
        Top = 79
        Width = 29
        Height = 14
        Size.Values = (
          37.041666666666670000
          21.166666666666670000
          209.020833333333300000
          76.729166666666670000)
        XLColumn = 0
        XLNumFormat = nfGeneral
        ActiveInPreview = False
        Alignment = taLeftJustify
        AlignToBand = False
        Caption = 'CANT.'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        VerticalAlignment = tlTop
        FontSize = 8
      end
    end
  end
  object RxMemoryData1: TRxMemoryData
    FieldDefs = <>
    Left = 144
    Top = 432
    object RxMemoryData1DESCRIPCION: TStringField
      FieldName = 'DESCRIPCION'
    end
    object RxMemoryData1PUNITARIO: TStringField
      FieldName = 'PUNITARIO'
      Size = 10
    end
    object RxMemoryData1IVA: TStringField
      FieldName = 'IVA'
      Size = 10
    end
    object RxMemoryData1TOTAL: TStringField
      FieldName = 'TOTAL'
      Size = 10
    end
    object RxMemoryData1CANTIDAD: TStringField
      FieldName = 'CANTIDAD'
      Size = 10
    end
  end
end
