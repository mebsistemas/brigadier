object pidecantidadyprecio: Tpidecantidadyprecio
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 197
  ClientWidth = 343
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
    Width = 329
    Height = 113
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 52
      Height = 13
      Caption = 'CANTIDAD'
    end
    object Label2: TLabel
      Left = 16
      Top = 62
      Width = 91
      Height = 13
      Caption = 'PRECIO UNITARIO'
    end
    object Label3: TLabel
      Left = 192
      Top = 62
      Width = 32
      Height = 13
      Caption = 'TOTAL'
    end
    object Edit1: TEdit
      Left = 16
      Top = 35
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
      OnKeyPress = Edit1KeyPress
    end
    object Edit2: TEdit
      Left = 16
      Top = 81
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'Edit2'
      OnKeyPress = Edit2KeyPress
    end
    object Edit3: TEdit
      Left = 192
      Top = 81
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'Edit3'
      OnKeyPress = Edit3KeyPress
    end
    object BitBtn3: TBitBtn
      Left = 144
      Top = 77
      Width = 42
      Height = 25
      Caption = 'C'
      TabOrder = 3
      OnClick = BitBtn3Click
    end
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 133
    Width = 113
    Height = 39
    Caption = 'ACEPTAR'
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
      0000000000000000000069A869003C9642001A8D2600158F2400158F24001B8E
      28003D96440069A8690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000039923D002EAB420040CE61004DE0740058F1850060F9910063FC95005DF6
      8C0052E57B0045D3680031AD450039923D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000002F90340028AC
      3D004EE8760051EA790055EF800058F185005DF68C0060F9910063FC950062FB
      94005DF68C005BF5890056F1820056F182002CAF420031903600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002A8F30003BCD590048E2
      6D004CE5720051EA790054ED7E0058F185005CF58A005FF88E0062FB940060F9
      91005DF68C0059F2880055EF800052EA7C004EE8760040D261002C9133000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000169122003DD25A0044DC650047E0
      6A004BE471004DE6750052EA7C0054ED7E0058F185005CF58A005DF68C005DF6
      8C0059F2880058F1850054ED7E0051EA79004DE6750048E26D0041DA62001993
      2600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000288D2D0039CD54003DD65C0041DA620046DF
      69004AE370004CE572004EE8760095F3AF0083F3A40056F1820059F2880059F2
      880058F1850055EF800051EA79004EE876004AE3700048E26D0044DC65003DD3
      5C002A8F30000000000000000000000000000000000000000000000000000000
      000000000000000000002C8E31002DC0450039D155003BD459003FD8610044DC
      650047E06A0048E26D00A6F3BA00FEFEFE00F6FCF80095F4AF0052ED7D0054ED
      7E0052ED7D0051EA79004EE876004DE6750048E26D0046DF690041DA64003FD8
      5E0032C54C002C8E310000000000000000000000000000000000000000000000
      000000000000000000001B9F290032CC4D0037D054003BD457003FD85E0041DA
      620042DD65008CECA300FEFEFE00FFFFFF00FFFFFF00F6FCF80080F09E0052EA
      7C0051EA79004EE876004CE5720048E26D0047E06A0044DC65003FD861003DD6
      5C003AD258001FA22E0000000000000000000000000000000000000000000000
      000000000000378F38002FCB480031CA4C0035CE4E0037D054003CD65A003DD6
      5C00A1EDB100FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6FCF8009DF0
      B3005FE781005FE7810055E379004DE06F0044DC650041DA62003DD65C003BD4
      570036D0520036D05200378F3800000000000000000000000000000000000000
      0000000000001A9726002DC6440030C9490032CC4D0035CE50003AD258008DE6
      9F00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F7FD
      F7008CECA30061E5800061E580005FE27C0054DC710040D85F003BD4570039D1
      550035CE4E0032CC4D001E9C2900000000000000000000000000000000000000
      000069A569001EAC2E002AC340002CC5430030C9490039CD5300ADEBB800FEFE
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00F6FCF800A1EDB10063E17F0066E1800066DD7D0060DC79003DD25A0035CE
      500031CA4C0030C9490021AF330069A569000000000000000000000000000000
      0000378F380020B4300028C13C002AC3400036C94C0095E2A100FEFEFE00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F6FCF80090E8A20066DD7D0066DD7D0066DD7D005DD8720039CD
      54002FC847002DC6440024B83800378F38000000000000000000000000000000
      00000B7C0F0020BA310025BD380027C13C00ACE7B500FEFEFE00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00F7FDF700A4EAB20069DA7D006DDA7E0069DA7D0063D5
      74002DC644002BC4400025BD38000B7C0F000000000000000000000000000000
      0000007A060020BA310020BA310080D98B00FEFEFE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00C7F1CF00D9F6DE00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7FDF70094E5A2006DDA7E006ED77E006ED7
      7E0043CA560025C0390025C03900027C08000000000000000000000000000000
      0000007A06001BB72B0058CA6400F7FDF700FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00BBEDC4007ADD8A0082DE9000CDF1D200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F6FCF800A9E7B30072D7800072D7
      800061D06F002ABF3B0020BA3100007A06000000000000000000000000000000
      00000B7B0D0018B1250038C04600BEEAC300FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CDF1D2007DDC8C007DDC8C007DDC8C0084DF9400DDF6E200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8FCF9009AE2A40076D6
      81006FD37B0032BF43001CB52D000B7B0D000000000000000000000000000000
      0000368D360014A71E0035BC410074D27E00CAEDCD00FEFEFE00FFFFFF00FFFF
      FF00BFECC50082DB8E0082DB8E0082DE900085DC910082DE900088DD9500CFF2
      D500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F8FCF900A6E4
      AE0078D4820038C0460017AB2300368D36000000000000000000000000000000
      000069A569000F9D170038BC420081D4880089D99200DAF1DD00FFFFFF00D2F1
      D60089D9920086DA910088DC930088DC930088DC930088DD950088DD95008EDD
      9900E2F5E400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1FA
      F20096DD9B0039BE470012A11B0069A569000000000000000000000000000000
      0000000000000F8B14002DB637007ED2840088D68E0089D79000B5E6B9008DDA
      95008DDA95008EDD96008EDD96008EDD96008EDD99008EDD96008EDD99008EDD
      960094DD9C00D2F1D600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00B8E7BC002FB93900118D1600000000000000000000000000000000000000
      000000000000368D360021B22A0079D07E008ED893008ED893008ED8930090DA
      970090DA970092DB980092DD9A0092DD9A0092DD9A0094DD9C0092DD9A0094DD
      9C0092DD9A0099DB9E00E2F5E400FFFFFF00FFFFFF00FFFFFF00FFFFFF00D6F0
      D8007CD1830025B62F00358A3500000000000000000000000000000000000000
      00000000000000000000068B0B0057C25C0096DA9A0096DA9A0096DA9A0097DA
      9C0096DD9B0099DB9E0099DB9E0099DB9E0099DB9E009CDDA20099DB9E0099DB
      9E009CDDA20099DB9E009CDDA200D8F2DA00FFFFFF00FFFFFF00CAEDCD0097DA
      9C0058C46000098D0D0000000000000000000000000000000000000000000000
      00000000000000000000278827001AA21F0097DA9C0099DB9E009CDDA20099DB
      9E009CDDA2009CDDA2009CDDA2009CDDA2009CDDA2009CDDA2009CDDA2009CDD
      A2009CDDA2009CDDA2009CDDA200A3DDA600E6F6E700DAF1DD009CDDA20099DB
      9E001CA422002888280000000000000000000000000000000000000000000000
      00000000000000000000000000001F831F0041B5450099DB9E00A3DDA600A4DD
      A800A4DDA800A4DDA800A4DDA800A6E0A900A6E0A900A6E0A900A6E0A900A6E0
      A900A6E0A900A6E0A900A4DDA800A4DDA800A3DDA600A3DDA6009CDDA20041B5
      45001F831F000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000067E07004BB74E00B3E2B500ABE0
      AE00ABE0AE00ABE0AE00ABE0AE00ABE0AE00ABE0AE00ABE0B000ABE0AE00ABE0
      AE00ABE0B000ABE0AE00ABE0AE00ABE0AE00ABE0AE00B3E2B5004DB95000077F
      0900000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001F831F0037AA3A008DD4
      8F00B7E3B900B3E2B500B3E2B500B3E2B500B3E2B500B3E2B500B3E2B500B3E2
      B500B3E2B500B3E2B500B3E2B500B8E4B9008ED4900039AC3C001F831F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000027872700158D
      160060C36200AADEAA00BFE6C000BCE5BD00BCE5BD00BCE5BD00BCE5BD00BCE5
      BD00BCE5BD00BFE6C000AADEAA0060C36200158D160027872700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000358A350008830800279E290053B5540072C6730083D0840083D0840072C6
      730053B55400289F2B0008830800358A35000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000069A56900358A35000B730B0000700000007000000B73
      0B00358A350069A5690000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000}
    ModalResult = 1
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 232
    Top = 133
    Width = 89
    Height = 39
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
  end
end
