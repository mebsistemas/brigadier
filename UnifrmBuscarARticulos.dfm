object frmBuscarARticulos: TfrmBuscarARticulos
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Buscar Art'#237'culos'
  ClientHeight = 315
  ClientWidth = 783
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 767
    Height = 201
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGOBARRA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'DESCRIPCION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 366
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MARCA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'PRECIOVENTA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Alignment = taCenter
        Title.Caption = 'PRECIO '
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'aidarticulo'
        Visible = False
      end>
  end
  object Edit1: TEdit
    Left = 8
    Top = 224
    Width = 767
    Height = 27
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    Text = 'EDIT1'
    OnKeyPress = Edit1KeyPress
  end
  object BitBtn1: TBitBtn
    Left = 664
    Top = 260
    Width = 110
    Height = 40
    Caption = 'SALIR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Glyph.Data = {
      36100000424D3610000000000000360000002800000020000000200000000100
      2000000000000010000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006060C8001010AC000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001010AC006060C800000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006163CD003644CB005064DA001113
      B300000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001113B3005A70E1003644CB006163CD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000006366D2003746D1008AACFF008CAEFF00586F
      E3001418BB000000000000000000000000000000000000000000000000000000
      000000000000000000001418BB005A70E1008DB0FF008DB0FF003847D1006366
      D200000000000000000000000000000000000000000000000000000000000000
      000000000000000000006569D7003647D60085A7FF008AACFF008DB0FF0086A8
      FF00576EE600171EC30000000000000000000000000000000000000000000000
      000000000000171EC3005970E6008AACFF008DB0FF008CAEFF008AACFF003949
      D6006569D7000000000000000000000000000000000000000000000000000000
      000000000000484ED5003547DB007E9EFE007C9AFE007C9AFE007C9AFE007C9A
      FE007FA0FF00556DE9001A22CA00000000000000000000000000000000000000
      00001A22CA00556DE90082A3FF007C9AFE007C9AFE007C9AFE007E9EFE0086A8
      FF00394BDB00666CDC0000000000000000000000000000000000000000000000
      0000000000001D26D2004F68EE006E8CFE006983FC006983FC006983FC006983
      FC006A84FC007695FE005169EC001D26D2000000000000000000000000001D26
      D2005169EC007998FE006A84FC006983FC006983FC006983FC006983FC007695
      FE00566FEE003B43D70000000000000000000000000000000000000000000000
      000000000000000000003C46DD004961F1005A71FC00576DFB00576DFB00576D
      FB00576DFB00576DFB006B88FE004B63EF001E2BD900000000001E2BD9004D65
      EF006E8CFE00586FFD00576DFB00576DFB00576DFB00576DFB00627BFD00526B
      F0003C46DD000000000000000000000000000000000000000000000000000000
      00000000000000000000000000003E49E3004259F3004E62FB004758FA004758
      FA004758FA004758FA004959F9005F79FD00455DF2001321DE00455DF200617D
      FE004959F9004758FA004758FA004758FA004758FA004E62FB004961F1003E49
      E300000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000414DE9003950F6003C4EFA003845
      F8003845F8003845F8003845F8003949FA005269FD005875FF00536DFE003949
      FA003845F8003845F8003845F8003845F8003E50FA00425AF500414DE9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004250ED003147F7002E3B
      F9002A34F8002A34F8002A34F8002A34F8002C37F8003D52FC002C37F8002A34
      F8002A34F8002A34F8002A34F800303EF9003950F6004250ED00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004352F200263C
      F900202BF9001E25F7001E25F7001E25F7001E25F7001E25F7001E25F7001E25
      F7001E25F7001E25F700232EF9002E45F9004352F20000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004555
      F5001C31F900161EF8001318F6001318F6001318F6001318F6001318F6001318
      F6001318F600161EF8002238FB004555F5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001C31F9001422FA000A0DF6001B20F7001B20F7001B20F7001B20F7001B20
      F7000A0DF6000E16F7001C31F900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000002B3F
      FB002E3DF9003845F8004A57F9004D5BF9004E5DF900505FF900505FF9004E5D
      F9004E5DF9003F4BF8003040F9002B3FFB000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002C40FE003748
      FB004A57F9004E5DF900505FF9005565FA005565FA005768FA005768FA005768
      FA005565FA005261F9004E5DF9003B4DFB002C40FE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002C40FE003949FA004D5B
      F9005261F9005768FA005A6DFA005C6EFA005E70FA006072FA006072FA006072
      FA005E70FA005A6DFA005768FA005565FA003E50FA002C40FE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002C40FE003949FA004E5DF9005565
      FA005A6DFA005E70FA006275FA006679FA00697DFB00697DFB00697DFB00697D
      FB00687BFB006477FA006072FA005C6EFA005768FA003E50FA002C40FE000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000002C40FE003949FA004E5DF9005565FA005C6E
      FA006275FA00687BFB006C80FB007085FB005269FD001E35FF005269FD007388
      FB007085FB006C80FB00697DFB006477FA005E70FA005869FA003D52FC002C40
      FE00000000000000000000000000000000000000000000000000000000000000
      000000000000000000002C40FE003748FB004D5BF9005565FA005C6EFA006275
      FA00697DFB007085FB00748AFB00566CFD00485BFF0000000000485BFF00586F
      FD007A91FC00768DFB007388FB006C80FB006679FA005E70FA005869FA003E50
      FA002C40FE000000000000000000000000000000000000000000000000000000
      0000000000002C40FE003245FC004A57F9005261F9005A6DFA006275FA00697D
      FB007085FB00788EFB00586FFD00485BFF00000000000000000000000000485B
      FF005D75FD007E96FC007A91FC00748AFB006C80FB006679FA005E70FA005565
      FA003C4EFA002C40FE0000000000000000000000000000000000000000000000
      0000000000007281FF002C40FE004E5DF9005768FA006072FA00687BFB007085
      FB00788EFB00586FFD00485BFF00000000000000000000000000000000000000
      0000485BFF005F79FD008199FC007A91FC007388FB006C80FB006275FA005A6D
      FA003245FC007281FF0000000000000000000000000000000000000000000000
      000000000000000000007281FF003245FC005A6DFA006477FA006C80FB00768D
      FB00586FFD00485BFF0000000000000000000000000000000000000000000000
      000000000000485BFF005F79FD008199FC00788EFB007085FB00687BFB00374C
      FD007281FF000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007281FF00374CFD00687BFB007085FB00566C
      FD00485BFF000000000000000000000000000000000000000000000000000000
      00000000000000000000485BFF005D75FD007E96FC00748AFB003B51FE007281
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007281FF003B51FE005269FD00485B
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000485BFF005A71FC004057FE007281FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005667FF00485BFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000485BFF007281FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    ModalResult = 2
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object DataSource1: TDataSource
    Left = 272
    Top = 104
  end
end
