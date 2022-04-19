unit Unit3INFOCOSTOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UNIT1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TINFOCOSTOS = class(TForm)
    FDQuery1: TFDQuery;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  INFOCOSTOS: TINFOCOSTOS;

implementation

{$R *.dfm}

procedure TINFOCOSTOS.BitBtn1Click(Sender: TObject);
begin
close;
end;

end.
