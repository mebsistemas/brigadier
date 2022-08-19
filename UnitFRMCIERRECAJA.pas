unit UnitFRMCIERRECAJA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Exportar2PDF, Vcl.StdCtrls, Vcl.Buttons;

type
  TFRMCIERRECAJA = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure cierreCaja58;
    procedure cierreCaja80;
    procedure cierreCajaA4;
  end;

var
  FRMCIERRECAJA: TFRMCIERRECAJA;

implementation

{$R *.dfm}

uses Unit1, Unidiseniocierrecaja, Udiseniocierrecaja58;

procedure TFRMCIERRECAJA.BitBtn1Click(Sender: TObject);
var cambio,salidas,efe,td,tc,ingresado,saldo,MP,CC,ENCAJA,PAGOSCUENTACORRIENTES,
INGRESOACAJA,bs:real; fe,MENSA,hora:string; archivoEmail ,fecha:String;
  TOTALNC,TOTALFACTUIRAS:REAL;    Gpdf :TExportar2PDFSyn ;
NCefe:REAL;
begin

   if Trim(form1.TIPOPAPEL)='A4' then
      cierreCajaA4;

    if Trim(form1.TIPOPAPEL)='80' then
      cierreCaja80;

      if Trim(form1.TIPOPAPEL)='58' then
       cierreCaja58;
;
end;





procedure TFRMCIERRECAJA.cierreCajaA4;
var cambio,salidas,efe,td,tc,ingresado,saldo,MP,CC,ENCAJA,PAGOSCUENTACORRIENTES,
INGRESOACAJA,bs:real; fe,MENSA,hora:string; archivoEmail ,fecha:String;
  TOTALNC,TOTALFACTUIRAS:REAL;    Gpdf :TExportar2PDFSyn ;
NCefe:REAL;
begin
cambio:=0;
salidas:=0;
efe:=0;
td:=0 ;
tc:=0;
ingresado:=0;
saldo:=0;
bs:=0;
CC:=0;
MP:=0;
ENCAJA:=0;
TOTALNC:=0;
INGRESOACAJA:=0;
NCefe:=0;
TOTALFACTUIRAS:=0;
PAGOSCUENTACORRIENTES:=0;
fe:=trim(edit1.Text);
ingresado:=strtofloat(edit2.Text);

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select apenom from tusuarios where idusuario='+inttostr(form1.IDUSUARIOLOGEADO));
form1.FDQuery2.Open;

frmdiseniocierrecaja.QRLabel1.Caption:='CIERRE DE CAJA: '+trim(form1.FDQuery2.FieldByName('apenom').AsString);

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where fecha='+#39+trim(fe)+#39+' AND  TIPOMOVIMIENTO IN (0,1,2,3) and cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if TRIM(form1.FDQuery2.FieldByName('F').ASSTRING)='' then
  TOTALFACTUIRAS:=0
  ELSE
TOTALFACTUIRAS:=form1.FDQuery2.FieldByName('F').ASFLOAT;

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where fecha='+#39+trim(fe)+#39+' AND  TIPOMOVIMIENTO IN (4,5,6,7) and cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if TRIM(form1.FDQuery2.FieldByName('F').ASSTRING)='' then
  TOTALNC:=0
  ELSE
TOTALNC:=form1.FDQuery2.FieldByName('F').ASFLOAT;

frmdiseniocierrecaja.QRLabel5.Caption:='TOTAL :$ '+FLOATTOSTR(TOTALFACTUIRAS -TOTALNC) ;

 frmdiseniocierrecaja.RxMemoryData1.Close;
frmdiseniocierrecaja.RxMemoryData1.OPEN;
   frmdiseniocierrecaja.RxMemoryData1.Append;
   frmdiseniocierrecaja.RxMemoryData1FORMA.Value:='--- VENTAS ----';
   frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierrecaja.RxMemoryData1.Post;



form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select TF.DESCRIPCION, SUM(TM.TOTAL) AS S  '+
'  from tmovimientos TM  ,TFORMAPAGO TF    '+
' where TM.fecha='+#39+trim(fe)+#39+' AND TM.IDFORMAPAGO=TF.IDFORMAPAGO  '+
' AND TM.TIPOMOVIMIENTO IN (0,1,2,3) AND  TM.cierre=0 and tm.pc='+inttostr(form1.PUESTO_PC)+
' GROUP BY  TF.IDFORMAPAGO   order  BY   TF.DESCRIPCION asc ');
form1.FDQuery2.Open;
while NOT FORM1.FDQuery2.Eof do
BEGIN
     frmdiseniocierrecaja.RxMemoryData1.Append;
      frmdiseniocierrecaja.RxMemoryData1FORMA.Value:=TRIM(FORM1.FDQuery2.Fields[0].ASSTRING);
      frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
      frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:=TRIM(FORM1.FDQuery2.Fields[1].ASSTRING);
     frmdiseniocierrecaja.RxMemoryData1.Post;
  FORM1.FDQuery2.Next;
END;

     frmdiseniocierrecaja.RxMemoryData1.Append;
   frmdiseniocierrecaja.RxMemoryData1FORMA.Value:='' ;
   frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierrecaja.RxMemoryData1.Post;


   frmdiseniocierrecaja.RxMemoryData1.Append;
   frmdiseniocierrecaja.RxMemoryData1FORMA.Value:='--- NC DEVOLUCIONES ----';
   frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierrecaja.RxMemoryData1.Post;

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select TF.DESCRIPCION, SUM(TM.TOTAL) AS S  '+
'  from tmovimientos TM  ,TFORMAPAGO TF    '+
' where TM.fecha='+#39+trim(fe)+#39+' AND TM.IDFORMAPAGO=TF.IDFORMAPAGO  '+
' AND TM.TIPOMOVIMIENTO IN (4,5,6,7) AND  TM.cierre=0 and tm.pc='+inttostr(form1.PUESTO_PC)+
' GROUP BY  TF.IDFORMAPAGO   order  BY   TF.DESCRIPCION asc ');
form1.FDQuery2.Open;
while NOT FORM1.FDQuery2.Eof do
BEGIN
     frmdiseniocierrecaja.RxMemoryData1.Append;
      frmdiseniocierrecaja.RxMemoryData1FORMA.Value:=TRIM(FORM1.FDQuery2.Fields[0].ASSTRING);
      frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
      frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:=TRIM(FORM1.FDQuery2.Fields[1].ASSTRING);
     frmdiseniocierrecaja.RxMemoryData1.Post;
  FORM1.FDQuery2.Next;
