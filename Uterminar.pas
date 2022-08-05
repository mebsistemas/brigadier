unit Uterminar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, IdAttachmentFile,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,Class_decimales,UDisenioPDF,Exportar2PDF, IdIOHandler,
  IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdMessageClient, IdSMTPBase, IdSMTP,IdMessage,  IdSSLOpenSSLHeaders, Vcl.Menus,
  Vcl.Grids, Vcl.DBGrids, RxMemDS;

type
  Tfrmterminar = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Panel4: TPanel;
    Panel5: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    SpeedButton1: TSpeedButton;
    FDQuery2: TFDQuery;
    Edit3: TEdit;
    FDQuery3: TFDQuery;
    FDQuery4: TFDQuery;
    FDQuery5: TFDQuery;
    FDQuery6: TFDQuery;
    IdSMTP: TIdSMTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    MainMenu1: TMainMenu;
    aceptar1: TMenuItem;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
    Label8: TLabel;
    Edit4: TEdit;
    BitBtn2: TBitBtn;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1IDFORMA: TIntegerField;
    RxMemoryData1FORMA: TStringField;
    RxMemoryData1IMPORTES: TStringField;
    RxMemoryData1IMPORTEF: TFloatField;
    DataSource2: TDataSource;
    Label9: TLabel;
    Edit5: TEdit;
    FDQuery7: TFDQuery;
    FDQuery8: TFDQuery;
    FDQuery9: TFDQuery;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure aceptar1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    FUNCTION GUARDAR:BOOLEAN;
    function EnviarMail(ARCHVOENVIA,correo:String):boolean;
    function armanumeroFactura(nro:string):string;
  public
    { Public declarations }
      IDVENDEDOR,tipoivacliente:LONGINT;
      function imprimir(idmovi:longint;ESPARAENAMIL:STRING):STRING;
      function imprimirTICKET(idmovi:longint;ESPARAENAMIL:STRING):STRING;
      function imprimirTICKET_58(idmovi:longint;ESPARAENAMIL:STRING):STRING;
      function imprimirFacturaFormato58(idmovi:longint;ESPARAENAMIL:STRING):STRING;

      function imprimirTICKETA4(idmovi:longint;ESPARAENAMIL:STRING):STRING;
     procedure EnviarMensaje( sAdjunto,
   sDestino: string);
  end;

var
  frmterminar: Tfrmterminar;

implementation

{$R *.dfm}

uses Unit1, UniPideusario, UniFRMDATOSTARJETASpas, UnitFRMMENSAJE,
  UnitbuscarDatosCliente, Unitfrmenviarmail, DISENIOTICKET,
  UnitPIDECOMENTARIOS4, disenioticketa4, UnitREALIZARDEVOLUCIONES4,
  UudisenioTicket58, UImprimeFActura58;

FUNCTION Tfrmterminar.GUARDAR:BOOLEAN;
VAR IDMOVI,TIPOMOVIMIENTO,IDCLIENTE,IDMOVIMIENTONC:LONGINT;
     IDFORMAPAGO:LONGINT;
     FECHAHOY:sTRING;        COMENTARIO:STRING;
      td:tdecimales;   posi:longint;
     SUBTOTAL,IVA,TOTAL:REAL;
     NROFACTURA,CAE,FECHAVENCE,POR:STRING;
     CODIGOUSUARIO,cierre:LONGINT;
     SALE:BOOLEAN;   PUNI,PTOTAL,PRECIOIVA,IVAART,IVA10,PAGO:REAL;
     PRECIOIVA_S,PUNI_S,PTOTAL_S:STRING;   CANT,TOTALVENTA:REAL;
BEGIN
    posi:=pos('-',trim(ComboBox1.Text));
   TIPOMOVIMIENTO:=strtoint(trim(copy(trim(ComboBox1.TEXT),0,posi-1)));

     posi:=pos('-',trim(label7.Caption));
   IDCLIENTE:=strtoint(trim(copy(trim(label7.Caption),0,posi-1)));

   IDMOVIMIENTONC:=0;

  IF (TIPOMOVIMIENTO = 4)  OR (TIPOMOVIMIENTO = 5)
       OR (TIPOMOVIMIENTO = 6) OR  (TIPOMOVIMIENTO = 7) THEN
  BEGIN
      REALIZARDEVOLUCIONES.Edit1.Clear;
      REALIZARDEVOLUCIONES.IDVENDEDOR:=IDVENDEDOR;
      REALIZARDEVOLUCIONES.IDCLIENTE:=IDCLIENTE;
      REALIZARDEVOLUCIONES.SHOWMODAL;
     if REALIZARDEVOLUCIONES.IDMOVIMIENTONC > 0 then
     BEGIN
        IDMOVIMIENTONC:= REALIZARDEVOLUCIONES.IDMOVIMIENTONC;
     END;

END;

