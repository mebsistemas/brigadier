object buscar_clientes: Tbuscar_clientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Buscar Clientes'
  ClientHeight = 273
  ClientWidth = 457
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
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 425
    Height = 153
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
  end
  object Edit1: TEdit
    Left = 8
    Top = 176
    Width = 425
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    Text = 'EDIT1'
    OnKeyPress = Edit1KeyPress
  end
  object BitBtn1: TBitBtn
    Left = 336
    Top = 216
    Width = 97
    Height = 39
    Caption = 'SALIR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
      000000000000000000006868C5003535B8000909B0000000B1000000B1000909
      B0003535B8006868C50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003434B5000808C4000000D9000000E3000000EF000000F6000000F8000000
      F2000000E9000000DD000808C8003535B8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002727B5000000
      C2000000E7000D0DE9002525EE003B3BF2005353F7005252FA005252FA005252
      FA003B3BF9002626F4000D0DF2000000EF000000C5002727B500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F1FB5000000D1000808
      DF003C3CEA005757EE006B6BF3006D6DF6006C6CF9006C6CF9006C6CFD006C6C
      FD006C6CF9006B6BF8005757F5003C3CF1000808E9000000D9001F1FB5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000B1000000D1002121DF004E4E
      E8005252ED005252ED005252F2005252F2005353F7005353F7005252FA005252
      FA005353F7005353F7005252F2005454F2004E4EEE002121E7000000D9000000
      B500000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001E1EB1000000CD001D1DDB003D3DE2003A3A
      E5009494F2005757EE003E3EED004141F2004141F2004141F8004141F8004141
      F8004040F6003A3AF4009D9DF8006565F2003E3EED004040E9001D1DE2000000
      D5001E1EB1000000000000000000000000000000000000000000000000000000
      000000000000000000002727B2000000C5001212D3002727DB003D3DE200ACAC
      F300FFFFFF00E1E1FA004040ED002525EE002828EF002828F1002828F1002626
      F4003131F200A5A5F800FFFFFF00F5F5FC005252ED002626E5002828E2001212
      DC000000CD002727B50000000000000000000000000000000000000000000000
      000000000000000000000000B5000000C9001212D3001212D500BBBBF400FEFE
      FE00FFFFFF00FFFFFF00C5C5F8003737ED002020EC002424F0002424F0001A1A
      EF00A0A0F800F9F9FD00FFFFFF00FFFFFF00D9D9FA004141E7001313DB001313
      DB000000D1000000B90000000000000000000000000000000000000000000000
      0000000000003434B5000000C5000000C9000000CD008686E900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00E1E1FA003B3BEC002222EA002D2DEC00A1A1
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E1E1FA000000D5000000
      D5000000D1000000D1003434B500000000000000000000000000000000000000
      0000000000000909B0000000C5000000C5000000C9001B1BD400DDDDF800FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5C5F8003C3CEA00A1A1F600F9F9
      FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F5FC006868E8000000D5000000
      D5000000CD000000CD000808B600000000000000000000000000000000000000
      00006969C1000000B5000000C2000000C5000000C9001515D0004C4CDE00CACA
      F500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9F9FD00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F5F5FC006868E8003333DE001717D7000000
      D1000000CD000000C9000000BD006969C1000000000000000000000000000000
      00003737AF000000B9000000C2000000C2001515CC003B3BD6003C3CD8005050
      DD00E6E6FA00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F5F5FC008686EC003939DF003E3EDE003B3BDB001515
      D0000000C9000000C9000000BD003737AF000000000000000000000000000000
      00000B0BA1000000B9000000BD000707C2004646D4004848D7004848DA004646
      D9005A5AE100CFCFF600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F5F5FC007676E8004343E0004848DD004848DD004848DA004646
      D9000707C9000000C5000000BD000B0BA1000000000000000000000000000000
      000000009E000000B9000000B9002C2CCA005151D6005151D6005050DA005050
      DA004E4EDB005F5FE000F9F9FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FEFEFE009898ED004B4BE0005050DD005050DD005050DD005050DA005151
      D6002C2CCF000000C2000000BD000000A0000000000000000000000000000000
      000000009E000000B5000C0CBB004D4DCF005A5AD5005A5AD5005A5AD9005A5A
      D9006161DC00B7B7F000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E6E6FA006B6BE2005A5ADD005A5ADD005A5AD9005A5AD9005A5A
      D9004D4DD3000C0CC2000000BD000000A0000000000000000000000000000000
      00000B0BA1000000B1001515BC005A5AD2006262D6006262D6006262D8005D5D
      D800BCBCF000F9F9FD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00D6D6F6007272E1006161DC006161DC006262D8006262
      D8005A5AD5001515C2000000B9000B0BA1000000000000000000000000000000
      00003737AF000000AC002121BD007171D5006C6CD6006C6CD6007373DA00C1C1
      EE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00EAEAF9007B7BDE006B6BDB006D6DD9006D6D
      D9006D6DD9002121C1000000B1003737AF000000000000000000000000000000
      00006969C1000101A8002020B9007171D5007676D7007171D500C4C4EF00FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F9F9FD00AEAEEC00EAEAF900FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DBDBF5008383DE007575DA007575
      DA007171D5002121BD000000AC006969C1000000000000000000000000000000
      0000000000000808A4001A1AB5007373D2007D7DD700B6B6E900FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F9F9FD009E9EE6007B7BDE008C8CE100DDDD
      F600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEAF9007B7BDA007F7F
      DB007373D2001A1AB9000808A900000000000000000000000000000000000000
      0000000000003333B1000909AD006969CE008686DA009696DE00EDEDF900FFFF
      FF00FFFFFF00FFFFFF00F9F9FD00B3B3EA008383DE008484DE008484DE009090
      E000EDEDF900FFFFFF00FFFFFF00FFFFFF00FEFEFE00C4C4EF008383DA008686
      DA006969D1000909B0003333B100000000000000000000000000000000000000
      000000000000000000000000A0003535B8009393DB008E8EDA00A4A4E200EDED
      F900FFFFFF00F9F9FD00ACACE6008D8DDE009090E0009090E0009090E0009090
      E0009B9BE200E2E2F600FFFFFF00FEFEFE00BABAEA008D8DDE009191DD009393
      DB003535BD000101A40000000000000000000000000000000000000000000000
      000000000000000000002727AC000101A4008282D5009999DD009696DE00ABAB
      E400F3F3FA00BFBFEA009696DE009696DE009797E0009797E0009797E0009797
      E0009797E000A1A1E100EDEDF900CCCCEF009696DE009696DE009999DD008282
      D5000101A8002727AC0000000000000000000000000000000000000000000000
      00000000000000000000000000001F1FA8001E1EAD008686D500A1A1DE00A1A1
      DE009E9EDF009E9EDF00A1A1DE00A1A1E100A1A1E100A1A1E100A1A1E100A1A1
      E100A1A1E100A1A1E1009E9EE0009E9EE000A1A1DE00A1A1E1008686D5001E1E
      B1001F1FA8000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000009E001E1EAD00A1A1DE00ADAD
      E200AAAAE200AAAAE200AAAAE200AAAAE200AAAAE200AAAAE200AAAAE200AAAA
      E200AAAAE200AAAAE200AAAAE200AAAAE200ADADE200A1A1DE001E1EAD000000
      9E00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F1FA7000D0DA3006868
      C500A8A8DE00B6B6E400B3B3E400B3B3E400B3B3E400B3B3E400B3B3E400B3B3
      E400B3B3E400B3B3E400B6B6E400A8A8DE006868C5000D0DA6001F1FA8000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002727AC000000
      9E002F2FB1006666C600B2B2E200C0C0E800BEBEE700BEBEE700BEBEE700BEBE
      E700C0C0E800B2B2E2006666C6002F2FB10000009E002727AC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003333B10008089D00000099001010A3003333B1003E3EB5003E3EB5003333
      B1001010A3000000990008089D003333B1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006969C1003737AB000B0B990000009500000095000B0B
      99003737AB006969C10000000000000000000000000000000000000000000000
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
  object FDQuery1: TFDQuery
    Connection = Form1.FDConnection1
    Left = 96
    Top = 56
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 192
    Top = 56
  end
end
