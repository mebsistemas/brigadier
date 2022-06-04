unit Udiseniocierrecaja58;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, RxMemDS, QRCtrls, QuickRpt, PRINTERS,
  Vcl.ExtCtrls, qrpBaseCtrls;

type
  TfrmdiseniocierreCaja58 = class(TForm)
    QRPQuickrep1: TQRPQuickrep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText2: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1FORMA: TStringField;
    RxMemoryData1CANTIDAD: TStringField;
    RxMemoryData1TOTAL: TStringField;
    PageFooterBand1: TQRBand;
    QRLabel11: TQRLabel;
    procedure QRPQuickrep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmdiseniocierreCaja58: TfrmdiseniocierreCaja58;

implementation

{$R *.dfm}

uses Unit1;

procedure TfrmdiseniocierreCaja58.QRPQuickrep1BeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
 QRPQuickrep1.PrinterSettings.PrinterIndex:=Printer.Printers.IndexOf(trim(FORM1.tconfi.GET_FIMPRESORA));
 QRPQuickrep1.Page.LeftMargin := 1;
 QRPQuickrep1.Page.TopMargin := 1;


end;

end.
