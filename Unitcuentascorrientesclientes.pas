unit Unitcuentascorrientesclientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,UNIT1;

type
  Tcuentascorrientesclientes = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    FDQuery3: TFDQuery;
    BitBtn5: TBitBtn;
    Label1: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    IDCLIENTE:LONGINT;
  public
    { Public declarations }
  end;

var
  cuentascorrientesclientes: Tcuentascorrientesclientes;

implementation

{$R *.dfm}

uses Unit2buscar_clientes, Unit2COBRARCC, Unit2FRMINFOPAGOS;

procedure Tcuentascorrientesclientes.BitBtn1Click(Sender: TObject);
begin
CLOSE;
end;

procedure Tcuentascorrientesclientes.BitBtn2Click(Sender: TObject);
VAR   SQL:STRING;      t,p,s:real;
begin
buscar_clientes.Edit1.Clear;
buscar_clientes.showmodal;
if buscar_clientes.SALE=TRUE then
CLOSE;

IDCLIENTE:=buscar_clientes.DBGRID1.Fields[0].AsInteger;
t:=0;
p:=0 ;
s:=0;
SQL:='SELECT sum(tm.total),sum(tm.pago) '+
' FROM TMOVIMIENTOS  TM,TCLIENTES TC  '+
' WHERE TM.IDCLIENTE='+inttostr(idcliente)+
' AND TM.IDFORMAPAGO=5  '+
' AND TM.TOTAL<>TM.PAGO  '+
' AND TM.IDCLIENTE=TC.IDCLIENTE   '+
' AND CODNC IS NULL   '+
' AND TM.TIPOMOVIMIENTO IN (0,1,2,3) ORDER BY TM.IDMOVIMIENTO ASC ';
 self.FDQuery1.Close;
 self.FDQuery1.SQL.Clear;
 self.FDQuery1.SQL.Add(SQL);
 self.FDQuery1.Open;
 if TRIM(FDQuery1.Fields[0].AsSTRING)='' then
    T:=0
    ELSE
 t:=FDQuery1.Fields[0].AsFloat;

  if TRIM(FDQuery1.Fields[1].AsSTRING)='' then
  P:=0
  ELSE
    p:=FDQuery1.Fields[1].AsFloat;

 s:=t-p;
 if S=0 then
   LABEL1.Caption:=''
   ELSE
LABEL1.Caption:='SALDO  $'+FLOATTOSTR(S);


SQL:='SELECT  TM.IDMOVIMIENTO as tmidmovimiento,TM.FECHA as tmfecha, '+
' TM.TOTAL as tmtotal,TM.PAGO as tmpago,TM.NROFACTURA as tmnro,TC.APENOM as tmcliente,'+
' CASE TM.TIPOMOVIMIENTO  '+
' WHEN 0 THEN ''TICKET''  '+
' WHEN 1 THEN ''FACTURA A'' '+
' WHEN 2 THEN ''FACTURA B'' '+
' WHEN 3 THEN ''FACTURA C'' '+
' ELSE    '+
' ''ERROR'' '+
' END  AS TICK , (tm.total - tm.pago) as saldo '+
' FROM TMOVIMIENTOS  TM,TCLIENTES TC  '+
' WHERE TM.IDCLIENTE='+inttostr(idcliente)+
' AND TM.IDFORMAPAGO=5  '+
' AND TM.TOTAL<>TM.PAGO  '+
' AND TM.IDCLIENTE=TC.IDCLIENTE   '+
' AND CODNC IS NULL   '+
' AND TM.TIPOMOVIMIENTO IN (0,1,2,3) ORDER BY TM.IDMOVIMIENTO ASC ';
 self.FDQuery1.Close;
 self.FDQuery1.SQL.Clear;
 self.FDQuery1.SQL.Add(SQL);
 self.FDQuery1.Open;

end;

procedure Tcuentascorrientesclientes.BitBtn3Click(Sender: TObject);
var pa:real;    sql,fecha:String;  CIERRE:LONGINT;
 t:REAL;
p:REAL;
s:REAL;
begin
if fdquery1.RecordCount=0 then
    exit;

    FDQuery3.Close;
    FDQuery3.SQL.Clear;
    FDQuery3.SQL.Add('select * from tformapago');
    FDQuery3.Open;
     COBRARCC.DataSource1.DataSet:=FDQuery3;