END;



    frmdiseniocierrecaja.RxMemoryData1.Append;
   frmdiseniocierrecaja.RxMemoryData1FORMA.Value:='';
   frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierrecaja.RxMemoryData1.Post;

   frmdiseniocierrecaja.RxMemoryData1.Append;
   frmdiseniocierrecaja.RxMemoryData1FORMA.Value:='---ARTICULOS DEVUELTOS ----';
   frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierrecaja.RxMemoryData1.Post;

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('SELECT TD.ARTICULO,TD.CANTIDAD,TD.COMENTARIO  '+
' FROM TMOVIMIENTOS TM, TDEVOLCIONES TD '+
' WHERE TM.IDMOVIMIENTO=TD.IDMOVIMIENTO  '+
' AND TM.TIPOMOVIMIENTO IN (4,5,6,7)   '+
' AND TM.CIERRE=0  and tm.pc='+inttostr(form1.PUESTO_PC)+
' AND TM.FECHA='+#39+trim(fe)+#39);
 form1.FDQuery2.Open;
while NOT FORM1.FDQuery2.Eof do
BEGIN
     frmdiseniocierrecaja.RxMemoryData1.Append;
      frmdiseniocierrecaja.RxMemoryData1FORMA.Value:=TRIM(FORM1.FDQuery2.Fields[0].ASSTRING);
      frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:=TRIM(FORM1.FDQuery2.Fields[1].ASSTRING);
      frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:=TRIM(FORM1.FDQuery2.Fields[2].ASSTRING);
     frmdiseniocierrecaja.RxMemoryData1.Post;
  FORM1.FDQuery2.Next;
END;

//COBROS CC
    frmdiseniocierrecaja.RxMemoryData1.Append;
   frmdiseniocierrecaja.RxMemoryData1FORMA.Value:='';
   frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierrecaja.RxMemoryData1.Post;
   frmdiseniocierrecaja.RxMemoryData1.Append;
   frmdiseniocierrecaja.RxMemoryData1FORMA.Value:='---COBROS CUENTA CORRIENTES CLIENTES ----';
   frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierrecaja.RxMemoryData1.Post;

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('SELECT TP.TOTAL,TC.APENOM ,TF.DESCRIPCION '+
'  FROM TPAGOSCUENTACORRIENTES TP, TMOVIMIENTOS TM  ,TCLIENTES TC ,TFORMAPAGO TF '+
' WHERE TP.IDMOVIMIENTO=TM.IDMOVIMIENTO '+
' AND TP.IDFORMAPAGO=TF.IDFORMAPAGO  '+
' AND TM.IDCLIENTE=TC.IDCLIENTE and tp.pc='+inttostr(form1.PUESTO_PC)+
' AND TP.CIERRE=0 AND TP.FECHA='+#39+trim(fe)+#39);
 form1.FDQuery2.Open;
while NOT FORM1.FDQuery2.Eof do
BEGIN
     frmdiseniocierrecaja.RxMemoryData1.Append;
      frmdiseniocierrecaja.RxMemoryData1FORMA.Value:=TRIM(FORM1.FDQuery2.Fields[1].ASSTRING);
      frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:=TRIM(FORM1.FDQuery2.Fields[0].ASSTRING);
      frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:=TRIM(FORM1.FDQuery2.Fields[2].ASSTRING);
     frmdiseniocierrecaja.RxMemoryData1.Post;
  FORM1.FDQuery2.Next;
END;


//articulos vendidos

    frmdiseniocierrecaja.RxMemoryData1.Append;
   frmdiseniocierrecaja.RxMemoryData1FORMA.Value:='';
   frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierrecaja.RxMemoryData1.Post;
   frmdiseniocierrecaja.RxMemoryData1.Append;
   frmdiseniocierrecaja.RxMemoryData1FORMA.Value:='---ARTICULOS VENDIDOS ----';
   frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierrecaja.RxMemoryData1.Post;
  form1.FDQuery2.Close;
    form1.FDQuery2.SQL.Clear;
    form1.FDQuery2.SQL.Add(' SELECT   '+
                     ' A.DESCRIPCION AS ARTICULOS,R.DESCRIPCION AS RUBRO,P.RAZONSOCIAL AS PROVEEDOR,  '+
                     ' SUM(TI.CANTIDAD)  AS VENDIDO, M.DESCRIPCION AS MARCA,sum(ti.ptotal) AS VENTATOTALPRECIO '+
                     ' FROM     TITEM_FACTURA TI   '+
                     ' INNER JOIN TMOVIMIENTOS TM ON TM.IDMOVIMIENTO = TI.IDFACTURA  '+
                     ' INNER JOIN TARTICULOS A ON A.IDARTICULO=TI.IDARTICULO  '+
                     ' LEFT JOIN TRUBROS R ON R.IDRUBRO=A.IDRUBRO '+
                     ' LEFT JOIN TPROVEEDORES P ON P.IDPROVEEDOR=A.IDPROVEEDOR  '+
                       ' LEFT JOIN TMARCAS M ON M.IDMARCA = A.IDMARCA '+
                     ' WHERE  TM.CIERRE=0 and tm.pc='+inttostr(form1.PUESTO_PC)+' AND TM.FECHA ='+#39+trim(fe)+#39);

     form1.FDQuery2.SQL.Add(' GROUP BY A.DESCRIPCION  '+
                     ' ORDER BY VENDIDO DESC') ;
    form1.FDQuery2.Open;
   while NOT FORM1.FDQuery2.Eof do
BEGIN
     frmdiseniocierrecaja.RxMemoryData1.Append;
      frmdiseniocierrecaja.RxMemoryData1FORMA.Value:=TRIM(FORM1.FDQuery2.Fields[0].ASSTRING)+'-'+TRIM(FORM1.FDQuery2.Fields[4].ASSTRING);
      frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';//TRIM(FORM1.FDQuery2.Fields[3].ASSTRING);
      frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:='CANT: '+TRIM(FORM1.FDQuery2.Fields[3].ASSTRING)+'       $'+TRIM(FORM1.FDQuery2.Fields[5].ASSTRING);
     frmdiseniocierrecaja.RxMemoryData1.Post;
  FORM1.FDQuery2.Next;
END;

//ventas

 //EFE
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where fecha='+#39+trim(fe)+#39+' AND IDFORMAPAGO=1 AND TIPOMOVIMIENTO IN (0,1,2,3) and cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('F').asstring)='' then
efe:=0
else
efe:=form1.FDQuery2.FieldByName('F').asfloat ;

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where fecha='+#39+trim(fe)+#39+' AND IDFORMAPAGO=1 AND TIPOMOVIMIENTO IN (4,5,6,7) and cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('F').asstring)='' then
NCefe:=0
else
NCefe:=form1.FDQuery2.FieldByName('F').asfloat ;





//TD

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where fecha='+#39+trim(fe)+#39+'AND IDFORMAPAGO=2 and cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('F').asstring)='' then
 td:=0
else
td:=form1.FDQuery2.FieldByName('F').asfloat;

//TC
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where fecha='+#39+trim(fe)+#39+'AND IDFORMAPAGO=3 and cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('F').asstring)='' then
tc:=0
else
tc:=form1.FDQuery2.FieldByName('F').asfloat ;


//billetera
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where fecha='+#39+trim(fe)+#39+'AND IDFORMAPAGO=4 and cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('F').asstring)='' then
bs:=0
else
bs:=form1.FDQuery2.FieldByName('F').asfloat ;


//CC
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where fecha='+#39+trim(fe)+#39+'AND IDFORMAPAGO=5 and cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('F').asstring)='' then
CC:=0
else
CC:=form1.FDQuery2.FieldByName('F').asfloat ;

//CC
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where fecha='+#39+trim(fe)+#39+'AND IDFORMAPAGO=6 and cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('F').asstring)='' then
MP:=0
else
MP:=form1.FDQuery2.FieldByName('F').asfloat ;



