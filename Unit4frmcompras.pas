unit Unit4frmcompras;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,UNIT1, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tfrmcompras = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDQuery2: TFDQuery;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn5: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmcompras: Tfrmcompras;

implementation

{$R *.dfm}

uses Unitneuvacompra;

procedure Tfrmcompras.BitBtn1Click(Sender: TObject);
begin
CLOSE;
end;

procedure Tfrmcompras.BitBtn2Click(Sender: TObject);
begin
neuvacompra.Edit1.Clear;
neuvacompra.Edit2.Clear;
neuvacompra.Edit3.Clear;
neuvacompra.Edit4.Clear;
neuvacompra.Edit5.Clear;
neuvacompra.Edit6.Clear;
neuvacompra.DateTimePicker1.DateTime:=now;
neuvacompra.CARGARPROVEEDOR;
neuvacompra.opcion:='N';
neuvacompra.Caption:='INFO';
neuvacompra.BitBtn1.Enabled:=TRUE;
neuvacompra.BitBtn2.Enabled:=TRUE;
neuvacompra.SHOWMODAL;
SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('SELECT  TC.IDCOMPRAS AS TCIDCOMPRA '+
' ,TC.FECHA AS TCFECHA '+
',TP.RAZONSOCIAL AS  RAZON '+
',TC.COMPROBANTE AS TCOMPRO,TC.NUMERO AS TNUMERO,  '+
' TC.FORMAPAGO AS FP,TC.GRAVADO AS GRA,TC.IVA10 AS I10,TC.IVA21 AS I21,  '+
' TC.OTROSIMP AS OTROS ,TC.TOTAL AS TCTOTAL FROM TCOMPRAS TC   '+
' LEFT JOIN TPROVEEDORES TP ON TP.IDPROVEEDOR=TC.IDPROVEEDOR    '+
' ORDER BY IDCOMPRAS DESC');
SELF.FDQuery1.Open;
end;

procedure Tfrmcompras.BitBtn3Click(Sender: TObject);
begin
SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('SELECT  TC.IDCOMPRAS AS TCIDCOMPRA '+
' ,TC.FECHA AS TCFECHA '+
',TP.RAZONSOCIAL AS  RAZON '+
',TC.COMPROBANTE AS TCOMPRO,TC.NUMERO AS TNUMERO,  '+
' TC.FORMAPAGO AS FP,TC.GRAVADO AS GRA,TC.IVA10 AS I10,TC.IVA21 AS I21,  '+
' TC.OTROSIMP AS OTROS ,TC.TOTAL AS TCTOTAL FROM TCOMPRAS TC   '+
' LEFT JOIN TPROVEEDORES TP ON TP.IDPROVEEDOR=TC.IDPROVEEDOR   WHERE TC.IDCOMPRAS > 0 ');

