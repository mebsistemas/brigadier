unit Unidiseniocierrecaja;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QuickRpt, QRCtrls, Vcl.ExtCtrls,
  qrpBaseCtrls, Data.DB, RxMemDS;

type
  Tfrmdiseniocierrecaja = class(TForm)
    QRPQuickrep1: TQRPQuickrep;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    PageFooterBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1FORMA: TStringField;
    RxMemoryData1CANTIDAD: TStringField;
    RxMemoryData1TOTAL: TStringField;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel9: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmdiseniocierrecaja: Tfrmdiseniocierrecaja;

implementation

{$R *.dfm}

end.
