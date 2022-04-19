unit Unitneuvacompra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,unit1, RxMemDS;

type
  Tneuvacompra = class(TForm)
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DateTimePicker1: TDateTimePicker;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Edit5: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    Edit6: TEdit;
    Label10: TLabel;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1IDARTICULO: TIntegerField;
    RxMemoryData1ARTICULO: TStringField;
    RxMemoryData1CANTIDAD: TFloatField;
    RxMemoryData1COSTOUNIT: TFloatField;
    RxMemoryData1TOTAL: TFloatField;
    DataSource2: TDataSource;
    FDQuery2: TFDQuery;
    FDQuery3: TFDQuery;
    FDQuery4: TFDQuery;
    FDQuery5: TFDQuery;
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit5KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    opcion:string;
     FUNCTION CARGARPROVEEDOR:BOOLEAN;
  end;

var
  neuvacompra: Tneuvacompra;

implementation

{$R *.dfm}

uses Unit4BUSCARARTICULSCOMPRA;

procedure Tneuvacompra.BitBtn1Click(Sender: TObject);
begin
BUSCARARTICULSCOMPRA.Edit1.Clear;
BUSCARARTICULSCOMPRA.FDQuery1.Close;
BUSCARARTICULSCOMPRA.SHOWMODAL;
end;

procedure Tneuvacompra.BitBtn2Click(Sender: TObject);
VAR SQL,SQL1:STRING;     IDCOMPRA:LONGINT;
begin
 FORM1.FDConnection1.StartTransaction;
 TRY
 SELF.FDQuery2.Close;
SELF.FDQuery2.SQL.Clear;
SELF.FDQuery2.SQL.Add('SELECT MAX(IDCOMPRAS) FROM TCOMPRAS ');
SELF.FDQuery2.Open;
if trim(SELF.FDQuery2.Fields[0].Asstring)='' then
   idcompra:=1
   else
 IDCOMPRA:=SELF.FDQuery2.Fields[0].AsInteger + 1;

SQL:='INSERT INTO TCOMPRAS   (IDCOMPRAS,IDPROVEEDOR,FECHA,COMPROBANTE,NUMERO,FORMAPAGO,GRAVADO,IVA10,IVA21,TOTAL,OTROSIMP) '+
' VALUES ('+INTTOSTR(IDCOMPRA)+','+INTTOSTR(SELF.DBLookupComboBox1.KeyValue)+','+#39+TRIM(DATETOSTR(SELF.DateTimePicker1.DateTime))+#39+
','+#39+TRIM(COMBOBOX1.Text)+#39+','+#39+TRIM(EDIT6.Text)+#39+','+#39+TRIM(COMBOBOX2.Text)+#39+
','+FLOATTOSTR(STRTOFLOAT(EDIT1.Text))+','+FLOATTOSTR(STRTOFLOAT(EDIT2.Text))+
','+FLOATTOSTR(STRTOFLOAT(EDIT3.Text))+','+FLOATTOSTR(STRTOFLOAT(EDIT5.Text))+','+FLOATTOSTR(STRTOFLOAT(EDIT4.Text))+')';

SELF.FDQuery2.Close;
SELF.FDQuery2.SQL.Clear;
SELF.FDQuery2.SQL.Add(SQL);
SELF.FDQuery2.ExecSQL;




SELF.RxMemoryData1.Open;
SELF.RxMemoryData1.First;
while NOT SELF.RxMemoryData1.Eof do
BEGIN
      SQL1:='INSERT INTO TITEMCOMPRAS (IDCOMPRA,IDARTICULO,CANTIDAD,PRECIOUNIT,TOTAL )'+
      ' VALUES ('+INTTOSTR(IDCOMPRA)+','+INTTOSTR(SELF.RxMemoryData1IDARTICULO.VALUE)+
      ','+FLOATTOSTR(SELF.RxMemoryData1CANTIDAD.Value)+','+FLOATTOSTR(SELF.RxMemoryData1COSTOUNIT.Value)+
      ','+FLOATTOSTR(SELF.RxMemoryData1TOTAL.Value)+')';


  SELF.FDQuery3.Close;