if COMBOBOX1.ItemIndex<>-1 then
   SELF.FDQuery1.SQL.Add(' AND TC.COMPROBANTE='+#39+TRIM(COMBOBOX1.Text)+#39);

 if TRIM(EDIT1.Text)<>'' then
   SELF.FDQuery1.SQL.Add(' AND TC.NUMERO='+#39+TRIM(EDIT1.Text)+#39);

SELF.FDQuery1.SQL.Add(' ORDER BY IDCOMPRAS DESC');
SELF.FDQuery1.Open;
end;

procedure Tfrmcompras.BitBtn4Click(Sender: TObject);
VAR IDCOMPRAS:LONGINT;
begin
if self.FDQuery1.RecordCount=0 then
    exit;

 IDCOMPRAS:=dbgrid1.Fields[0].asinteger;
SELF.FDQuery2.Close;
SELF.FDQuery2.SQL.Clear;
SELF.FDQuery2.SQL.Add('SELECT  TC.IDCOMPRAS AS TCIDCOMPRA '+
' ,TC.FECHA AS TCFECHA '+
',TP.RAZONSOCIAL AS  RAZON '+
',TC.COMPROBANTE AS TCOMPRO,TC.NUMERO AS TNUMERO,  '+
' TC.FORMAPAGO AS FP,TC.GRAVADO AS GRA,TC.IVA10 AS I10,TC.IVA21 AS I21,  '+
' TC.OTROSIMP AS OTROS ,TC.TOTAL AS TCTOTAL ,TC.IDPROVEEDOR as tcoidprove FROM TCOMPRAS TC   '+
' LEFT JOIN TPROVEEDORES TP ON TP.IDPROVEEDOR=TC.IDPROVEEDOR    '+
' where tc.IDCOMPRAS='+inttostr(dbgrid1.Fields[0].asinteger));
SELF.FDQuery2.Open;

neuvacompra.Edit1.text:=trim(FDQuery2.FieldByName('GRA').asstring);
neuvacompra.Edit2.text:=trim(FDQuery2.FieldByName('I10').asstring);
neuvacompra.Edit3.text:=trim(FDQuery2.FieldByName('I21').asstring);
neuvacompra.Edit4.text:=trim(FDQuery2.FieldByName('OTROS').asstring);
neuvacompra.Edit5.text:=trim(FDQuery2.FieldByName('TCTOTAL').asstring);
neuvacompra.Edit6.text:=trim(FDQuery2.FieldByName('TNUMERO').asstring);

neuvacompra.Caption:='INFO';
neuvacompra.BitBtn1.Enabled:=FALSE;
neuvacompra.BitBtn2.Enabled:=FALSE;
if trim(FDQuery2.FieldByName('FP').asstring)='CONTADO' then
   neuvacompra.ComboBox2.ItemIndex:=0;

if trim(FDQuery2.FieldByName('FP').asstring)='CUENTA CORRIENTE' then
   neuvacompra.ComboBox2.ItemIndex:=1;




if trim(FDQuery2.FieldByName('TCOMPRO').asstring)='FACTURA A' then
   neuvacompra.ComboBox1.ItemIndex:=0;


if trim(FDQuery2.FieldByName('TCOMPRO').asstring)='FACTURA B' then
   neuvacompra.ComboBox1.ItemIndex:=1;


if trim(FDQuery2.FieldByName('TCOMPRO').asstring)='FACTURA C' then
   neuvacompra.ComboBox1.ItemIndex:=2;
 if trim(FDQuery2.FieldByName('TCOMPRO').asstring)='REMITO' then
   neuvacompra.ComboBox1.ItemIndex:=3;

 if trim(FDQuery2.FieldByName('TCOMPRO').asstring)='NOTA DE CREDITO A' then
   neuvacompra.ComboBox1.ItemIndex:=4;


 if trim(FDQuery2.FieldByName('TCOMPRO').asstring)='NOTA DE CREDITO B' then
   neuvacompra.ComboBox1.ItemIndex:=5;


 if trim(FDQuery2.FieldByName('TCOMPRO').asstring)='NOTA DE CREDITO C' then
   neuvacompra.ComboBox1.ItemIndex:=6;


 if trim(FDQuery2.FieldByName('TCOMPRO').asstring)='NC REMITO' then
   neuvacompra.ComboBox1.ItemIndex:=7;


 if trim(FDQuery2.FieldByName('TCOMPRO').asstring)='NOTA DE DEBITO A' then
   neuvacompra.ComboBox1.ItemIndex:=8;


 if trim(FDQuery2.FieldByName('TCOMPRO').asstring)='NOTA DE DEBITO B' then
   neuvacompra.ComboBox1.ItemIndex:=9;


 if trim(FDQuery2.FieldByName('TCOMPRO').asstring)='NOTA DE DEBITO C' then
   neuvacompra.ComboBox1.ItemIndex:=10;


 if trim(FDQuery2.FieldByName('TCOMPRO').asstring)='ND REMITO' then
   neuvacompra.ComboBox1.ItemIndex:=11;



neuvacompra.DateTimePicker1.DateTime:=strtodate(trim(FDQuery2.FieldByName('TCFECHA').asstring));
neuvacompra.CARGARPROVEEDOR;
neuvacompra.DBLookupComboBox1.KeyValue:=FDQuery2.FieldByName('tcoidprove').AsInteger;
neuvacompra.opcion:='M';

neuvacompra.FDQuery5.CLOSE;
neuvacompra.FDQuery5.SQL.Clear;
neuvacompra.FDQuery5.SQL.Add('SELECT TI.IDARTICULO,TA.DESCRIPCION,TI.CANTIDAD,TI.PRECIOUNIT,TI.TOTAL FROM TITEMCOMPRAS TI, TARTICULOS TA  '+
' WHERE TI.IDARTICULO=TA.IDARTICULO  '+
' AND TI.IDCOMPRA='+INTTOSTR(IDCOMPRAS));
neuvacompra.FDQuery5.Open;
neuvacompra.RxMemoryData1.Close;
neuvacompra.RxMemoryData1.Open;
while NOT neuvacompra.FDQuery5.Eof do
BEGIN
neuvacompra.RxMemoryData1.Append;
neuvacompra.RxMemoryData1IDARTICULO.Value:=neuvacompra.FDQuery5.Fields[0].AsInteger;
neuvacompra.RxMemoryData1ARTICULO.Value:=TRIM(neuvacompra.FDQuery5.Fields[1].ASSTRING);
neuvacompra.RxMemoryData1CANTIDAD.Value:=neuvacompra.FDQuery5.Fields[2].AsInteger;
neuvacompra.RxMemoryData1COSTOUNIT.Value:=neuvacompra.FDQuery5.Fields[3].AsInteger;
neuvacompra.RxMemoryData1TOTAL.Value:=neuvacompra.FDQuery5.Fields[4].AsInteger;

  neuvacompra.RxMemoryData1.Post;
neuvacompra.FDQuery5.Next;
END;



neuvacompra.ShowModal;
end;

procedure Tfrmcompras.BitBtn5Click(Sender: TObject);
begin
SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('SELECT  TC.IDCOMPRAS AS TCIDCOMPRA '+
' ,TC.FECHA AS TCFECHA '+
',TP.RAZONSOCIAL AS  RAZON '+
',TC.COMPROBANTE AS TCOMPRO,TC.NUMERO AS TNUMERO,  '+
' TC.FORMAPAGO AS FP,TC.GRAVADO AS GRA,TC.IVA10 AS I10,TC.IVA21 AS I21,  '+
' TC.OTROSIMP AS OTROS ,TC.TOTAL AS TCTOTAL FROM TCOMPRAS TC   '+
' LEFT JOIN TPROVEEDORES TP ON TP.IDPROVEEDOR=TC.IDPROVEEDOR    '+
' ORDER BY IDCOMPRAS DESC');
SELF.FDQuery1.Open;
end;

procedure Tfrmcompras.FormCreate(Sender: TObject);
begin
EDIT1.Clear;
end;

procedure Tfrmcompras.FormShow(Sender: TObject);
begin
SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('SELECT  TC.IDCOMPRAS AS TCIDCOMPRA '+
' ,TC.FECHA AS TCFECHA '+
',TP.RAZONSOCIAL AS  RAZON '+
',TC.COMPROBANTE AS TCOMPRO,TC.NUMERO AS TNUMERO,  '+
' TC.FORMAPAGO AS FP,TC.GRAVADO AS GRA,TC.IVA10 AS I10,TC.IVA21 AS I21,  '+
' TC.OTROSIMP AS OTROS ,TC.TOTAL AS TCTOTAL FROM TCOMPRAS TC   '+
' LEFT JOIN TPROVEEDORES TP ON TP.IDPROVEEDOR=TC.IDPROVEEDOR    '+
' ORDER BY IDCOMPRAS DESC');
SELF.FDQuery1.Open;
end;

end.
