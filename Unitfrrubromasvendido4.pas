unit Unitfrrubromasvendido4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, QuickRpt, QRCtrls,UNIT1;

type
  Tfrrubromasvendido = class(TForm)
    QuickRep1: TQuickRep;
    DetailBand1: TQRBand;
    TitleBand1: TQRBand;
    PageFooterBand1: TQRBand;
    QRLabel1: TQRLabel;
    PageHeaderBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRExpr1: TQRExpr;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frrubromasvendido: Tfrrubromasvendido;

implementation

{$R *.dfm}

end.
