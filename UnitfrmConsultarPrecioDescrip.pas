unit UnitfrmConsultarPrecioDescrip;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,Unit1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmConsultarPrecioDescrip = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultarPrecioDescrip: TfrmConsultarPrecioDescrip;

implementation

{$R *.dfm}

procedure TfrmConsultarPrecioDescrip.BitBtn1Click(Sender: TObject);
begin
CLOSE;
end;

procedure TfrmConsultarPrecioDescrip.DBGrid1DblClick(Sender: TObject);
begin
MODALRESULT:=MROK;

end;

procedure TfrmConsultarPrecioDescrip.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
MODALRESULT:=MROK;
end;

procedure TfrmConsultarPrecioDescrip.Edit1KeyPress(Sender: TObject;
  var Key: Char);
  VAR SQL,B:sTRING;

begin
B:='%'+TRIM(EDIT1.Text)+'%';
SQL:='select descripcion, precioventa,stock,CODIGOBARRA from tarticulos where descripcion like '+#39+TRIM(B)+#39+' order by descripcion asc';
SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add(SQL);
SELF.FDQuery1.OpeN;
end;

procedure TfrmConsultarPrecioDescrip.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
if KEY=#27 then
MODALRESULT:=MRCANCEL;
end;

procedure TfrmConsultarPrecioDescrip.FormShow(Sender: TObject);
begin
EDIT1.SetFocus;
end;

end.
