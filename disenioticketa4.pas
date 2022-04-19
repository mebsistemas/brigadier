unit disenioticketa4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, RxMemDS, QRCtrls, QuickRpt, printers,
  Vcl.ExtCtrls, qrpBaseCtrls,unit1;

type
  TfrmDisenioTicketA4 = class(TForm)
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
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1DESCRIPCION: TStringField;
    RxMemoryData1PUNITARIO: TStringField;
    RxMemoryData1IVA: TStringField;
    RxMemoryData1TOTAL: TStringField;
    RxMemoryData1CANTIDAD: TStringField;
    QRLabel1: TQRLabel;
    SummaryBand1: TQRBand;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape3: TQRShape;
    QRLabel9: TQRLabel;
    QRShape2: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    procedure QRPQuickrep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDisenioTicketA4: TfrmDisenioTicketA4;

implementation

{$R *.dfm}

procedure TfrmDisenioTicketA4.QRPQuickrep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
QRPQuickrep1.PrinterSettings.PrinterIndex:=Printer.Printers.IndexOf(trim(form1.tconfi.GET_FIMPRESORA));
end;

end.
