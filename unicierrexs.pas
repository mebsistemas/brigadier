unit unicierrexs;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QuickRpt, QRCtrls, Vcl.ExtCtrls,
  qrpBaseCtrls, Data.DB, RxMemDS;

type
  Tcierrex = class(TForm)
    QRPQuickrep1: TQRPQuickrep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1cantidad: TStringField;
    RxMemoryData1total: TStringField;
    RxMemoryData1forma: TStringField;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cierrex: Tcierrex;

implementation

{$R *.dfm}

end.