COBRARCC.Edit1.Text:=trim(dbgrid1.Fields[3].asstring) +'   '+trim(dbgrid1.Fields[4].asstring);
COBRARCC.Edit2.Text:=trim(dbgrid1.Fields[7].asstring);
COBRARCC.Edit3.Text:=trim(dbgrid1.Fields[0].asstring);
COBRARCC.Edit4.Text:=trim(dbgrid1.Fields[7].asstring);
COBRARCC.SHOWMODAL;
if COBRARCC.ModalResult=MROK then
BEGIN
form1.FDConnection1.StartTransaction;
try
   FDQuery2.Close;
   FDQuery2.SQL.Clear;
   FDQuery2.SQL.Add('SELECT * FROM TCAJA WHERE estado=1 order by idcaja desc');
   FDQuery2.Open;
   fecha:= FDQuery2.FieldByName('fecha').AsString;

   pa:=strtofloat(COBRARCC.edit4.text);
   self.FDQuery2.Close;
   FDQuery2.SQL.Clear;
   FDQuery2.SQL.Add('update tmovimientos set pago=pago +'+floattostr(pa)+' where idmovimiento='+inttostr(strtoint(COBRARCC.edit3.text)));
   FDQuery2.ExecSQL;
   CIERRE:=0;
   self.FDQuery2.Close;
   FDQuery2.SQL.Clear;
   FDQuery2.SQL.Add('insert into TPAGOSCUENTACORRIENTES (IDMOVIMIENTO,TOTAL,IDFORMAPAGO,FECHA,CIERRE) '+
   ' values ('+inttostr(strtoint(COBRARCC.edit3.text))+','+floattostr(pa)+','+INTTOSTR(COBRARCC.DBLookupComboBox1.KeyValue)+','+#39+TRIM(fecha)+#39+','+INTTOSTR(CIERRE)+')');
   FDQuery2.ExecSQL;

   form1.FDConnection1.Commit;
   showmessage('Se ha procesado correctamente');
except
      form1.FDConnection1.Rollback;
        showmessage('Se produjo un error');
end;

 t:=0;
p:=0 ;
s:=0;
SQL:='SELECT sum(tm.total),sum(tm.pago) '+
' FROM TMOVIMIENTOS  TM,TCLIENTES TC  '+
' WHERE TM.IDCLIENTE='+inttostr(idcliente)+
' AND TM.IDFORMAPAGO=5  '+
' AND TM.TOTAL<>TM.PAGO  '+
' AND TM.IDCLIENTE=TC.IDCLIENTE   '+
' AND CODNC IS NULL   '+
' AND TM.TIPOMOVIMIENTO IN (0,1,2,3) ORDER BY TM.IDMOVIMIENTO ASC ';
 self.FDQuery1.Close;
 self.FDQuery1.SQL.Clear;
 self.FDQuery1.SQL.Add(SQL);
 self.FDQuery1.Open;
 if TRIM(FDQuery1.Fields[0].AsSTRING)='' then
    T:=0
    ELSE
 t:=FDQuery1.Fields[0].AsFloat;

  if TRIM(FDQuery1.Fields[1].AsSTRING)='' then
  P:=0
  ELSE
    p:=FDQuery1.Fields[1].AsFloat;

 s:=t-p;
 if S=0 then
   LABEL1.Caption:=''
   ELSE
LABEL1.Caption:='SALDO  $'+FLOATTOSTR(S);

SQL:='SELECT  TM.IDMOVIMIENTO as tmidmovimiento,TM.FECHA as tmfecha, '+
' TM.TOTAL as tmtotal,TM.PAGO as tmpago,TM.NROFACTURA as tmnro,TC.APENOM as tmcliente,'+
' CASE TM.TIPOMOVIMIENTO  '+
' WHEN 0 THEN ''TICKET''  '+
' WHEN 1 THEN ''FACTURA A'' '+
' WHEN 2 THEN ''FACTURA B'' '+
' WHEN 3 THEN ''FACTURA C'' '+
' ELSE    '+
' ''ERROR'' '+
' END  AS TICK , (tm.total - tm.pago) as saldo '+
' FROM TMOVIMIENTOS  TM,TCLIENTES TC  '+
' WHERE TM.IDCLIENTE='+inttostr(idcliente)+
' AND TM.IDFORMAPAGO=5  '+
' AND TM.TOTAL<>TM.PAGO  '+
' AND TM.IDCLIENTE=TC.IDCLIENTE   '+
' AND CODNC IS NULL   '+
' AND TM.TIPOMOVIMIENTO IN (0,1,2,3) ORDER BY TM.IDMOVIMIENTO ASC ';
 self.FDQuery1.Close;
 self.FDQuery1.SQL.Clear;
 self.FDQuery1.SQL.Add(SQL);
 self.FDQuery1.Open;


END;

end;

procedure Tcuentascorrientesclientes.BitBtn5Click(Sender: TObject);
var sql:string;
begin
sql:='select tp.idcc as tpidcc,tp.idmovimiento as idm, tp.fecha as Fecha, tf.descripcion as Forma_Pago ,tp.total as Total '+
' from TPAGOSCUENTACORRIENTES tp, tformapago tf   '+
' where tp.idformapago=tf.idformapago '+
' and tp.idmovimiento='+inttostr(strtoint(trim(dbgrid1.Fields[0].asstring)))+' order by tp.idmovimiento asc';
 fdquery3.Close;
 fdquery3.SQL.Clear;
 fdquery3.SQL.Add(sql);
 fdquery3.Open;
 FRMINFOPAGOS.DataSource1.DataSet:=fdquery3;
 FRMINFOPAGOS.ShowModal;



SQL:='SELECT  TM.IDMOVIMIENTO as tmidmovimiento,TM.FECHA as tmfecha, '+
' TM.TOTAL as tmtotal,TM.PAGO as tmpago,TM.NROFACTURA as tmnro,TC.APENOM as tmcliente,'+
' CASE TM.TIPOMOVIMIENTO  '+
' WHEN 0 THEN ''TICKET''  '+
' WHEN 1 THEN ''FACTURA A'' '+
' WHEN 2 THEN ''FACTURA B'' '+
' WHEN 3 THEN ''FACTURA C'' '+
' ELSE    '+
' ''ERROR'' '+
' END  AS TICK , (tm.total - tm.pago) as saldo '+
' FROM TMOVIMIENTOS  TM,TCLIENTES TC  '+
' WHERE TM.IDCLIENTE='+inttostr(idcliente)+
' AND TM.IDFORMAPAGO=5  '+
' AND TM.TOTAL<>TM.PAGO  '+
' AND TM.IDCLIENTE=TC.IDCLIENTE   '+
' AND CODNC IS NULL   '+
' AND TM.TIPOMOVIMIENTO IN (0,1,2,3) ORDER BY TM.IDMOVIMIENTO ASC ';
 self.FDQuery1.Close;
 self.FDQuery1.SQL.Clear;
 self.FDQuery1.SQL.Add(SQL);
 self.FDQuery1.Open;

end;

procedure Tcuentascorrientesclientes.FormShow(Sender: TObject);
begin
LABEL1.Caption:='';
end;

end.
