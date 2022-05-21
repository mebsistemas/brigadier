unit ufimformex80;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, RxMemDS, QRCtrls, QuickRpt,   PRINTERS,
  Vcl.ExtCtrls, qrpBaseCtrls;

type
  Tfrminformex80 = class(TForm)
    QRPQuickrep1: TQRPQuickrep;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1cantidad: TStringField;
    RxMemoryData1total: TStringField;
    RxMemoryData1forma: TStringField;
    procedure QRPQuickrep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frminformex80: Tfrminformex80;

implementation

{$R *.dfm}

uses Unit1;

procedure Tfrminformex80.QRPQuickrep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
 QRPQuickrep1.PrinterSettings.PrinterIndex:=Printer.Printers.IndexOf(trim(FORM1.tconfi.GET_FIMPRESORA));
 QRPQuickrep1.Page.LeftMargin := 1;
 QRPQuickrep1.Page.TopMargin := 1;
end;

end.
