unit UFMIMPRESIONVARIOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, QuickRpt, Vcl.ExtCtrls, qrpBaseCtrls,
  QRCtrls;

type
  TFRMIMPRESIONVARIOS = class(TForm)
    QRPQuickrep1: TQRPQuickrep;
    PageFooterBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMIMPRESIONVARIOS: TFRMIMPRESIONVARIOS;

implementation

{$R *.dfm}

end.