//SALIDAS
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('SELECT sum(importe)  as total FROM tsalidas WHERE fecha='+#39+trim(fe)+#39+' AND CIERRE=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('total').asstring)='' then
salidas:=0
else
salidas:=form1.FDQuery2.fieldbyname('total').asfloat;


//CAJA INICIAL
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('SELECT cambio FROM TCAJA WHERE fecha='+#39+trim(fe)+#39+' and estado=1 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('cambio').asstring)='' then
cambio:=0
else
cambio:=form1.FDQuery2.fieldbyname('cambio').asfloat;


 form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('SELECT sum(importe)  as total FROM TINGRESOS WHERE fecha='+#39+trim(fe)+#39+' AND CIERRE=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('total').asstring)='' then
INGRESOACAJA:=0
else
INGRESOACAJA:=form1.FDQuery2.fieldbyname('total').asfloat;



 form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('SELECT sum(TOTAL)  as TOTA FROM TPAGOSCUENTACORRIENTES  WHERE fecha='+#39+trim(fe)+#39+' AND CIERRE=0 AND IDFORMAPAGO=1 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('TOTA').asstring)='' then
PAGOSCUENTACORRIENTES:=0
else
PAGOSCUENTACORRIENTES:=form1.FDQuery2.fieldbyname('TOTA').asfloat;




frmdiseniocierrecaja.QRLabel4.Caption:='DINERO DEL CAJERO :$ '+FLOATTOSTR(ingresado) ;
frmdiseniocierrecaja.QRLabel10.Caption:='CAMBIO :$ '+FLOATTOSTR(cambio) ;
frmdiseniocierrecaja.QRLabel12.Caption:='SALIDAS DE CAJA :$ '+FLOATTOSTR(salidas) ;
frmdiseniocierrecaja.QRLabel18.Caption:='INGRESOS DE CAJA :$ '+FLOATTOSTR(INGRESOACAJA) ;
frmdiseniocierrecaja.QRLabel9.Caption:='COBROS EN EFECT. C/C CLIENTES :$ '+FLOATTOSTR(PAGOSCUENTACORRIENTES) ;

efe:=efe - NCEFE;

ENCAJA:=CAMBIO +  INGRESOACAJA +  efe + PAGOSCUENTACORRIENTES;
ENCAJA:=ENCAJA - SALIDAS;
SALDO:=ENCAJA;
frmdiseniocierrecaja.QRLabel14.Caption:='EFECT. EN CAJA:$ '+FLOATTOSTR(ENCAJA) ;

if saldo > ingresado then
begin
   saldo:=saldo - ingresado;
   showmessage('SALDO FALTANTE: '+FLOATTOSTR(SALDO));
   MENSA:='FALTANTE';
end ELSE BEGIN
        if saldo < ingresado then
          begin
                saldo:=ingresado - saldo;
                 showmessage('SALDO SOBRANTE: '+FLOATTOSTR(SALDO));
                  MENSA:='SOBRANTE';
          end ELSE BEGIN

                      if saldo = ingresado then
                       begin
                            showmessage('SALDO CERO');
                            MENSA:='';
                      end;
                  END;
        END;


        frmdiseniocierrecaja.QRLabel17.Caption:='SALDO:$ '+FLOATTOSTR(saldo) +' '+MENSA;

frmdiseniocierrecaja.QRLabel2.Caption:='FECHA : '+FE+'  '+TIMETOSTR(TIME);
frmdiseniocierrecaja.QRPQuickrep1.Prepare;

{if form1.demo=false then
frmdiseniocierrecaja.QRPQuickrep1.Print
else  }
 fecha:=fe;
 hora:=timetostr(time);
 hora:=StringReplace (hora, ':', '_',[rfReplaceAll, rfIgnoreCase]);
 fecha:=StringReplace (fecha, '/', '',[rfReplaceAll, rfIgnoreCase]);
 archivoEmail := ExtractFilePath(ParamStr(0))+'\INFORMES\cierreCaja_dia_'+fecha+'_hora_'+hora+'.pdf';
    Gpdf := TExportar2PDFSyn.Create;
    Gpdf.rutaPDF := archivoEmail;
    Gpdf.Exportar2PDF(frmdiseniocierrecaja.QRPQuickrep1);
    Gpdf.free;

frmdiseniocierrecaja.QRPQuickrep1.Preview;

 try
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('UPDATE tmovimientos  SET CIERRE = 1 where fecha='+#39+trim(FE)+#39+'AND cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.ExecSQL;


form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('UPDATE TINGRESOS  SET CIERRE = 1 where fecha='+#39+trim(FE)+#39+'AND cierre=0 and pc='+inttostr(form1.PUESTO_PC));

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('UPDATE TSALIDAS  SET CIERRE = 1 where fecha='+#39+trim(FE)+#39+'AND cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.ExecSQL;

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('UPDATE TPAGOSCUENTACORRIENTES  SET CIERRE = 1 where fecha='+#39+trim(FE)+#39+'AND cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.ExecSQL;


form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('update TCAJA  set VENTA_EFE='+FLOATTOSTR(EFE)+
                                          ', VENTA_TD='+FLOATTOSTR(TD)+
                                         ', VENTA_TC='+FLOATTOSTR(TC)+
                                        ', EFE_INGRESADO='+FLOATTOSTR(ingresado)+
                                       ', SALDO='+FLOATTOSTR(saldo)+
                                        ', ESTADO=0'+
                                       ', SALIDAS='+FLOATTOSTR(SALIDAS)+
                                     ', DINERO_EN_CAJA='+FLOATTOSTR(ENCAJA)+
                                     ', INGRESOSCAJA='+FLOATTOSTR(INGRESOACAJA)+
                                     ' WHERE fecha='+#39+trim(fe)+#39+' and estado=1 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.ExecSQL;
form1.FDConnection1.Commit;

form1.Panel2.Caption:='CAJA: ';
CLOSE;
except

  on E: Exception do
  begin
      ShowMessage (E.ClassName + 'error generado, con mensaje:' + E.Message);
      form1.FDConnection1.Rollback;
  end;
end;

end;


procedure TFRMCIERRECAJA.cierreCaja58;
var cambio,salidas,efe,td,tc,ingresado,saldo,MP,CC,ENCAJA,PAGOSCUENTACORRIENTES,
INGRESOACAJA,bs:real; fe,MENSA,hora:string; archivoEmail ,fecha:String;
  TOTALNC,TOTALFACTUIRAS:REAL;    Gpdf :TExportar2PDFSyn ;
NCefe:REAL;
begin
cambio:=0;
salidas:=0;
efe:=0;
td:=0 ;
tc:=0;
ingresado:=0;
saldo:=0;
bs:=0;
CC:=0;
MP:=0;
ENCAJA:=0;
TOTALNC:=0;
INGRESOACAJA:=0;
NCefe:=0;
TOTALFACTUIRAS:=0;
PAGOSCUENTACORRIENTES:=0;
fe:=trim(edit1.Text);
ingresado:=strtofloat(edit2.Text);

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select apenom from tusuarios where idusuario='+inttostr(form1.IDUSUARIOLOGEADO));
form1.FDQuery2.Open;

frmdiseniocierreCaja58.QRLabel1.Caption:='CIERRE DE CAJA: '+trim(form1.FDQuery2.FieldByName('apenom').AsString);

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where fecha='+#39+trim(fe)+#39+' AND  TIPOMOVIMIENTO IN (0,1,2,3) and cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if TRIM(form1.FDQuery2.FieldByName('F').ASSTRING)='' then
  TOTALFACTUIRAS:=0
  ELSE
TOTALFACTUIRAS:=form1.FDQuery2.FieldByName('F').ASFLOAT;

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where fecha='+#39+trim(fe)+#39+' AND  TIPOMOVIMIENTO IN (4,5,6,7) and cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if TRIM(form1.FDQuery2.FieldByName('F').ASSTRING)='' then
  TOTALNC:=0
  ELSE
TOTALNC:=form1.FDQuery2.FieldByName('F').ASFLOAT;

frmdiseniocierreCaja58.QRLabel5.Caption:='TOTAL :$ '+FLOATTOSTR(TOTALFACTUIRAS -TOTALNC) ;

 frmdiseniocierreCaja58.RxMemoryData1.Close;
frmdiseniocierreCaja58.RxMemoryData1.OPEN;
   frmdiseniocierreCaja58.RxMemoryData1.Append;
   frmdiseniocierreCaja58.RxMemoryData1FORMA.Value:='--- VENTAS ----';
   frmdiseniocierreCaja58.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierreCaja58.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierreCaja58.RxMemoryData1.Post;
   frmdiseniocierreCaja58.QRPQuickrep1.Page.Length:=frmdiseniocierreCaja58.QRPQuickrep1.Page.Length + 10;


form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select TF.DESCRIPCION, SUM(Tf.importe) AS S  '+
 ' from tmovimientos TM  ,TFORMAPAGOS_FACTURAS TF   '+
' where TM.fecha='+#39+trim(fe)+#39+' AND TM.IDmovimiento=TF.idmovimiento    '+
' AND TM.TIPOMOVIMIENTO IN (0,1,2,3) AND  TM.cierre=0  and tm.pc='+inttostr(form1.PUESTO_PC)+
' GROUP BY  TF.IDFORMA   order  BY   TF.DESCRIPCION asc ');
form1.FDQuery2.Open;
while NOT FORM1.FDQuery2.Eof do
BEGIN
     frmdiseniocierreCaja58.RxMemoryData1.Append;
      frmdiseniocierreCaja58.RxMemoryData1FORMA.Value:='';//TRIM(FORM1.FDQuery2.Fields[0].ASSTRING);
      frmdiseniocierreCaja58.RxMemoryData1CANTIDAD.Value:=TRIM(FORM1.FDQuery2.Fields[0].ASSTRING);
      frmdiseniocierreCaja58.RxMemoryData1TOTAL.Value:='$'+TRIM(FORM1.FDQuery2.Fields[1].ASSTRING);
     frmdiseniocierreCaja58.RxMemoryData1.Post;
     frmdiseniocierreCaja58.QRPQuickrep1.Page.Length:=frmdiseniocierreCaja58.QRPQuickrep1.Page.Length + 10;
  FORM1.FDQuery2.Next;
END;

     frmdiseniocierreCaja58.RxMemoryData1.Append;
   frmdiseniocierreCaja58.RxMemoryData1FORMA.Value:='' ;
   frmdiseniocierreCaja58.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierreCaja58.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierreCaja58.RxMemoryData1.Post;
   frmdiseniocierreCaja58.QRPQuickrep1.Page.Length:=frmdiseniocierreCaja58.QRPQuickrep1.Page.Length + 10;

   frmdiseniocierreCaja58.RxMemoryData1.Append;
   frmdiseniocierreCaja58.RxMemoryData1FORMA.Value:='--- NC DEVOLUCIONES ----';
   frmdiseniocierreCaja58.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierreCaja58.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierreCaja58.RxMemoryData1.Post;
      frmdiseniocierreCaja58.QRPQuickrep1.Page.Length:=frmdiseniocierreCaja58.QRPQuickrep1.Page.Length + 10;
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select TF.DESCRIPCION, SUM(tf.importe) AS S  '+
'  from tmovimientos TM  ,TFORMAPAGOS_FACTURAS TF     '+
' where TM.fecha='+#39+trim(fe)+#39+' AND  TM.IDmovimiento=TF.idmovimiento   '+
' AND TM.TIPOMOVIMIENTO IN (4,5,6,7) AND  TM.cierre=0 and tm.pc='+inttostr(form1.PUESTO_PC)+
' GROUP BY  TF.IDFORMA  order  BY   TF.DESCRIPCION asc ');
form1.FDQuery2.Open;
while NOT FORM1.FDQuery2.Eof do
BEGIN
     frmdiseniocierreCaja58.RxMemoryData1.Append;
      frmdiseniocierreCaja58.RxMemoryData1FORMA.Value:='';//TRIM(FORM1.FDQuery2.Fields[0].ASSTRING);
      frmdiseniocierreCaja58.RxMemoryData1CANTIDAD.Value:=TRIM(FORM1.FDQuery2.Fields[0].ASSTRING);
      frmdiseniocierreCaja58.RxMemoryData1TOTAL.Value:=TRIM(FORM1.FDQuery2.Fields[1].ASSTRING);
   frmdiseniocierreCaja58.QRPQuickrep1.Page.Length:=frmdiseniocierreCaja58.QRPQuickrep1.Page.Length + 10;
  FORM1.FDQuery2.Next;
END;



    frmdiseniocierreCaja58.RxMemoryData1.Append;
   frmdiseniocierreCaja58.RxMemoryData1FORMA.Value:='';
   frmdiseniocierreCaja58.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierreCaja58.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierreCaja58.RxMemoryData1.Post;
      frmdiseniocierreCaja58.QRPQuickrep1.Page.Length:=frmdiseniocierreCaja58.QRPQuickrep1.Page.Length + 10;
   frmdiseniocierreCaja58.RxMemoryData1.Append;
   frmdiseniocierreCaja58.RxMemoryData1FORMA.Value:='---ARTICULOS DEVUELTOS ----';
   frmdiseniocierreCaja58.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierreCaja58.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierreCaja58.RxMemoryData1.Post;
     frmdiseniocierreCaja58.QRPQuickrep1.Page.Length:=frmdiseniocierreCaja58.QRPQuickrep1.Page.Length + 10;
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('SELECT TD.ARTICULO,TD.CANTIDAD,TD.COMENTARIO  '+
' FROM TMOVIMIENTOS TM, TDEVOLCIONES TD '+
' WHERE TM.IDMOVIMIENTO=TD.IDMOVIMIENTO  '+
' AND TM.TIPOMOVIMIENTO IN (4,5,6,7)   '+
' AND TM.CIERRE=0  and tm.pc='+inttostr(form1.PUESTO_PC)+
' AND TM.FECHA='+#39+trim(fe)+#39);
 form1.FDQuery2.Open;
while NOT FORM1.FDQuery2.Eof do
BEGIN
     frmdiseniocierreCaja58.RxMemoryData1.Append;
      frmdiseniocierreCaja58.RxMemoryData1FORMA.Value:=TRIM(FORM1.FDQuery2.Fields[0].ASSTRING);
      frmdiseniocierreCaja58.RxMemoryData1CANTIDAD.Value:=TRIM(FORM1.FDQuery2.Fields[1].ASSTRING);
      frmdiseniocierreCaja58.RxMemoryData1TOTAL.Value:='';//TRIM(FORM1.FDQuery2.Fields[2].ASSTRING);
     frmdiseniocierreCaja58.RxMemoryData1.Post;

          frmdiseniocierreCaja58.QRPQuickrep1.Page.Length:=frmdiseniocierreCaja58.QRPQuickrep1.Page.Length + 10;
  FORM1.FDQuery2.Next;
END;

//COBROS CC
    frmdiseniocierreCaja58.RxMemoryData1.Append;
   frmdiseniocierreCaja58.RxMemoryData1FORMA.Value:='';
   frmdiseniocierreCaja58.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierreCaja58.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierreCaja58.RxMemoryData1.Post;
      frmdiseniocierreCaja58.QRPQuickrep1.Page.Length:=frmdiseniocierreCaja58.QRPQuickrep1.Page.Length + 10;
   frmdiseniocierreCaja58.RxMemoryData1.Append;
   frmdiseniocierreCaja58.RxMemoryData1FORMA.Value:='---COBROS CUENTA CORRIENTES CLIENTES ----';
   frmdiseniocierreCaja58.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierreCaja58.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierreCaja58.RxMemoryData1.Post;
     frmdiseniocierreCaja58.QRPQuickrep1.Page.Length:=frmdiseniocierreCaja58.QRPQuickrep1.Page.Length + 10;
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('SELECT TP.TOTAL,TC.APENOM ,TF.DESCRIPCION '+
'  FROM TPAGOSCUENTACORRIENTES TP, TMOVIMIENTOS TM  ,TCLIENTES TC ,TFORMAPAGO TF '+
' WHERE TP.IDMOVIMIENTO=TM.IDMOVIMIENTO '+
' AND TP.IDFORMAPAGO=TF.IDFORMAPAGO  and tp.pc='+inttostr(form1.PUESTO_PC)+
' AND TM.IDCLIENTE=TC.IDCLIENTE  '+
' AND TP.CIERRE=0 AND TP.FECHA='+#39+trim(fe)+#39);
 form1.FDQuery2.Open;
while NOT FORM1.FDQuery2.Eof do
BEGIN
     frmdiseniocierreCaja58.RxMemoryData1.Append;
      frmdiseniocierreCaja58.RxMemoryData1FORMA.Value:=TRIM(FORM1.FDQuery2.Fields[1].ASSTRING);
      frmdiseniocierreCaja58.RxMemoryData1CANTIDAD.Value:='$'+TRIM(FORM1.FDQuery2.Fields[2].ASSTRING);
      frmdiseniocierreCaja58.RxMemoryData1TOTAL.Value:=TRIM(FORM1.FDQuery2.Fields[0].ASSTRING);
     frmdiseniocierreCaja58.RxMemoryData1.Post;

            frmdiseniocierreCaja58.QRPQuickrep1.Page.Length:=frmdiseniocierreCaja58.QRPQuickrep1.Page.Length + 10;
  FORM1.FDQuery2.Next;
END;


//articulos vendidos

    frmdiseniocierreCaja58.RxMemoryData1.Append;
   frmdiseniocierreCaja58.RxMemoryData1FORMA.Value:='';
   frmdiseniocierreCaja58.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierreCaja58.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierreCaja58.RxMemoryData1.Post;
      frmdiseniocierreCaja58.QRPQuickrep1.Page.Length:=frmdiseniocierreCaja58.QRPQuickrep1.Page.Length + 10;
   frmdiseniocierreCaja58.RxMemoryData1.Append;
   frmdiseniocierreCaja58.RxMemoryData1FORMA.Value:='---ARTICULOS VENDIDOS ----';
   frmdiseniocierreCaja58.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierreCaja58.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierreCaja58.RxMemoryData1.Post;
      frmdiseniocierreCaja58.QRPQuickrep1.Page.Length:=frmdiseniocierreCaja58.QRPQuickrep1.Page.Length + 10;
  form1.FDQuery2.Close;
    form1.FDQuery2.SQL.Clear;
    form1.FDQuery2.SQL.Add(' SELECT   '+
                     ' A.DESCRIPCION AS ARTICULOS,R.DESCRIPCION AS RUBRO,P.RAZONSOCIAL AS PROVEEDOR,  '+
                     ' SUM(TI.CANTIDAD)  AS VENDIDO, M.DESCRIPCION AS MARCA,sum(ti.ptotal) AS VENTATOTALPRECIO '+
                     ' FROM     TITEM_FACTURA TI   '+
                     ' INNER JOIN TMOVIMIENTOS TM ON TM.IDMOVIMIENTO = TI.IDFACTURA  '+
                     ' INNER JOIN TARTICULOS A ON A.IDARTICULO=TI.IDARTICULO  '+
                     ' LEFT JOIN TRUBROS R ON R.IDRUBRO=A.IDRUBRO '+
                     ' LEFT JOIN TPROVEEDORES P ON P.IDPROVEEDOR=A.IDPROVEEDOR  '+
                       ' LEFT JOIN TMARCAS M ON M.IDMARCA = A.IDMARCA '+
                     ' WHERE  TM.CIERRE=0  and tm.pc='+inttostr(form1.PUESTO_PC)+' and tm.total > 0 AND TM.FECHA ='+#39+trim(fe)+#39);

     form1.FDQuery2.SQL.Add(' GROUP BY A.DESCRIPCION  '+
                     ' ORDER BY VENDIDO DESC') ;
    form1.FDQuery2.Open;
   while NOT FORM1.FDQuery2.Eof do
BEGIN
     frmdiseniocierreCaja58.RxMemoryData1.Append;
      frmdiseniocierreCaja58.RxMemoryData1FORMA.Value:=TRIM(FORM1.FDQuery2.Fields[0].ASSTRING)+'-'+TRIM(FORM1.FDQuery2.Fields[4].ASSTRING);
      frmdiseniocierreCaja58.RxMemoryData1CANTIDAD.Value:='CANT: '+TRIM(FORM1.FDQuery2.Fields[3].ASSTRING)+'       $'+TRIM(FORM1.FDQuery2.Fields[5].ASSTRING);//TRIM(FORM1.FDQuery2.Fields[3].ASSTRING);
      frmdiseniocierreCaja58.RxMemoryData1TOTAL.Value:='';
     frmdiseniocierreCaja58.RxMemoryData1.Post;
          frmdiseniocierreCaja58.QRPQuickrep1.Page.Length:=frmdiseniocierreCaja58.QRPQuickrep1.Page.Length + 10;
  FORM1.FDQuery2.Next;
END;

//ventas

 //EFE
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(tf.importe) AS F from tmovimientos tm , TFORMAPAGOS_FACTURAS tf  '+
' where tm.fecha='+#39+trim(fe)+#39+' AND tf.IDFORMA=1   '+
' and tm.IDMOVIMIENTO=tf.IDMOVIMIENTO   '+
' AND tm.TIPOMOVIMIENTO IN (0,1,2,3) and tm.cierre=0 and tm.pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('F').asstring)='' then
efe:=0
else
efe:=form1.FDQuery2.FieldByName('F').asfloat ;

{form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where fecha='+#39+trim(fe)+#39+' AND IDFORMAPAGO=1 AND TIPOMOVIMIENTO IN (4,5,6,7) and cierre=0');
form1.FDQuery2.Open;  }

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(tf.importe) AS F from tmovimientos tm , TFORMAPAGOS_FACTURAS tf  '+
' where tm.fecha='+#39+trim(fe)+#39+' AND tf.IDFORMA=1   '+
' and tm.IDMOVIMIENTO=tf.IDMOVIMIENTO   '+
' AND tm.TIPOMOVIMIENTO IN (4,5,6,7) and tm.cierre=0  and tm.pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('F').asstring)='' then
NCefe:=0
else
NCefe:=form1.FDQuery2.FieldByName('F').asfloat ;





//TD

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(tf.importe) AS F from tmovimientos tm , TFORMAPAGOS_FACTURAS tf  '+
' where tm.fecha='+#39+trim(fe)+#39+' AND tf.IDFORMA=2   '+
' and tm.IDMOVIMIENTO=tf.IDMOVIMIENTO   '+
'  and tm.cierre=0 and tm.pc='+inttostr(form1.PUESTO_PC));           //AND tm.TIPOMOVIMIENTO IN (0,1,2,3)
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('F').asstring)='' then
 td:=0
else
td:=form1.FDQuery2.FieldByName('F').asfloat;

//TC
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(tf.importe) AS F from tmovimientos tm , TFORMAPAGOS_FACTURAS tf  '+
' where tm.fecha='+#39+trim(fe)+#39+' AND tf.IDFORMA=3   '+
' and tm.IDMOVIMIENTO=tf.IDMOVIMIENTO   '+
'  and tm.cierre=0 and tm.pc='+inttostr(form1.PUESTO_PC));           //AND tm.TIPOMOVIMIENTO IN (0,1,2,3)
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('F').asstring)='' then
tc:=0
else
tc:=form1.FDQuery2.FieldByName('F').asfloat ;


//billetera
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(tf.importe) AS F from tmovimientos tm , TFORMAPAGOS_FACTURAS tf  '+
' where tm.fecha='+#39+trim(fe)+#39+' AND tf.IDFORMA=4  '+
' and tm.IDMOVIMIENTO=tf.IDMOVIMIENTO   '+
'  and tm.cierre=0  and tm.pc='+inttostr(form1.PUESTO_PC));         //AND tm.TIPOMOVIMIENTO IN (0,1,2,3)
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('F').asstring)='' then
bs:=0
else
bs:=form1.FDQuery2.FieldByName('F').asfloat ;


//CC
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(tf.importe) AS F from tmovimientos tm , TFORMAPAGOS_FACTURAS tf  '+
' where tm.fecha='+#39+trim(fe)+#39+' AND tf.IDFORMA=5   '+
' and tm.IDMOVIMIENTO=tf.IDMOVIMIENTO   '+
'  and tm.cierre=0  and tm.pc='+inttostr(form1.PUESTO_PC));          //AND tm.TIPOMOVIMIENTO IN (0,1,2,3)
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('F').asstring)='' then
CC:=0
else
CC:=form1.FDQuery2.FieldByName('F').asfloat ;

//mp
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(tf.importe) AS F from tmovimientos tm , TFORMAPAGOS_FACTURAS tf  '+
' where tm.fecha='+#39+trim(fe)+#39+' AND tf.IDFORMA=6   '+
' and tm.IDMOVIMIENTO=tf.IDMOVIMIENTO   '+
'  and tm.cierre=0  and tm.pc='+inttostr(form1.PUESTO_PC));          //AND tm.TIPOMOVIMIENTO IN (0,1,2,3)
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('F').asstring)='' then
MP:=0
else
MP:=form1.FDQuery2.FieldByName('F').asfloat ;



