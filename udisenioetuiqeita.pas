unit udisenioetuiqeita;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, QuickRpt, QRCtrls,printers;

type
  TdisenioEtiqeuta = class(TForm)
    QuickRep1: TQuickRep;
    PageHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRep1AfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    paso:boolean;
  end;

var
  disenioEtiqeuta: TdisenioEtiqeuta;

implementation

{$R *.dfm}

uses Unit1;

procedure TdisenioEtiqeuta.QuickRep1AfterPreview(Sender: TObject);
 {var    Detiqueta: TQRShape;
        i:longint;    }
begin
 { i:=1;
  Detiqueta:=TQRShape.Create(self);
  Detiqueta.Name:='eti'+IntToStr(I);
 // Detiqueta.Color:=clYellow;
  Detiqueta.Width:=235;
  Detiqueta.Height:=73;
  Detiqueta.Top:=8;
   Detiqueta.Shape:=qrsRectangle;
   Detiqueta.Parent :=pageheaderband1;
  Detiqueta.Left:=2;//110-(NewDisk.Width Div 2);
  Detiqueta.Visible:=True;
     }
end;

procedure TdisenioEtiqeuta.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);

{ var    Detiqueta: TQRShape;
        i:longint;  }
begin
QuickRep1.PrinterSettings.PrinterIndex:=Printer.Printers.IndexOf('Microsoft Print to PDF');
// QRPQuickrep1.Page.LeftMargin := 1;
 //QRPQuickrep1.Page.TopMargin := 1;
end;

end.