SELF.FDQuery3.SQL.Clear;
SELF.FDQuery3.SQL.Add(SQL1);
SELF.FDQuery3.ExecSQL;

     SELF.FDQuery4.Close;
SELF.FDQuery4.SQL.Clear;
SELF.FDQuery4.SQL.Add('UPDATE TARTICULOS SET STOCKCOMPRA=STOCKCOMPRA + '+FLOATTOSTR(SELF.RxMemoryData1CANTIDAD.Value)+',  STOCK=STOCK  + '+FLOATTOSTR(SELF.RxMemoryData1CANTIDAD.Value)+' WHERE IDARTICULO='+INTTOSTR(SELF.RxMemoryData1IDARTICULO.Value) );
SELF.FDQuery4.ExecSQL;

SELF.FDQuery5.Close;
SELF.FDQuery5.SQL.Clear;
SELF.FDQuery5.SQL.Add('INSERT INTO THISTORIAL_COSTO (IDARTICULO,IDPROVEEDOR,COSTO,FECHA) VALUES  '+
' ('+INTTOSTR(SELF.RxMemoryData1IDARTICULO.Value)+','+INTTOSTR(SELF.DBLookupComboBox1.KeyValue)+
','+FLOATTOSTR(SELF.RxMemoryData1COSTOUNIT.Value)+','+#39+DATETOSTR(SELF.DateTimePicker1.DateTime)+#39+')');
SELF.FDQuery5.ExecSQL;

SELF.RxMemoryData1.Next;
END;





 FORM1.FDConnection1.COMMIT;

 SHOWMESSAGE('SE HA GUARDADO CORRECTAMENTE');
 SELF.FDQuery2.Close;
 SELF.FDQuery3.Close;

 neuvacompra.Edit1.Clear;
neuvacompra.Edit2.Clear;
neuvacompra.Edit3.Clear;
neuvacompra.Edit4.Clear;
neuvacompra.Edit5.Clear;
neuvacompra.Edit6.Clear;
neuvacompra.CARGARPROVEEDOR;
SELF.RxMemoryData1.Close;

neuvacompra.opcion:='N';

 EXCEPT
    SHOWMESSAGE('SE PRODUJO UN ERROR');
 FORM1.FDConnection1.Rollback;
 END;
end;

procedure Tneuvacompra.BitBtn3Click(Sender: TObject);
begin
CLOSE;
end;

FUNCTION Tneuvacompra.CARGARPROVEEDOR:BOOLEAN;
BEGIN
SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('SELECT IDPROVEEDOR,RAZONSOCIAL FROM TPROVEEDORES ORDER BY RAZONSOCIAL ASC');
SELF.FDQuery1.Open;

END;
procedure Tneuvacompra.DBGrid1DblClick(Sender: TObject);
begin
SELF.RxMemoryData1.Delete;
end;

procedure Tneuvacompra.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0','1','2','3','7','8','9','4','5','6','.',#13,#8] then
edit1.ReadOnly:=false
else
edit1.ReadOnly:=true;

end;

procedure Tneuvacompra.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0','1','2','3','7','8','9','4','5','6','.',#13,#8] then
edit2.ReadOnly:=false
else
edit2.ReadOnly:=true;
end;

procedure Tneuvacompra.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0','1','2','3','7','8','9','4','5','6','.',#13,#8] then
edit3.ReadOnly:=false
else
edit3.ReadOnly:=true;
end;

procedure Tneuvacompra.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0','1','2','3','7','8','9','4','5','6','.',#13,#8] then
edit4.ReadOnly:=false
else
edit4.ReadOnly:=true;
end;

procedure Tneuvacompra.Edit5KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0','1','2','3','7','8','9','4','5','6','.',#13,#8] then
edit5.ReadOnly:=false
else
edit5.ReadOnly:=true;
end;

end.
