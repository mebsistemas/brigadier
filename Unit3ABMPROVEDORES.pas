unit Unit3ABMPROVEDORES;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,UNIT1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FUNCTION CARGARPROVEEDOR:BOOLEAN;
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses Unitnuevoproveedor4;
procedure TForm3.BitBtn1Click(Sender: TObject);
begin
CLOSE;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
nuevoproveedor.EDIT1.Clear;
nuevoproveedor.EDIT2.Clear;
nuevoproveedor.EDIT3.Clear;
nuevoproveedor.EDIT4.Clear;
nuevoproveedor.N:='N';
nuevoproveedor.showmodal;
CARGARPROVEEDOR
end;

procedure TForm3.BitBtn3Click(Sender: TObject);
begin
nuevoproveedor.EDIT1.TEXT:=TRIM(DBGRID1.Fields[1].ASSTRING);
nuevoproveedor.EDIT2.TEXT:=TRIM(DBGRID1.Fields[2].ASSTRING);
nuevoproveedor.EDIT3.TEXT:=TRIM(DBGRID1.Fields[3].ASSTRING);
nuevoproveedor.EDIT4.TEXT:=TRIM(DBGRID1.Fields[4].ASSTRING);
nuevoproveedor.EDIT5.TEXT:=TRIM(DBGRID1.Fields[0].ASSTRING);
nuevoproveedor.N:='M';
nuevoproveedor.showmodal;
CARGARPROVEEDOR


end;

FUNCTION TFORM3.CARGARPROVEEDOR:BOOLEAN;
BEGIN
 SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('SELECT * FROM TPROVEEDORES ORDER BY RAZONSOCIAL ASC');
SELF.FDQuery1.Open;

END;

procedure TForm3.FormShow(Sender: TObject);
begin
CARGARPROVEEDOR;
end;

end.
