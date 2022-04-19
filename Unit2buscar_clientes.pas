unit Unit2buscar_clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids,UNIT1, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tbuscar_clientes = class(TForm)
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SALE:BOOLEAN;
  end;

var
  buscar_clientes: Tbuscar_clientes;

implementation

{$R *.dfm}

procedure Tbuscar_clientes.BitBtn1Click(Sender: TObject);
begin
SALE:=TRUE;
CLOSE;
end;

procedure Tbuscar_clientes.DBGrid1DblClick(Sender: TObject);
begin
SALE:=FALSE;
CLOSE;
end;

procedure Tbuscar_clientes.Edit1KeyPress(Sender: TObject; var Key: Char);
VAR B:sTRING;
begin
B:='%'+TRIM(EDIT1.Text)+'%';
SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('SELECT IDCLIENTE, APENOM FROM TCLIENTES WHERE  APENOM LIKE '+#39+TRIM(B)+#39);
SELF.FDQuery1.Open;
end;

procedure Tbuscar_clientes.FormShow(Sender: TObject);
begin
SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('SELECT IDCLIENTE, APENOM FROM TCLIENTES ORDER BY APENOM ASC');
SELF.FDQuery1.Open;
end;

end.
