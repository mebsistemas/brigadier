unit URemitoPDFA4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, QuickRpt, qrpBaseCtrls,
  QRCtrls, qrpctrls, Data.DB, RxMemDS, QRQRBarcode,printers;

type
  TfremitoPDFA4 = class(TForm)
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
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    qrrazonsocial: TQRLabel;
    qrcuitdni: TQRLabel;
    qrivacliente: TQRLabel;
    qrdomicilio: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRShape3: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape4: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel7: TQRLabel;
    QRORIGINAL: TQRLabel;
    qrdomicilio2: TQRLabel;
    procedure QRPQuickrep1AfterPrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    nombreimpresora:string;
  end;

var
  fremitoPDFA4: TfremitoPDFA4;

implementation

{$R *.dfm}

procedure TfremitoPDFA4.QRPQuickrep1AfterPrint(Sender: TObject);
begin
QRPQuickrep1.PrinterSettings.PrinterIndex:=Printer.Printers.IndexOf(trim(nombreimpresora));

end;

end.
