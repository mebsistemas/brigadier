unit Unit4frmProgreso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Gauges;

type
  TfrmProgreso = class(TForm)
    Gauge1: TGauge;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProgreso: TfrmProgreso;

implementation

{$R *.dfm}

end.