TD:=TDECIMALES.Create;


   SALE:=TRUE;
  FORM1.FDConnection1.StartTransaction;
 TRY

  //PIDE DATOS DE TARJETA
    { if (SELF.DBLookupComboBox2.KeyValue =2) OR (SELF.DBLookupComboBox2.KeyValue =3) then
        FRMDATOSTARJETAS.SHOWMODAL;  }
  //-------------
  //PIde usuario
  { frmpideusuario.Edit1.Clear;
    frmpideusuario.Label1.CAPTION:='';
 if form1.demo=TRUE then
 frmpideusuario.Label1.CAPTION:='CODIGO DEMO: 0810';

  frmpideusuario.SHOWMODAL;
  CODIGOUSUARIO:=STRTOINT(frmpideusuario.Edit1.Text);   }

  CODIGOUSUARIO:=FORM1.IDUSUARIOLOGEADO;

   FDQuery2.Close;
   FDQuery2.SQL.Clear;
   FDQuery2.SQL.Add('SELECT MAX(IDMOVIMIENTO) AS  MAXIMO  FROM TMOVIMIENTOS ');
   FDQuery2.Open;
   IF TRIM(FDQuery2.FieldByName('MAXIMO').ASSTRING)='' THEN
      IDMOVI:=1
      ELSE
       IDMOVI:=FDQuery2.FieldByName('MAXIMO').AsInteger + 1;

  edit3.Text:=inttostr(IDMOVI);

   posi:=pos('-',trim(ComboBox1.Text));
   TIPOMOVIMIENTO:=strtoint(trim(copy(trim(ComboBox1.TEXT),0,posi-1)));

   //0TICKET
   //1FAC A  2 FAC B  3 FACT C
   //4NC A 5NCB 6NC C 7 NC TI
   //TIPOMOVIMIENTO:=SELF.ComboBox1.ItemIndex;





   if TIPOMOVIMIENTO=0 then
   BEGIN
     SUBTOTAL:=STRTOFLOAT(LABEL4.Caption);
     IVA:= 0;
     IVA10:=0;
     TOTAL:=STRTOFLOAT(LABEL4.Caption);
     NROFACTURA:=INTTOSTR(IDMOVI);
     CAE:='-' ;
     FECHAVENCE:=DATETOSTR(DATE);
   END ELSE BEGIN
     SUBTOTAL:=STRTOFLOAT(LABEL4.Caption);
     IVA:= 0;
     IVA10:=0;
     TOTAL:=STRTOFLOAT(LABEL4.Caption);
     NROFACTURA:=INTTOSTR(IDMOVI);
     CAE:='-' ;
     FECHAVENCE:=DATETOSTR(DATE);

   END;
   cierre:=0;
   FECHAHOY:=DATETOSTR(DATE);

      IF (TIPOMOVIMIENTO = 4)  OR (TIPOMOVIMIENTO = 5)
       OR (TIPOMOVIMIENTO = 6) OR  (TIPOMOVIMIENTO = 7) THEN
       BEGIN
            TOTAL:=TOTAL*-1;
          PIDECOMENTARIOS.RichEdit1.Clear;
          PIDECOMENTARIOS.SHOWMODAL;
          COMENTARIO:=PIDECOMENTARIOS.RichEdit1.Text;

        END;

   FDQuery2.Close;
   FDQuery2.SQL.Clear;
   FDQuery2.SQL.Add('SELECT * FROM TCAJA WHERE estado=1 order by idcaja desc');
   FDQuery2.Open;
   FECHAHOY:= FDQuery2.FieldByName('fecha').AsString;
   PAGO:=0;

    self.RxMemoryData1.Open;
   if RxMemoryData1.RecordCount > 1 then
     IDFORMAPAGO:=0
     ELSE
      IDFORMAPAGO:=SELF.RxMemoryData1IDFORMA.Value;

   FDQuery2.Close;
   FDQuery2.SQL.Clear;
   FDQuery2.SQL.Add('INSERT INTO TMOVIMIENTOS (IDMOVIMIENTO,TIPOMOVIMIENTO,IDCLIENTE, IDFORMAPAGO '+
                    ',FECHA,SUBTOTAL,IVA,TOTAL,NROFACTURA,CAE,FECHAVENCE,CODIGOUSUARIO,CIERRE,IVA10,PAGO,CODNC,PC) ' +
                   ' VALUES ('+INTTOSTR(IDMOVI)+','+INTTOSTR(TIPOMOVIMIENTO)+','+INTTOSTR(IDCLIENTE)+
                   ','+INTTOSTR(IDFORMAPAGO)+','+#39+TRIM(FECHAHOY)+#39+','+FLOATTOSTR(SUBTOTAL)+
                   ','+FLOATTOSTR(IVA)+','+FLOATTOSTR(TOTAL)+','+#39+TRIM(NROFACTURA)+#39+
                   ','+#39+TRIM(CAE)+#39+','+#39+TRIM(FECHAVENCE)+#39+','+INTTOSTR(CODIGOUSUARIO)+','+inttostr(cierre)+','+FLOATTOSTR(IVA10)+','+FLOATTOSTR(PAGO)+','+inttostr(IDMOVIMIENTONC)+','+INTTOSTR(FORM1.PUESTO_PC)+')');

   FDQuery2.ExecSQL;


   self.RxMemoryData1.Open;
   self.RxMemoryData1.First;
   while not self.RxMemoryData1.Eof do
   begin
        FDQuery7.Close;
        FDQuery7.SQL.Clear;
        FDQuery7.SQL.Add('insert into TFORMAPAGOS_FACTURAS (idmovimiento,idforma,descripcion,importe) '+
        ' values ('+inttostr(IDMOVI)+','+inttostr(self.RxMemoryData1IDFORMA.Value)+
        ','+#39+trim(self.RxMemoryData1FORMA.Value)+#39+','+floattostr(self.RxMemoryData1IMPORTEF.Value)+')') ;
        FDQuery7.ExecSQL;

   self.RxMemoryData1.Next
   end;

    {   IF (TIPOMOVIMIENTO = 4)  OR (TIPOMOVIMIENTO = 5)
       OR (TIPOMOVIMIENTO = 6) OR  (TIPOMOVIMIENTO = 7) THEN
       BEGIN
         if IDMOVIMIENTONC > 0 THEN
         BEGIN
           FDQuery5.Close;
           FDQuery5.SQL.Clear;
           FDQuery5.SQL.Add('UPDATE TMOVIMIENTOS SET CODNC='+INTTOSTR(IDMOVI)+' WHERE IDMOVIMIENTO='+INTTOSTR(IDMOVIMIENTONC));
           FDQuery5.ExecSQL;
         END;

      END;     }


   TOTALVENTA:=TOTAL;

       FDQuery2.Close;
        FDQuery2.SQL.Clear;
        FDQuery2.SQL.Add('INSERT INTO TVENTAS_VENDEDOR (IDVENDEDOR,IDVENTA,IMPORTE) VALUES ('+INTTOSTR(IDVENDEDOR)+','+INTTOSTR(IDMOVI)+','+FLOATTOSTR(TOTALVENTA)+') ');
        FDQuery2.ExecSQL;

   FORM1.RxMemoryData1.Open;
   FORM1.RxMemoryData1.First;
  while NOT FORM1.RxMemoryData1.Eof do
  BEGIN
    if STRTOFLOAT(FORM1.RxMemoryData1cantidad.Value)<>0 then
    BEGIN
       IVAART:=STRTOFLOAT(FORM1.RxMemoryData1IVA.Value);
       if IVAART=21 then
         POR:='1.21';

       if IVAART=0 then
         POR:='1';
       if IVAART=10.5 then
         POR:='1.105';

       PUNI:=STRTOFLOAT(FORM1.RxMemoryData1preciototal.Value)/STRTOFLOAT(POR);

       PTOTAL:=STRTOFLOAT(FORM1.RxMemoryData1preciototal.Value);
       PRECIOIVA:=PTOTAL - PUNI;

       PUNI_s:=TD.arma_importe_para_mostrar(PUNI);
       PTOTAL_s:=TD.arma_importe_para_mostrar(PTOTAL);
       PRECIOIVA_S:=TD.arma_importe_para_mostrar(PRECIOIVA);

        FDQuery2.Close;
        FDQuery2.SQL.Clear;
        FDQuery2.SQL.Add('INSERT INTO TITEM_FACTURA (IDFACTURA, IDARTICULO,CANTIDAD,PUNI,IVA,PTOTAL,POR_IVA,PROMOCION) VALUES ('+INTTOSTR(IDMOVI)+','+INTTOSTR(FORM1.RxMemoryData1idarticulo.Value)+','+FLOATTOSTR(STRTOFLOAT(FORM1.RxMemoryData1cantidad.Value))+
                                                     ','+FLOATTOSTR(STRTOFLOAT(PUNI_s))+','+FLOATTOSTR(STRTOFLOAT(PRECIOIVA_s))+
                                                     ','+FLOATTOSTR(STRTOFLOAT(PTOTAL_s))+
                                                     ','+FLOATTOSTR(IVAART)+','+#39+TRIM(FORM1.RxMemoryData1PROMOCION.Value)+#39+') ');
        FDQuery2.ExecSQL;






        CANT:=STRTOFLOAT(FORM1.RxMemoryData1cantidad.Value);

       IF (TIPOMOVIMIENTO = 0)  OR (TIPOMOVIMIENTO = 1)
       OR (TIPOMOVIMIENTO = 2) OR  (TIPOMOVIMIENTO = 3) THEN
       BEGIN

         if FORM1.RxMemoryData1PROMOCION.Value='N' then
          BEGIN
           FDQuery5.Close;
           FDQuery5.SQL.Clear;
           FDQuery5.SQL.Add('SELECT DESCUENTAPOR  FROM tarticulos where idarticulo='+inttostr(FORM1.RxMemoryData1idarticulo.Value));
           FDQuery5.Open;
           if FDQUERY5.FieldByName('DESCUENTAPOR').AsFloat=1 then
           BEGIN
              FDQuery4.Close;
              FDQuery4.SQL.Clear;
              FDQuery4.SQL.Add('UPDATE TARTICULOS SET STOCKVENTA = STOCKVENTA + '+FLOATTOSTR(CANT)+
                      ',  STOCK=STOCK - '+FLOATTOSTR(CANT)+'  WHERE IDARTICULO='+INTTOSTR(FORM1.RxMemoryData1idarticulo.Value));
              FDQuery4.ExecSQL;

           END;
            if FDQUERY5.FieldByName('DESCUENTAPOR').AsFloat > 1 then
           BEGIN
             CANT:=FDQUERY5.FieldByName('DESCUENTAPOR').AsFloat;
              FDQuery4.Close;
              FDQuery4.SQL.Clear;
              FDQuery4.SQL.Add('UPDATE TARTICULOS SET STOCKVENTA = STOCKVENTA + '+FLOATTOSTR(CANT)+
                      ',  STOCK=STOCK - '+FLOATTOSTR(CANT)+'  WHERE IDARTICULO='+INTTOSTR(FORM1.RxMemoryData1idarticulo.Value));
              FDQuery4.ExecSQL;
           END;
          END
           ELSE BEGIN
                 FDQuery4.Close;
                 FDQuery4.SQL.Clear;
                 FDQuery4.SQL.Add('UPDATE TPROMOCIONES SET STOCK = STOCK - '+FLOATTOSTR(CANT)+
                      '  WHERE IDPROMOCION='+INTTOSTR(FORM1.RxMemoryData1idarticulo.Value));
                FDQuery4.ExecSQL;

                FDQuery8.Close;
                 FDQuery8.SQL.Clear;
                 FDQuery8.SQL.Add('SELECT IDARTICULO, CANTIDAD FROM TDETALLES_PROMOCIONES   WHERE IDPROMOCION='+INTTOSTR(FORM1.RxMemoryData1idarticulo.Value));
                FDQuery8.Open;
                while NOT FDQuery8.Eof do
                BEGIN
                     FDQuery9.Close;
                     FDQuery9.SQL.Clear;
                     FDQuery9.SQL.Add('UPDATE TARTICULOS SET STOCKVENTA = STOCKVENTA + '+FLOATTOSTR(FDQuery8.FieldByName('CANTIDAD').ASFLOAT)+
                      ',  STOCK=STOCK - '+FLOATTOSTR(FDQuery8.FieldByName('CANTIDAD').ASFLOAT)+'  WHERE IDARTICULO='+INTTOSTR(FDQuery8.FieldByName('IDARTICULO').AsInteger));
                     FDQuery9.ExecSQL;

                   FDQuery8.Next;
                END;




           END;
      END;


       IF (TIPOMOVIMIENTO = 4)  OR (TIPOMOVIMIENTO = 5)
       OR (TIPOMOVIMIENTO = 6) OR  (TIPOMOVIMIENTO = 7) THEN
       BEGIN
               FDQuery6.Close;
           FDQuery6.SQL.Clear;
           FDQuery6.SQL.Add('INSERT INTO TDEVOLCIONES (IDMOVIMIENTO, ARTICULO, CANTIDAD,COMENTARIO,IDMOVIORIGINAL)  '+
           ' VALUES ('+INTTOSTR(IDMOVI)+','+#39+TRIM(FORM1.RxMemoryData1descripcion.Value)+#39+
           ','+FLOATTOSTR(STRTOFLOAT(FORM1.RxMemoryData1cantidad.Value))+','+#39+TRIM(COMENTARIO)+#39+','+INTTOSTR(IDMOVIMIENTONC)+')');
           FDQuery6.ExecSQL;

           FDQuery5.Close;
           FDQuery5.SQL.Clear;
           FDQuery5.SQL.Add('SELECT DESCUENTAPOR  FROM tarticulos where idarticulo='+inttostr(FORM1.RxMemoryData1idarticulo.Value));
           FDQuery5.Open;
           if FDQUERY5.FieldByName('DESCUENTAPOR').AsFloat=1 then
           BEGIN
            if CANT < 0 then
            CANT:=CANT * -1;

              FDQuery4.Close;
              FDQuery4.SQL.Clear;
              FDQuery4.SQL.Add('UPDATE TARTICULOS SET STOCKVENTA = STOCKVENTA - '+FLOATTOSTR(CANT)+
                      ',  STOCK=STOCK + '+FLOATTOSTR(CANT)+'  WHERE IDARTICULO='+INTTOSTR(FORM1.RxMemoryData1idarticulo.Value));
              FDQuery4.ExecSQL;

           END;
            if FDQUERY5.FieldByName('DESCUENTAPOR').AsFloat > 1 then
           BEGIN
             CANT:=FDQUERY5.FieldByName('DESCUENTAPOR').AsFloat;
              FDQuery4.Close;
              FDQuery4.SQL.Clear;
              FDQuery4.SQL.Add('UPDATE TARTICULOS SET STOCKVENTA = STOCKVENTA - '+FLOATTOSTR(CANT)+
                      ',  STOCK=STOCK + '+FLOATTOSTR(CANT)+'  WHERE IDARTICULO='+INTTOSTR(FORM1.RxMemoryData1idarticulo.Value));
              FDQuery4.ExecSQL;
           END;
      END;

   END;
   FORM1.RxMemoryData1.Next;
  END;

   FORM1.FDConnection1.Commit;


EXCEPT
   ON E: Exception do
   BEGIN
    SHOWMESSAGE('ATENCION. ERROR: '+E.Message);
    SALE:=FALSE;
    FORM1.FDConnection1.Rollback;
   END;
 END;

 TD.Free;

  RESULT:=SALE;
 if SALE=TRUE then
    CLOSE;



END;

 procedure Tfrmterminar.BitBtn1Click(Sender: TObject);
begin
SpeedButton1Click(Sender);
end;

procedure Tfrmterminar.BitBtn2Click(Sender: TObject);
VAR T:TDECIMALES;     S,TT:REAL;
begin
if TRIM(SELF.DBLookupComboBox2.Text)='' then
BEGIN
   SHOWMESSAGE('DEBE SELECCIONAR LA FORMA DE PAGO');
  EXIT;
END;

if TRIM(EDIT4.Text)='' then
BEGIN
   SHOWMESSAGE('DEBE INGRESAR EL IMPORTE');
  EXIT;
END;

if TRIM(EDIT4.Text)='0' then
BEGIN
   SHOWMESSAGE('DEBE INGRESAR EL IMPORTE');
  EXIT;
END;

if STRTOFLOAT(LABEL4.Caption)<STRTOFLOAT(EDIT1.Text) then
   BEGIN
       SHOWMESSAGE('EL IMPORTE TOTAL PAGADO NO PUEDE SER MAYOR AL TOTAL DE LA VENTA');
           EXIT;

   END;

    if STRTOFLOAT(EDIT4.Text) > STRTOFLOAT(EDIT5.Text) then
   BEGIN
       SHOWMESSAGE('EL IMPORTE INGRESADO NO PUEDE SER MAYOR AL SALDO');
           EXIT;

   END;


T:=TDECIMALES.Create;
SELF.RxMemoryData1.Append;
SELF.RxMemoryData1IDFORMA.Value:=SELF.DBLookupComboBox2.KeyValue;
SELF.RxMemoryData1FORMA.Value:=TRIM(SELF.DBLookupComboBox2.Text);
SELF.RxMemoryData1IMPORTES.Value:=T.arma_importe_para_mostrar(STRTOFLOAT(EDIT4.Text));
SELF.RxMemoryData1IMPORTEF.Value:=STRTOFLOAT(EDIT4.Text);
SELF.RxMemoryData1.Post;

SELF.RxMemoryData1.First;
TT:=0;
S:=STRTOFLOAT(EDIT5.Text);
while NOT SELF.RxMemoryData1.Eof do
BEGIN
    TT:=TT + SELF.RxMemoryData1IMPORTEF.Value;
  SELF.RxMemoryData1.Next;
END;
EDIT1.Text:=T.arma_importe_para_mostrar(TT);

EDIT5.Text:=T.arma_importe_para_mostrar(STRTOFLOAT(LABEL4.Caption) - TT);
EDIT4.Text:=TRIM(EDIT5.Text);

T.Free;


end;

procedure Tfrmterminar.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
if KEY=#13 THEN
SELF.DBLookupComboBox2.SetFocus;

end;

procedure Tfrmterminar.DBGrid1DblClick(Sender: TObject);
VAR T:TDECIMALES;
TT,S:REAL;
begin
if SELF.RxMemoryData1.RecordCount=0 then
  EXIT;

SELF.RxMemoryData1.Delete;

T:=TDECIMALES.Create;


SELF.RxMemoryData1.First;
TT:=0;
S:=STRTOFLOAT(EDIT5.Text);
while NOT SELF.RxMemoryData1.Eof do
BEGIN
    TT:=TT + SELF.RxMemoryData1IMPORTEF.Value;
  SELF.RxMemoryData1.Next;
END;
EDIT1.Text:=T.arma_importe_para_mostrar(TT);

EDIT5.Text:=T.arma_importe_para_mostrar(STRTOFLOAT(LABEL4.Caption) - TT);
EDIT4.Text:=TRIM(EDIT5.Text);

T.Free;

end;

procedure Tfrmterminar.DBLookupComboBox2KeyPress(Sender: TObject;
  var Key: Char);
begin
if KEY=#13 THEN
SELF.EDIT1.SetFocus;
end;

procedure Tfrmterminar.Edit1KeyPress(Sender: TObject; var Key: Char);
var vuelto:real;
td:tdecimales;
begin
 if key in ['0','1','2','3','4','5','6','7','8','9',#13,#8,'.']  then
 begin
if KEY=#13 THEN
begin
     td:=tdecimales.Create;
      vuelto:=strtofloat(edit1.Text) - strtofloat(label4.Caption);
      edit2.Text:=td.arma_importe_para_mostrar(vuelto);
    SELF.EDIT2.SetFocus;
end;
 end;
end;

procedure Tfrmterminar.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if KEY=#13 THEN
SELF.BitBtn1Click(Sender);
end;

procedure Tfrmterminar.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
  if KEY IN ['1','2','3','4','5','6','7','8','9','0','.',#8,#13,#27] then
  EDIT4.ReadOnly:=FALSE
  ELSE
  EDIT4.ReadOnly:=TRUE;

end;

procedure Tfrmterminar.FormShow(Sender: TObject);
begin
FDQuery1.Connection:=FORM1.FDConnection1;
SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('SELECT  * FROM TFORMAPAGO ');
SELF.FDQuery1.Open;
SELF.DBLookupComboBox2.KeyValue:=1;
if TRIM(FORM1.SOLOTICKET)='N' then
SELF.ComboBox1.SetFocus;
end;




procedure Tfrmterminar.SpeedButton1Click(Sender: TObject);
VAR IDCLIENTE:LONGINT;     TIPOMOVIMIENTO:LONGINT;
POSI:LONGINT;    ARCHVOENVIA:sTRING;
begin
   if (SELF.RxMemoryData1.RecordCount=0)  then
       BEGIN
            Application.MessageBox( 'NO HAY FORMA DE PAGOS INGRESADAS.',
  'Acceso denegado', MB_ICONSTOP );
       EXIT;
       END;

    if STRTOFLOAT(EDIT5.Text) > 0 then
   BEGIN
       SHOWMESSAGE('NO SE HA PAGADO LA TOTALIDAD DE LA VENTA.');
           EXIT;

   END;

   posi:=pos('-',trim(ComboBox1.Text));
   TIPOMOVIMIENTO:=strtoint(trim(copy(trim(ComboBox1.TEXT),0,posi-1)));

 posi:=pos('-',trim(label7.Caption));
       IDCLIENTE:=strtoint(trim(copy(trim(label7.Caption),0,posi-1)));

if TIPOMOVIMIENTO=1 THEN
 BEGIN
       posi:=pos('-',trim(label7.Caption));
       IDCLIENTE:=strtoint(trim(copy(trim(label7.Caption),0,posi-1)));
       if (IDCLIENTE=0)  then
       BEGIN
            Application.MessageBox( 'PARA FACTURAS A EL CLIENTE NO PUEDE SER CONSUMIDOR FINAL.',
  'Acceso denegado', MB_ICONSTOP );
       EXIT;
       END;
 END;

    if (SELF.DBLookupComboBox2.KeyValue=5)  THEN
     BEGIN
           if (IDCLIENTE=0)  then
       BEGIN
            Application.MessageBox( 'PARA CUENTA CORRIENTE DEBE SELECCIONAR UN CLIENTE',
  'Acceso denegado', MB_ICONSTOP );
       EXIT;
       END;
     END;




SPEEDBUTTON1.Enabled:=FALSE;
 IF GUARDAR=TRUE THEN
BEGIN

  if  (TIPOMOVIMIENTO<>0) AND (TIPOMOVIMIENTO<>7) then //si es <> a tiket
  BEGIN
      FRMMENSAJE.Label1.Caption:='VALIDANDO FACTURA CON AFIP....';
      FRMMENSAJE.SHOW;
      APPLICATION.ProcessMessages;
      IF FORM1.FACTURAELECTRONICA(strtoint(edit3.Text))=TRUE THEN
       BEGIN


          if trim(form1.tconfi.GET_FIMPRIME)='S' then
          begin
             if Application.MessageBox( '¿Desea imprimir el Comprobante Electrónico ?', 'Impresión',
               MB_ICONQUESTION OR MB_YESNO ) = ID_YES then
              begin
                 FRMMENSAJE.Label1.Caption:='IMPRIMIENDO...';
                 FRMMENSAJE.SHOW;
                 APPLICATION.ProcessMessages;
                 if Trim(form1.TIPOPAPEL)='80' then
                    imprimir(strtoint(edit3.Text),'N');
                  if Trim(form1.TIPOPAPEL)='58' then
                     imprimirFacturaFormato58(strtoint(edit3.Text),'N');
                   if Trim(form1.TIPOPAPEL)='A4' then
                      SHOWMESSAGE('SIN FORMATO A4');
              end;
          end;


      END;
  END ELSE
          BEGIN
          //IMPRIME TICKET
            if trim(form1.tconfi.GET_FIMPRIME)='S' then
               begin
                 if Application.MessageBox( '¿Desea imprimir el Ticket ?', 'Impresión',
                   MB_ICONQUESTION OR MB_YESNO ) = ID_YES then
                  begin
                     FRMMENSAJE.Label1.Caption:='IMPRIMIENDO...';
                      FRMMENSAJE.SHOW;
                      APPLICATION.ProcessMessages;
                      if Trim(form1.TIPOPAPEL)='80' then
                      imprimirTICKET(strtoint(edit3.Text),'N');

                      if Trim(form1.TIPOPAPEL)='A4' then
                      imprimirTICKETA4(strtoint(edit3.Text),'R');

                       if Trim(form1.TIPOPAPEL)='58' then
                          imprimirTICKET_58(strtoint(edit3.Text),'N');
                  END;
               end;
          END;

    if trim(form1.tconfi.GET_FENVIAMAIL)='S' then
    begin
     if Application.MessageBox( '¿Desea mandar por Mail  ?', 'Correo Electrónico',
                   MB_ICONQUESTION OR MB_YESNO ) = ID_YES then
                  begin
                     frmenviarmail.Edit1.Clear;
                     frmenviarmail.showmodal;
                     if frmenviarmail.ModalResult=MROK then
                     BEGIN
                        FRMMENSAJE.Label1.Caption:='ENVIANDO MAIL...';
                        FRMMENSAJE.SHOW;
                        APPLICATION.ProcessMessages;
                          if  (TIPOMOVIMIENTO<>0)  AND (TIPOMOVIMIENTO<>7) then  //NO ES TICTKET
                               ARCHVOENVIA:=imprimir(strtoint(edit3.Text),'S')
                               ELSE
                               begin
                                    if Trim(form1.TIPOPAPEL)='80' then
                                      ARCHVOENVIA:=imprimirTICKET(strtoint(edit3.Text),'S');

                                  { if Trim(form1.TIPOPAPEL)='A4' then
                                      imprimirTICKETA4(strtoint(edit3.Text),'R');

                                   if Trim(form1.TIPOPAPEL)='58' then
                                     SHOWMESSAGE('SIN FORMATO 558');   }


                              end;
                        EnviarMail(ARCHVOENVIA,frmenviarmail.Edit1.Text);
                     END;
                  end;
    end;


  FRMMENSAJE.Close;
  FORM1.RxMemoryData1.Close;
  FORM1.RxMemoryData1.Open;
  FORM1.Label2.Caption:='00.00';
   FORM1.PANEL11.Visible:=FALSE;
  FORM1.esDevolucion:=falsE;
END;
SPEEDBUTTON1.Enabled:=TRUE;
end;
function Tfrmterminar.EnviarMail(ARCHVOENVIA,correo:String):boolean;
begin
   EnviarMensaje(ARCHVOENVIA,correo);
end;


procedure Tfrmterminar.EnviarMensaje( sAdjunto,
   sDestino: string);

var
   mail : TIdMessage;
   adjuntos : TStrings;
   i ,li: integer;       puerto: longint;
    conectado:boolean;
    largo:longint; archivomail:string;
    emailcuenta,NOMBRECuenta:string;
    sUsuario, sClave, sHost,smensaje:string;
{var
  SMTP: TIdSMTP;
  Mensaje: TIdMessage;
 Adjunto: TIdAttachment;
  continua:boolean; }

begin
//  sDestino:='martinbien77@gmail.com';

  IdSSLOpenSSLHeaders.Load;
 //***version nueva
    conectado:=false;
    emailcuenta:=FORM1.tconfi.GET_FCUENTAMAIL;// 'sistemas_arg@applus.com';
    NOMBRECuenta:=FORM1.tconfi.GET_FCUENTAMAIL;
    sUsuario:=form1.tconfi.GET_FUSUARIOMAIL;//'sistemas_arg@applusglobal.com';
    sClave:=form1.tconfi.GET_FPASSWORDMAIL;//'Applus0001$';
    puerto:=587;
    sHost:=form1.tconfi.GET_FSMTP;//'smtp.office365.com';




with idSMTP do
begin
        IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method :=sslvTLSv1_2;// sslvTLSv1;
        IoHandler := IdSSLIOHandlerSocketOpenSSL1;
        AuthType :=satDefault;
        Username := sUsuario;
        Password := sClave;
        Host := sHost;
        useTLS := utUseExplicitTLS;
        port :=puerto;

end;

    try
      idSMTP.Connect;
      conectado:=true;

    except
      on e : exception do
      begin
       conectado:=false;

         // memo1.Lines.Add('Error al conectar con servidor SMTP: ' + e.Message);

      end;
    end;

   smensaje := 'Se adjuntan Comprobante.';



if  conectado=true then
begin
mail := TIdMessage.Create(Self);
  with mail do
  begin
 // sDestino:='martin.bien@applus.com';

  //sDestino:='';


      From.Name := NOMBRECuenta;
    From.Address := emailcuenta;
    Recipients.EMailAddresses := sDestino;
   // ReplyTo.EMailAddresses:='valeria.zamorano@applus.com;alejandro.bunes@applus.com';

    Subject :='Comprobante de Compra';
    body.Text := smensaje;




     if FileExists(sAdjunto) then
        TIdAttachmentFile.Create(MessageParts, sAdjunto);


  end;
  try

   idSMTP.Send(mail);



    if idSMTP.Connected then
      idSMTP.Disconnect;
  except
    on e : exception do
    begin
          showmessage(' Error: '+e.Message);
         if idSMTP.Connected then
        idSMTP.Disconnect;
    end;

 end;
  end;

  end;


procedure Tfrmterminar.aceptar1Click(Sender: TObject);
begin
SpeedButton1Click(Sender);
end;

function Tfrmterminar.armanumeroFactura(nro:string):string;
var largo,i,hasta:longint; cero,n,PV:string;
begin
cero:='';
largo:=length(nro);
hasta:=8 - largo;
for i := 1 to hasta do
cero:=cero + '0';

n:=cero+nro;

 PV:=FORM1.tconfi.GET_FPUNTOVENTA;
 if LENGTH(PV)=1 then
   PV:='000'+PV;

  if LENGTH(PV)=2 then
     PV:='00'+PV;
   if LENGTH(PV)=3 then
     PV:='0'+PV
    ELSE
     PV:=PV;

 armanumeroFactura:=PV+'-'+n;
end;

function Tfrmterminar.imprimir(idmovi:longint;ESPARAENAMIL:STRING):STRING;
var posi,codigocliente:longint; COMPROBANTE,LETRA,COD,DNICUIT,TIPODOC,RAZONSOCIAL,IVACLIENTE:sTRING;
    fechaqr,tipocbte,CODIGO_QR:String;
                    fechadir:sTRING;
    NROFAC,  ARCHIVO,DIRFAE:STRING;   Gpdf :TExportar2PDFSyn ;
    IDFOMAPAO:LONGINT;TIPOMOVIMIENTO,I:LONGINT;
begin

   posi:=pos('-',trim(label7.Caption));
   codigocliente:=strtoint(trim(copy(trim(label7.Caption),0,posi-1)));

   Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT  TIPOMOVIMIENTO FROM TMOVIMIENTOS WHERE IDMOVIMIENTO='+INTTOSTR(idmovi));
  Form1.FDQuery3.Open;
  TIPOMOVIMIENTO:=Form1.FDQuery3.FieldByName('TIPOMOVIMIENTO').AsInteger;
   if TIPOMOVIMIENTO=1 then  //FACTURA A
   BEGIN
     letra:='A';
     cod:='COD 01';
     COMPROBANTE:='FACTURA';
     tipocbte:='1';
   END;

   if TIPOMOVIMIENTO=2 then  //FACTURA B
   BEGIN
     letra:='B';
     cod:='COD 06';
     COMPROBANTE:='FACTURA';
     tipocbte:='6';
   END;

   if TIPOMOVIMIENTO=3 then  //FACTURA C
   BEGIN
    { letra:='B';
     cod:='COD 06';
     COMPROBANTE:='FACTURA';  }
   END ;

   if TIPOMOVIMIENTO=4 then  //NOTA CREDITO A
   BEGIN
     letra:='A';
     cod:='COD 03';
     COMPROBANTE:='NOTA DE CREDITO';
     tipocbte:='3';
   END;

   if TIPOMOVIMIENTO=5 then  //NOTA CREDITO B
   BEGIN
     letra:='B';
     cod:='COD 08';
     COMPROBANTE:='NOTA DE CREDITO';
     tipocbte:='8';
   END ;

   if codigocliente=0 then
   begin
    RAZONSOCIAL:='CONSUMIDOR FINAL';
    DNICUIT:='DOC (OTRO) 0';
    IVACLIENTE:='CONSUMIDOR FINAL';
   end ELSE
       BEGIN
          Form1.FDQuery3.Close;
          Form1.FDQuery3.SQL.Clear;
          Form1.FDQuery3.SQL.Add('SELECT  * FROM TCLIENTES WHERE IDCLIENTE='+INTTOSTR(codigocliente));
          Form1.FDQuery3.Open;

          RAZONSOCIAL:=TRIM(Form1.FDQuery3.FieldByName('APENOM').ASSTRING);
          DNICUIT:=TRIM(Form1.FDQuery3.FieldByName('NRODOC').ASSTRING);
          IVACLIENTE:=TRIM(Form1.FDQuery3.FieldByName('IVA').ASSTRING);
          TIPODOC:=TRIM(Form1.FDQuery3.FieldByName('TIPODOC').ASSTRING);
          if TIPODOC='96' then
          DNICUIT:='DNI '+DNICUIT;
          if TIPODOC='80' then
          DNICUIT:='CUIT '+DNICUIT;
          if TIPODOC='86' then
          DNICUIT:='CUIL '+DNICUIT;
          if TIPODOC='87' then
          DNICUIT:='CDI '+DNICUIT;
          if TIPODOC='89' then
          DNICUIT:='LE '+DNICUIT;
          if TIPODOC='90' then
          DNICUIT:='LC '+DNICUIT;
          if TIPODOC='91' then
          DNICUIT:='CI '+DNICUIT;
          if TIPODOC='92' then
          DNICUIT:='EN TRAMITE '+DNICUIT;
          if TIPODOC='93' then
          DNICUIT:='AC. NAC. '+DNICUIT;
          if TIPODOC='95' then
          DNICUIT:='CI Bs. As. RN '+DNICUIT;
          if TIPODOC='99' then
          DNICUIT:='OTRO DOC '+DNICUIT;




    END;

  frmpdf.QRLabel24.Caption:=letra;
  frmpdf.QRLabel25.Caption:=cod;
  frmpdf.QRLabel26.Caption:=COMPROBANTE;

  Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT  * FROM TMOVIMIENTOS WHERE IDMOVIMIENTO='+INTTOSTR(idmovi));
  Form1.FDQuery3.Open;
  IDFOMAPAO:=Form1.FDQuery3.FieldByName('IDFORMAPAGO').ASINTEGER;
  NROFAC:=armanumeroFactura(TRIM(Form1.FDQuery3.FieldByName('NROFACTURA').ASSTRING));
  frmpdf.QRLabel27.Caption:=TRIM(Form1.FDQuery3.FieldByName('FECHA').ASSTRING);
  frmpdf.QRLabel28.Caption:=armanumeroFactura(TRIM(Form1.FDQuery3.FieldByName('NROFACTURA').ASSTRING));
  frmpdf.QRLabel22.Caption:='CAE:'+TRIM(Form1.FDQuery3.FieldByName('CAE').ASSTRING);
  frmpdf.QRLabel23.Caption:='FECHA VENC:'+TRIM(Form1.FDQuery3.FieldByName('FECHAVENCE').ASSTRING);

  frmpdf.QRLabel18.Caption:=FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.FieldByName('SUBTOTAL').ASSTRING)),FFFIXED,8,2);
  frmpdf.QRLabel21.Caption:=FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.FieldByName('TOTAL').ASSTRING)),FFFIXED,8,2);

   fechaqr:=copy(TRIM(Form1.FDQuery3.FieldByName('FECHA').ASSTRING),7,4)+'-'+copy(TRIM(Form1.FDQuery3.FieldByName('FECHA').ASSTRING),4,2)+'-'+copy(TRIM(Form1.FDQuery3.FieldByName('FECHA').ASSTRING),1,2);

