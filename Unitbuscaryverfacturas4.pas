unit Unitbuscaryverfacturas4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.StdCtrls, Vcl.DBCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls,UNIT1, Vcl.Menus;

type
  Tbuscaryverfacturas = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    BitBtn2: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    Edit1: TEdit;
    DataSource2: TDataSource;
    FDQuery2: TFDQuery;
    BitBtn3: TBitBtn;
    PopupMenu1: TPopupMenu;
    IMPRIMIR1: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure IMPRIMIR1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  buscaryverfacturas: Tbuscaryverfacturas;

implementation

{$R *.dfm}

uses Unit4buscarcliente, Unidetallefacturat4, Uterminar;

procedure Tbuscaryverfacturas.BitBtn1Click(Sender: TObject);
begin
if TRIM(EDIT1.Text)='' then
EXIT;


self.FDQuery1.Close;
self.FDQuery1.SQL.Clear;
self.FDQuery1.SQL.Add('select  tm.idmovimiento as ID ,tm.fecha as FECHA, '+
      ' tc.apenom AS CLIENTE,   '+
      ' t.descripcion AS COMPROBANTE, '+
      ' tm.nrofactura AS NUMERO,'+
      ' tm.total  AS TOTAL ,TVE.NOMBRE AS VENDEDOR '+
      ' from tmovimientos tm, tventas_vendedor tv  ,tclientes tc, TVENDEDORES TVE, '+
' TIPOMOVIMIENTOS T  '+
' where tm.idmovimiento=tv.idventa  '+
' AND TV.IDVENDEDOR=TVE.IDVENDEDOR '+
' and tm.idcliente=tc.idcliente '+
' and tm.tipomovimiento=t.idtipo '+
' AND TM.nrofactura='+INTTOSTR(STRTOINT(EDIT1.Text))+
' AND t.idtipo='+INTTOSTR(SELF.DBLookupComboBox1.KeyValue)+
' ORDER BY tm.idmovimiento asc');
self.FDQuery1.Open;
end;

procedure Tbuscaryverfacturas.BitBtn2Click(Sender: TObject);
var idcliente:longint;
begin
buscarcliente.showmodal;
if buscarcliente.ModalResult=MROK then
BEGIN
idcliente:=buscarcliente.DataSource1.DataSet.FieldByName('id').Asinteger;
self.FDQuery1.Close;
self.FDQuery1.SQL.Clear;
self.FDQuery1.SQL.Add('select  tm.idmovimiento as ID  , tm.fecha as FECHA, '+
      ' tc.apenom AS CLIENTE,   '+
      ' t.descripcion AS COMPROBANTE, '+
      ' tm.nrofactura AS NUMERO,'+
      ' tm.total  AS TOTAL ,TVE.NOMBRE AS VENDEDOR '+
      ' from tmovimientos tm, tventas_vendedor tv  ,tclientes tc, TVENDEDORES TVE, '+
' TIPOMOVIMIENTOS T  '+
' where tm.idmovimiento=tv.idventa  '+
' AND TV.IDVENDEDOR=TVE.IDVENDEDOR '+
' and tm.idcliente=tc.idcliente '+
' and tm.tipomovimiento=t.idtipo '+
' AND tc.idcliente='+INTTOSTR(idcliente)+
' ORDER BY tm.idmovimiento asc');
self.FDQuery1.Open;

ENd
end;

procedure Tbuscaryverfacturas.BitBtn3Click(Sender: TObject);
begin
CLOSE;
end;

procedure Tbuscaryverfacturas.DBGrid1DblClick(Sender: TObject);
var sql:string;
begin
sql:='select   '+
    ' ta.descripcion as ARTICULO, ti.cantidad AS CANTIDAD,   '+
    '  ti.puni AS PRECIO_UNIT,ti.por_iva AS POR_IVA,ti.iva AS IVA,ti.ptotal AS TOTAL   '+
    '   from titem_factura ti, tarticulos ta  '+
    '   where  ti.idfactura='+inttostr(self.DataSource1.DataSet.FieldByName('id').AsInteger)+
    '   and  '+
    '   ti.idarticulo=ta.idarticulo';

detallefactura.FDQuery1.Close;
detallefactura.FDQuery1.SQL.Clear;
detallefactura.FDQuery1.SQL.Add(sql);
detallefactura.FDQuery1.Open;
detallefactura.showmodal;
end;

procedure Tbuscaryverfacturas.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if KEY IN ['0','1','2','3','4','5','6','7','8','9',#13,#8] then
EDIT1.ReadOnly:=FALSE
ELSE
EDIT1.ReadOnly:=TRUE;
end;

procedure Tbuscaryverfacturas.IMPRIMIR1Click(Sender: TObject);
begin
frmterminar.imprimirTICKETA4(self.DataSource1.DataSet.FieldByName('id').AsInteger,'R');
end;

end.
