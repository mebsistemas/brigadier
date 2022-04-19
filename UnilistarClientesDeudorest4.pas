unit UnilistarClientesDeudorest4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,unit1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TlistarClientesDeudores = class(TForm)
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
  listarClientesDeudores: TlistarClientesDeudores;

implementation

{$R *.dfm}

procedure TlistarClientesDeudores.BitBtn3Click(Sender: TObject);
begin
close;
end;

end.
