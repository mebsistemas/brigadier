unit DISENIOTICKET;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, RxMemDS, QRCtrls,
  Vcl.Imaging.pngimage, QRQRBarcode, QuickRpt, Vcl.ExtCtrls, qrpBaseCtrls;

type
  TFRMDISENIOTICKET = class(TForm)
    QRPQuickrep1: TQRPQuickrep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel17: TQRLabel;
    QRLabel21: TQRLabel;
    TitleBand1: TQRBand;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel6: TQRLabel;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1DESCRIPCION: TStringField;
    RxMemoryData1PUNITARIO: TStringField;
    RxMemoryData1IVA: TStringField;
    RxMemoryData1TOTAL: TStringField;
    RxMemoryData1CANTIDAD: TStringField;
    QRLabel7: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMDISENIOTICKET: TFRMDISENIOTICKET;

implementation

{$R *.dfm}

end.