{qr}
    CODIGO_QR:='{"ver":1,'+
             '"fecha":"'+fechaqr+'",'+
             '"cuit": "'+form1.tconfi.GET_FCUITFACTURA+'",'+
             '"ptoVta":"'+form1.tconfi.GET_FPUNTOVENTA+'",'+
             '"tipoCmp":'+tipocbte+','+
             '"nroCmp":'+TRIM(Form1.FDQuery3.FieldByName('NROFACTURA').ASSTRING)+','+
             '"importe":'+FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.FieldByName('TOTAL').ASSTRING)),FFFIXED,8,2)+','+
             '"moneda":"PES",'+
             '"ctz":1,'+
             '"tipoDocRec":'+TIPODOC+','+
             '"nroDocRec":'+stringreplace(DNICUIT, '-', '',[rfReplaceAll, rfIgnoreCase])+','+
             '"tipoCodAut":"E",'+
             '"codAut":'+TRIM(Form1.FDQuery3.FieldByName('CAE').ASSTRING)+'}';

 CODIGO_QR:='https://www.afip.gob.ar/fe/qr/?p='+CODIGO_QR;
   frmpdf.QRQRBarcode1.BarcodeText:=CODIGO_QR;

  Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT  DESCRIPCION FROM TFORMAPAGO WHERE IDFORMAPAGO='+INTTOSTR(IDFOMAPAO));
  Form1.FDQuery3.Open;
  frmpdf.QRLabel31.CAPTION:='FORMA DE PAGO:'+TRIM(Form1.FDQuery3.FieldByName('DESCRIPCION').ASSTRING);

  if trim(letra)='B' then
  begin
      frmpdf.QRLabel19.Caption:='0.00';
      frmpdf.QRLabel20.Caption:='0.00';
  end else begin
        Form1.FDQuery3.Close;
        Form1.FDQuery3.SQL.Clear;
        Form1.FDQuery3.SQL.Add('SELECT  sum(iva) as iv FROM TITEM_FACTURA WHERE IDFACTURA='+INTTOSTR(idmovi)+' and POR_IVA=''10.5'' ');
        Form1.FDQuery3.Open;
         if trim(Form1.FDQuery3.FieldByName('iv').ASSTRING)='' then
          frmpdf.QRLabel20.Caption:='0.00'
          else
        frmpdf.QRLabel20.Caption:=FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.FieldByName('iv').ASSTRING)),FFFIXED,8,2);

        Form1.FDQuery3.Close;
        Form1.FDQuery3.SQL.Clear;
        Form1.FDQuery3.SQL.Add('SELECT  sum(iva) as iv FROM TITEM_FACTURA WHERE IDFACTURA='+INTTOSTR(idmovi)+' and POR_IVA=''21'' ');
        Form1.FDQuery3.Open;
        if trim(Form1.FDQuery3.FieldByName('iv').ASSTRING)='' then
          frmpdf.QRLabel19.Caption:='0.00'
          else
         frmpdf.QRLabel19.Caption:=FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.FieldByName('iv').ASSTRING)),FFFIXED,8,2);

  end;


  frmpdf.qrrazonsocial.Caption:=TRIM(RAZONSOCIAL);
  frmpdf.qrcuitdni.Caption:=TRIM(DNICUIT);
  frmpdf.qrivacliente.Caption:=TRIM(IVACLIENTE);

    frmpdf.QRLabel29.Caption:='';
    frmpdf.QRLabel30.Caption:='';

  frmpdf.QRLabel1.Caption:='RAZON SOCIAL:'+TRIM(form1.tconfi.GET_FNOMBRE);
  frmpdf.QRLabel2.Caption:='CUIT:'+TRIM(form1.tconfi.GET_FCUITFACTURA);
  frmpdf.QRLabel3.Caption:='IVA:'+TRIM(form1.tconfi.GET_FIVA);
  frmpdf.QRLabel4.Caption:='IIBB:'+TRIM(form1.tconfi.GET_FIIBB);
  frmpdf.QRLabel5.Caption:='INIC. ACTV.:'+TRIM(form1.tconfi.GET_FECHAINICIO);
  frmpdf.QRLabel7.Caption:='DOMICILIO:'+TRIM(form1.tconfi.GET_FDOMICILIO);

  frmpdf.RxMemoryData1.Close;
  frmpdf.RxMemoryData1.Open;
  Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT TA.DESCRIPCION, TI.CANTIDAD,TI.PUNI,TI.PTOTAL,'+
  ' TA.PRECIOVENTA,TI.IVA,TI.POR_IVA FROM TITEM_FACTURA TI,TARTICULOS TA '+
                         ' WHERE TI.IDARTICULO=TA.IDARTICULO '+
                         ' AND TI.IDFACTURA='+INTTOSTR(idmovi));
  Form1.FDQuery3.Open;
  while NOT FORM1.FDQuery3.EOF do
  BEGIN
      frmpdf.RxMemoryData1.Append;


      if trim(letra)='A' then
      BEGIN
      frmpdf.RxMemoryData1DESCRIPCION.Value:=TRIM(Form1.FDQuery3.Fields[0].AsString);
      frmpdf.RxMemoryData1PUNITARIO.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[2].AsString)),FFFIXED,8,2);
      frmpdf.RxMemoryData1IVA.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString))-STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[2].AsString)),FFFIXED,8,2);
      frmpdf.RxMemoryData1TOTAL.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString)),FFFIXED,8,2);
      frmpdf.RxMemoryData1CANTIDAD.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString)),FFFIXED,8,2);
      END ELSE BEGIN
            frmpdf.RxMemoryData1DESCRIPCION.Value:=TRIM(Form1.FDQuery3.Fields[0].AsString);
            frmpdf.RxMemoryData1PUNITARIO.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString)),FFFIXED,8,2);
            frmpdf.RxMemoryData1IVA.Value:='';
            frmpdf.RxMemoryData1TOTAL.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString)),FFFIXED,8,2);
            frmpdf.RxMemoryData1CANTIDAD.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString)),FFFIXED,8,2);

      END;
      frmpdf.RxMemoryData1.Post;

       frmpdf.QRPQuickrep1.Page.Length:= frmpdf.QRPQuickrep1.Page.Length + 20;


  Form1.FDQuery3.NEXT;
  END;


          ///PROMOCIONES
  Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT TA.NOMBRE, TI.CANTIDAD,TI.PUNI,TI.PTOTAL,  '+
 '  TA.PRECIO,TI.IVA,TI.POR_IVA FROM TITEM_FACTURA TI,TPROMOCIONES TA   '+
                      '    WHERE TI.IDARTICULO=TA.IDPROMOCION AND TI.PROMOCION=''S'' '+
                         ' AND TI.IDFACTURA='+INTTOSTR(idmovi));
    Form1.FDQuery3.Open;
     while NOT FORM1.FDQuery3.EOF do
  BEGIN
      frmpdf.RxMemoryData1.Append;


      if trim(letra)='A' then
      BEGIN
      frmpdf.RxMemoryData1DESCRIPCION.Value:=TRIM(Form1.FDQuery3.Fields[0].AsString);
      frmpdf.RxMemoryData1PUNITARIO.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[2].AsString)),FFFIXED,8,2);
      frmpdf.RxMemoryData1IVA.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString))-STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[2].AsString)),FFFIXED,8,2);
      frmpdf.RxMemoryData1TOTAL.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString)),FFFIXED,8,2);
      frmpdf.RxMemoryData1CANTIDAD.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString)),FFFIXED,8,2);
      END ELSE BEGIN
            frmpdf.RxMemoryData1DESCRIPCION.Value:=TRIM(Form1.FDQuery3.Fields[0].AsString);
            frmpdf.RxMemoryData1PUNITARIO.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString)),FFFIXED,8,2);
            frmpdf.RxMemoryData1IVA.Value:='';
            frmpdf.RxMemoryData1TOTAL.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString)),FFFIXED,8,2);
            frmpdf.RxMemoryData1CANTIDAD.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString)),FFFIXED,8,2);

      END;
      frmpdf.RxMemoryData1.Post;

       frmpdf.QRPQuickrep1.Page.Length:= frmpdf.QRPQuickrep1.Page.Length + 20;


  Form1.FDQuery3.NEXT;
  END;


  //fomra de pago
  for i:=1 to 5 do
   begin
       frmpdf.RxMemoryData1.Append;
       frmpdf.RxMemoryData1DESCRIPCION.Value:='';
       frmpdf.RxMemoryData1PUNITARIO.Value:='';
       frmpdf.RxMemoryData1IVA.Value:='';
       frmpdf.RxMemoryData1TOTAL.Value:= '';
       frmpdf.RxMemoryData1.Post;
       frmpdf.QRPQuickrep1.Page.Length:= frmpdf.QRPQuickrep1.Page.Length + 20;
   end;
      frmpdf.RxMemoryData1.Append;
       frmpdf.RxMemoryData1DESCRIPCION.Value:='FORMAS DE PAGOS';
       frmpdf.RxMemoryData1PUNITARIO.Value:='';
       frmpdf.RxMemoryData1IVA.Value:='';
       frmpdf.RxMemoryData1TOTAL.Value:= '';
       frmpdf.RxMemoryData1.Post;
       frmpdf.QRPQuickrep1.Page.Length:= frmpdf.QRPQuickrep1.Page.Length + 20;

     Form1.FDQuery3.Close;
     Form1.FDQuery3.SQL.Clear;
     Form1.FDQuery3.SQL.Add('SELECT  * FROM TFORMAPAGOS_FACTURAS WHERE IDMOVIMIENTO='+INTTOSTR(idmovi));
     Form1.FDQuery3.Open;
     while NOT Form1.FDQuery3.Eof do
     BEGIN
         frmpdf.RxMemoryData1.Append;
         frmpdf.RxMemoryData1DESCRIPCION.Value:=TRIM(Form1.FDQuery3.FieldByName('DESCRIPCION').AsString);
         frmpdf.RxMemoryData1PUNITARIO.Value:='';
         frmpdf.RxMemoryData1IVA.Value:='';
         frmpdf.RxMemoryData1TOTAL.Value:=FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.FieldByName('IMPORTE').AsString)),FFFIXED,8,2);
         frmpdf.RxMemoryData1.Post;
         frmpdf.QRPQuickrep1.Page.Length:= frmpdf.QRPQuickrep1.Page.Length + 20;


     Form1.FDQuery3.Next;
     END;




   {forma directorios}
     DIRFAE:=ExtractFilePath(ParamStr(0))+'COMPROBANTES';
     if not DirectoryExists(DIRFAE+'\')=true then
     begin
       CreateDir(DIRFAE);
     end;
     DIRFAE:=DIRFAE+'\';
     fechadir:=fechaqr ;
     fechadir:=stringreplace(fechadir, '-', '',[rfReplaceAll, rfIgnoreCase]);
     DIRFAE:=DIRFAE+fechadir;
     if not DirectoryExists(DIRFAE+'\')=true then
     begin
       CreateDir(DIRFAE);
     end;


   frmpdf.QRORIGINAL.Caption:='ORIGINAL';
  frmpdf.QRPQuickrep1.Prepare;

  if ESPARAENAMIL='N' then
     frmpdf.QRPQuickrep1.Print;

  ARCHIVO:=NROFAC+'.pdf';
  imprimir:=DIRFAE+'\'+trim(ARCHIVO);
  frmpdf.QRORIGINAL.Caption:='ORIGINAL';
  frmpdf.QRPQuickrep1.Prepare;
  Gpdf := TExportar2PDFSyn.create;
  Gpdf.rutaPDF := DIRFAE+'\'+trim(ARCHIVO);
  Gpdf.exportar2PDF(frmpdf.QRPQuickrep1);
  Gpdf.Free;

  frmpdf.QRORIGINAL.Caption:='DUPLICADO';
  frmpdf.QRPQuickrep1.Prepare;

  ARCHIVO:='D_'+ARCHIVO;
  Gpdf := TExportar2PDFSyn.create;
  Gpdf.rutaPDF := DIRFAE+'\'+trim(ARCHIVO);
  Gpdf.exportar2PDF(frmpdf.QRPQuickrep1);
  Gpdf.Free;

  frmpdf.QRORIGINAL.Caption:='TRIPLICADO';
  frmpdf.QRPQuickrep1.Prepare;
  ARCHIVO:='T_'+ARCHIVO;
  Gpdf := TExportar2PDFSyn.create;
  Gpdf.rutaPDF := DIRFAE+'\'+trim(ARCHIVO);
  Gpdf.exportar2PDF(frmpdf.QRPQuickrep1);
  Gpdf.Free;



 if ESPARAENAMIL='N' then
 BEGIN
   WHILE frmpdf.QRPQuickrep1.QRPrinter.IsPrinting=TRUE DO
   BEGIN
     APPLICATION.ProcessMessages;
   END;
 END;
end;




function Tfrmterminar.imprimirFacturaFormato58(idmovi:longint;ESPARAENAMIL:STRING):STRING;
var posi,codigocliente:longint; COMPROBANTE,LETRA,COD,DNICUIT,TIPODOC,RAZONSOCIAL,IVACLIENTE:sTRING;
    fechaqr,tipocbte,CODIGO_QR:String;
                    fechadir:sTRING;
    NROFAC,  ARCHIVO,DIRFAE:STRING;   Gpdf :TExportar2PDFSyn ;
    IDFOMAPAO:LONGINT;TIPOMOVIMIENTO,I:LONGINT;
begin

   posi:=pos('-',trim(label7.Caption));
   codigocliente:=strtoint(trim(copy(trim(label7.Caption),0,posi-1)));

   Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT  TIPOMOVIMIENTO FROM TMOVIMIENTOS WHERE IDMOVIMIENTO='+INTTOSTR(idmovi));
  Form1.FDQuery3.Open;
  TIPOMOVIMIENTO:=Form1.FDQuery3.FieldByName('TIPOMOVIMIENTO').AsInteger;
   if TIPOMOVIMIENTO=1 then  //FACTURA A
   BEGIN
     letra:='A';
     cod:='COD 01';
     COMPROBANTE:='FACTURA';
     tipocbte:='1';
   END;

   if TIPOMOVIMIENTO=2 then  //FACTURA B
   BEGIN
     letra:='B';
     cod:='COD 06';
     COMPROBANTE:='FACTURA';
     tipocbte:='6';
   END;

   if TIPOMOVIMIENTO=3 then  //FACTURA C
   BEGIN
    { letra:='B';
     cod:='COD 06';
     COMPROBANTE:='FACTURA';  }
   END ;

   if TIPOMOVIMIENTO=4 then  //NOTA CREDITO A
   BEGIN
     letra:='A';
     cod:='COD 03';
     COMPROBANTE:='NOTA DE CREDITO';
     tipocbte:='3';
   END;

   if TIPOMOVIMIENTO=5 then  //NOTA CREDITO B
   BEGIN
     letra:='B';
     cod:='COD 08';
     COMPROBANTE:='NOTA DE CREDITO';
     tipocbte:='8';
   END ;

   if codigocliente=0 then
   begin
    RAZONSOCIAL:='CONSUMIDOR FINAL';
    DNICUIT:='DOC (OTRO) 0';
    IVACLIENTE:='CONSUMIDOR FINAL';
   end ELSE
       BEGIN
          Form1.FDQuery3.Close;
          Form1.FDQuery3.SQL.Clear;
          Form1.FDQuery3.SQL.Add('SELECT  * FROM TCLIENTES WHERE IDCLIENTE='+INTTOSTR(codigocliente));
          Form1.FDQuery3.Open;

          RAZONSOCIAL:=TRIM(Form1.FDQuery3.FieldByName('APENOM').ASSTRING);
          DNICUIT:=TRIM(Form1.FDQuery3.FieldByName('NRODOC').ASSTRING);
          IVACLIENTE:=TRIM(Form1.FDQuery3.FieldByName('IVA').ASSTRING);
          TIPODOC:=TRIM(Form1.FDQuery3.FieldByName('TIPODOC').ASSTRING);
          if TIPODOC='96' then
          DNICUIT:='DNI '+DNICUIT;
          if TIPODOC='80' then
          DNICUIT:='CUIT '+DNICUIT;
          if TIPODOC='86' then
          DNICUIT:='CUIL '+DNICUIT;
          if TIPODOC='87' then
          DNICUIT:='CDI '+DNICUIT;
          if TIPODOC='89' then
          DNICUIT:='LE '+DNICUIT;
          if TIPODOC='90' then
          DNICUIT:='LC '+DNICUIT;
          if TIPODOC='91' then
          DNICUIT:='CI '+DNICUIT;
          if TIPODOC='92' then
          DNICUIT:='EN TRAMITE '+DNICUIT;
          if TIPODOC='93' then
          DNICUIT:='AC. NAC. '+DNICUIT;
          if TIPODOC='95' then
          DNICUIT:='CI Bs. As. RN '+DNICUIT;
          if TIPODOC='99' then
          DNICUIT:='OTRO DOC '+DNICUIT;




    END;

  disenioimprimirFactura58.QRLabel24.Caption:=letra;
  disenioimprimirFactura58.QRLabel25.Caption:=cod;
  disenioimprimirFactura58.QRLabel26.Caption:=COMPROBANTE;

  Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT  * FROM TMOVIMIENTOS WHERE IDMOVIMIENTO='+INTTOSTR(idmovi));
  Form1.FDQuery3.Open;
  IDFOMAPAO:=Form1.FDQuery3.FieldByName('IDFORMAPAGO').ASINTEGER;
  NROFAC:=armanumeroFactura(TRIM(Form1.FDQuery3.FieldByName('NROFACTURA').ASSTRING));
  disenioimprimirFactura58.QRLabel27.Caption:=TRIM(Form1.FDQuery3.FieldByName('FECHA').ASSTRING);
  disenioimprimirFactura58.QRLabel28.Caption:=armanumeroFactura(TRIM(Form1.FDQuery3.FieldByName('NROFACTURA').ASSTRING));
  disenioimprimirFactura58.QRLabel22.Caption:='CAE:'+TRIM(Form1.FDQuery3.FieldByName('CAE').ASSTRING);
  disenioimprimirFactura58.QRLabel23.Caption:='FECHA VENC:'+TRIM(Form1.FDQuery3.FieldByName('FECHAVENCE').ASSTRING);

  disenioimprimirFactura58.QRLabel18.Caption:=FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.FieldByName('SUBTOTAL').ASSTRING)),FFFIXED,8,2);
  disenioimprimirFactura58.QRLabel21.Caption:=FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.FieldByName('TOTAL').ASSTRING)),FFFIXED,8,2);

   fechaqr:=copy(TRIM(Form1.FDQuery3.FieldByName('FECHA').ASSTRING),7,4)+'-'+copy(TRIM(Form1.FDQuery3.FieldByName('FECHA').ASSTRING),4,2)+'-'+copy(TRIM(Form1.FDQuery3.FieldByName('FECHA').ASSTRING),1,2);