//SALIDAS
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('SELECT sum(importe)  as total FROM tsalidas WHERE fecha='+#39+trim(fe)+#39+' AND CIERRE=0  and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('total').asstring)='' then
salidas:=0
else
salidas:=form1.FDQuery2.fieldbyname('total').asfloat;


//CAJA INICIAL
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('SELECT cambio FROM TCAJA WHERE fecha='+#39+trim(fe)+#39+' and estado=1  and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('cambio').asstring)='' then
cambio:=0
else
cambio:=form1.FDQuery2.fieldbyname('cambio').asfloat;


 form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('SELECT sum(importe)  as total FROM TINGRESOS WHERE fecha='+#39+trim(fe)+#39+' AND CIERRE=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('total').asstring)='' then
INGRESOACAJA:=0
else
INGRESOACAJA:=form1.FDQuery2.fieldbyname('total').asfloat;



 form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('SELECT sum(TOTAL)  as TOTA FROM TPAGOSCUENTACORRIENTES  WHERE fecha='+#39+trim(fe)+#39+' AND CIERRE=0 AND IDFORMAPAGO=1 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('TOTA').asstring)='' then
PAGOSCUENTACORRIENTES:=0
else
PAGOSCUENTACORRIENTES:=form1.FDQuery2.fieldbyname('TOTA').asfloat;

  frmdiseniocierreCaja58.QRLABEL11.Caption:='IMPRESION: '+DATETOSTR(DATE);


frmdiseniocierreCaja58.QRLabel4.Caption:='DINERO DEL CAJERO :$ '+FLOATTOSTR(ingresado) ;
frmdiseniocierreCaja58.QRLabel10.Caption:='CAMBIO :$ '+FLOATTOSTR(cambio) ;
frmdiseniocierreCaja58.QRLabel12.Caption:='SALIDAS DE CAJA :$ '+FLOATTOSTR(salidas) ;
frmdiseniocierreCaja58.QRLabel18.Caption:='INGRESOS DE CAJA :$ '+FLOATTOSTR(INGRESOACAJA) ;
frmdiseniocierreCaja58.QRLabel9.Caption:='COBROS EN EFECT. C/C CLIENTES :$ '+FLOATTOSTR(PAGOSCUENTACORRIENTES) ;

efe:=efe - NCEFE;

ENCAJA:=CAMBIO +  INGRESOACAJA +  efe + PAGOSCUENTACORRIENTES;
ENCAJA:=ENCAJA - SALIDAS;
SALDO:=ENCAJA;
frmdiseniocierreCaja58.QRLabel14.Caption:='EFECT. EN CAJA:$ '+FLOATTOSTR(ENCAJA) ;

if saldo > ingresado then
begin
   saldo:=saldo - ingresado;
   showmessage('SALDO FALTANTE: '+FLOATTOSTR(SALDO));
   MENSA:='FALTANTE';
end ELSE BEGIN
        if saldo < ingresado then
          begin
                saldo:=ingresado - saldo;
                 showmessage('SALDO SOBRANTE: '+FLOATTOSTR(SALDO));
                  MENSA:='SOBRANTE';
          end ELSE BEGIN

                      if saldo = ingresado then
                       begin
                       saldo:=0;
                            showmessage('SALDO CERO');
                            MENSA:='';
                      end;
                  END;
        END;


        frmdiseniocierreCaja58.QRLabel17.Caption:='SALDO:$ '+FLOATTOSTR(saldo) +' '+MENSA;

frmdiseniocierreCaja58.QRLabel2.Caption:='FECHA : '+FE+'  '+TIMETOSTR(TIME);
frmdiseniocierreCaja58.QRPQuickrep1.Prepare;

{if form1.demo=false then
frmdiseniocierrecaja.QRPQuickrep1.Print
else  }
 fecha:=fe;
 hora:=timetostr(time);
 hora:=StringReplace (hora, ':', '_',[rfReplaceAll, rfIgnoreCase]);
 fecha:=StringReplace (fecha, '/', '',[rfReplaceAll, rfIgnoreCase]);
 archivoEmail := ExtractFilePath(ParamStr(0))+'\INFORMES\cierreCaja_dia_'+fecha+'_hora_'+hora+'.pdf';
    Gpdf := TExportar2PDFSyn.Create;
    Gpdf.rutaPDF := archivoEmail;
    Gpdf.Exportar2PDF(frmdiseniocierreCaja58.QRPQuickrep1);
    Gpdf.free;

frmdiseniocierreCaja58.QRPQuickrep1.Print;

 try

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('UPDATE tmovimientos  SET CIERRE = 1 where fecha='+#39+trim(FE)+#39+'AND cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.ExecSQL;


form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('UPDATE TINGRESOS  SET CIERRE = 1 where fecha='+#39+trim(FE)+#39+'AND cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.ExecSQL;

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('UPDATE TSALIDAS  SET CIERRE = 1 where fecha='+#39+trim(FE)+#39+'AND cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.ExecSQL;

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('UPDATE TPAGOSCUENTACORRIENTES  SET CIERRE = 1 where fecha='+#39+trim(FE)+#39+'AND cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.ExecSQL;


form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('update TCAJA  set VENTA_EFE='+FLOATTOSTR(EFE)+
                                          ', VENTA_TD='+FLOATTOSTR(TD)+
                                         ', VENTA_TC='+FLOATTOSTR(TC)+
                                        ', EFE_INGRESADO='+FLOATTOSTR(ingresado)+
                                       ', SALDO='+FORMATFLOAT('##########.##',saldo)+
                                        ', ESTADO=0'+
                                       ', SALIDAS='+FLOATTOSTR(SALIDAS)+
                                     ', DINERO_EN_CAJA='+FLOATTOSTR(ENCAJA)+
                                     ', INGRESOSCAJA='+FLOATTOSTR(INGRESOACAJA)+
                                     ' WHERE fecha='+#39+trim(fe)+#39+' and estado=1 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.ExecSQL;
form1.FDConnection1.Commit;

form1.Panel2.Caption:='CAJA: ';
CLOSE;
except

  on E: Exception do
  begin
      ShowMessage (E.ClassName + 'error generado, con mensaje:' + E.Message);
      form1.FDConnection1.Rollback;
  end;
end;

end;

procedure TFRMCIERRECAJA.cierreCaja80;
var cambio,salidas,efe,td,tc,ingresado,saldo,MP,CC,ENCAJA,PAGOSCUENTACORRIENTES,
INGRESOACAJA,bs:real; fe,MENSA,hora:string; archivoEmail ,fecha:String;
  TOTALNC,TOTALFACTUIRAS:REAL;    Gpdf :TExportar2PDFSyn ;
NCefe:REAL;
begin
cambio:=0;
salidas:=0;
efe:=0;
td:=0 ;
tc:=0;
ingresado:=0;
saldo:=0;
bs:=0;
CC:=0;
MP:=0;
ENCAJA:=0;
TOTALNC:=0;
INGRESOACAJA:=0;
NCefe:=0;
TOTALFACTUIRAS:=0;
PAGOSCUENTACORRIENTES:=0;
fe:=trim(edit1.Text);
ingresado:=strtofloat(edit2.Text);

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select apenom from tusuarios where idusuario='+inttostr(form1.IDUSUARIOLOGEADO));
form1.FDQuery2.Open;

frmdiseniocierrecaja.QRLabel1.Caption:='CIERRE DE CAJA: '+trim(form1.FDQuery2.FieldByName('apenom').AsString);

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where fecha='+#39+trim(fe)+#39+' AND  TIPOMOVIMIENTO IN (0,1,2,3) and cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if TRIM(form1.FDQuery2.FieldByName('F').ASSTRING)='' then
  TOTALFACTUIRAS:=0
  ELSE
TOTALFACTUIRAS:=form1.FDQuery2.FieldByName('F').ASFLOAT;

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where fecha='+#39+trim(fe)+#39+' AND  TIPOMOVIMIENTO IN (4,5,6,7) and cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if TRIM(form1.FDQuery2.FieldByName('F').ASSTRING)='' then
  TOTALNC:=0
  ELSE
TOTALNC:=form1.FDQuery2.FieldByName('F').ASFLOAT;

frmdiseniocierrecaja.QRLabel5.Caption:='TOTAL :$ '+FLOATTOSTR(TOTALFACTUIRAS -TOTALNC) ;

 frmdiseniocierrecaja.RxMemoryData1.Close;
frmdiseniocierrecaja.RxMemoryData1.OPEN;
   frmdiseniocierrecaja.RxMemoryData1.Append;
   frmdiseniocierrecaja.RxMemoryData1FORMA.Value:='--- VENTAS ----';
   frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierrecaja.RxMemoryData1.Post;



form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select TF.DESCRIPCION, SUM(TM.TOTAL) AS S  '+
'  from tmovimientos TM  ,TFORMAPAGO TF    '+
' where TM.fecha='+#39+trim(fe)+#39+' AND TM.IDFORMAPAGO=TF.IDFORMAPAGO  '+
' AND TM.TIPOMOVIMIENTO IN (0,1,2,3) AND  TM.cierre=0 and tm.pc='+inttostr(form1.PUESTO_PC)+
' GROUP BY  TF.IDFORMAPAGO   order  BY   TF.DESCRIPCION asc ');
form1.FDQuery2.Open;
while NOT FORM1.FDQuery2.Eof do
BEGIN
     frmdiseniocierrecaja.RxMemoryData1.Append;
      frmdiseniocierrecaja.RxMemoryData1FORMA.Value:=TRIM(FORM1.FDQuery2.Fields[0].ASSTRING);
      frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
      frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:=TRIM(FORM1.FDQuery2.Fields[1].ASSTRING);
     frmdiseniocierrecaja.RxMemoryData1.Post;
  FORM1.FDQuery2.Next;
END;

     frmdiseniocierrecaja.RxMemoryData1.Append;
   frmdiseniocierrecaja.RxMemoryData1FORMA.Value:='' ;
   frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierrecaja.RxMemoryData1.Post;


   frmdiseniocierrecaja.RxMemoryData1.Append;
   frmdiseniocierrecaja.RxMemoryData1FORMA.Value:='--- NC DEVOLUCIONES ----';
   frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierrecaja.RxMemoryData1.Post;

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select TF.DESCRIPCION, SUM(TM.TOTAL) AS S  '+
'  from tmovimientos TM  ,TFORMAPAGO TF    '+
' where TM.fecha='+#39+trim(fe)+#39+' AND TM.IDFORMAPAGO=TF.IDFORMAPAGO  '+
' AND TM.TIPOMOVIMIENTO IN (4,5,6,7) AND  TM.cierre=0 and tm.pc='+inttostr(form1.PUESTO_PC)+
' GROUP BY  TF.IDFORMAPAGO   order  BY   TF.DESCRIPCION asc ');
form1.FDQuery2.Open;
while NOT FORM1.FDQuery2.Eof do
BEGIN
     frmdiseniocierrecaja.RxMemoryData1.Append;
      frmdiseniocierrecaja.RxMemoryData1FORMA.Value:=TRIM(FORM1.FDQuery2.Fields[0].ASSTRING);
      frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
      frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:=TRIM(FORM1.FDQuery2.Fields[1].ASSTRING);
     frmdiseniocierrecaja.RxMemoryData1.Post;
  FORM1.FDQuery2.Next;
END;



    frmdiseniocierrecaja.RxMemoryData1.Append;
   frmdiseniocierrecaja.RxMemoryData1FORMA.Value:='';
   frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierrecaja.RxMemoryData1.Post;

   frmdiseniocierrecaja.RxMemoryData1.Append;
   frmdiseniocierrecaja.RxMemoryData1FORMA.Value:='---ARTICULOS DEVUELTOS ----';
   frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierrecaja.RxMemoryData1.Post;

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('SELECT TD.ARTICULO,TD.CANTIDAD,TD.COMENTARIO  '+
' FROM TMOVIMIENTOS TM, TDEVOLCIONES TD '+
' WHERE TM.IDMOVIMIENTO=TD.IDMOVIMIENTO  '+
' AND TM.TIPOMOVIMIENTO IN (4,5,6,7)   '+
' AND TM.CIERRE=0  and tm.pc='+inttostr(form1.PUESTO_PC)+
' AND TM.FECHA='+#39+trim(fe)+#39);
 form1.FDQuery2.Open;
while NOT FORM1.FDQuery2.Eof do
BEGIN
     frmdiseniocierrecaja.RxMemoryData1.Append;
      frmdiseniocierrecaja.RxMemoryData1FORMA.Value:=TRIM(FORM1.FDQuery2.Fields[0].ASSTRING);
      frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:=TRIM(FORM1.FDQuery2.Fields[1].ASSTRING);
      frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:=TRIM(FORM1.FDQuery2.Fields[2].ASSTRING);
     frmdiseniocierrecaja.RxMemoryData1.Post;
  FORM1.FDQuery2.Next;
END;

//COBROS CC
    frmdiseniocierrecaja.RxMemoryData1.Append;
   frmdiseniocierrecaja.RxMemoryData1FORMA.Value:='';
   frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierrecaja.RxMemoryData1.Post;
   frmdiseniocierrecaja.RxMemoryData1.Append;
   frmdiseniocierrecaja.RxMemoryData1FORMA.Value:='---COBROS CUENTA CORRIENTES CLIENTES ----';
   frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierrecaja.RxMemoryData1.Post;

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('SELECT TP.TOTAL,TC.APENOM ,TF.DESCRIPCION '+
'  FROM TPAGOSCUENTACORRIENTES TP, TMOVIMIENTOS TM  ,TCLIENTES TC ,TFORMAPAGO TF '+
' WHERE TP.IDMOVIMIENTO=TM.IDMOVIMIENTO '+
' AND TP.IDFORMAPAGO=TF.IDFORMAPAGO  '+
' AND TM.IDCLIENTE=TC.IDCLIENTE  and tp.pc='+inttostr(form1.PUESTO_PC)+
' AND TP.CIERRE=0 AND TP.FECHA='+#39+trim(fe)+#39);
 form1.FDQuery2.Open;
while NOT FORM1.FDQuery2.Eof do
BEGIN
     frmdiseniocierrecaja.RxMemoryData1.Append;
      frmdiseniocierrecaja.RxMemoryData1FORMA.Value:=TRIM(FORM1.FDQuery2.Fields[1].ASSTRING);
      frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:=TRIM(FORM1.FDQuery2.Fields[0].ASSTRING);
      frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:=TRIM(FORM1.FDQuery2.Fields[2].ASSTRING);
     frmdiseniocierrecaja.RxMemoryData1.Post;
  FORM1.FDQuery2.Next;
END;


//articulos vendidos

    frmdiseniocierrecaja.RxMemoryData1.Append;
   frmdiseniocierrecaja.RxMemoryData1FORMA.Value:='';
   frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierrecaja.RxMemoryData1.Post;
   frmdiseniocierrecaja.RxMemoryData1.Append;
   frmdiseniocierrecaja.RxMemoryData1FORMA.Value:='---ARTICULOS VENDIDOS ----';
   frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';
    frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:='';
   frmdiseniocierrecaja.RxMemoryData1.Post;
  form1.FDQuery2.Close;
    form1.FDQuery2.SQL.Clear;
    form1.FDQuery2.SQL.Add(' SELECT   '+
                     ' A.DESCRIPCION AS ARTICULOS,R.DESCRIPCION AS RUBRO,P.RAZONSOCIAL AS PROVEEDOR,  '+
                     ' SUM(TI.CANTIDAD)  AS VENDIDO, M.DESCRIPCION AS MARCA,sum(ti.ptotal) AS VENTATOTALPRECIO '+
                     ' FROM     TITEM_FACTURA TI   '+
                     ' INNER JOIN TMOVIMIENTOS TM ON TM.IDMOVIMIENTO = TI.IDFACTURA  '+
                     ' INNER JOIN TARTICULOS A ON A.IDARTICULO=TI.IDARTICULO  '+
                     ' LEFT JOIN TRUBROS R ON R.IDRUBRO=A.IDRUBRO '+
                     ' LEFT JOIN TPROVEEDORES P ON P.IDPROVEEDOR=A.IDPROVEEDOR  '+
                       ' LEFT JOIN TMARCAS M ON M.IDMARCA = A.IDMARCA '+
                     ' WHERE  TM.CIERRE=0  and tm.pc='+inttostr(form1.PUESTO_PC)+' AND TM.FECHA ='+#39+trim(fe)+#39);

     form1.FDQuery2.SQL.Add(' GROUP BY A.DESCRIPCION  '+
                     ' ORDER BY VENDIDO DESC') ;
    form1.FDQuery2.Open;
   while NOT FORM1.FDQuery2.Eof do
BEGIN
     frmdiseniocierrecaja.RxMemoryData1.Append;
      frmdiseniocierrecaja.RxMemoryData1FORMA.Value:=TRIM(FORM1.FDQuery2.Fields[0].ASSTRING)+'-'+TRIM(FORM1.FDQuery2.Fields[4].ASSTRING);
      frmdiseniocierrecaja.RxMemoryData1CANTIDAD.Value:='';//TRIM(FORM1.FDQuery2.Fields[3].ASSTRING);
      frmdiseniocierrecaja.RxMemoryData1TOTAL.Value:='CANT: '+TRIM(FORM1.FDQuery2.Fields[3].ASSTRING)+'       $'+TRIM(FORM1.FDQuery2.Fields[5].ASSTRING);
     frmdiseniocierrecaja.RxMemoryData1.Post;
  FORM1.FDQuery2.Next;
END;

//ventas

 //EFE
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where fecha='+#39+trim(fe)+#39+'AND IDFORMAPAGO=1 AND TIPOMOVIMIENTO IN (0,1,2,3) and cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('F').asstring)='' then
efe:=0
else
efe:=form1.FDQuery2.FieldByName('F').asfloat ;

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where fecha='+#39+trim(fe)+#39+'AND IDFORMAPAGO=1 AND TIPOMOVIMIENTO IN (4,5,6,7) and cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('F').asstring)='' then
NCefe:=0
else
NCefe:=form1.FDQuery2.FieldByName('F').asfloat ;





//TD

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where fecha='+#39+trim(fe)+#39+'AND IDFORMAPAGO=2 and cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('F').asstring)='' then
 td:=0
else
td:=form1.FDQuery2.FieldByName('F').asfloat;

//TC
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where fecha='+#39+trim(fe)+#39+'AND IDFORMAPAGO=3 and cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('F').asstring)='' then
tc:=0
else
tc:=form1.FDQuery2.FieldByName('F').asfloat ;


//billetera
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where fecha='+#39+trim(fe)+#39+'AND IDFORMAPAGO=4 and cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('F').asstring)='' then
bs:=0
else
bs:=form1.FDQuery2.FieldByName('F').asfloat ;


//CC
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where fecha='+#39+trim(fe)+#39+'AND IDFORMAPAGO=5 and cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('F').asstring)='' then
CC:=0
else
CC:=form1.FDQuery2.FieldByName('F').asfloat ;

//CC
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where fecha='+#39+trim(fe)+#39+'AND IDFORMAPAGO=6 and cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('F').asstring)='' then
MP:=0
else
MP:=form1.FDQuery2.FieldByName('F').asfloat ;



//SALIDAS
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('SELECT sum(importe)  as total FROM tsalidas WHERE fecha='+#39+trim(fe)+#39+' AND CIERRE=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('total').asstring)='' then
salidas:=0
else
salidas:=form1.FDQuery2.fieldbyname('total').asfloat;


//CAJA INICIAL
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('SELECT cambio FROM TCAJA WHERE fecha='+#39+trim(fe)+#39+' and estado=1 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('cambio').asstring)='' then
cambio:=0
else
cambio:=form1.FDQuery2.fieldbyname('cambio').asfloat;


 form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('SELECT sum(importe)  as total FROM TINGRESOS WHERE fecha='+#39+trim(fe)+#39+' AND CIERRE=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('total').asstring)='' then
INGRESOACAJA:=0
else
INGRESOACAJA:=form1.FDQuery2.fieldbyname('total').asfloat;



 form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('SELECT sum(TOTAL)  as TOTA FROM TPAGOSCUENTACORRIENTES  WHERE fecha='+#39+trim(fe)+#39+' AND CIERRE=0 AND IDFORMAPAGO=1 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.Open;
if trim(form1.FDQuery2.FieldByName('TOTA').asstring)='' then
PAGOSCUENTACORRIENTES:=0
else
PAGOSCUENTACORRIENTES:=form1.FDQuery2.fieldbyname('TOTA').asfloat;




frmdiseniocierrecaja.QRLabel4.Caption:='DINERO DEL CAJERO :$ '+FLOATTOSTR(ingresado) ;
frmdiseniocierrecaja.QRLabel10.Caption:='CAMBIO :$ '+FLOATTOSTR(cambio) ;
frmdiseniocierrecaja.QRLabel12.Caption:='SALIDAS DE CAJA :$ '+FLOATTOSTR(salidas) ;
frmdiseniocierrecaja.QRLabel18.Caption:='INGRESOS DE CAJA :$ '+FLOATTOSTR(INGRESOACAJA) ;
frmdiseniocierrecaja.QRLabel9.Caption:='COBROS EN EFECT. C/C CLIENTES :$ '+FLOATTOSTR(PAGOSCUENTACORRIENTES) ;

efe:=efe - NCEFE;

ENCAJA:=CAMBIO +  INGRESOACAJA +  efe + PAGOSCUENTACORRIENTES;
ENCAJA:=ENCAJA - SALIDAS;
SALDO:=ENCAJA;
frmdiseniocierrecaja.QRLabel14.Caption:='EFECT. EN CAJA:$ '+FLOATTOSTR(ENCAJA) ;

if saldo > ingresado then
begin
   saldo:=saldo - ingresado;
   showmessage('SALDO FALTANTE: '+FLOATTOSTR(SALDO));
   MENSA:='FALTANTE';
end ELSE BEGIN
        if saldo < ingresado then
          begin
                saldo:=ingresado - saldo;
                 showmessage('SALDO SOBRANTE: '+FLOATTOSTR(SALDO));
                  MENSA:='SOBRANTE';
          end ELSE BEGIN

                      if saldo = ingresado then
                       begin
                            showmessage('SALDO CERO');
                            MENSA:='';
                      end;
                  END;
        END;


        frmdiseniocierrecaja.QRLabel17.Caption:='SALDO:$ '+FLOATTOSTR(saldo) +' '+MENSA;

frmdiseniocierrecaja.QRLabel2.Caption:='FECHA : '+FE+'  '+TIMETOSTR(TIME);
frmdiseniocierrecaja.QRPQuickrep1.Prepare;

{if form1.demo=false then
frmdiseniocierrecaja.QRPQuickrep1.Print
else  }
 fecha:=fe;
 hora:=timetostr(time);
 hora:=StringReplace (hora, ':', '_',[rfReplaceAll, rfIgnoreCase]);
 fecha:=StringReplace (fecha, '/', '',[rfReplaceAll, rfIgnoreCase]);
 archivoEmail := ExtractFilePath(ParamStr(0))+'\INFORMES\cierreCaja_dia_'+fecha+'_hora_'+hora+'.pdf';
    Gpdf := TExportar2PDFSyn.Create;
    Gpdf.rutaPDF := archivoEmail;
    Gpdf.Exportar2PDF(frmdiseniocierrecaja.QRPQuickrep1);
    Gpdf.free;

frmdiseniocierrecaja.QRPQuickrep1.Preview;

 try
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('UPDATE tmovimientos  SET CIERRE = 1 where fecha='+#39+trim(FE)+#39+'AND cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.ExecSQL;


form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('UPDATE TINGRESOS  SET CIERRE = 1 where fecha='+#39+trim(FE)+#39+'AND cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.ExecSQL;

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('UPDATE TSALIDAS  SET CIERRE = 1 where fecha='+#39+trim(FE)+#39+'AND cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.ExecSQL;

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('UPDATE TPAGOSCUENTACORRIENTES  SET CIERRE = 1 where fecha='+#39+trim(FE)+#39+'AND cierre=0 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.ExecSQL;


form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('update TCAJA  set VENTA_EFE='+FLOATTOSTR(EFE)+
                                          ', VENTA_TD='+FLOATTOSTR(TD)+
                                         ', VENTA_TC='+FLOATTOSTR(TC)+
                                        ', EFE_INGRESADO='+FLOATTOSTR(ingresado)+
                                       ', SALDO='+FLOATTOSTR(saldo)+
                                        ', ESTADO=0'+
                                       ', SALIDAS='+FLOATTOSTR(SALIDAS)+
                                     ', DINERO_EN_CAJA='+FLOATTOSTR(ENCAJA)+
                                     ', INGRESOSCAJA='+FLOATTOSTR(INGRESOACAJA)+
                                     ' WHERE fecha='+#39+trim(fe)+#39+' and estado=1 and pc='+inttostr(form1.PUESTO_PC));
form1.FDQuery2.ExecSQL;
form1.FDConnection1.Commit;

form1.Panel2.Caption:='CAJA: ';
CLOSE;
except

  on E: Exception do
  begin
      ShowMessage (E.ClassName + 'error generado, con mensaje:' + E.Message);
      form1.FDConnection1.Rollback;
  end;
end;

end;

procedure TFRMCIERRECAJA.BitBtn2Click(Sender: TObject);
begin
CLOSE;
end;

procedure TFRMCIERRECAJA.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0','1','2','3','4','5','6','7','8','9','+','-','.',#8,#13] then
    edit2.readonly:=false
    else
     edit2.readonly:=true;
end;

end.
