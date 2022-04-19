unit Unidetallefacturat4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons,unit1, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tdetallefactura = class(TForm)
    DBGrid1: TDBGrid;
    BitBtn3: TBitBtn;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  detallefactura: Tdetallefactura;

implementation

{$R *.dfm}

procedure Tdetallefactura.BitBtn3Click(Sender: TObject);
begin
close;
end;

end.