{qr}
    CODIGO_QR:='{"ver":1,'+
             '"fecha":"'+fechaqr+'",'+
             '"cuit": "'+form1.tconfi.GET_FCUITFACTURA+'",'+
             '"ptoVta":"'+form1.tconfi.GET_FPUNTOVENTA+'",'+
             '"tipoCmp":'+tipocbte+','+
             '"nroCmp":'+TRIM(Form1.FDQuery3.FieldByName('NROFACTURA').ASSTRING)+','+
             '"importe":'+FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.FieldByName('TOTAL').ASSTRING)),FFFIXED,8,2)+','+
             '"moneda":"PES",'+
             '"ctz":1,'+
             '"tipoDocRec":'+TIPODOC+','+
             '"nroDocRec":'+stringreplace(DNICUIT, '-', '',[rfReplaceAll, rfIgnoreCase])+','+
             '"tipoCodAut":"E",'+
             '"codAut":'+TRIM(Form1.FDQuery3.FieldByName('CAE').ASSTRING)+'}';

 CODIGO_QR:='https://www.afip.gob.ar/fe/qr/?p='+CODIGO_QR;
   disenioimprimirFactura58.QRQRBarcode1.BarcodeText:=CODIGO_QR;

  Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT  DESCRIPCION FROM TFORMAPAGO WHERE IDFORMAPAGO='+INTTOSTR(IDFOMAPAO));
  Form1.FDQuery3.Open;
