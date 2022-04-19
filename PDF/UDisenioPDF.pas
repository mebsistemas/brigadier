unit UDisenioPDF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, QuickRpt, qrpBaseCtrls,
  QRCtrls, qrpctrls, Data.DB, RxMemDS, QRQRBarcode,printers, Barcode,
  Vcl.Imaging.pngimage,Unit1;

type
  Tfrmpdf = class(TForm)
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1DESCRIPCION: TStringField;
    RxMemoryData1PUNITARIO: TStringField;
    RxMemoryData1IVA: TStringField;
    RxMemoryData1TOTAL: TStringField;
    QRPQuickrep1: TQRPQuickrep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    PageFooterBand1: TQRBand;
    TitleBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel9: TQRLabel;
    qrrazonsocial: TQRLabel;
    qrcuitdni: TQRLabel;
    qrivacliente: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape4: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel7: TQRLabel;
    QRORIGINAL: TQRLabel;
    QRQRBarcode1: TQRQRBarcode;
    QRImage1: TQRImage;
    QRLabel8: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    RxMemoryData1CANTIDAD: TStringField;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    procedure QRPQuickrep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    nombreimpresora:String;
  end;

var
  frmpdf: Tfrmpdf;

implementation

{$R *.dfm}

procedure Tfrmpdf.QRPQuickrep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
 QRPQuickrep1.PrinterSettings.PrinterIndex:=Printer.Printers.IndexOf(trim(FORM1.tconfi.GET_FIMPRESORA));
 QRPQuickrep1.Page.LeftMargin := 5;
 QRPQuickrep1.Page.TopMargin := 1;
 //QRPQuickrep1.Page.BottomMargin:=15;
end;

end.