//  disenioimprimirFactura58.QRLabel31.CAPTION:='FORMA DE PAGO:'+TRIM(Form1.FDQuery3.FieldByName('DESCRIPCION').ASSTRING);

  if trim(letra)='B' then
  begin
      disenioimprimirFactura58.QRLabel19.Caption:='0.00';
      disenioimprimirFactura58.QRLabel20.Caption:='0.00';
  end else begin
        Form1.FDQuery3.Close;
        Form1.FDQuery3.SQL.Clear;
        Form1.FDQuery3.SQL.Add('SELECT  sum(iva) as iv FROM TITEM_FACTURA WHERE IDFACTURA='+INTTOSTR(idmovi)+' and POR_IVA=''10.5'' ');
        Form1.FDQuery3.Open;
         if trim(Form1.FDQuery3.FieldByName('iv').ASSTRING)='' then
          disenioimprimirFactura58.QRLabel20.Caption:='0.00'
          else
        disenioimprimirFactura58.QRLabel20.Caption:=FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.FieldByName('iv').ASSTRING)),FFFIXED,8,2);

        Form1.FDQuery3.Close;
        Form1.FDQuery3.SQL.Clear;
        Form1.FDQuery3.SQL.Add('SELECT  sum(iva) as iv FROM TITEM_FACTURA WHERE IDFACTURA='+INTTOSTR(idmovi)+' and POR_IVA=''21'' ');
        Form1.FDQuery3.Open;
        if trim(Form1.FDQuery3.FieldByName('iv').ASSTRING)='' then
          disenioimprimirFactura58.QRLabel19.Caption:='0.00'
          else
         disenioimprimirFactura58.QRLabel19.Caption:=FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.FieldByName('iv').ASSTRING)),FFFIXED,8,2);

  end;


  disenioimprimirFactura58.qrrazonsocial.Caption:=TRIM(RAZONSOCIAL);
  disenioimprimirFactura58.qrcuitdni.Caption:=TRIM(DNICUIT);
  disenioimprimirFactura58.qrivacliente.Caption:=TRIM(IVACLIENTE);

    disenioimprimirFactura58.QRLabel29.Caption:='';
    disenioimprimirFactura58.QRLabel30.Caption:='';

  disenioimprimirFactura58.QRLabel1.Caption:='RAZON SOCIAL:'+TRIM(form1.tconfi.GET_FNOMBRE);
  disenioimprimirFactura58.QRLabel2.Caption:='CUIT:'+TRIM(form1.tconfi.GET_FCUITFACTURA);
  disenioimprimirFactura58.QRLabel3.Caption:='IVA:'+TRIM(form1.tconfi.GET_FIVA);
  disenioimprimirFactura58.QRLabel4.Caption:='IIBB:'+TRIM(form1.tconfi.GET_FIIBB);
  disenioimprimirFactura58.QRLabel5.Caption:='INIC. ACTV.:'+TRIM(form1.tconfi.GET_FECHAINICIO);
  disenioimprimirFactura58.QRLabel7.Caption:='DOMICILIO:'+TRIM(form1.tconfi.GET_FDOMICILIO);

  disenioimprimirFactura58.RxMemoryData1.Close;
  disenioimprimirFactura58.RxMemoryData1.Open;
  Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT TA.DESCRIPCION, TI.CANTIDAD,TI.PUNI,TI.PTOTAL,'+
  ' TA.PRECIOVENTA,TI.IVA,TI.POR_IVA FROM TITEM_FACTURA TI,TARTICULOS TA '+
                         ' WHERE TI.IDARTICULO=TA.IDARTICULO AND TI.PROMOCION=''N'' '+
                         ' AND TI.IDFACTURA='+INTTOSTR(idmovi));
  Form1.FDQuery3.Open;
  while NOT FORM1.FDQuery3.EOF do
  BEGIN



      if trim(letra)='A' then
      BEGIN
   {   disenioimprimirFactura58.RxMemoryData1DESCRIPCION.Value:=TRIM(Form1.FDQuery3.Fields[0].AsString);
      disenioimprimirFactura58.RxMemoryData1PUNITARIO.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[2].AsString)),FFFIXED,8,2);
      disenioimprimirFactura58.RxMemoryData1IVA.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString))-STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[2].AsString)),FFFIXED,8,2);
      disenioimprimirFactura58.RxMemoryData1TOTAL.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString)),FFFIXED,8,2);
      disenioimprimirFactura58.RxMemoryData1CANTIDAD.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString)),FFFIXED,8,2);
      }
        disenioimprimirFactura58.RxMemoryData1.Append;
       disenioimprimirFactura58.RxMemoryData1DESCRIPCION.Value:=FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString)),FFFIXED,8,2);
       disenioimprimirFactura58.RxMemoryData1PUNITARIO.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[2].AsString)),FFFIXED,8,2);
       disenioimprimirFactura58.RxMemoryData1IVA.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString))-STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[2].AsString)),FFFIXED,8,2);
       disenioimprimirFactura58.RxMemoryData1TOTAL.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString)),FFFIXED,8,2);
      // disenioimprimirFactura58.RxMemoryData1CANTIDAD.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString)),FFFIXED,8,2);

       disenioimprimirFactura58.RxMemoryData1.Post;

       disenioimprimirFactura58.RxMemoryData1.Append;
       disenioimprimirFactura58.RxMemoryData1DESCRIPCION.Value:=TRIM(Form1.FDQuery3.Fields[0].AsString);
       disenioimprimirFactura58.RxMemoryData1.Post;
      END ELSE BEGIN
            disenioimprimirFactura58.RxMemoryData1.Append;
            disenioimprimirFactura58.RxMemoryData1DESCRIPCION.Value:=FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString)),FFFIXED,8,2);
            disenioimprimirFactura58.RxMemoryData1PUNITARIO.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString)),FFFIXED,8,2);
            disenioimprimirFactura58.RxMemoryData1IVA.Value:='';
            disenioimprimirFactura58.RxMemoryData1TOTAL.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString)),FFFIXED,8,2);
          // disenioimprimirFactura58.RxMemoryData1CANTIDAD.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString)),FFFIXED,8,2);
            disenioimprimirFactura58.RxMemoryData1.Post;
           disenioimprimirFactura58.RxMemoryData1.Append;
           disenioimprimirFactura58.RxMemoryData1DESCRIPCION.Value:=TRIM(Form1.FDQuery3.Fields[0].AsString);
            disenioimprimirFactura58.RxMemoryData1.Post;
      END;
     // disenioimprimirFactura58.RxMemoryData1.Post;

       disenioimprimirFactura58.QRPQuickrep1.Page.Length:= disenioimprimirFactura58.QRPQuickrep1.Page.Length + 20;


  Form1.FDQuery3.NEXT;
  END;

  ///PROMOCIONES
    Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT TA.NOMBRE, TI.CANTIDAD,TI.PUNI,TI.PTOTAL,  '+
 '  TA.PRECIO,TI.IVA,TI.POR_IVA FROM TITEM_FACTURA TI,TPROMOCIONES TA   '+
                      '    WHERE TI.IDARTICULO=TA.IDPROMOCION AND TI.PROMOCION=''S'' '+
                         ' AND TI.IDFACTURA='+INTTOSTR(idmovi));
  Form1.FDQuery3.Open;
  while NOT FORM1.FDQuery3.EOF do
  BEGIN



      if trim(letra)='A' then
      BEGIN

        disenioimprimirFactura58.RxMemoryData1.Append;
       disenioimprimirFactura58.RxMemoryData1DESCRIPCION.Value:=FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString)),FFFIXED,8,2);
       disenioimprimirFactura58.RxMemoryData1PUNITARIO.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[2].AsString)),FFFIXED,8,2);
       disenioimprimirFactura58.RxMemoryData1IVA.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString))-STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[2].AsString)),FFFIXED,8,2);
       disenioimprimirFactura58.RxMemoryData1TOTAL.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString)),FFFIXED,8,2);
      // disenioimprimirFactura58.RxMemoryData1CANTIDAD.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString)),FFFIXED,8,2);

       disenioimprimirFactura58.RxMemoryData1.Post;

       disenioimprimirFactura58.RxMemoryData1.Append;
       disenioimprimirFactura58.RxMemoryData1DESCRIPCION.Value:=TRIM(Form1.FDQuery3.Fields[0].AsString);
       disenioimprimirFactura58.RxMemoryData1.Post;
      END ELSE BEGIN
            disenioimprimirFactura58.RxMemoryData1.Append;
            disenioimprimirFactura58.RxMemoryData1DESCRIPCION.Value:=FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString)),FFFIXED,8,2);
            disenioimprimirFactura58.RxMemoryData1PUNITARIO.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString)),FFFIXED,8,2);
            disenioimprimirFactura58.RxMemoryData1IVA.Value:='';
            disenioimprimirFactura58.RxMemoryData1TOTAL.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString)),FFFIXED,8,2);
          // disenioimprimirFactura58.RxMemoryData1CANTIDAD.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString)),FFFIXED,8,2);
            disenioimprimirFactura58.RxMemoryData1.Post;
           disenioimprimirFactura58.RxMemoryData1.Append;
           disenioimprimirFactura58.RxMemoryData1DESCRIPCION.Value:=TRIM(Form1.FDQuery3.Fields[0].AsString);
            disenioimprimirFactura58.RxMemoryData1.Post;
      END;
     // disenioimprimirFactura58.RxMemoryData1.Post;

       disenioimprimirFactura58.QRPQuickrep1.Page.Length:= disenioimprimirFactura58.QRPQuickrep1.Page.Length + 20;


  Form1.FDQuery3.NEXT;
  END;




  //fomra de pago
  for i:=1 to 5 do
   begin
       disenioimprimirFactura58.RxMemoryData1.Append;
       disenioimprimirFactura58.RxMemoryData1DESCRIPCION.Value:='';
       disenioimprimirFactura58.RxMemoryData1PUNITARIO.Value:='';
       disenioimprimirFactura58.RxMemoryData1IVA.Value:='';
       disenioimprimirFactura58.RxMemoryData1TOTAL.Value:= '';
       disenioimprimirFactura58.RxMemoryData1.Post;
       disenioimprimirFactura58.QRPQuickrep1.Page.Length:= disenioimprimirFactura58.QRPQuickrep1.Page.Length + 20;
   end;
      disenioimprimirFactura58.RxMemoryData1.Append;
       disenioimprimirFactura58.RxMemoryData1DESCRIPCION.Value:='FORMAS DE PAGOS';
       disenioimprimirFactura58.RxMemoryData1PUNITARIO.Value:='';
       disenioimprimirFactura58.RxMemoryData1IVA.Value:='';
       disenioimprimirFactura58.RxMemoryData1TOTAL.Value:= '';
       disenioimprimirFactura58.RxMemoryData1.Post;
       disenioimprimirFactura58.QRPQuickrep1.Page.Length:= disenioimprimirFactura58.QRPQuickrep1.Page.Length + 20;

     Form1.FDQuery3.Close;
     Form1.FDQuery3.SQL.Clear;
     Form1.FDQuery3.SQL.Add('SELECT  * FROM TFORMAPAGOS_FACTURAS WHERE IDMOVIMIENTO='+INTTOSTR(idmovi));
     Form1.FDQuery3.Open;
     while NOT Form1.FDQuery3.Eof do
     BEGIN
         disenioimprimirFactura58.RxMemoryData1.Append;
         disenioimprimirFactura58.RxMemoryData1DESCRIPCION.Value:=TRIM(Form1.FDQuery3.FieldByName('DESCRIPCION').AsString);
         disenioimprimirFactura58.RxMemoryData1PUNITARIO.Value:='';
         disenioimprimirFactura58.RxMemoryData1IVA.Value:='';
         disenioimprimirFactura58.RxMemoryData1TOTAL.Value:=FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.FieldByName('IMPORTE').AsString)),FFFIXED,8,2);
         disenioimprimirFactura58.RxMemoryData1.Post;
         disenioimprimirFactura58.QRPQuickrep1.Page.Length:= disenioimprimirFactura58.QRPQuickrep1.Page.Length + 20;


     Form1.FDQuery3.Next;
     END;



   {forma directorios}
     DIRFAE:=ExtractFilePath(ParamStr(0))+'COMPROBANTES';
     if not DirectoryExists(DIRFAE+'\')=true then
     begin
       CreateDir(DIRFAE);
     end;
     DIRFAE:=DIRFAE+'\';
     fechadir:=fechaqr ;
     fechadir:=stringreplace(fechadir, '-', '',[rfReplaceAll, rfIgnoreCase]);
     DIRFAE:=DIRFAE+fechadir;
     if not DirectoryExists(DIRFAE+'\')=true then
     begin
       CreateDir(DIRFAE);
     end;


   disenioimprimirFactura58.QRORIGINAL.Caption:='ORIGINAL';
  disenioimprimirFactura58.QRPQuickrep1.Prepare;

  if ESPARAENAMIL='N' then
     disenioimprimirFactura58.QRPQuickrep1.Print;

  ARCHIVO:=NROFAC+'.pdf';
  imprimirFacturaFormato58:=DIRFAE+'\'+trim(ARCHIVO);
  disenioimprimirFactura58.QRORIGINAL.Caption:='ORIGINAL';
  disenioimprimirFactura58.QRPQuickrep1.Prepare;
  Gpdf := TExportar2PDFSyn.create;
  Gpdf.rutaPDF := DIRFAE+'\'+trim(ARCHIVO);
  Gpdf.exportar2PDF(disenioimprimirFactura58.QRPQuickrep1);
  Gpdf.Free;

  disenioimprimirFactura58.QRORIGINAL.Caption:='DUPLICADO';
  disenioimprimirFactura58.QRPQuickrep1.Prepare;

  ARCHIVO:='D_'+ARCHIVO;
  Gpdf := TExportar2PDFSyn.create;
  Gpdf.rutaPDF := DIRFAE+'\'+trim(ARCHIVO);
  Gpdf.exportar2PDF(disenioimprimirFactura58.QRPQuickrep1);
  Gpdf.Free;

  disenioimprimirFactura58.QRORIGINAL.Caption:='TRIPLICADO';
  disenioimprimirFactura58.QRPQuickrep1.Prepare;
  ARCHIVO:='T_'+ARCHIVO;
  Gpdf := TExportar2PDFSyn.create;
  Gpdf.rutaPDF := DIRFAE+'\'+trim(ARCHIVO);
  Gpdf.exportar2PDF(disenioimprimirFactura58.QRPQuickrep1);
  Gpdf.Free;



 if ESPARAENAMIL='N' then
 BEGIN
   WHILE disenioimprimirFactura58.QRPQuickrep1.QRPrinter.IsPrinting=TRUE DO
   BEGIN
     APPLICATION.ProcessMessages;
   END;
 END;
end;


function Tfrmterminar.imprimirTICKET(idmovi:longint;ESPARAENAMIL:STRING):STRING;
var posi,codigocliente:longint; COMPROBANTE,LETRA,COD,DNICUIT,TIPODOC,RAZONSOCIAL,IVACLIENTE:sTRING;
    fechaqr,tipocbte,CODIGO_QR:String;
                    fechadir:sTRING;
    NROFAC,  ARCHIVO,DIRFAE:STRING;   Gpdf :TExportar2PDFSyn ;
    IDFOMAPAO:LONGINT;TIPOMOVIMIENTO,I:LONGINT;
begin

   posi:=pos('-',trim(label7.Caption));
   codigocliente:=strtoint(trim(copy(trim(label7.Caption),0,posi-1)));

   Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT  TIPOMOVIMIENTO FROM TMOVIMIENTOS WHERE IDMOVIMIENTO='+INTTOSTR(idmovi));
  Form1.FDQuery3.Open;
  TIPOMOVIMIENTO:=Form1.FDQuery3.FieldByName('TIPOMOVIMIENTO').AsInteger;


   if codigocliente=0 then
   begin
    RAZONSOCIAL:='CONSUMIDOR FINAL';
    DNICUIT:='DOC (OTRO) 0';
    IVACLIENTE:='CONSUMIDOR FINAL';
   end ELSE
       BEGIN
          Form1.FDQuery3.Close;
          Form1.FDQuery3.SQL.Clear;
          Form1.FDQuery3.SQL.Add('SELECT  * FROM TCLIENTES WHERE IDCLIENTE='+INTTOSTR(codigocliente));
          Form1.FDQuery3.Open;

          RAZONSOCIAL:=TRIM(Form1.FDQuery3.FieldByName('APENOM').ASSTRING);
          DNICUIT:=TRIM(Form1.FDQuery3.FieldByName('NRODOC').ASSTRING);
          IVACLIENTE:=TRIM(Form1.FDQuery3.FieldByName('IVA').ASSTRING);
          TIPODOC:=TRIM(Form1.FDQuery3.FieldByName('TIPODOC').ASSTRING);
          if TIPODOC='96' then
          DNICUIT:='DNI '+DNICUIT;
          if TIPODOC='80' then
          DNICUIT:='CUIT '+DNICUIT;
          if TIPODOC='86' then
          DNICUIT:='CUIL '+DNICUIT;
          if TIPODOC='87' then
          DNICUIT:='CDI '+DNICUIT;
          if TIPODOC='89' then
          DNICUIT:='LE '+DNICUIT;
          if TIPODOC='90' then
          DNICUIT:='LC '+DNICUIT;
          if TIPODOC='91' then
          DNICUIT:='CI '+DNICUIT;
          if TIPODOC='92' then
          DNICUIT:='EN TRAMITE '+DNICUIT;
          if TIPODOC='93' then
          DNICUIT:='AC. NAC. '+DNICUIT;
          if TIPODOC='95' then
          DNICUIT:='CI Bs. As. RN '+DNICUIT;
          if TIPODOC='99' then
          DNICUIT:='OTRO DOC '+DNICUIT;




    END;

  {frmpdf.QRLabel24.Caption:=letra;
  frmpdf.QRLabel25.Caption:=cod;
  frmpdf.QRLabel26.Caption:=COMPROBANTE;
   }
  Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT  * FROM TMOVIMIENTOS WHERE IDMOVIMIENTO='+INTTOSTR(idmovi));
  Form1.FDQuery3.Open;
  IDFOMAPAO:=Form1.FDQuery3.FieldByName('IDFORMAPAGO').ASINTEGER;
  NROFAC:=TRIM(Form1.FDQuery3.FieldByName('NROFACTURA').ASSTRING);
  FRMDISENIOTICKET.QRLabel27.Caption:=TRIM(Form1.FDQuery3.FieldByName('FECHA').ASSTRING);
  FRMDISENIOTICKET.QRLabel28.Caption:=TRIM(Form1.FDQuery3.FieldByName('NROFACTURA').ASSTRING);


  FRMDISENIOTICKET.QRLabel21.Caption:='$'+FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.FieldByName('TOTAL').ASSTRING)),FFFIXED,8,2);

   fechaqr:=copy(TRIM(Form1.FDQuery3.FieldByName('FECHA').ASSTRING),7,4)+'-'+copy(TRIM(Form1.FDQuery3.FieldByName('FECHA').ASSTRING),4,2)+'-'+copy(TRIM(Form1.FDQuery3.FieldByName('FECHA').ASSTRING),1,2);








  FRMDISENIOTICKET.QRLabel9.Caption:='A: '+TRIM(RAZONSOCIAL);




  FRMDISENIOTICKET.QRLabel7.Caption:=TRIM(form1.tconfi.GET_FNOMBRE);

  FRMDISENIOTICKET.RxMemoryData1.Close;
  FRMDISENIOTICKET.RxMemoryData1.Open;
  Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT TA.DESCRIPCION, TI.CANTIDAD,TI.PUNI,TI.PTOTAL,'+
  ' TA.PRECIOVENTA,TI.IVA,TI.POR_IVA FROM TITEM_FACTURA TI,TARTICULOS TA '+
                         ' WHERE TI.IDARTICULO=TA.IDARTICULO '+
                         ' AND TI.IDFACTURA='+INTTOSTR(idmovi));
  Form1.FDQuery3.Open;
  while NOT FORM1.FDQuery3.EOF do
  BEGIN
      FRMDISENIOTICKET.RxMemoryData1.Append;



            FRMDISENIOTICKET.RxMemoryData1DESCRIPCION.Value:=TRIM(Form1.FDQuery3.Fields[0].AsString);
            FRMDISENIOTICKET.RxMemoryData1PUNITARIO.Value:= FLOATTOSTRF((STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString))/STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString))),FFFIXED,8,2);
            FRMDISENIOTICKET.RxMemoryData1IVA.Value:='';
            FRMDISENIOTICKET.RxMemoryData1TOTAL.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString)),FFFIXED,8,2);
            FRMDISENIOTICKET.RxMemoryData1CANTIDAD.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString)),FFFIXED,8,2);


      FRMDISENIOTICKET.RxMemoryData1.Post;

        FRMDISENIOTICKET.QRPQuickrep1.Page.Length:= FRMDISENIOTICKET.QRPQuickrep1.Page.Length + 20;


  Form1.FDQuery3.NEXT;
  END;

        ///PROMOCIONES
  Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT TA.NOMBRE, TI.CANTIDAD,TI.PUNI,TI.PTOTAL,  '+
 '  TA.PRECIO,TI.IVA,TI.POR_IVA FROM TITEM_FACTURA TI,TPROMOCIONES TA   '+
                      '    WHERE TI.IDARTICULO=TA.IDPROMOCION AND TI.PROMOCION=''S'' '+
                         ' AND TI.IDFACTURA='+INTTOSTR(idmovi));
    Form1.FDQuery3.Open;
    while NOT FORM1.FDQuery3.EOF do
  BEGIN
      FRMDISENIOTICKET.RxMemoryData1.Append;



            FRMDISENIOTICKET.RxMemoryData1DESCRIPCION.Value:=TRIM(Form1.FDQuery3.Fields[0].AsString);
            FRMDISENIOTICKET.RxMemoryData1PUNITARIO.Value:= FLOATTOSTRF((STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString))/STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString))),FFFIXED,8,2);
            FRMDISENIOTICKET.RxMemoryData1IVA.Value:='';
            FRMDISENIOTICKET.RxMemoryData1TOTAL.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString)),FFFIXED,8,2);
            FRMDISENIOTICKET.RxMemoryData1CANTIDAD.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString)),FFFIXED,8,2);


      FRMDISENIOTICKET.RxMemoryData1.Post;

        FRMDISENIOTICKET.QRPQuickrep1.Page.Length:= FRMDISENIOTICKET.QRPQuickrep1.Page.Length + 20;


  Form1.FDQuery3.NEXT;
  END;

  //fomra de pago
  for i:=1 to 5 do
   begin
       FRMDISENIOTICKET.RxMemoryData1.Append;
       FRMDISENIOTICKET.RxMemoryData1DESCRIPCION.Value:='';
       FRMDISENIOTICKET.RxMemoryData1PUNITARIO.Value:='';
       FRMDISENIOTICKET.RxMemoryData1IVA.Value:='';
       FRMDISENIOTICKET.RxMemoryData1TOTAL.Value:= '';
       FRMDISENIOTICKET.RxMemoryData1.Post;
       FRMDISENIOTICKET.QRPQuickrep1.Page.Length:= FRMDISENIOTICKET.QRPQuickrep1.Page.Length + 20;
   end;
      FRMDISENIOTICKET.RxMemoryData1.Append;
       FRMDISENIOTICKET.RxMemoryData1DESCRIPCION.Value:='FORMAS DE PAGOS';
       FRMDISENIOTICKET.RxMemoryData1PUNITARIO.Value:='';
       FRMDISENIOTICKET.RxMemoryData1IVA.Value:='';
       FRMDISENIOTICKET.RxMemoryData1TOTAL.Value:= '';
       FRMDISENIOTICKET.RxMemoryData1.Post;
       FRMDISENIOTICKET.QRPQuickrep1.Page.Length:= FRMDISENIOTICKET.QRPQuickrep1.Page.Length + 20;

     Form1.FDQuery3.Close;
     Form1.FDQuery3.SQL.Clear;
     Form1.FDQuery3.SQL.Add('SELECT  * FROM TFORMAPAGOS_FACTURAS WHERE IDMOVIMIENTO='+INTTOSTR(idmovi));
     Form1.FDQuery3.Open;
     while NOT Form1.FDQuery3.Eof do
     BEGIN
         FRMDISENIOTICKET.RxMemoryData1.Append;
         FRMDISENIOTICKET.RxMemoryData1DESCRIPCION.Value:=TRIM(Form1.FDQuery3.FieldByName('DESCRIPCION').AsString);
         FRMDISENIOTICKET.RxMemoryData1PUNITARIO.Value:='';
         FRMDISENIOTICKET.RxMemoryData1IVA.Value:='';
         FRMDISENIOTICKET.RxMemoryData1TOTAL.Value:=FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.FieldByName('IMPORTE').AsString)),FFFIXED,8,2);
         FRMDISENIOTICKET.RxMemoryData1.Post;
         FRMDISENIOTICKET.QRPQuickrep1.Page.Length:= FRMDISENIOTICKET.QRPQuickrep1.Page.Length + 20;


     Form1.FDQuery3.Next;
     END;



   {forma directorios}
     DIRFAE:=ExtractFilePath(ParamStr(0))+'COMPROBANTES';
     if not DirectoryExists(DIRFAE+'\')=true then
     begin
       CreateDir(DIRFAE);
     end;
     DIRFAE:=DIRFAE+'\';
     fechadir:=fechaqr ;
     fechadir:=stringreplace(fechadir, '-', '',[rfReplaceAll, rfIgnoreCase]);
     DIRFAE:=DIRFAE+fechadir;
     if not DirectoryExists(DIRFAE+'\')=true then
     begin
       CreateDir(DIRFAE);
     end;



  FRMDISENIOTICKET.QRPQuickrep1.Prepare;

  if ESPARAENAMIL='N' then
  FRMDISENIOTICKET.QRPQuickrep1.Print;

  ARCHIVO:='TICKET_'+NROFAC+'.pdf';

  FRMDISENIOTICKET.QRPQuickrep1.Prepare;
  Gpdf := TExportar2PDFSyn.create;
  Gpdf.rutaPDF := DIRFAE+'\'+trim(ARCHIVO);
  Gpdf.exportar2PDF(FRMDISENIOTICKET.QRPQuickrep1);
  Gpdf.Free;


  imprimirTICKET:=DIRFAE+'\'+trim(ARCHIVO);


  if ESPARAENAMIL='N' then
  BEGIN
    WHILE FRMDISENIOTICKET.QRPQuickrep1.QRPrinter.IsPrinting=TRUE DO
    BEGIN
     APPLICATION.ProcessMessages;
    END;
  END;
end;



function Tfrmterminar.imprimirTICKET_58(idmovi:longint;ESPARAENAMIL:STRING):STRING;
var posi,codigocliente:longint; COMPROBANTE,LETRA,COD,DNICUIT,TIPODOC,RAZONSOCIAL,IVACLIENTE:sTRING;
    fechaqr,tipocbte,CODIGO_QR:String;
                    fechadir:sTRING;
    NROFAC,  ARCHIVO,DIRFAE:STRING;   Gpdf :TExportar2PDFSyn ;
    IDFOMAPAO:LONGINT;TIPOMOVIMIENTO,I:LONGINT;
begin
   frmTicket58.QRPQuickrep1.Page.Length:=129;

   posi:=pos('-',trim(label7.Caption));
   codigocliente:=strtoint(trim(copy(trim(label7.Caption),0,posi-1)));

   Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT  TIPOMOVIMIENTO FROM TMOVIMIENTOS WHERE IDMOVIMIENTO='+INTTOSTR(idmovi));
  Form1.FDQuery3.Open;
  TIPOMOVIMIENTO:=Form1.FDQuery3.FieldByName('TIPOMOVIMIENTO').AsInteger;


   if codigocliente=0 then
   begin
    RAZONSOCIAL:='CONSUMIDOR FINAL';
    DNICUIT:='DOC (OTRO) 0';
    IVACLIENTE:='CONSUMIDOR FINAL';
   end ELSE
       BEGIN
          Form1.FDQuery3.Close;
          Form1.FDQuery3.SQL.Clear;
          Form1.FDQuery3.SQL.Add('SELECT  * FROM TCLIENTES WHERE IDCLIENTE='+INTTOSTR(codigocliente));
          Form1.FDQuery3.Open;

          RAZONSOCIAL:=TRIM(Form1.FDQuery3.FieldByName('APENOM').ASSTRING);
          DNICUIT:=TRIM(Form1.FDQuery3.FieldByName('NRODOC').ASSTRING);
          IVACLIENTE:=TRIM(Form1.FDQuery3.FieldByName('IVA').ASSTRING);
          TIPODOC:=TRIM(Form1.FDQuery3.FieldByName('TIPODOC').ASSTRING);
          if TIPODOC='96' then
          DNICUIT:='DNI '+DNICUIT;
          if TIPODOC='80' then
          DNICUIT:='CUIT '+DNICUIT;
          if TIPODOC='86' then
          DNICUIT:='CUIL '+DNICUIT;
          if TIPODOC='87' then
          DNICUIT:='CDI '+DNICUIT;
          if TIPODOC='89' then
          DNICUIT:='LE '+DNICUIT;
          if TIPODOC='90' then
          DNICUIT:='LC '+DNICUIT;
          if TIPODOC='91' then
          DNICUIT:='CI '+DNICUIT;
          if TIPODOC='92' then
          DNICUIT:='EN TRAMITE '+DNICUIT;
          if TIPODOC='93' then
          DNICUIT:='AC. NAC. '+DNICUIT;
          if TIPODOC='95' then
          DNICUIT:='CI Bs. As. RN '+DNICUIT;
          if TIPODOC='99' then
          DNICUIT:='OTRO DOC '+DNICUIT;




    END;

  {frmpdf.QRLabel24.Caption:=letra;
  frmpdf.QRLabel25.Caption:=cod;
  frmpdf.QRLabel26.Caption:=COMPROBANTE;
   }
  Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT  * FROM TMOVIMIENTOS WHERE IDMOVIMIENTO='+INTTOSTR(idmovi));
  Form1.FDQuery3.Open;
  IDFOMAPAO:=Form1.FDQuery3.FieldByName('IDFORMAPAGO').ASINTEGER;
  NROFAC:=TRIM(Form1.FDQuery3.FieldByName('NROFACTURA').ASSTRING);
  frmTicket58.QRLabel27.Caption:=TRIM(Form1.FDQuery3.FieldByName('FECHA').ASSTRING);
  frmTicket58.QRLabel28.Caption:=TRIM(Form1.FDQuery3.FieldByName('NROFACTURA').ASSTRING);


  frmTicket58.QRLabel21.Caption:='$'+FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.FieldByName('TOTAL').ASSTRING)),FFFIXED,8,2);

   fechaqr:=copy(TRIM(Form1.FDQuery3.FieldByName('FECHA').ASSTRING),7,4)+'-'+copy(TRIM(Form1.FDQuery3.FieldByName('FECHA').ASSTRING),4,2)+'-'+copy(TRIM(Form1.FDQuery3.FieldByName('FECHA').ASSTRING),1,2);

   frmTicket58.QRLabel26.Caption:='TIKECT';
    if TIPOMOVIMIENTO=7 then
        frmTicket58.QRLabel26.Caption:='DEVOLUCION';





  frmTicket58.QRLabel9.Caption:='A: '+TRIM(RAZONSOCIAL);




  frmTicket58.QRLabel7.Caption:=TRIM(form1.tconfi.GET_FNOMBRE);

  frmTicket58.RxMemoryData1.Close;
  frmTicket58.RxMemoryData1.Open;
  Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT TA.DESCRIPCION, TI.CANTIDAD,TI.PUNI,TI.PTOTAL,'+
  ' TA.PRECIOVENTA,TI.IVA,TI.POR_IVA FROM TITEM_FACTURA TI,TARTICULOS TA '+
                         ' WHERE TI.IDARTICULO=TA.IDARTICULO '+
                         ' AND TI.IDFACTURA='+INTTOSTR(idmovi));
  Form1.FDQuery3.Open;
  while NOT FORM1.FDQuery3.EOF do
  BEGIN
      frmTicket58.RxMemoryData1.Append;
       frmTicket58.RxMemoryData1PUNITARIO.Value:= FLOATTOSTRF((STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString))/STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString))),FFFIXED,8,2);
        frmTicket58.RxMemoryData1DESCRIPCION.Value:=FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString)),FFFIXED,8,2);

         frmTicket58.RxMemoryData1TOTAL.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString)),FFFIXED,8,2);
        frmTicket58.RxMemoryData1.Post;

        frmTicket58.RxMemoryData1.Append;

        frmTicket58.RxMemoryData1DESCRIPCION.Value:=TRIM(Form1.FDQuery3.Fields[0].AsString);
        frmTicket58.RxMemoryData1.Post;
       { frmTicket58.RxMemoryData1.Append;
            frmTicket58.RxMemoryData1PUNITARIO.Value:= FLOATTOSTRF((STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString))/STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString))),FFFIXED,8,2);
            frmTicket58.RxMemoryData1IVA.Value:='';
            frmTicket58.RxMemoryData1TOTAL.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString)),FFFIXED,8,2);
            frmTicket58.RxMemoryData1CANTIDAD.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString)),FFFIXED,8,2);
            frmTicket58.RxMemoryData1.Post;

         frmTicket58.RxMemoryData1.Append;
          frmTicket58.RxMemoryData1DESCRIPCION.Value:=TRIM(Form1.FDQuery3.Fields[0].AsString);
           frmTicket58.RxMemoryData1.Post;  }

     //  if  frmTicket58.RxMemoryData1.RecordCount > 15 then
        frmTicket58.QRPQuickrep1.Page.Length:= frmTicket58.QRPQuickrep1.Page.Length + 20;


     // frmTicket58.RxMemoryData1.Post;
  Form1.FDQuery3.NEXT;
  END;

    ///PROMOCIONES
  Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT TA.NOMBRE, TI.CANTIDAD,TI.PUNI,TI.PTOTAL,  '+
 '  TA.PRECIO,TI.IVA,TI.POR_IVA FROM TITEM_FACTURA TI,TPROMOCIONES TA   '+
                      '    WHERE TI.IDARTICULO=TA.IDPROMOCION AND TI.PROMOCION=''S'' '+
                         ' AND TI.IDFACTURA='+INTTOSTR(idmovi));
  Form1.FDQuery3.Open;
  while NOT FORM1.FDQuery3.EOF do
  BEGIN
      frmTicket58.RxMemoryData1.Append;
       frmTicket58.RxMemoryData1PUNITARIO.Value:= FLOATTOSTRF((STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString))/STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString))),FFFIXED,8,2);
        frmTicket58.RxMemoryData1DESCRIPCION.Value:=FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString)),FFFIXED,8,2);

         frmTicket58.RxMemoryData1TOTAL.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString)),FFFIXED,8,2);
        frmTicket58.RxMemoryData1.Post;

        frmTicket58.RxMemoryData1.Append;

        frmTicket58.RxMemoryData1DESCRIPCION.Value:=TRIM(Form1.FDQuery3.Fields[0].AsString);
        frmTicket58.RxMemoryData1.Post;
       { frmTicket58.RxMemoryData1.Append;
            frmTicket58.RxMemoryData1PUNITARIO.Value:= FLOATTOSTRF((STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString))/STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString))),FFFIXED,8,2);
            frmTicket58.RxMemoryData1IVA.Value:='';
            frmTicket58.RxMemoryData1TOTAL.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString)),FFFIXED,8,2);
            frmTicket58.RxMemoryData1CANTIDAD.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString)),FFFIXED,8,2);
            frmTicket58.RxMemoryData1.Post;

         frmTicket58.RxMemoryData1.Append;
          frmTicket58.RxMemoryData1DESCRIPCION.Value:=TRIM(Form1.FDQuery3.Fields[0].AsString);
           frmTicket58.RxMemoryData1.Post;  }

     //  if  frmTicket58.RxMemoryData1.RecordCount > 15 then
        frmTicket58.QRPQuickrep1.Page.Length:= frmTicket58.QRPQuickrep1.Page.Length + 20;


     // frmTicket58.RxMemoryData1.Post;
  Form1.FDQuery3.NEXT;
  END;


    //fomra de pago
  for i:=1 to 5 do
   begin
       frmTicket58.RxMemoryData1.Append;
       frmTicket58.RxMemoryData1DESCRIPCION.Value:='';
       frmTicket58.RxMemoryData1PUNITARIO.Value:='';
       frmTicket58.RxMemoryData1IVA.Value:='';
       frmTicket58.RxMemoryData1TOTAL.Value:= '';
       frmTicket58.RxMemoryData1.Post;
       frmTicket58.QRPQuickrep1.Page.Length:= frmTicket58.QRPQuickrep1.Page.Length + 20;
   end;
      frmTicket58.RxMemoryData1.Append;
       frmTicket58.RxMemoryData1DESCRIPCION.Value:='FORMAS DE PAGOS';
       frmTicket58.RxMemoryData1PUNITARIO.Value:='';
       frmTicket58.RxMemoryData1IVA.Value:='';
       frmTicket58.RxMemoryData1TOTAL.Value:= '';
       frmTicket58.RxMemoryData1.Post;
       frmTicket58.QRPQuickrep1.Page.Length:= frmTicket58.QRPQuickrep1.Page.Length + 20;

     Form1.FDQuery3.Close;
     Form1.FDQuery3.SQL.Clear;
     Form1.FDQuery3.SQL.Add('SELECT  * FROM TFORMAPAGOS_FACTURAS WHERE IDMOVIMIENTO='+INTTOSTR(idmovi));
     Form1.FDQuery3.Open;
     while NOT Form1.FDQuery3.Eof do
     BEGIN
         frmTicket58.RxMemoryData1.Append;
         frmTicket58.RxMemoryData1DESCRIPCION.Value:=TRIM(Form1.FDQuery3.FieldByName('DESCRIPCION').AsString);
         frmTicket58.RxMemoryData1PUNITARIO.Value:='';
         frmTicket58.RxMemoryData1IVA.Value:='';
         frmTicket58.RxMemoryData1TOTAL.Value:=FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.FieldByName('IMPORTE').AsString)),FFFIXED,8,2);
         frmTicket58.RxMemoryData1.Post;
         frmTicket58.QRPQuickrep1.Page.Length:= frmTicket58.QRPQuickrep1.Page.Length + 20;


     Form1.FDQuery3.Next;
     END;




   {forma directorios}
     DIRFAE:=ExtractFilePath(ParamStr(0))+'COMPROBANTES';
     if not DirectoryExists(DIRFAE+'\')=true then
     begin
       CreateDir(DIRFAE);
     end;
     DIRFAE:=DIRFAE+'\';
     fechadir:=fechaqr ;
     fechadir:=stringreplace(fechadir, '-', '',[rfReplaceAll, rfIgnoreCase]);
     DIRFAE:=DIRFAE+fechadir;
     if not DirectoryExists(DIRFAE+'\')=true then
     begin
       CreateDir(DIRFAE);
     end;

      frmTicket58.QRPQuickrep1.Page.Length:= frmTicket58.QRPQuickrep1.Page.Length + 100;

  frmTicket58.QRPQuickrep1.Prepare;

  if ESPARAENAMIL='N' then
  frmTicket58.QRPQuickrep1.Print;

  ARCHIVO:='TICKET_'+NROFAC+'.pdf';

  frmTicket58.QRPQuickrep1.Prepare;
  Gpdf := TExportar2PDFSyn.create;
  Gpdf.rutaPDF := DIRFAE+'\'+trim(ARCHIVO);
  Gpdf.exportar2PDF(frmTicket58.QRPQuickrep1);
  Gpdf.Free;


  imprimirTICKET_58:=DIRFAE+'\'+trim(ARCHIVO);


  if ESPARAENAMIL='N' then
  BEGIN
    WHILE frmTicket58.QRPQuickrep1.QRPrinter.IsPrinting=TRUE DO
    BEGIN
     APPLICATION.ProcessMessages;
    END;
  END;
end;
function Tfrmterminar.imprimirTICKETA4(idmovi:longint;ESPARAENAMIL:STRING):STRING;
var posi,codigocliente:longint; COMPROBANTE,LETRA,COD,DNICUIT,TIPODOC,RAZONSOCIAL,IVACLIENTE:sTRING;
    fechaqr,tipocbte,CODIGO_QR:String;       sumacantidad:real;
                    fechadir:sTRING;
    NROFAC,  ARCHIVO,DIRFAE:STRING;   Gpdf :TExportar2PDFSyn ;
    IDFOMAPAO:LONGINT;TIPOMOVIMIENTO:LONGINT;
begin
  if ESPARAENAMIL='R' then
  BEGIN

    Form1.FDQuery3.Close;
    Form1.FDQuery3.SQL.Clear;
    Form1.FDQuery3.SQL.Add('SELECT  IDCLIENTE FROM TMOVIMIENTOS WHERE IDMOVIMIENTO='+INTTOSTR(idmovi));
    Form1.FDQuery3.Open;
    codigocliente:=Form1.FDQuery3.FieldByName('IDCLIENTE').AsInteger;
    END ELSE BEGIN
     posi:=pos('-',trim(label7.Caption));
     codigocliente:=strtoint(trim(copy(trim(label7.Caption),0,posi-1)));
  END;

   sumacantidad:=0;
   Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT  TIPOMOVIMIENTO FROM TMOVIMIENTOS WHERE IDMOVIMIENTO='+INTTOSTR(idmovi));
  Form1.FDQuery3.Open;
  TIPOMOVIMIENTO:=Form1.FDQuery3.FieldByName('TIPOMOVIMIENTO').AsInteger;
  if TIPOMOVIMIENTO=0 then
   frmDisenioTicketA4.QRLabel26.Caption:='PEDIDO';

  if TIPOMOVIMIENTO=7 then
   frmDisenioTicketA4.QRLabel26.Caption:='DEVOLUCION';




   if codigocliente=0 then
   begin
    RAZONSOCIAL:='CONSUMIDOR FINAL';
    DNICUIT:='DOC (OTRO) 0';
    IVACLIENTE:='CONSUMIDOR FINAL';
   end ELSE
       BEGIN
          Form1.FDQuery3.Close;
          Form1.FDQuery3.SQL.Clear;
          Form1.FDQuery3.SQL.Add('SELECT  * FROM TCLIENTES WHERE IDCLIENTE='+INTTOSTR(codigocliente));
          Form1.FDQuery3.Open;

          RAZONSOCIAL:=TRIM(Form1.FDQuery3.FieldByName('APENOM').ASSTRING);
          DNICUIT:=TRIM(Form1.FDQuery3.FieldByName('NRODOC').ASSTRING);
          IVACLIENTE:=TRIM(Form1.FDQuery3.FieldByName('IVA').ASSTRING);
          TIPODOC:=TRIM(Form1.FDQuery3.FieldByName('TIPODOC').ASSTRING);
          if TIPODOC='96' then
          DNICUIT:='DNI '+DNICUIT;
          if TIPODOC='80' then
          DNICUIT:='CUIT '+DNICUIT;
          if TIPODOC='86' then
          DNICUIT:='CUIL '+DNICUIT;
          if TIPODOC='87' then
          DNICUIT:='CDI '+DNICUIT;
          if TIPODOC='89' then
          DNICUIT:='LE '+DNICUIT;
          if TIPODOC='90' then
          DNICUIT:='LC '+DNICUIT;
          if TIPODOC='91' then
          DNICUIT:='CI '+DNICUIT;
          if TIPODOC='92' then
          DNICUIT:='EN TRAMITE '+DNICUIT;
          if TIPODOC='93' then
          DNICUIT:='AC. NAC. '+DNICUIT;
          if TIPODOC='95' then
          DNICUIT:='CI Bs. As. RN '+DNICUIT;
          if TIPODOC='99' then
          DNICUIT:='OTRO DOC '+DNICUIT;




    END;

  {frmpdf.QRLabel24.Caption:=letra;
  frmpdf.QRLabel25.Caption:=cod;
  frmpdf.QRLabel26.Caption:=COMPROBANTE;
   }
  Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT  * FROM TMOVIMIENTOS WHERE IDMOVIMIENTO='+INTTOSTR(idmovi));
  Form1.FDQuery3.Open;
  IDFOMAPAO:=Form1.FDQuery3.FieldByName('IDFORMAPAGO').ASINTEGER;
  NROFAC:=TRIM(Form1.FDQuery3.FieldByName('NROFACTURA').ASSTRING);
  frmDisenioTicketA4.QRLabel27.Caption:=TRIM(Form1.FDQuery3.FieldByName('FECHA').ASSTRING);
  frmDisenioTicketA4.QRLabel28.Caption:=TRIM(Form1.FDQuery3.FieldByName('NROFACTURA').ASSTRING);


  frmDisenioTicketA4.QRLabel3.Caption:='$'+FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.FieldByName('TOTAL').ASSTRING)),FFFIXED,8,2);

   fechaqr:=copy(TRIM(Form1.FDQuery3.FieldByName('FECHA').ASSTRING),7,4)+'-'+copy(TRIM(Form1.FDQuery3.FieldByName('FECHA').ASSTRING),4,2)+'-'+copy(TRIM(Form1.FDQuery3.FieldByName('FECHA').ASSTRING),1,2);








  frmDisenioTicketA4.QRLabel9.Caption:='CLIENTE: '+TRIM(RAZONSOCIAL);




  frmDisenioTicketA4.QRLabel1.Caption:=TRIM(form1.tconfi.GET_FNOMBRE);

  frmDisenioTicketA4.RxMemoryData1.Close;
  frmDisenioTicketA4.RxMemoryData1.Open;
  Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT TA.DESCRIPCION, TI.CANTIDAD,TI.PUNI,TI.PTOTAL,'+
  ' TA.PRECIOVENTA,TI.IVA,TI.POR_IVA FROM TITEM_FACTURA TI,TARTICULOS TA '+
                         ' WHERE TI.IDARTICULO=TA.IDARTICULO '+
                         ' AND TI.IDFACTURA='+INTTOSTR(idmovi));
  Form1.FDQuery3.Open;
  while NOT FORM1.FDQuery3.EOF do
  BEGIN
      frmDisenioTicketA4.RxMemoryData1.Append;

       sumacantidad:=sumacantidad +  STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString));

            frmDisenioTicketA4.RxMemoryData1DESCRIPCION.Value:=TRIM(Form1.FDQuery3.Fields[0].AsString);
            frmDisenioTicketA4.RxMemoryData1PUNITARIO.Value:= FLOATTOSTRF((STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString))/STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString))),FFFIXED,8,2);
            frmDisenioTicketA4.RxMemoryData1IVA.Value:='';
            frmDisenioTicketA4.RxMemoryData1TOTAL.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString)),FFFIXED,8,2);
            frmDisenioTicketA4.RxMemoryData1CANTIDAD.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString)),FFFIXED,8,2);


      frmDisenioTicketA4.RxMemoryData1.Post;
  Form1.FDQuery3.NEXT;
  END;

      ///PROMOCIONES
  Form1.FDQuery3.Close;
  Form1.FDQuery3.SQL.Clear;
  Form1.FDQuery3.SQL.Add('SELECT TA.NOMBRE, TI.CANTIDAD,TI.PUNI,TI.PTOTAL,  '+
 '  TA.PRECIO,TI.IVA,TI.POR_IVA FROM TITEM_FACTURA TI,TPROMOCIONES TA   '+
                      '    WHERE TI.IDARTICULO=TA.IDPROMOCION AND TI.PROMOCION=''S'' '+
                         ' AND TI.IDFACTURA='+INTTOSTR(idmovi));
    Form1.FDQuery3.Open;
   while NOT FORM1.FDQuery3.EOF do
  BEGIN
      frmDisenioTicketA4.RxMemoryData1.Append;

       sumacantidad:=sumacantidad +  STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString));

            frmDisenioTicketA4.RxMemoryData1DESCRIPCION.Value:=TRIM(Form1.FDQuery3.Fields[0].AsString);
            frmDisenioTicketA4.RxMemoryData1PUNITARIO.Value:= FLOATTOSTRF((STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString))/STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString))),FFFIXED,8,2);
            frmDisenioTicketA4.RxMemoryData1IVA.Value:='';
            frmDisenioTicketA4.RxMemoryData1TOTAL.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[3].AsString)),FFFIXED,8,2);
            frmDisenioTicketA4.RxMemoryData1CANTIDAD.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(Form1.FDQuery3.Fields[1].AsString)),FFFIXED,8,2);


      frmDisenioTicketA4.RxMemoryData1.Post;
  Form1.FDQuery3.NEXT;
  END;

     frmDisenioTicketA4.QRLabel5.Caption:='CANT. ARTICULOS: '+floatTOSTR(sumacantidad);


   {forma directorios}
     DIRFAE:=ExtractFilePath(ParamStr(0))+'COMPROBANTES';
     if not DirectoryExists(DIRFAE+'\')=true then
     begin
       CreateDir(DIRFAE);
     end;
     DIRFAE:=DIRFAE+'\';
     fechadir:=fechaqr ;
     fechadir:=stringreplace(fechadir, '-', '',[rfReplaceAll, rfIgnoreCase]);
     DIRFAE:=DIRFAE+fechadir;
     if not DirectoryExists(DIRFAE+'\')=true then
     begin
       CreateDir(DIRFAE);
     end;



  frmDisenioTicketA4.QRPQuickrep1.Prepare;

  if ESPARAENAMIL='N' then
  frmDisenioTicketA4.QRPQuickrep1.Print
  ELSE
    frmDisenioTicketA4.QRPQuickrep1.Preview;

  ARCHIVO:='TICKET_'+NROFAC+'.pdf';

  frmDisenioTicketA4.QRPQuickrep1.Prepare;
  Gpdf := TExportar2PDFSyn.create;
  Gpdf.rutaPDF := DIRFAE+'\'+trim(ARCHIVO);
  Gpdf.exportar2PDF(frmDisenioTicketA4.QRPQuickrep1);
  Gpdf.Free;


  imprimirTICKETA4:=DIRFAE+'\'+trim(ARCHIVO);


  if ESPARAENAMIL='N' then
  BEGIN
    WHILE frmDisenioTicketA4.QRPQuickrep1.QRPrinter.IsPrinting=TRUE DO
    BEGIN
     APPLICATION.ProcessMessages;
    END;
  END;
end;

procedure Tfrmterminar.SpeedButton2Click(Sender: TObject);
begin

CLOSE;
end;

procedure Tfrmterminar.SpeedButton3Click(Sender: TObject);
begin
buscarDatosCliente.Edit1.Clear;
buscarDatosCliente.Edit2.Clear;
buscarDatosCliente.Edit3.Clear;
buscarDatosCliente.Edit4.Clear;
buscarDatosCliente.Edit5.Clear;
buscarDatosCliente.Edit7.Clear;
buscarDatosCliente.CheckBox1.Checked:=FALSe;
buscarDatosCliente.buscaDatos:=true;
buscarDatosCliente.showmodal;
end;

end.
