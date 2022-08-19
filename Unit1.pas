unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, RxMemDS,Class_decimales,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, WSFEV1,
  FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet,TCConfiguracion,INIFILES,DateUtils, Vcl.OleServer,
  Excel2010, Vcl.DBCtrls,Exportar2PDF;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Men1: TMenuItem;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1idarticulo: TIntegerField;
    RxMemoryData1cantidad: TStringField;
    RxMemoryData1descripcion: TStringField;
    RxMemoryData1preciounit: TStringField;
    RxMemoryData1preciototal: TStringField;
    DataSource1: TDataSource;
    terminar1: TMenuItem;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    RxMemoryData1IVA: TStringField;
    FDQuery2: TFDQuery;
    buscar1: TMenuItem;
    Articulos1: TMenuItem;
    N1: TMenuItem;
    Caja1: TMenuItem;
    CierreX1: TMenuItem;
    CierreZ1: TMenuItem;
    AperturadeCaja1: TMenuItem;
    SalidasdeCaja1: TMenuItem;
    Clientes1: TMenuItem;
    FDQuery3: TFDQuery;
    PopupMenu1: TPopupMenu;
    EliminarArticulo1: TMenuItem;
    FDQuery4: TFDQuery;
    IngresosaCaja1: TMenuItem;
    N2: TMenuItem;
    ListadodeMovimientos1: TMenuItem;
    Stock1: TMenuItem;
    Acercade1: TMenuItem;
    Configuracin1: TMenuItem;
    FicherodeClientes1: TMenuItem;
    CuentaCorrientes1: TMenuItem;
    N3: TMenuItem;
    Usuarios1: TMenuItem;
    N4: TMenuItem;
    Proveedores1: TMenuItem;
    Estadsticas1: TMenuItem;
    Proveedores2: TMenuItem;
    ListarArtculosVendidos1: TMenuItem;
    ListarRubromsVendido1: TMenuItem;
    ListarArtculosenReposicin1: TMenuItem;
    N5: TMenuItem;
    AnlisisdeRentabilidad1: TMenuItem;
    N6: TMenuItem;
    Contable1: TMenuItem;
    LibrosIVAVenta1: TMenuItem;
    Compras1: TMenuItem;
    LibroIVACompra1: TMenuItem;
    N7: TMenuItem;
    ListadosdeCompras1: TMenuItem;
    N8: TMenuItem;
    arjetas1: TMenuItem;
    N9: TMenuItem;
    Descuentos1: TMenuItem;
    Inventario1: TMenuItem;
    Marcas1: TMenuItem;
    queryvece: TFDQuery;
    qrylistarrubro: TFDQuery;
    QUERYIVAVENTA: TFDQuery;
    FDQuery5: TFDQuery;
    fdvencimientos: TFDQuery;
    DTSVENDEDOR: TDataSource;
    FDVENDEDOR: TFDQuery;
    Vendedores1: TMenuItem;
    ABMVendedores1: TMenuItem;
    Comisiones1: TMenuItem;
    ListarVentasporfecha1: TMenuItem;
    ListadodeVentasporVen1: TMenuItem;
    N10: TMenuItem;
    BuscaryVerFacturas1: TMenuItem;
    ListadodeClientesDeudores1: TMenuItem;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel6: TPanel;
    DBGrid1: TDBGrid;
    Panel7: TPanel;
    Edit1: TEdit;
    Panel9: TPanel;
    Panel10: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Edit2: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn1: TBitBtn;
    Panel5: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Panel8: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ListadePrecio1: TMenuItem;
    BitBtn4: TBitBtn;
    FDQuery6: TFDQuery;
    FDQuery7: TFDQuery;
    Panel11: TPanel;
    Panel12: TPanel;
    Label8: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    fdQueryListaPrecio: TFDQuery;
    DataSource2: TDataSource;
    AdministrarListasdePrecios1: TMenuItem;
    ImprimirListasdePrecios1: TMenuItem;
    BitBtn5: TBitBtn;
    ActualizarPrecios1: TMenuItem;
    PorProveedor1: TMenuItem;
    Panel13: TPanel;
    Edit3: TEdit;
    Promociones1: TMenuItem;
    RxMemoryData1PROMOCION: TStringField;
    RxMemoryData1ITEM: TIntegerField;
    ImprimirEtiquetas1: TMenuItem;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure terminar1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure buscar1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Articulos1Click(Sender: TObject);
    procedure CierreX1Click(Sender: TObject);
    procedure AperturadeCaja1Click(Sender: TObject);
    procedure CierreZ1Click(Sender: TObject);
    procedure SalidasdeCaja1Click(Sender: TObject);
    procedure EliminarArticulo1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure IngresosaCaja1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ListadodeMovimientos1Click(Sender: TObject);
    procedure Stock1Click(Sender: TObject);
    procedure Acercade1Click(Sender: TObject);
    procedure Configuracin1Click(Sender: TObject);
    procedure FicherodeClientes1Click(Sender: TObject);
    procedure CuentaCorrientes1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Usuarios1Click(Sender: TObject);
    procedure Proveedores2Click(Sender: TObject);
    procedure ListarArtculosVendidos1Click(Sender: TObject);
    procedure ListarArtculosenReposicin1Click(Sender: TObject);
    procedure AnlisisdeRentabilidad1Click(Sender: TObject);
    procedure Compras1Click(Sender: TObject);
    procedure arjetas1Click(Sender: TObject);
    procedure Descuentos1Click(Sender: TObject);
    procedure Inventario1Click(Sender: TObject);
    procedure Marcas1Click(Sender: TObject);
    procedure LibrosIVAVenta1Click(Sender: TObject);
    procedure LibroIVACompra1Click(Sender: TObject);
    procedure ListarRubromsVendido1Click(Sender: TObject);
    procedure ListadosdeCompras1Click(Sender: TObject);
    procedure ABMVendedores1Click(Sender: TObject);
    procedure Comisiones1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ListarVentasporfecha1Click(Sender: TObject);
    procedure ListadodeVentasporVen1Click(Sender: TObject);
    procedure BuscaryVerFacturas1Click(Sender: TObject);
    procedure ListadodeClientesDeudores1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure AdministrarListasdePrecios1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure PorProveedor1Click(Sender: TObject);
    procedure Promociones1Click(Sender: TObject);
    procedure ImprimirEtiquetas1Click(Sender: TObject);
  private
    { Private declarations }
    cantidad:string;
    esPorPrecio:boolean;
    precioIngresado:string;
    suma:real;         sumaCantidad:real;

  public
    { Public declarations }
    PERMISOS: array of INTEGER;

    SOLOTICKET,NRONC:STRING;
    tconfi:TConfig;
    demo:boolean;
        esDevolucion:boolean;
    PUESTO_PC,ESADMINISTRADOR,IDUSUARIOLOGEADO:LONGINT;
     TIPOPAPEL:STRING;
     function  buscrVencimientos(ida:longint):boolean;
    FUNCTION FACTURAELECTRONICA(CODFACTU:LONGINT):BOOLEAN;
    function imrprimeCierrexA4:boolean;
    function imrprimeCierrex58:boolean;
     function imrprimeCierrex80:boolean;
     FUNCTION revisaPermisoTAG(nro:longint):boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Uterminar, UnifrmBuscarARticulos, UnifrmabmArticulos, UnPRPRECIOVARIABLE,
  unicierrexs, UnAPERTURACAJA, UnitFRMCIERRECAJA, Ufrmsalidacaja,
  UnitbuscarDatosCliente, Unit2FRMFECHA, Unit2frmIngresosaCaja,
  Unit2frmclientes, Unit2FRMLISTADOSMOVIMIENTOS, Unit2verStock, Unit2acercade,
  Unit2configuracion, Unitcuentascorrientesclientes, unifrmusuarios,
  Unitfrfiltro, Unitlistarasrticulosvendod3, Unitlistararticulosreposicion3,
  UnitanalisisRentabilidad, Unit3ABMPROVEDORES, Unit4frmcompras,
  Unit4fromtarjetas, Unifmdescuentost4, Unitinventario4, Unit4frmingresologeo,
  UnitMESYANIO, Unit4FRMFECHASDESDEYHASTAS, Unitfrrubromasvendido4,
  Unit4FRMBUSCAFACTPARANC, UniFRMIVAVENTAt4, Unit4altavendedores,
  Unit4buscarcliente, UnitcomisionesVendedores4, Unit4verventas,  UnitfrmConsultarPrecioDescrip,
  Unit4ventaporvendedor, Unitbuscaryverfacturas4, UnilistarClientesDeudorest4,
  UnitREALIZARDEVOLUCIONES4, Unit2FRMDEVOLCUIONESTOTT, Unit2listadeprecio,
  Unit2CONSULTARPRECIO, UnifrmActualizaPrecioporProveedor, ufimformex80,
  Ufrmcierrex58mm2, UnitfrmPromociones2, UnitimprimirEtiquetas;

procedure TForm1.ABMVendedores1Click(Sender: TObject);
begin
if FORM1.ESADMINISTRADOR=2 then
BEGIN
SHOWMESSAGE('NO ERES ADMINISTRADOR');
EXIT;
END ;

altavendedores.FDQuery1.Close;
altavendedores.FDQuery1.SQL.Clear;
altavendedores.FDQuery1.SQL.Add('SELECT IDVENDEDOR,NOMBRE,COMISION FROM TVENDEDORES ORDER BY NOMBRE ASC');
altavendedores.FDQuery1.Open;
altavendedores.showmodal;

SELF.FDVENDEDOR.Close;
SELF.FDVENDEDOR.SQL.Clear;
SELF.FDVENDEDOR.SQL.Add('SELECT IDVENDEDOR, NOMBRE FROM TVENDEDORES ORDER BY NOMBRE ASC');
SELF.fdvENDEDOR.OpeN;

SELF.DBLookupComboBox1.KeyValue:=1;
end;

procedure TForm1.Acercade1Click(Sender: TObject);
begin
acercade.showmodal;
end;

procedure TForm1.AdministrarListasdePrecios1Click(Sender: TObject);
begin
listadeprecio.showmodal;
end;

procedure TForm1.AnlisisdeRentabilidad1Click(Sender: TObject);
begin
   if FORM1.revisaPermisoTAG(AnlisisdeRentabilidad1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;

  analisisRentabilidad.showmodal;
end;

procedure TForm1.AperturadeCaja1Click(Sender: TObject);
begin
   if FORM1.revisaPermisoTAG(AperturadeCaja1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;

SELF.FDQuery2.Close;
SELF.FDQuery2.SQL.Clear;
SELF.FDQuery2.SQL.Add('SELECT * FROM TCAJA WHERE ESTADO=1 AND PC='+INTTOSTR(FORM1.PUESTO_PC));
SELF.FDQuery2.Open;
if SELF.FDQuery2.IsEmpty=FALSE then
BEGIN
     SHOWMESSAGE('YA HAY UNA CAJA ABIERTA.');
     EXIT;

END;
APERTURACAJA.DateTimePicker1.DateTime:=NOW;
APERTURACAJA.Edit1.Clear ;
APERTURACAJA.SHOWMODAL;

end;

procedure TForm1.arjetas1Click(Sender: TObject);
begin
fromtarjetas.showmodal;
end;

procedure TForm1.Articulos1Click(Sender: TObject);
begin

frmABMARticulos.SHOWMODAL;
end;

FUNCTION TForm1.revisaPermisoTAG(nro:longint):boolean;
var i:longint;    sinpermiso:boolean;
begin

if FORM1.ESADMINISTRADOR=1 then
BEGIN
   sinpermiso:=FALSE;
END ELSE
        BEGIN
           sinpermiso:=true;
            for i := 0 to High(permisos) do
            begin
               if permisos[i]=nro then
                   sinpermiso:=false;


            end;
       END;

 revisaPermisoTAG:=sinpermiso;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
var posi,tipoiva,idclienteCC:longint; T,S,P:REAL;  SQL:sTRING;
begin
buscarcliente.esDe:='VENTAS';
buscarcliente.showmodal;
if buscarcliente.ModalResult=MROK then
BEGIN
EDIT2.Text:=TRIM(buscarcliente.DataSource1.DataSet.FieldByName('id').AsString)+' - '+TRIM(buscarcliente.DataSource1.DataSet.FieldByName('cliente').AsString);
idclienteCC:=buscarcliente.DataSource1.DataSet.FieldByName('id').AsINTEGER;
posi:=pos('-',trim(buscarcliente.DataSource1.DataSet.FieldByName('iva').AsString));
frmterminar.tipoivacliente:=strtoint(trim(copy(trim(buscarcliente.DataSource1.DataSet.FieldByName('iva').AsString),0,posi-1)));


t:=0;
p:=0 ;
s:=0;
SQL:='SELECT sum(tm.total),sum(tm.pago) '+
' FROM TMOVIMIENTOS  TM,TCLIENTES TC  '+
' WHERE TM.IDCLIENTE='+inttostr(idclienteCC)+
' AND TM.IDFORMAPAGO=5  '+
' AND TM.TOTAL<>TM.PAGO  '+
' AND TM.IDCLIENTE=TC.IDCLIENTE   '+
' AND CODNC IS NULL   '+
' AND TM.TIPOMOVIMIENTO IN (0,1,2,3) ORDER BY TM.IDMOVIMIENTO ASC ';
 self.FDQuery7.Close;
 self.FDQuery7.SQL.Clear;
 self.FDQuery7.SQL.Add(SQL);
 self.FDQuery7.Open;
 if TRIM(FDQuery7.Fields[0].AsSTRING)='' then
    T:=0
    ELSE
 t:=FDQuery7.Fields[0].AsFloat;

  if TRIM(FDQuery7.Fields[1].AsSTRING)='' then
  P:=0
  ELSE
    p:=FDQuery7.Fields[1].AsFloat;

 s:=t-p;
 if S=0 then
    PANEL11.Visible:=FALSE
   ELSE
     BEGIN
       PANEL11.Visible:=TRUE;
       PANEL11.Caption:='CLIENTE CON SALDO $'+FLOATTOSTR(S);
     END;
END;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  FORM1.RxMemoryData1.Close;
  FORM1.RxMemoryData1.Open;
  FORM1.Label2.Caption:='00.00';
  FORM1.suma:=0;
  LABEL7.Caption:='0';
  esDevolucion:=false;
  sumaCantidad:=0;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var idcliente, idvendedor:longint;  sql:string;    sumaCantidad:real;
begin
FRMDEVOLCUIONESTOTT.SHOWMODAL;
sumaCantidad:=0;
if FRMDEVOLCUIONESTOTT.ModalResult=mrok then
begin
  esDevolucion:=true;
  FRMDEVOLCUIONESTOTT.FDQuery1.Close;
  FRMDEVOLCUIONESTOTT.FDQuery1.SQL.Clear;
  FRMDEVOLCUIONESTOTT.FDQuery1.SQL.Add('select * from tmovimientos where idmovimiento='+inttostr(FRMDEVOLCUIONESTOTT.idfactura));
  FRMDEVOLCUIONESTOTT.FDQuery1.Open;
  label2.Caption:=FRMDEVOLCUIONESTOTT.FDQuery1.FieldByName('total').AsString;
  idcliente:=FRMDEVOLCUIONESTOTT.FDQuery1.FieldByName('idcliente').Asinteger;
  edit3.Text:=inttostr(FRMDEVOLCUIONESTOTT.idfactura);
  FRMDEVOLCUIONESTOTT.FDQuery1.Close;
  FRMDEVOLCUIONESTOTT.FDQuery1.SQL.Clear;
  FRMDEVOLCUIONESTOTT.FDQuery1.SQL.Add('select * from TVENTAS_VENDEDOR where idventa='+inttostr(FRMDEVOLCUIONESTOTT.idfactura));
  FRMDEVOLCUIONESTOTT.FDQuery1.Open;
  self.DBLookupComboBox1.KeyValue:=FRMDEVOLCUIONESTOTT.FDQuery1.FieldByName('idvendedor').Asinteger;

  FRMDEVOLCUIONESTOTT.FDQuery1.Close;
  FRMDEVOLCUIONESTOTT.FDQuery1.SQL.Clear;
  FRMDEVOLCUIONESTOTT.FDQuery1.SQL.Add('select * from tclientes where idcliente='+inttostr(idcliente));
  FRMDEVOLCUIONESTOTT.FDQuery1.Open;
  edit2.Text:=inttostr(idcliente)+' - '+trim(FRMDEVOLCUIONESTOTT.FDQuery1.FieldByName('apenom').AsString);

  form1.RxMemoryData1.Close;
  form1.RxMemoryData1.Open;

  sql:='SELECT TA.DESCRIPCION, TI.CANTIDAD,TI.PUNI,TI.PTOTAL,'+
  ' TA.PRECIOVENTA,TI.IVA,TI.POR_IVA as poriva, ti.idarticulo as tiidarti FROM TITEM_FACTURA TI,TARTICULOS TA '+
                         ' WHERE TI.IDARTICULO=TA.IDARTICULO '+
                         ' AND TI.IDFACTURA='+INTTOSTR(FRMDEVOLCUIONESTOTT.idfactura);
    FRMDEVOLCUIONESTOTT.FDQuery1.Close;
  FRMDEVOLCUIONESTOTT.FDQuery1.SQL.Clear;
  FRMDEVOLCUIONESTOTT.FDQuery1.SQL.Add(sql);
  FRMDEVOLCUIONESTOTT.FDQuery1.Open;
  while not  FRMDEVOLCUIONESTOTT.FDQuery1.Eof do
  begin
      form1.RxMemoryData1.Append;
         form1.RxMemoryData1IVA.Value:=TRIM(FRMDEVOLCUIONESTOTT.FDQuery1.FieldByName('poriva').AsSTRING);
         form1.RxMemoryData1idarticulo.Value:=FRMDEVOLCUIONESTOTT.FDQuery1.FieldByName('tiidarti').ASINTEGER;
         form1.RxMemoryData1cantidad.Value:=FLOATTOSTRF(STRTOFLOAT(TRIM(FRMDEVOLCUIONESTOTT.FDQuery1.Fields[1].AsString)),FFFIXED,8,2);
         form1.RxMemoryData1descripcion.Value:=TRIM(FRMDEVOLCUIONESTOTT.FDQuery1.Fields[0].AsString);
         form1.RxMemoryData1preciounit.Value:=FLOATTOSTRF((STRTOFLOAT(TRIM(FRMDEVOLCUIONESTOTT.FDQuery1.Fields[3].AsString))/STRTOFLOAT(TRIM(FRMDEVOLCUIONESTOTT.FDQuery1.Fields[1].AsString))),FFFIXED,8,2);
         form1.RxMemoryData1preciototal.Value:= FLOATTOSTRF(STRTOFLOAT(TRIM(FRMDEVOLCUIONESTOTT.FDQuery1.Fields[3].AsString)),FFFIXED,8,2);
         form1.RxMemoryData1.Post;

        sumaCantidad:=sumaCantidad + STRTOFLOAT(TRIM(FRMDEVOLCUIONESTOTT.FDQuery1.Fields[1].AsString));



   FRMDEVOLCUIONESTOTT.FDQuery1.Next;
  end;

         LABEL7.Caption:=floatTOSTR(sumaCantidad);


  form1.RxMemoryData1.First;
end else
esDevolucion:=false;


end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
CONSULTARPRECIO.Label2.Caption:='';
CONSULTARPRECIO.Label3.Caption:='';
CONSULTARPRECIO.Label4.Caption:='';
CONSULTARPRECIO.Edit1.Clear;
CONSULTARPRECIO.SHOWMODAL;
end;

procedure TForm1.BitBtn5Click(Sender: TObject);
begin
frmConsultarPrecioDescrip.Edit1.Clear;
frmConsultarPrecioDescrip.FDQuery1.Close;
frmConsultarPrecioDescrip.ShowModal;
if frmConsultarPrecioDescrip.ModalResult=MROK then
BEGIN
EDIT1.SetFocus;
EDIT1.Text:=TRIM(frmConsultarPrecioDescrip.DataSource1.DataSet.FieldByName('CODIGOBARRA').AsString);
end;
end;

procedure TForm1.buscar1Click(Sender: TObject);
begin
SpeedButton2Click(Sender);
end;

procedure TForm1.BuscaryVerFacturas1Click(Sender: TObject);
begin
   if FORM1.revisaPermisoTAG(BuscaryVerFacturas1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;
buscaryverfacturas.FDQuery2.Close;
buscaryverfacturas.FDQuery2.SQL.Clear;
buscaryverfacturas.FDQuery2.SQL.Add('SELECT IDTIPO, DESCRIPCION FROM TIPOMOVIMIENTOS ORDER BY IDTIPO ASC');
buscaryverfacturas.FDQuery2.OpeN;
buscaryverfacturas.Edit1.Clear;
buscaryverfacturas.FDQuery1.Close;

buscaryverfacturas.showmodal;
end;

procedure TForm1.Button1Click(Sender: TObject);
VAR  FA:tfacturae;
BEGIN



end;




FUNCTION TForm1.FACTURAELECTRONICA(CODFACTU:LONGINT):BOOLEAN;
VAR  FA:tfacturae;
CUIT_EMPRESA:STRING;
TIENE_CONEXION_ELECTRONICA:BOOLEAN;
IMPORTE_SIN_IVA:real;
  IMPORTE_IVA:real;
  id_SERVICIO,PTOVTA,TIPOALICUOTA:longint;
  NROCBTEASOC:longint;  ES_FACT:boolean;
  fecha,TIPO_COMPROBANTE,IMPORTEFACTURA:String;
  TIPOCBTE,COMPROYLETRA,letra:String;
  TOTAL_TRIBU:real;
  TOTAL_FACTURA:real;
  punto_vta:longint;
  cbt_desde,archivoPDF:String;
  cbt_hasta:String;
  para_Actualizar_numero,imponeto:String;
  para_Actualizar_compro:String;
  IMP_NETO,imp_trib,imp_op_ex,IVA21:String;
  IMPORTE_SIN_IVA_FL:real;
  IMPORTE_SIN_IVA_S,imp_total:string;
  iibbCaba,iibbprov,imp_tot_conc,IMP_IVA:string;
  F1,fecha_cbte,fecha_venc_pago,fecha_serv_desde,fecha_serv_hasta:string;
  F2,moneda_id,moneda_ctz:string;
  F3:string;  IMPORTE_PARA21_s,IMPRIMIR_COMPROBANTE:String;
  FECHA_FACTURA_IMPRIME:string;perce_iibbCaba:string;
  estadoValidacion:longint;
  TIPODOC,NRODOC:string;      h: HWND;
  TIPOCBTEASOC, PTOVTAASOc:string;
  TASA_IIBB_CABA,  TASA_IIBB_PROV,CONTROL_COMPROBANTE,MODO:String;
    posiNC:LONGINT;   ES_FACTURA_C:BOOLEAN;
    IDCLIENTENC:LONGINT;
begin

form1.FDQuery4.Close;
form1.FDQuery4.SQL.Clear;
form1.FDQuery4.SQL.Add('SELECT modo FROM tconfiguracion WHERE idtabla=1');
form1.FDQuery4.Open;
MODO:=trim(form1.FDQuery4.FieldByName('modo').aSstring);


FACTURAELECTRONICA:=FALSE;
if trim(modo)='P' then
CUIT_EMPRESA:=trim(form1.tconfi.GET_FCUITFACTURA)
ELSE
CUIT_EMPRESA:=trim(form1.tconfi.GET_FCUITFACTURA); //TEST     //30685200143

  FA:=tfacturae.CREATE;
  if fa.Autenticar(MODO,'',trim(form1.tconfi.GET_FCUITFACTURA),trim(form1.tconfi.GET_FCERTIFICADO),trim(form1.tconfi.GET_FLLAVE))=TRUE then
 begin
 TIENE_CONEXION_ELECTRONICA:=TRUE;
       FA.Control_servidores(FA.Token,FA.Sign,MODO,trim(form1.tconfi.GET_FCUITFACTURA));
       IF TRIM(FA.estado_servidor)<>'OK' THEN
         BEGIN
            Application.MessageBox( 'PROBLEMA DEL SERVIDOR DE AFIP.',
           'Acceso denegado', MB_ICONSTOP );
           TIENE_CONEXION_ELECTRONICA:=FALSE;
          EXIT;
         END;
         IF TRIM(FA.Estado_autentica)<>'OK' THEN
         BEGIN
            Application.MessageBox( 'PROBLEMA DEL SERVIDOR DE AUTENTICACION DE AFIP.',
           'Acceso denegado', MB_ICONSTOP );
           TIENE_CONEXION_ELECTRONICA:=FALSE;
          EXIT;
         END;
         IF TRIM(FA.estado_bd)<>'OK' THEN
         BEGIN
            Application.MessageBox( 'PROBLEMA DEL SERVIDOR DE BASE DE DATOS DE AFIP.',
           'Acceso denegado', MB_ICONSTOP );
           TIENE_CONEXION_ELECTRONICA:=FALSE;
          EXIT;
         END;



 end ELSE BEGIN
    Application.MessageBox( 'PROBLEMA DE AUTENTICACION CON AFIP.',
  'Acceso denegado', MB_ICONSTOP );
   TIENE_CONEXION_ELECTRONICA:=FALSE;
 END;

 ES_FACTURA_C:=FALSE;
 form1.FDQuery4.Close;
form1.FDQuery4.SQL.Clear;
form1.FDQuery4.SQL.Add('SELECT  iva from tconfiguracion');
form1.FDQuery4.Open;
if TRIM(form1.FDQuery4.FieldByName('iva').AsString)='MONOTRIBUTO' then
   ES_FACTURA_C:=TRUE;

if TRIM(form1.FDQuery4.FieldByName('iva').AsString)='EXENTO' then
   ES_FACTURA_C:=TRUE;


form1.FDQuery4.Close;
form1.FDQuery4.SQL.Clear;
form1.FDQuery4.SQL.Add('SELECT SUM(PUNI) AS PU, SUM(IVA) AS IV, SUM(PTOTAL) AS PT FROM TITEM_FACTURA WHERE IDFACTURA ='+INTTOSTR(CODFACTU));
form1.FDQuery4.Open;
  imponeto:=trim(form1.FDQuery4.FieldByName('PU').AsString);
  IMPORTEFACTURA:=trim(form1.FDQuery4.FieldByName('PT').AsString);
  IMP_IVA:=trim(form1.FDQuery4.FieldByName('IV').AsString);
 if TIENE_CONEXION_ELECTRONICA=TRUE then
 BEGIN
        IMPORTE_SIN_IVA:=0;
        IMPORTE_IVA:=0;
        fecha:=datetostr(date);
        id_SERVICIO:=2;
        TIPO_COMPROBANTE:='';



        TIPOALICUOTA:=5;
        NROCBTEASOC:=0;


       TOTAL_TRIBU:=0;
       TOTAL_FACTURA:=0;
       if MODO='P' then
         punto_vta:=2
         ELSE
         punto_vta:=1998;

       cbt_desde:='0';
       cbt_hasta:='0';
       para_Actualizar_numero:='1';
       para_Actualizar_compro:='1';
       iibbCaba:='0';
       iibbprov:='0';

       perce_iibbCaba:='0';
       iibbCaba:='0';
       if STRTOFLOAT(iibbCaba) > 0 then
               begin
                 { iibbCaba:=floattostr((STRTOFLOAT(imponeto)*STRTOFLOAT(iibbCaba))/100);
                  iibbCaba:=FLOATTOSTRF(STRTOFLOAT(iibbCaba),FFFIXED,8,2); }
                  TASA_IIBB_CABA:=floattostr((STRTOFLOAT(iibbCaba)*100)/STRTOFLOAT(imponeto));
                  TASA_IIBB_CABA:=FLOATTOSTRF(STRTOFLOAT(TASA_IIBB_CABA),FFFIXED,8,2);
               end ELSE
                   iibbCaba:='0';

            {   if STRTOFLOAT(iibbProv) > 0 then
               begin
                   iibbProv:=floattostr((STRTOFLOAT(imponeto)*STRTOFLOAT(iibbProv))/100);
                    iibbProv:=FLOATTOSTRF(STRTOFLOAT(iibbProv),FFFIXED,8,2);
               end ELSE   }

               iibbProv:='0';




               IMPORTE_SIN_IVA_FL:=STRTOFLOAT(imponeto);//+STRTOFLOAT(iibbProv) + +STRTOFLOAT(iibbCaba);

               IMPORTE_SIN_IVA_S:=FLOATTOSTRF(IMPORTE_SIN_IVA_FL,FFFIXED,8,2);

               imp_total:=FLOATTOSTRF(IMPORTE_SIN_IVA_FL*1.21,FFFIXED,8,2);//'12.10';


               TOTAL_FACTURA:=strtofloat(trim(IMPORTEFACTURA)); //STRTOFLOAT(imp_total)+STRTOFLOAT(iibbProv) + +STRTOFLOAT(iibbCaba);

               imp_total:=FLOATTOSTRF(TOTAL_FACTURA,FFFIXED,8,2);
               TOTAL_TRIBU:= STRTOFLOAT(iibbCaba) + STRTOFLOAT(iibbProv);
               imp_trib:=FLOATTOSTRF(TOTAL_TRIBU,FFFIXED,8,2);
               imp_op_ex:='0.00';

               TOTAL_TRIBU:=STRTOFLOAT(FLOATTOSTRF(TOTAL_TRIBU,FFFIXED,8,2));

             //  IMPORTE_IVA:=STRTOFLOAT(FLOATTOSTRF(IMP_IVA,FFFIXED,8,2));

               IMP_NETO:= StringReplace(TRIM(imponeto), '.', ',',[rfReplaceAll, rfIgnoreCase]);


               imp_tot_conc:='0.00';

              // IMP_IVA:=FLOATTOSTRF(IMPORTE_IVA,FFFIXED,8,2);
               IMP_IVA:= StringReplace(TRIM(IMP_IVA), '.', ',',[rfReplaceAll, rfIgnoreCase]);

                F1:=COPY(trim(fecha),7,4);
                F2:=COPY(trim(fecha),4,2);
                F3:=COPY(trim(fecha),1,2);
                FECHA_FACTURA_IMPRIME:=DATETOSTR(DATE);
                FECHA:=F1+F2+F3;
                DateTimeToString(Fecha, 'yyyymmdd', date);
                fecha_cbte:=trim(fecha);
                fecha_venc_pago:=trim(fecha);
                fecha_serv_desde:=trim(fecha);
                fecha_serv_hasta:=trim(fecha);
                moneda_id := 'PES';
                moneda_ctz := '1.000';
               //IMPORTE_PARA21_s:='504.14';
                IMPORTE_PARA21_s:=IMP_NETO;

               //IVA21:='105.86';
                IVA21:=IMP_IVA;

                imp_total:= StringReplace(TRIM(imp_total), ',', '.',[rfReplaceAll, rfIgnoreCase]);
                IMP_NETO:= StringReplace(TRIM(IMP_NETO), ',', '.',[rfReplaceAll, rfIgnoreCase]);
                IMP_IVA:= StringReplace(TRIM(IMP_IVA), ',', '.',[rfReplaceAll, rfIgnoreCase]);

     if (frmterminar.ComboBox1.ItemIndex=4) OR
        (frmterminar.ComboBox1.ItemIndex=5)
        OR (frmterminar.ComboBox1.ItemIndex=6) THEN
        BEGIN
           posiNC:=pos('-',trim(frmterminar.label7.Caption));
          IDCLIENTENC:=strtoint(trim(copy(trim(frmterminar.label7.Caption),0,posiNC-1)));
          if IDCLIENTENC=0 then
            NRONC:='1'
            ELSE
            BEGIN
              FRMBUSCAFACTPARANC.SHOWMODAL;
              if FRMBUSCAFACTPARANC.ModalResult=MROK then
               NRONC:=TRIM(FRMBUSCAFACTPARANC.Edit1.Text);
            END;
        END;

      if ES_FACTURA_C=TRUE then
      BEGIN
       imp_total := imp_total; // importe con iva
       imp_tot_conc := '0.00'; //IMPORTE_PARA00_s;
       imp_neto := imp_total; // importe sin iva


       imp_op_ex := '0.00';
       IMP_IVA:='0.00';
       IMP_NETO:='0.00';
      END;


     FACTURAELECTRONICA:=FA.procesar_comprobantepANADERIA(CODFACTU,fecha,moneda_id,moneda_ctz,FA.Token,FA.Sign,trim(form1.tconfi.GET_FCUITFACTURA),SELF.FDConnection1,imp_total,imp_neto,imp_iva,MODO,NRONC,ES_FACTURA_C);
     FA.Free;

 END;



end;

procedure TForm1.FicherodeClientes1Click(Sender: TObject);

begin
   if FORM1.revisaPermisoTAG(FicherodeClientes1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;
frmclientes.ShowModal;
end;

procedure TForm1.CierreX1Click(Sender: TObject);
var fecha,archivoEmail,hora:string;    totalventa,totalnc:real;
 Gpdf : TExportar2PDFSyn;
begin
   if FORM1.revisaPermisoTAG(CierreX1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;


   if Trim(form1.TIPOPAPEL)='A4' then
      imrprimeCierrexA4;

    if Trim(form1.TIPOPAPEL)='80' then
      imrprimeCierrex80;

      if Trim(form1.TIPOPAPEL)='58' then
       imrprimeCierrex58;

end;

function TForm1.imrprimeCierrexA4:boolean;
var fecha,archivoEmail,hora:string;    totalventa,totalnc:real;
 Gpdf : TExportar2PDFSyn;
begin
if FORM1.ESADMINISTRADOR=2 then
BEGIN
SHOWMESSAGE('NO ERES ADMINISTRADOR');
EXIT;
END;
cierrex.QRLabel1.Caption:='INFORME X   PUESTO: '+INTTOSTR(FORM1.PUESTO_PC);

FDQuery2.Close;
   FDQuery2.SQL.Clear;
   FDQuery2.SQL.Add('SELECT * FROM TCAJA WHERE estado=1 AND PC='+INTTOSTR(FORM1.PUESTO_PC)+' order by idcaja desc');
   FDQuery2.Open;


   fecha:= FDQuery2.FieldByName('fecha').AsString;
   if trim(fecha)='' then
    FRMFECHA.DateTimePicker1.DateTime:=now
    else
   FRMFECHA.DateTimePicker1.DateTime:=STRTODATE(fecha);
  FRMFECHA.showmodal;
  if FRMFECHA.ModalResult=mrcancel then
     exit;

     fecha:= trim(datetostr(FRMFECHA.DateTimePicker1.DateTime));

     totalventa:=0;
     totalnc:=0;
  { FDQuery2.Close;
   FDQuery2.SQL.Clear;
   FDQuery2.SQL.Add('SELECT * FROM TCAJA WHERE estado=1 order by idcaja desc');
   FDQuery2.Open;
   fecha:= FDQuery2.FieldByName('fecha').AsString;  }
 cierrex.RxMemoryData1.Close;
 cierrex.RxMemoryData1.Open;
self.FDQuery2.Close;
self.FDQuery2.SQL.Clear;
self.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where  tipomovimiento in (0,1,2,3) and fecha='+#39+trim(fecha)+#39+' and cierre=0 AND PC='+INTTOSTR(FORM1.PUESTO_PC));  //' and cierre=0'
self.FDQuery2.Open;
cierrex.QRLabel2.Caption:='FECHA: '+FECHA;
if trim(self.FDQuery2.FieldByName('F').asstring)='' then
   totalventa:=0
   else
totalventa:=self.FDQuery2.FieldByName('F').asfloat;


//ncself.FDQuery2.Close;
self.FDQuery2.SQL.Clear;
self.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where  tipomovimiento in (4,5,6,7) and fecha='+#39+trim(fecha)+#39+' and cierre=0 AND PC='+INTTOSTR(FORM1.PUESTO_PC));  //' and cierre=0'
self.FDQuery2.Open;
if trim(self.FDQuery2.FieldByName('F').asstring)='' then
   totalnc:=0
   else
totalnc:=self.FDQuery2.FieldByName('F').asfloat;

cierrex.QRLabel5.Caption:='TOTAL :$ '+floattostr(totalventa-totalnc) ;

self.FDQuery2.Close;
self.FDQuery2.SQL.Clear;
self.FDQuery2.SQL.Add('select COUNT(*) AS F from tmovimientos where fecha='+#39+trim(fecha)+#39+' and cierre=0 AND PC='+INTTOSTR(FORM1.PUESTO_PC));
self.FDQuery2.Open;
cierrex.QRLabel4.Caption:='CANT : '+self.FDQuery2.FieldByName('F').AsString ;


//forma pago
cierrex.RxMemoryData1.Append;
cierrex.RxMemoryData1forma.Value:='--- POR FORMAS DE PAGOS ----';
cierrex.RxMemoryData1.Post;

 self.FDQuery2.Close;
self.FDQuery2.SQL.Clear;
self.FDQuery2.SQL.Add('select TF.DESCRIPCION, COUNT(TM.IDMOVIMIENTO) AS F,SUM(Tf.importe) AS S  '+
' from tmovimientos TM  ,TFORMAPAGOS_FACTURAS TF   '+
' where TM.fecha='+#39+trim(fecha)+#39' and TM.IDMOVIMIENTO=tf.IDMOVIMIENTO   AND TM.TIPOMOVIMIENTO IN (0,1,2,3)   '+
' and tm.cierre=0  AND TM.PC='+INTTOSTR(FORM1.PUESTO_PC)+
' GROUP BY  TF.IDFORMA   order by   TF.DESCRIPCION asc');
self.FDQuery2.Open;
while not self.FDQuery2.Eof do
begin
    cierrex.RxMemoryData1.Append;
    cierrex.RxMemoryData1forma.Value:=trim(FDQuery2.Fields[0].asstring);
    cierrex.RxMemoryData1cantidad.Value:=trim(FDQuery2.Fields[1].asstring);
    cierrex.RxMemoryData1total.Value:=trim(FDQuery2.Fields[2].asstring);
    cierrex.RxMemoryData1.Post;
self.FDQuery2.Next;
end;



 ///POR COMPROBANTES
 ///
 ///
 ///
 ///
 ///
 cierrex.RxMemoryData1.Append;
cierrex.RxMemoryData1forma.Value:='----- POR COMPROBANTES VENTAS -----';
cierrex.RxMemoryData1.Post;
 self.FDQuery2.Close;
self.FDQuery2.SQL.Clear;
self.FDQuery2.SQL.Add('select CASE TM.TIPOMOVIMIENTO   '+
 ' WHEN 0 THEN ''TICKET''  '+
 ' WHEN 1 THEN ''FACT A''  '+
 ' WHEN 2 THEN ''FACT B''  '+
 ' WHEN 3 THEN ''FACT C''  '+
' ELSE ''DESCONOCIDO'' END AS TIPO   '+
' , TF.DESCRIPCION, COUNT(TM.IDMOVIMIENTO) AS F,SUM(Tf.importe) AS S   '+
' from tmovimientos TM  ,TFORMAPAGOS_FACTURAS TF    '+
' where TM.fecha='+#39+trim(fecha)+#39' AND TM.IDmovimiento=TF.IDmovimiento and tm.cierre=0  AND TM.PC='+INTTOSTR(FORM1.PUESTO_PC)+
' AND TM.TIPOMOVIMIENTO IN (0,1,2,3)  '+
' GROUP BY TM.TIPOMOVIMIENTO, TF.IDFORMA   order  BY TM.TIPOMOVIMIENTO,  TF.DESCRIPCION asc   ');
self.FDQuery2.Open;
while not self.FDQuery2.Eof do
begin
    cierrex.RxMemoryData1.Append;
    cierrex.RxMemoryData1forma.Value:=trim(FDQuery2.Fields[0].asstring)+'  '+trim(FDQuery2.Fields[1].asstring);
    cierrex.RxMemoryData1cantidad.Value:=trim(FDQuery2.Fields[2].asstring);
    cierrex.RxMemoryData1total.Value:=trim(FDQuery2.Fields[3].asstring);
    cierrex.RxMemoryData1.Post;
self.FDQuery2.Next;
end;

cierrex.RxMemoryData1.Append;
cierrex.RxMemoryData1forma.Value:='';
cierrex.RxMemoryData1.Post;
cierrex.RxMemoryData1.Append;
cierrex.RxMemoryData1forma.Value:='----- POR NOTAS DE CREDITOS -----';
cierrex.RxMemoryData1.Post;
 self.FDQuery2.Close;
self.FDQuery2.SQL.Clear;
self.FDQuery2.SQL.Add('select CASE TM.TIPOMOVIMIENTO '+
 ' WHEN 4 THEN ''NC TICKET''  '+
 ' WHEN 5 THEN ''NC FACT A''  '+
 ' WHEN 6 THEN ''NC FACT B''   '+
 ' WHEN 7 THEN ''NC FACT C''   '+
' ELSE ''DESCONOCIDO'' END AS TIPO   '+
' , TF.DESCRIPCION, COUNT(TM.IDMOVIMIENTO) AS F,SUM(Tf.importe) AS S   '+
' from tmovimientos TM  ,TFORMAPAGOS_FACTURAS TF   '+
' where TM.fecha='+#39+trim(fecha)+#39' AND TM.IDmovimiento=TF.IDmovimiento   and tm.cierre=0   AND TM.PC='+INTTOSTR(FORM1.PUESTO_PC)+
' AND TM.TIPOMOVIMIENTO IN (4,5,6,7) '+
' GROUP BY TM.TIPOMOVIMIENTO, TF.IDFORMA   order  BY TM.TIPOMOVIMIENTO,  TF.DESCRIPCION asc');
self.FDQuery2.Open;
while not self.FDQuery2.Eof do
begin
    cierrex.RxMemoryData1.Append;
    cierrex.RxMemoryData1forma.Value:=trim(FDQuery2.Fields[0].asstring)+'  '+trim(FDQuery2.Fields[1].asstring);
    cierrex.RxMemoryData1cantidad.Value:=trim(FDQuery2.Fields[2].asstring);
    cierrex.RxMemoryData1total.Value:=trim(FDQuery2.Fields[3].asstring);
    cierrex.RxMemoryData1.Post;
self.FDQuery2.Next;
end;


cierrex.QRPQuickrep1.Prepare;
  hora:=timetostr(time);
 hora:=StringReplace (hora, ':', '_',[rfReplaceAll, rfIgnoreCase]);
 fecha:=StringReplace (fecha, '/', '',[rfReplaceAll, rfIgnoreCase]);
 archivoEmail := ExtractFilePath(ParamStr(0))+'\INFORMES\informeX_dia_'+fecha+'_hora_'+hora+'.pdf';

;
    Gpdf := TExportar2PDFSyn.Create;
    Gpdf.rutaPDF := archivoEmail;
    Gpdf.Exportar2PDF(cierrex.QRPQuickrep1);
    Gpdf.free;


{if form1.demo=false then
cierrex.QRPQuickrep1.Print
else   }
cierrex.QRPQuickrep1.Preview;

end;


function TForm1.imrprimeCierrex80:boolean;
var fecha,archivoEmail,hora:string;    totalventa,totalnc:real;
 Gpdf : TExportar2PDFSyn;
begin
if FORM1.ESADMINISTRADOR=2 then
BEGIN
SHOWMESSAGE('NO ERES ADMINISTRADOR');
EXIT;
END;

 frminformex80.QRLabel1.Caption:='INFORME X    PUESTO: '+INTTOSTR(FORM1.PUESTO_PC);
FDQuery2.Close;
   FDQuery2.SQL.Clear;
   FDQuery2.SQL.Add('SELECT * FROM TCAJA WHERE estado=1 AND PC='+INTTOSTR(FORM1.PUESTO_PC)+' order by idcaja desc');
   FDQuery2.Open;


   fecha:= FDQuery2.FieldByName('fecha').AsString;
   if trim(fecha)='' then
    FRMFECHA.DateTimePicker1.DateTime:=now
    else
   FRMFECHA.DateTimePicker1.DateTime:=STRTODATE(fecha);
  FRMFECHA.showmodal;
  if FRMFECHA.ModalResult=mrcancel then
     exit;

     fecha:= trim(datetostr(FRMFECHA.DateTimePicker1.DateTime));

     totalventa:=0;
     totalnc:=0;
  { FDQuery2.Close;
   FDQuery2.SQL.Clear;
   FDQuery2.SQL.Add('SELECT * FROM TCAJA WHERE estado=1 order by idcaja desc');
   FDQuery2.Open;
   fecha:= FDQuery2.FieldByName('fecha').AsString;  }
 frminformex80.RxMemoryData1.Close;
 frminformex80.RxMemoryData1.Open;
self.FDQuery2.Close;
self.FDQuery2.SQL.Clear;
self.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where  tipomovimiento in (0,1,2,3) and fecha='+#39+trim(fecha)+#39+' and cierre=0 AND PC='+INTTOSTR(FORM1.PUESTO_PC));  //' and cierre=0'
self.FDQuery2.Open;
frminformex80.QRLabel2.Caption:='FECHA: '+FECHA;
if trim(self.FDQuery2.FieldByName('F').asstring)='' then
   totalventa:=0
   else
totalventa:=self.FDQuery2.FieldByName('F').asfloat;


//ncself.FDQuery2.Close;
self.FDQuery2.SQL.Clear;
self.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where  tipomovimiento in (4,5,6,7) and fecha='+#39+trim(fecha)+#39+' and cierre=0 AND PC='+INTTOSTR(FORM1.PUESTO_PC));  //' and cierre=0'
self.FDQuery2.Open;
if trim(self.FDQuery2.FieldByName('F').asstring)='' then
   totalnc:=0
   else
totalnc:=self.FDQuery2.FieldByName('F').asfloat;

frminformex80.QRLabel5.Caption:='TOTAL :$ '+floattostr(totalventa-totalnc) ;

self.FDQuery2.Close;
self.FDQuery2.SQL.Clear;
self.FDQuery2.SQL.Add('select COUNT(*) AS F from tmovimientos where fecha='+#39+trim(fecha)+#39+' and cierre=0 AND PC='+INTTOSTR(FORM1.PUESTO_PC));
self.FDQuery2.Open;
frminformex80.QRLabel4.Caption:='CANT : '+self.FDQuery2.FieldByName('F').AsString ;


//forma pago
frminformex80.RxMemoryData1.Append;
frminformex80.RxMemoryData1forma.Value:='--- POR FORMAS DE PAGOS ----';
frminformex80.RxMemoryData1.Post;

 self.FDQuery2.Close;
self.FDQuery2.SQL.Clear;
self.FDQuery2.SQL.Add('select TF.DESCRIPCION, COUNT(TM.IDMOVIMIENTO) AS F,SUM(Tf.importe) AS S  '+
' from tmovimientos TM  ,TFORMAPAGOS_FACTURAS TF   '+
' where TM.fecha='+#39+trim(fecha)+#39' and TM.IDMOVIMIENTO=tf.IDMOVIMIENTO   AND TM.TIPOMOVIMIENTO IN (0,1,2,3)   '+
' and tm.cierre=0  AND PC='+INTTOSTR(FORM1.PUESTO_PC)+
' GROUP BY  TF.IDFORMA   order by   TF.DESCRIPCION asc');
self.FDQuery2.Open;
while not self.FDQuery2.Eof do
begin
    frminformex80.RxMemoryData1.Append;
    frminformex80.RxMemoryData1forma.Value:=trim(FDQuery2.Fields[0].asstring);
    frminformex80.RxMemoryData1cantidad.Value:=trim(FDQuery2.Fields[1].asstring);
    frminformex80.RxMemoryData1total.Value:=trim(FDQuery2.Fields[2].asstring);
    frminformex80.RxMemoryData1.Post;

    frminformex80.QRPQuickrep1.Page.Length:=frminformex80.QRPQuickrep1.Page.Length + 20;
self.FDQuery2.Next;
end;



 ///POR COMPROBANTES
 ///
 ///
 ///
 ///
 ///
 frminformex80.RxMemoryData1.Append;
frminformex80.RxMemoryData1forma.Value:='----- POR COMPROBANTES VENTAS -----';
frminformex80.RxMemoryData1.Post;
 self.FDQuery2.Close;
self.FDQuery2.SQL.Clear;
self.FDQuery2.SQL.Add('select CASE TM.TIPOMOVIMIENTO   '+
 ' WHEN 0 THEN ''TICKET''  '+
 ' WHEN 1 THEN ''FACT A''  '+
 ' WHEN 2 THEN ''FACT B''  '+
 ' WHEN 3 THEN ''FACT C''  '+
' ELSE ''DESCONOCIDO'' END AS TIPO   '+
' , TF.DESCRIPCION, COUNT(TM.IDMOVIMIENTO) AS F,SUM(Tf.importe) AS S   '+
' from tmovimientos TM  ,TFORMAPAGOS_FACTURAS TF    '+
' where TM.fecha='+#39+trim(fecha)+#39' AND TM.IDmovimiento=TF.IDmovimiento and tm.cierre=0  AND PC='+INTTOSTR(FORM1.PUESTO_PC)+
 ' AND TM.TIPOMOVIMIENTO IN (0,1,2,3)  '+
' GROUP BY TM.TIPOMOVIMIENTO, TF.IDFORMA   order  BY TM.TIPOMOVIMIENTO,  TF.DESCRIPCION asc   ');
self.FDQuery2.Open;
while not self.FDQuery2.Eof do
begin
    frminformex80.RxMemoryData1.Append;
    frminformex80.RxMemoryData1forma.Value:=trim(FDQuery2.Fields[0].asstring)+'  '+trim(FDQuery2.Fields[1].asstring);
    frminformex80.RxMemoryData1cantidad.Value:=trim(FDQuery2.Fields[2].asstring);
    frminformex80.RxMemoryData1total.Value:=trim(FDQuery2.Fields[3].asstring);
    frminformex80.RxMemoryData1.Post;
     frminformex80.QRPQuickrep1.Page.Length:=frminformex80.QRPQuickrep1.Page.Length + 20;
self.FDQuery2.Next;
end;

frminformex80.RxMemoryData1.Append;
frminformex80.RxMemoryData1forma.Value:='';
frminformex80.RxMemoryData1.Post;
frminformex80.RxMemoryData1.Append;
frminformex80.RxMemoryData1forma.Value:='----- POR NOTAS DE CREDITOS -----';
frminformex80.RxMemoryData1.Post;
 self.FDQuery2.Close;
self.FDQuery2.SQL.Clear;
self.FDQuery2.SQL.Add('select CASE TM.TIPOMOVIMIENTO '+
 ' WHEN 4 THEN ''NC TICKET''  '+
 ' WHEN 5 THEN ''NC FACT A''  '+
 ' WHEN 6 THEN ''NC FACT B''   '+
 ' WHEN 7 THEN ''NC FACT C''   '+
' ELSE ''DESCONOCIDO'' END AS TIPO   '+
' , TF.DESCRIPCION, COUNT(TM.IDMOVIMIENTO) AS F,SUM(Tf.importe) AS S   '+
' from tmovimientos TM  ,TFORMAPAGOS_FACTURAS TF   '+
' where TM.fecha='+#39+trim(fecha)+#39' AND TM.IDmovimiento=TF.IDmovimiento and tm.cierre=0  AND PC='+INTTOSTR(FORM1.PUESTO_PC)+
 '  AND TM.TIPOMOVIMIENTO IN (4,5,6,7) '+
' GROUP BY TM.TIPOMOVIMIENTO, TF.IDFORMA   order  BY TM.TIPOMOVIMIENTO,  TF.DESCRIPCION asc');
self.FDQuery2.Open;
while not self.FDQuery2.Eof do
begin
    frminformex80.RxMemoryData1.Append;
    frminformex80.RxMemoryData1forma.Value:=trim(FDQuery2.Fields[0].asstring)+'  '+trim(FDQuery2.Fields[1].asstring);
    frminformex80.RxMemoryData1cantidad.Value:=trim(FDQuery2.Fields[2].asstring);
    frminformex80.RxMemoryData1total.Value:=trim(FDQuery2.Fields[3].asstring);
    frminformex80.RxMemoryData1.Post;
     frminformex80.QRPQuickrep1.Page.Length:=frminformex80.QRPQuickrep1.Page.Length + 20;
self.FDQuery2.Next;
end;

      frminformex80.QRPQuickrep1.Page.Length:= frminformex80.QRPQuickrep1.Page.Length + 20;
frminformex80.QRPQuickrep1.Prepare;
  hora:=timetostr(time);
 hora:=StringReplace (hora, ':', '_',[rfReplaceAll, rfIgnoreCase]);
 fecha:=StringReplace (fecha, '/', '',[rfReplaceAll, rfIgnoreCase]);
 archivoEmail := ExtractFilePath(ParamStr(0))+'\INFORMES\informeX_dia_'+fecha+'_hora_'+hora+'.pdf';

;
    Gpdf := TExportar2PDFSyn.Create;
    Gpdf.rutaPDF := archivoEmail;
    Gpdf.Exportar2PDF(frminformex80.QRPQuickrep1);
    Gpdf.free;


{if form1.demo=false then
cierrex.QRPQuickrep1.Print
else   }
frminformex80.QRPQuickrep1.Print;

end;

function TForm1.imrprimeCierrex58:boolean;
var fecha,archivoEmail,hora:string;    totalventa,totalnc:real;
 Gpdf : TExportar2PDFSyn;
begin
if FORM1.ESADMINISTRADOR=2 then
BEGIN
SHOWMESSAGE('NO ERES ADMINISTRADOR');
EXIT;
END;

  frmcierrex58mm.QRLabel1.Caption:='INFORME X  PUESTO '+INTTOSTR(FORM1.PUESTO_PC);
FDQuery2.Close;
   FDQuery2.SQL.Clear;
   FDQuery2.SQL.Add('SELECT * FROM TCAJA WHERE estado=1  AND PC='+INTTOSTR(FORM1.PUESTO_PC)+' order by idcaja desc');
   FDQuery2.Open;


   fecha:= FDQuery2.FieldByName('fecha').AsString;
   if trim(fecha)='' then
    FRMFECHA.DateTimePicker1.DateTime:=now
    else
   FRMFECHA.DateTimePicker1.DateTime:=STRTODATE(fecha);
  FRMFECHA.showmodal;
  if FRMFECHA.ModalResult=mrcancel then
     exit;

     fecha:= trim(datetostr(FRMFECHA.DateTimePicker1.DateTime));

     totalventa:=0;
     totalnc:=0;
  { FDQuery2.Close;
   FDQuery2.SQL.Clear;
   FDQuery2.SQL.Add('SELECT * FROM TCAJA WHERE estado=1 order by idcaja desc');
   FDQuery2.Open;
   fecha:= FDQuery2.FieldByName('fecha').AsString;  }
 frmcierrex58mm.RxMemoryData1.Close;
 frmcierrex58mm.RxMemoryData1.Open;
self.FDQuery2.Close;
self.FDQuery2.SQL.Clear;
self.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where   tipomovimiento in (0,1,2,3) and fecha='+#39+trim(fecha)+#39+' and cierre=0 AND PC='+INTTOSTR(FORM1.PUESTO_PC));  //' and cierre=0'
self.FDQuery2.Open;
frmcierrex58mm.QRLabel2.Caption:='FECHA: '+FECHA+ '  '+timetostr(time);
if trim(self.FDQuery2.FieldByName('F').asstring)='' then
   totalventa:=0
   else
totalventa:=self.FDQuery2.FieldByName('F').asfloat;


//ncself.FDQuery2.Close;
self.FDQuery2.SQL.Clear;
self.FDQuery2.SQL.Add('select SUM(TOTAL) AS F from tmovimientos where  tipomovimiento in (4,5,6,7) and fecha='+#39+trim(fecha)+#39+' and cierre=0 AND PC='+INTTOSTR(FORM1.PUESTO_PC));  //' and cierre=0'
self.FDQuery2.Open;
if trim(self.FDQuery2.FieldByName('F').asstring)='' then
   totalnc:=0
   else
totalnc:=self.FDQuery2.FieldByName('F').asfloat;

frmcierrex58mm.QRLabel5.Caption:='TOTAL :$ '+floattostr(totalventa-totalnc) ;

self.FDQuery2.Close;
self.FDQuery2.SQL.Clear;
self.FDQuery2.SQL.Add('select COUNT(*) AS F from tmovimientos where fecha='+#39+trim(fecha)+#39+' and cierre=0 AND PC='+INTTOSTR(FORM1.PUESTO_PC));
self.FDQuery2.Open;
frmcierrex58mm.QRLabel4.Caption:='CANT : '+self.FDQuery2.FieldByName('F').AsString ;


//forma pago
frmcierrex58mm.RxMemoryData1.Append;
frmcierrex58mm.RxMemoryData1forma.Value:='--- POR FORMAS DE PAGOS ----';
frmcierrex58mm.RxMemoryData1.Post;

 self.FDQuery2.Close;
self.FDQuery2.SQL.Clear;
self.FDQuery2.SQL.Add('select TF.DESCRIPCION, COUNT(TM.IDMOVIMIENTO) AS F,SUM(Tf.importe) AS S  '+
' from tmovimientos TM  ,TFORMAPAGOS_FACTURAS TF   '+
' where TM.fecha='+#39+trim(fecha)+#39' and TM.IDMOVIMIENTO=tf.IDMOVIMIENTO   AND TM.TIPOMOVIMIENTO IN (0,1,2,3)   '+
' and tm.cierre=0   AND TM.PC='+INTTOSTR(FORM1.PUESTO_PC)+
' GROUP BY  TF.IDFORMA   order by   TF.DESCRIPCION asc');
self.FDQuery2.Open;
while not self.FDQuery2.Eof do
begin
    frmcierrex58mm.RxMemoryData1.Append;
    frmcierrex58mm.RxMemoryData1forma.Value:=trim(FDQuery2.Fields[0].asstring);
    frmcierrex58mm.RxMemoryData1cantidad.Value:=trim(FDQuery2.Fields[1].asstring);
    frmcierrex58mm.RxMemoryData1total.Value:=trim(FDQuery2.Fields[2].asstring);
    frmcierrex58mm.RxMemoryData1.Post;
        frmcierrex58mm.QRPQuickrep1.Page.Length:= frmcierrex58mm.QRPQuickrep1.Page.Length + 20;
self.FDQuery2.Next;
end;



 ///POR COMPROBANTES
 ///
 ///
 ///
 ///
 ///
 frmcierrex58mm.RxMemoryData1.Append;
frmcierrex58mm.RxMemoryData1forma.Value:='----- POR COMPROBANTES VENTAS -----';
frmcierrex58mm.RxMemoryData1.Post;
 self.FDQuery2.Close;
self.FDQuery2.SQL.Clear;
self.FDQuery2.SQL.Add('select CASE TM.TIPOMOVIMIENTO   '+
 ' WHEN 0 THEN ''TICKET''  '+
 ' WHEN 1 THEN ''FACT A''  '+
 ' WHEN 2 THEN ''FACT B''  '+
 ' WHEN 3 THEN ''FACT C''  '+
' ELSE ''DESCONOCIDO'' END AS TIPO   '+
' , TF.DESCRIPCION, COUNT(TM.IDMOVIMIENTO) AS F,SUM(Tf.importe) AS S   '+
' from tmovimientos TM  ,TFORMAPAGOS_FACTURAS TF    '+
' where TM.fecha='+#39+trim(fecha)+#39' AND TM.IDmovimiento=TF.IDmovimiento and tm.cierre=0 AND TM.PC='+INTTOSTR(FORM1.PUESTO_PC)+
 ' AND TM.TIPOMOVIMIENTO IN (0,1,2,3)  '+
' GROUP BY TM.TIPOMOVIMIENTO, TF.IDFORMA   order  BY TM.TIPOMOVIMIENTO,  TF.DESCRIPCION asc   ');
self.FDQuery2.Open;
while not self.FDQuery2.Eof do
begin
    frmcierrex58mm.RxMemoryData1.Append;
    frmcierrex58mm.RxMemoryData1forma.Value:=trim(FDQuery2.Fields[0].asstring)+'  '+trim(FDQuery2.Fields[1].asstring);
    frmcierrex58mm.RxMemoryData1cantidad.Value:=trim(FDQuery2.Fields[2].asstring);
    frmcierrex58mm.RxMemoryData1total.Value:=trim(FDQuery2.Fields[3].asstring);
    frmcierrex58mm.RxMemoryData1.Post;
        frmcierrex58mm.QRPQuickrep1.Page.Length:= frmcierrex58mm.QRPQuickrep1.Page.Length + 20;
self.FDQuery2.Next;
end;

frmcierrex58mm.RxMemoryData1.Append;
frmcierrex58mm.RxMemoryData1forma.Value:='';
frmcierrex58mm.RxMemoryData1.Post;
frmcierrex58mm.RxMemoryData1.Append;
frmcierrex58mm.RxMemoryData1forma.Value:='----- POR NOTAS DE CREDITOS -----';
frmcierrex58mm.RxMemoryData1.Post;
 self.FDQuery2.Close;
self.FDQuery2.SQL.Clear;
self.FDQuery2.SQL.Add('select CASE TM.TIPOMOVIMIENTO '+
 ' WHEN 4 THEN ''NC TICKET''  '+
 ' WHEN 5 THEN ''NC FACT A''  '+
 ' WHEN 6 THEN ''NC FACT B''   '+
 ' WHEN 7 THEN ''NC FACT C''   '+
' ELSE ''DESCONOCIDO'' END AS TIPO   '+
' , TF.DESCRIPCION, COUNT(TM.IDMOVIMIENTO) AS F,SUM(Tf.importe) AS S   '+
' from tmovimientos TM  ,TFORMAPAGOS_FACTURAS TF   '+
' where TM.fecha='+#39+trim(fecha)+#39' AND TM.IDmovimiento=TF.IDmovimiento and tm.cierre=0 AND TM.PC='+INTTOSTR(FORM1.PUESTO_PC)+
'  AND TM.TIPOMOVIMIENTO IN (4,5,6,7) '+
' GROUP BY TM.TIPOMOVIMIENTO, TF.IDFORMA   order  BY TM.TIPOMOVIMIENTO,  TF.DESCRIPCION asc');
self.FDQuery2.Open;
while not self.FDQuery2.Eof do
begin
    frmcierrex58mm.RxMemoryData1.Append;
    frmcierrex58mm.RxMemoryData1forma.Value:=trim(FDQuery2.Fields[0].asstring)+'  '+trim(FDQuery2.Fields[1].asstring);
    frmcierrex58mm.RxMemoryData1cantidad.Value:=trim(FDQuery2.Fields[2].asstring);
    frmcierrex58mm.RxMemoryData1total.Value:=trim(FDQuery2.Fields[3].asstring);
    frmcierrex58mm.RxMemoryData1.Post;
    frmcierrex58mm.QRPQuickrep1.Page.Length:= frmcierrex58mm.QRPQuickrep1.Page.Length + 20;
self.FDQuery2.Next;
end;

    frmcierrex58mm.QRPQuickrep1.Page.Length:= frmcierrex58mm.QRPQuickrep1.Page.Length + 20;
frmcierrex58mm.QRPQuickrep1.Prepare;
  hora:=timetostr(time);
 hora:=StringReplace (hora, ':', '_',[rfReplaceAll, rfIgnoreCase]);
 fecha:=StringReplace (fecha, '/', '',[rfReplaceAll, rfIgnoreCase]);
 archivoEmail := ExtractFilePath(ParamStr(0))+'\INFORMES\informeX_dia_'+fecha+'_hora_'+hora+'.pdf';

;
    Gpdf := TExportar2PDFSyn.Create;
    Gpdf.rutaPDF := archivoEmail;
    Gpdf.Exportar2PDF(frmcierrex58mm.QRPQuickrep1);
    Gpdf.free;


{if form1.demo=false then
cierrex.QRPQuickrep1.Print
else   }
frmcierrex58mm.QRPQuickrep1.Print;

end;

procedure TForm1.CierreZ1Click(Sender: TObject);
VAR FECHA:sTRING;
begin
   if FORM1.revisaPermisoTAG(CierreZ1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;



SELF.FDQuery2.Close;
SELF.FDQuery2.SQL.Clear;
SELF.FDQuery2.SQL.Add('SELECT * FROM TCAJA WHERE ESTADO=1 and pc='+inttostr(form1.PUESTO_PC));
SELF.FDQuery2.Open;
if SELF.FDQuery2.RecordCount=0 then
BEGIN
     SHOWMESSAGE('NO HAY UNA CAJA ABIERTA.');
     EXIT;

END;

   FDQuery2.Close;
   FDQuery2.SQL.Clear;
   FDQuery2.SQL.Add('SELECT * FROM TCAJA WHERE estado=1 and pc='+inttostr(form1.PUESTO_PC)+' order by idcaja desc');
   FDQuery2.Open;
   fecha:= FDQuery2.FieldByName('fecha').AsString;
   FRMCIERRECAJA.Edit1.Text:=FECHA;
   FRMCIERRECAJA.Edit2.Clear;
   FRMCIERRECAJA.ShowModal;
end;

procedure TForm1.Comisiones1Click(Sender: TObject);
begin
if FORM1.ESADMINISTRADOR=2 then
BEGIN
SHOWMESSAGE('NO ERES ADMINISTRADOR');
EXIT;
END ;
comisionesVendedores.Edit1.Clear;
comisionesVendedores.Edit2.Clear;
comisionesVendedores.Edit4.Clear;
comisionesVendedores.DateTimePicker1.DateTime:=NOW;
comisionesVendedores.DateTimePicker2.DateTime:=NOW;

comisionesVendedores.FDVENDEDOR.Close;
comisionesVendedores.FDVENDEDOR.SQL.Clear;
comisionesVendedores.FDVENDEDOR.SQL.Add('SELECT IDVENDEDOR, NOMBRE FROM TVENDEDORES ORDER BY NOMBRE ASC');
comisionesVendedores.fdvENDEDOR.OpeN;


comisionesVendedores.showmodal;
end;

procedure TForm1.Compras1Click(Sender: TObject);
begin
   if FORM1.revisaPermisoTAG(Compras1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;
frmcompras.showmodal;
end;

procedure TForm1.Configuracin1Click(Sender: TObject);
begin
if FORM1.ESADMINISTRADOR=2 then
BEGIN
SHOWMESSAGE('NO ERES ADMINISTRADOR');
EXIT;
END;
configuracion.showmodal ;
tconfi.GetDatos(FORM1.PUESTO_PC);
   SOLOTICKET:=tconfi.GET_FSOLOTICKET;
  form1.CAPTION:=tconfi.GET_FNOMBRE+'      | MODO: '+tconfi.GET_FMODO;
end;

procedure TForm1.CuentaCorrientes1Click(Sender: TObject);
begin

   if FORM1.revisaPermisoTAG(CuentaCorrientes1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;

cuentascorrientesclientes.showmodal;
end;

procedure TForm1.Descuentos1Click(Sender: TObject);
begin
fmdescuentos.showmodal;
end;
 function  TForm1.buscrVencimientos(ida:longint):boolean;
 var resultado:boolean;
 begin
 resultado:=true;
  self.queryvece.Close;
  self.queryvece.SQL.Clear;
  self.queryvece.SQL.Add('select TV.LOTE,TV.FECHAVENCIMIENTO, TA.DESCRIPCION  '+
                         ' from tvencimientos TV, TARTICULOS TA '+
                         ' where TV.idarticulo=TA.IDARTICULO  '+
                         ' AND TV.idarticulo='+inttostr(ida)+
                        ' and  (TV.fechavencimiento='+#39+trim(datetostr(date))+#39+
                        ' or  TV.fechavencimiento < '+#39+trim(datetostr(date))+#39+')');
  self.queryvece.Open;
  if self.queryvece.RecordCount > 0 then
   begin
      if Application.MessageBox( pchar('El art�culo '+trim(queryvece.Fields[2].asstring)
              +' Lote Nro: '+trim(queryvece.Fields[0].asstring)+' est� vencido. (vence: '+trim(queryvece.Fields[1].asstring)+'). �Desea continuar?'), 'ATENCION. ARTICULO VENCIDO',
         MB_ICONQUESTION OR MB_YESNO ) = ID_YES then
            resultado:=true
            else
            resultado:=false;

   end;
    result:=resultado;

 end;
procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
var busca,busca_precio,CODIGO_BARRA:string;     ES_ENVASADO:BOOLEAN; barra_hasta:longint;
td:tdecimales;    precioTotal,precioUnit:real;   idartibuaca:longint;
  ES_PROMOCION:BOOLEAN;
begin

form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('SELECT * FROM TCAJA WHERE estado=1 AND PC='+INTTOSTR(FORM1.PUESTO_PC));
form1.FDQuery2.Open;
if form1.FDQuery2.RecordCount=0 then
begin
  showmessage('Debe abrir la caja del d�a');
  exit;
end;


if key in ['0','1','2','3','4','5','6','7','8','9','+','.','*',#8,#13,'P','p'] then
  begin
    edit1.readonly:=false;

   end  else
     edit1.readonly:=true;

     if key=#27 then
    begin
           ES_ENVASADO:=false;
          edit1.Clear;
         edit1.SetFocus;
         cantidad:='1';
         busca:='';
         esPorPrecio:=falsE;
          PANEL9.Caption:='<<<< INGRESE CANTIDAD O ARTICULO';
    end;

if key=#13 then
begin

td:=tdecimales.Create;
     busca:=copy(trim(edit1.Text),1,1);
      busca:=uppercase(busca);
  if (trim(busca)='*')then
  begin
    esPorPrecio:=true;
    precioIngresado:=copy(trim(edit1.Text),2,length(trim(edit1.Text))) ;
     edit1.Clear;
     edit1.SetFocus;
        PANEL9.Caption:='<<<< INGRESE ARTICULO';
  end else
  begin
      if (trim(busca)='+') OR (trim(busca)='-')then
      begin
         cantidad:=copy(trim(edit1.Text),2,length(trim(edit1.Text))) ;
          if BUSCA='-' then
            cantidad:='-'+cantidad;
         edit1.Clear;
         edit1.SetFocus;
         PANEL9.Caption:='<<<< INGRESE ARTICULO';
      end else begin
         busca:=trim(edit1.Text) ;
         busca:=uppercase(busca);
         ES_ENVASADO:=FALSE;
         if COPY(BUSCA,1,1)=TRIM(TCONFI.GET_FDIGITOCODIGOBARRA) then
         BEGIN
            CODIGO_BARRA:=BUSCA;
            ES_ENVASADO:=TRUE;
            BUSCA:=COPY(CODIGO_BARRA,2,STRTOINT(TRIM(TCONFI.GET_FCANTIDADIGITOCODIGOBARRA)));
           CODIGO_BARRA:=COPY(CODIGO_BARRA,LENGTH(BUSCA)+1,LENGTH(CODIGO_BARRA));
            if   TRIM(TCONFI.GET_FCANTIDADIGITOCODIGOBARRA)='0' then
                 barra_hasta:=length(CODIGO_BARRA)
                 else
                   if   TRIM(TCONFI.GET_FCANTIDADIGITOCODIGOBARRA)='1' then
                        barra_hasta:=length(CODIGO_BARRA)-1
                        else
                          barra_hasta:=length(CODIGO_BARRA)-1;

             busca_precio:=COPY(CODIGO_BARRA,1,barra_hasta);
            precioUnit:=strtofloat(busca_precio)/100;
         END;
        ES_PROMOCION:=FALSE;
         if COPY(BUSCA,1,1)='P' then
         BEGIN
          ES_PROMOCION:=TRUE;
         END;

       if ES_PROMOCION=FALSE then
        BEGIN
         self.FDQuery1.Close;
         self.FDQuery1.SQL.Clear;
         self.FDQuery1.SQL.Add('select * from tarticulos where codigobarra='+#39+trim(busca)+#39);

         self.FDQuery1.Open;
         if self.FDQuery1.RecordCount = 0 then
         begin
              showmessage('ARTICULO INEXISTENTE');
              EDIT1.Clear;
              EDIT1.SetFocus;
         exit;
         end;

      if (trim(cantidad)='') or (trim(cantidad)='0') then
             cantidad:='1';

         if FDQuery1.FieldByName('stock').asfloat < strtofloat(cantidad) then
         begin
            Application.MessageBox( PCHAR('ARTICULO: '+TRIM(FDQuery1.FieldByName('DESCRIPCION').AsSTRING)+'  TIENE STOCK '+TRIM(FDQuery1.FieldByName('STOCK').AsSTRING)+'. CANTIDAD INSUFICIENTE'),
           'ATENCION', MB_ICONSTOP );
           EXIT;
         end;


         if FDQuery1.FieldByName('stock').asfloat<=0 then
         begin
           Application.MessageBox( PCHAR('ARTICULO: '+TRIM(FDQuery1.FieldByName('DESCRIPCION').AsSTRING)+'  TIENE STOCK 0. NO SE PUEDE VENDER'),
           'ATENCION', MB_ICONSTOP );
           EXIT;
         end;

          if FDQuery1.FieldByName('stock').asfloat <= FDQuery1.FieldByName('stockalerta').asfloat then
         begin
           Application.MessageBox( PCHAR('ARTICULO: '+TRIM(FDQuery1.FieldByName('DESCRIPCION').AsSTRING)+'  TIENE STOCK EN ALERTA. STOCK ACTUAL:  '+FDQuery1.FieldByName('STOCK').AsSTRING),
           'ATENCION', MB_ICONINFORMATION  );
           end;
        { if Application.MessageBox(PCHAR(TRIM(FDQuery1.FieldByName('DESCRIPCION').AsSTRING)), 'AGREGAR ARTICULO',
                 MB_ICONQUESTION OR MB_YESNO ) = ID_NO then
                 EXIT;         }


         precioTotal:=0;

        if ES_ENVASADO=FALSE then
         BEGIN

            if TRIM(FDQuery1.FieldByName('PRECIOVARIABLE').AsString)='S' then
             BEGIN
                PRPRECIOVARIABLE.Edit1.Clear;
                PRPRECIOVARIABLE.Edit1.Text:=trim(FDQuery1.FieldByName('PRECIOVENTA').asstring);
                PRPRECIOVARIABLE.SHOWMODAL;
                precioUnit:=STRTOFLOAT(PRPRECIOVARIABLE.Edit1.Text);
              END ELSE
                 precioUnit:=FDQuery1.FieldByName('PRECIOVENTA').AsFloat;
        END;


          if (trim(cantidad)='') or (trim(cantidad)='0') then
             cantidad:='1';

         if self.RxMemoryData1.Active=false then
           begin
            self.RxMemoryData1.Close;
            self.RxMemoryData1.Open;
           end;

           idartibuaca:=FDQuery1.FieldByName('IDARTICULO').ASINTEGER;

           if buscrVencimientos(idartibuaca)=false  then
           begin
           edit1.Clear;
           edit1.SetFocus;
             exit;
           end;

           if esPorPrecio=false then
               precioTotal:=precioUnit * strtofloat(cantidad)
               else
                begin

                cantidad:=floattostr((strtofloat(precioIngresado)*strtofloat(cantidad))/precioUnit);
                 precioTotal:=precioUnit * strtofloat(cantidad);
                end;

           SUMA:=SUMA + precioTotal;

      END ELSE
      BEGIN
           //PROMOCION
               if self.RxMemoryData1.Active=false then
                begin
                    self.RxMemoryData1.Close;
                    self.RxMemoryData1.Open;
               end;

           if (trim(cantidad)='') or (trim(cantidad)='0') then
             cantidad:='1';


             self.FDQuery1.Close;
             self.FDQuery1.SQL.Clear;
             self.FDQuery1.SQL.Add('select * from TPROMOCIONES where codigo='+#39+trim(busca)+#39);
             self.FDQuery1.Open;
             precioUnit:=FDQuery1.FieldByName('PRECIO').AsFloat;

             precioTotal:=precioUnit * strtofloat(cantidad);

             SUMA:=SUMA + precioTotal;
      END;

         self.RxMemoryData1.Append;
         SELF.RxMemoryData1ITEM.Value:=SELF.RxMemoryData1.RecordCount + 1;
         if  ES_PROMOCION=FALSE then
         BEGIN
         SELF.RxMemoryData1IVA.Value:=TRIM(FDQuery1.FieldByName('IVA').AsSTRING);
         self.RxMemoryData1idarticulo.Value:=FDQuery1.FieldByName('IDARTICULO').ASINTEGER;
         self.RxMemoryData1cantidad.Value:=trim(cantidad);
         self.RxMemoryData1descripcion.Value:=TRIM(FDQuery1.FieldByName('DESCRIPCION').AsSTRING);
         self.RxMemoryData1preciounit.Value:=td.arma_importe_para_mostrar(precioUnit);
         self.RxMemoryData1preciototal.Value:=td.arma_importe_para_mostrar(precioTotal);
         SELF.RxMemoryData1PROMOCION.Value:='N';
         END
          ELSE BEGIN
                 SELF.RxMemoryData1IVA.Value:='21';
                 self.RxMemoryData1idarticulo.Value:=FDQuery1.FieldByName('IDPROMOCION').ASINTEGER;
                 self.RxMemoryData1cantidad.Value:=trim(cantidad);
                 self.RxMemoryData1descripcion.Value:=TRIM(FDQuery1.FieldByName('NOMBRE').AsSTRING);
                 self.RxMemoryData1preciounit.Value:=td.arma_importe_para_mostrar(precioUnit);
                 self.RxMemoryData1preciototal.Value:=td.arma_importe_para_mostrar(precioTotal);
                 SELF.RxMemoryData1PROMOCION.Value:='S';
          END;
         self.RxMemoryData1.Post;

         sumaCantidad:=sumaCantidad + STRTOFLOAT(TRIM(cantidad));


         LABEL7.Caption:=floatTOSTR(sumaCantidad);
         LABEL2.Caption:=TD.arma_importe_para_mostrar(SUMA);
         edit1.Clear;
         edit1.SetFocus;
         cantidad:='1';
         esPorPrecio:=false;
          PANEL9.Caption:='<<<< INGRESE CANTIDAD O ARTICULO';
          busca:='';
            ES_ENVASADO:=false;
      end;
  end;
td.Free;
end;

end;

procedure TForm1.EliminarArticulo1Click(Sender: TObject);
var td:tdecimales;   S,sumaCantidad:real;
begin
SUMA:=0;
td:=tdecimales.Create;


self.RxMemoryData1.Delete;

RxMemoryData1.Refresh;

self.RxMemoryData1.Open;
s:=0;
sumaCantidad:=0;
RxMemoryData1.First;
while not self.RxMemoryData1.Eof  do
begin
 s:=s + strtofloat(self.RxMemoryData1preciototal.Value);
 sumaCantidad:=sumaCantidad + STRTOFLOAT(TRIM(self.RxMemoryData1cantidad.Value));
self.RxMemoryData1.Next;
end;
 SUMA:=s;
  LABEL2.Caption:=TD.arma_importe_para_mostrar(s);




         LABEL7.Caption:=floatTOSTR(sumaCantidad);

  td.Free;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
FDConnection1.Close;
end;

procedure TForm1.FormShow(Sender: TObject);
var m:string;
    PATHBD,FEFINALIZA:sTRING;
  Ini: TIniFile;
begin
demo:=false;

if demo=true then
begin
FEFINALIZA:='15/08/2022';
 if (date > STRTODATE(FEFINALIZA)) then
    begin
     showmessage('VERSION DEMO TERMINADA');
   APPLICATION.Terminate;
    end;

end;

PANEL11.Visible:=FALSE;
sumaCantidad:=0;
LABEL7.Caption:='0';
EDIT2.TEXT:='0 - CONSUMIDOR FINAL';

 Ini := TIniFile.Create(ExtractFilePath(ParamStr(0))+'\config.ini');
 PATHBD:=TRIM(Ini.ReadString('BASE', 'PATH', ''));
 PUESTO_PC:=Ini.ReadInteger('PUESTO', 'PC', 1);
 TIPOPAPEL:=TRIM(INI.ReadString('PAPEL', 'TIPO', 'A4'));
 Ini.Free;
 esDevolucion:=false;
PANEL9.Caption:='<<<< INGRESE CANTIDAD O ARTICULO';
STATUSBAR1.Panels[0].Text:='ver: 1.0.4';
STATUSBAR1.Panels[4].Text:='PUESTO: '+INTTOSTR(PUESTO_PC);
esPorPrecio:=false;
precioIngresado:='';

  if TRIM(PATHBD)='' then
   PATHBD:=ExtractFilePath(ParamStr(0))+'bd';

// if FDConnection1.Connected=false then
// begin
self.FDConnection1.Params.DriverID:='SQLITE';
self.FDConnection1.Params.Database:=PATHBD+'\base.s3db';
self.FDConnection1.Params.UserName:='';
self.FDConnection1.Params.Password:='';
self.FDConnection1.Connected:=true;
self.FDConnection1.Open;

frmingresologeo.Edit1.Clear;
 frmingresologeo.Label2.CAPTION:='';
 if demo=TRUE then
 frmingresologeo.Label2.CAPTION:='CODIGO DEMO: 0810';

frmingresologeo.showmodal;

if frmingresologeo.ModalResult=mrcancel then
begin

application.Terminate;
end;


{SELF.fdQueryListaPrecio.Close;
SELF.fdQueryListaPrecio.SQL.Clear;
SELF.fdQueryListaPrecio.SQL.Add('SELECT IDLISTA, NOMBRE FROM TLISTADEPRECIOS ORDER BY IDLISTA ASC');
SELF.fdQueryListaPrecio.OpeN;
SELF.DBLookupComboBox2.KeyValue:=1; }

SELF.FDVENDEDOR.Close;
SELF.FDVENDEDOR.SQL.Clear;
SELF.FDVENDEDOR.SQL.Add('SELECT IDVENDEDOR, NOMBRE FROM TVENDEDORES ORDER BY NOMBRE ASC');
SELF.fdvENDEDOR.OpeN;

SELF.DBLookupComboBox1.KeyValue:=0;

fdvencimientos.Close;
fdvencimientos.SQL.Clear;
fdvencimientos.SQL.Add('select * from tvencimientos where fechavencimiento ='+#39+trim(datetostr(date))+#39);
fdvencimientos.Open;
if fdvencimientos.RecordCount > 0  then
 begin
   Application.MessageBox( 'ATENCION. TIENE PRODUCTOS POR VENCER EN EL D�A DE HOY.',
  'VENCIMIENTOS', MB_ICONSTOP );
 end;

tconfi:=TConfig.create(FDConnection1,PUESTO_PC);
if tconfi.GET_FSOLOTICKET='S' then
STATUSBAR1.Panels[1].Text:='SOLO TICKET'
ELSE
 STATUSBAR1.Panels[1].Text:='TICKET/FACTURAS';

STATUSBAR1.Panels[2].Text:='IMPRIME: '+tconfi.GET_FIMPRIME+'   MAIL: '+TCONFI.GET_FENVIAMAIL;
 STATUSBAR1.Panels[3].Text:=tconfi.GET_FIMPRESORA;

 frmterminar.tipoivacliente:=3;

   FDQuery2.Close;
   FDQuery2.SQL.Clear;
   FDQuery2.SQL.Add('SELECT * FROM tformapago WHERE idformapago=4');
   FDQuery2.Open;
   if FDQuery2.IsEmpty=true then
   begin
      FDConnection1.StartTransaction;
      try
          m:='BILLETERA SANTA FE' ;
          FDQuery2.Close;
          FDQuery2.SQL.Clear;
          FDQuery2.SQL.Add('insert into tformapago values (4,'+#39+trim(m)+#39+')');
          FDQuery2.ExecSQL ;
         FDConnection1.Commit;
      except
         FDConnection1.Rollback;
      end;
   end;



// END;
edit1.Clear;
suma:=0;
lABEL2.Caption:='00.00';
   FDQuery2.Close;
   FDQuery2.SQL.Clear;
   FDQuery2.SQL.Add('SELECT * FROM TCAJA WHERE estado=1  AND PC='+INTTOSTR(FORM1.PUESTO_PC)+' order by idcaja desc');
   FDQuery2.Open;
   PANEL2.Caption:='CAJA '+ FDQuery2.FieldByName('fecha').AsString+'  PUESTO: '+INTTOSTR(FORM1.PUESTO_PC);



   CAPTION:=tconfi.GET_FNOMBRE+'      | MODO: '+tconfi.GET_FMODO;

   SOLOTICKET:=tconfi.GET_FSOLOTICKET;

EDIT1.SetFocus;


end;

procedure TForm1.ImprimirEtiquetas1Click(Sender: TObject);
begin
frmimprimirEtiquetas.RxMemoryData1.Close;
frmimprimirEtiquetas.RxMemoryData1.Open;
frmimprimirEtiquetas.Edit1.Clear;
frmimprimirEtiquetas.CheckBox1.Checked:=FALSE;
frmimprimirEtiquetas.showmodal;
end;

procedure TForm1.IngresosaCaja1Click(Sender: TObject);
begin
   if FORM1.revisaPermisoTAG(IngresosaCaja1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;


SELF.FDQuery2.Close;
SELF.FDQuery2.SQL.Clear;
SELF.FDQuery2.SQL.Add('SELECT * FROM TCAJA WHERE ESTADO=0 AND PC='+INTTOSTR(FORM1.PUESTO_PC));
SELF.FDQuery2.Open;
if  SELF.FDQuery2.IsEmpty=true then
BEGIN
     SHOWMESSAGE('NO HAY UNA CAJA ABIERTA.');
     EXIT;

END;
frmIngresosaCaja.showmodal;
end;

procedure TForm1.Inventario1Click(Sender: TObject);
begin
   if FORM1.revisaPermisoTAG(Inventario1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;

inventario.showmodal;
end;

procedure TForm1.LibroIVACompra1Click(Sender: TObject);
begin
   if FORM1.revisaPermisoTAG(LibroIVACompra1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;
MESYANIO.Edit1.Text:=INTTOSTR(YearOf(Now));
MESYANIO.SHOWMODAL;
end;

procedure TForm1.LibrosIVAVenta1Click(Sender: TObject);
VAR SQL,ME:STRING;   SGRAVADO, STOTAL, SIVA10, SIVA21:REAL;
begin
   if FORM1.revisaPermisoTAG(LibrosIVAVenta1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;

MESYANIO.Edit1.Text:=INTTOSTR(YearOf(Now));
MESYANIO.SHOWMODAL;
if MESYANIO.ModalResult=MROK then
BEGIN
 SGRAVADO:=0;
 STOTAL:=0;
 SIVA10:=0;
 SIVA21:=0;
  if MESYANIO.ComboBox1.ItemIndex=0 then
      ME:='01';
   if MESYANIO.ComboBox1.ItemIndex=1 then
      ME:='02';
    if MESYANIO.ComboBox1.ItemIndex=2 then
      ME:='03';
   if MESYANIO.ComboBox1.ItemIndex=3 then
      ME:='04';
    if MESYANIO.ComboBox1.ItemIndex=4 then
      ME:='05';
    if MESYANIO.ComboBox1.ItemIndex=5 then
      ME:='06';
    if MESYANIO.ComboBox1.ItemIndex=6 then
      ME:='07';
   if MESYANIO.ComboBox1.ItemIndex=7 then
      ME:='08';
   if MESYANIO.ComboBox1.ItemIndex=8 then
      ME:='09';
    if MESYANIO.ComboBox1.ItemIndex=9 then
      ME:='10';
    if MESYANIO.ComboBox1.ItemIndex=10 then
      ME:='11';
    if MESYANIO.ComboBox1.ItemIndex=11 then
      ME:='12';


  FRMIVAVENTA.QRLabel2.Caption:='MES Y A�O : '+TRIM(MESYANIO.ComboBox1.Text)+'  '+TRIM(MESYANIO.Edit1.Text);

 SQL:='SELECT TM.TIPOMOVIMIENTO AS TMTIPOMOVIMIENTO,TC.IDCLIENTE AS TCIDCLIENTE,'+
' TC.APENOM AS TCAPENOM, '+
' TC.TIPODOC AS TCTIPODOC,TC.NRODOC AS TCNRODOC,TC.IVA AS TCIVA,TM.FECHA AS TMFECHA,'+
' CASE TM.TIPOMOVIMIENTO  '+
'  WHEN 1 THEN  (TM.SUBTOTAL -(TM.IVA10+TM.IVA)) '+
'  WHEN 2 THEN  (TM.SUBTOTAL -(TM.IVA10+TM.IVA)) '+
'  WHEN 3 THEN  (TM.SUBTOTAL -(TM.IVA10+TM.IVA)) '+
'  WHEN 4 THEN  ((TM.SUBTOTAL +(TM.IVA10+TM.IVA))*-1) '+
'  WHEN 5 THEN  ((TM.SUBTOTAL +(TM.IVA10+TM.IVA))*-1) '+
'  WHEN 6 THEN  ((TM.SUBTOTAL + (TM.IVA10+TM.IVA))*-1)'+
'  ELSE  '+
'  ''0'' '+
'  END AS GRAV , '+
' CASE TM.TIPOMOVIMIENTO '+
'  WHEN 1 THEN  ''FACTURA A''   '+
'  WHEN 2 THEN  ''FACTURA B''  '+
'  WHEN 3 THEN  ''FACTURA C''  '+
'  WHEN 4 THEN  ''NOTA CREDITO A''  '+
'  WHEN 5 THEN  ''NOTA CREDITO B'' '+
'  WHEN 6 THEN  ''NOTA CREDITO C'' '+
'  ELSE '+
'  ''0''  '+
'  END  ||'' ''|| TM.NROFACTURA AS COMPRO   '+
',TM.TOTAL AS TOTAL,TM.IVA10 AS TMIVA10,   '+
' TM.IVA AS TMIVA21, '+
' TM.NROFACTURA  AS TMNRO,TM.CAE AS TMCAE '+
' FROM TMOVIMIENTOS TM,TCLIENTES TC   '+
' WHERE TM.IDCLIENTE=TC.IDCLIENTE  '+
'  AND substr( TM.FECHA , 7, 4 ) ='+#39+TRIM(MESYANIO.Edit1.Text)+#39+
'  AND substr( TM.FECHA , 4, 2 ) ='+#39+TRIM(ME)+#39+
' AND TM.TIPOMOVIMIENTO IN (1,4,2,5,3,6) '+
'  AND TM.CAE <>''-'' AND  TM.CAE IS NOT NULL   '+
'  ORDER BY TM.FECHA ASC';

 QUERYIVAVENTA.Close;
 QUERYIVAVENTA.SQL.Clear;
 QUERYIVAVENTA.SQL.Add(SQL);
 QUERYIVAVENTA.Open;
 while NOT  QUERYIVAVENTA.Eof DO
 BEGIN
    SGRAVADO:=SGRAVADO + QUERYIVAVENTA.FieldBYNAME('GRAV').AsFloat;
    STOTAL:=STOTAL + QUERYIVAVENTA.FieldBYNAME('TOTAL').AsFloat;
    SIVA21:=SIVA21 + QUERYIVAVENTA.FieldBYNAME('TMIVA21').AsFloat;
    SIVA10:=SIVA10 + QUERYIVAVENTA.FieldBYNAME('TMIVA10').AsFloat;

    QUERYIVAVENTA.Next;
 END;

 FRMIVAVENTA.QRLabel12.Caption:=FORMATFLOAT('##########.##',SGRAVADO);
 FRMIVAVENTA.QRLabel13.Caption:=FORMATFLOAT('##########.##',SIVA10);
 FRMIVAVENTA.QRLabel14.Caption:=FORMATFLOAT('##########.##',SIVA21);
 FRMIVAVENTA.QRLabel15.Caption:=FORMATFLOAT('##########.##',STOTAL);

SQL:='SELECT TM.TIPOMOVIMIENTO AS TMTIPOMOVIMIENTO,TC.IDCLIENTE AS TCIDCLIENTE,'+
' TC.APENOM AS TCAPENOM, '+
' TC.TIPODOC AS TCTIPODOC,TC.NRODOC AS TCNRODOC,TC.IVA AS TCIVA,TM.FECHA AS TMFECHA,'+
' CASE TM.TIPOMOVIMIENTO  '+
'  WHEN 1 THEN  (TM.SUBTOTAL -(TM.IVA10+TM.IVA)) '+
'  WHEN 2 THEN  (TM.SUBTOTAL -(TM.IVA10+TM.IVA)) '+
'  WHEN 3 THEN  (TM.SUBTOTAL -(TM.IVA10+TM.IVA)) '+
'  WHEN 4 THEN  ((TM.SUBTOTAL +(TM.IVA10+TM.IVA))*-1) '+
'  WHEN 5 THEN  ((TM.SUBTOTAL +(TM.IVA10+TM.IVA))*-1) '+
'  WHEN 6 THEN  ((TM.SUBTOTAL + (TM.IVA10+TM.IVA))*-1)'+
'  ELSE  '+
'  ''0'' '+
'  END AS GRAV , '+
' CASE TM.TIPOMOVIMIENTO '+
'  WHEN 1 THEN  ''FACTURA A''   '+
'  WHEN 2 THEN  ''FACTURA B''  '+
'  WHEN 3 THEN  ''FACTURA C''  '+
'  WHEN 4 THEN  ''NOTA CREDITO A''  '+
'  WHEN 5 THEN  ''NOTA CREDITO B'' '+
'  WHEN 6 THEN  ''NOTA CREDITO C'' '+
'  ELSE '+
'  ''0''  '+
'  END  ||'' ''|| TM.NROFACTURA AS COMPRO   '+
',TM.TOTAL AS TOTAL,TM.IVA10 AS TMIVA10,   '+
' TM.IVA AS TMIVA21, '+
' TM.NROFACTURA  AS TMNRO,TM.CAE AS TMCAE '+
' FROM TMOVIMIENTOS TM,TCLIENTES TC   '+
' WHERE TM.IDCLIENTE=TC.IDCLIENTE  '+
' AND TM.TIPOMOVIMIENTO IN (1,4,2,5,3,6) '+
'  AND substr( TM.FECHA , 7, 4 ) ='+#39+TRIM(MESYANIO.Edit1.Text)+#39+
'  AND substr( TM.FECHA , 4, 2 ) ='+#39+TRIM(ME)+#39+
'  AND TM.CAE <>''-'' AND  TM.CAE IS NOT NULL   '+
'  ORDER BY TM.FECHA ASC';

 QUERYIVAVENTA.Close;
 QUERYIVAVENTA.SQL.Clear;
 QUERYIVAVENTA.SQL.Add(SQL);
 QUERYIVAVENTA.Open;
 FRMIVAVENTA.QuickRep1.Prepare;
 FRMIVAVENTA.QuickRep1.Preview;

END;
end;

procedure TForm1.ListadodeClientesDeudores1Click(Sender: TObject);
var sql:string;
begin
   if FORM1.revisaPermisoTAG(ListadodeClientesDeudores1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;

SQL:='SELECT  tc.idcliente as IDC, TC.APENOM as CLIENTE,  '+
' (SUM(Tf.importe)-SUM(TM.PAGO)) AS SALDO   '+
' FROM TMOVIMIENTOS  TM,TCLIENTES TC ,TFORMAPAGOS_FACTURAS tf  '+
'  WHERE '+
'  Tf.IDFORMA=5   '+
' AND TM.IDCLIENTE=TC.IDCLIENTE  '+
' and tm.idmovimiento=tf.idmovimiento   '+
' AND tm.CODNC=0   '+
' AND TM.TIPOMOVIMIENTO IN (0,1,2,3,4,5,6,7)  '+
' GROUP BY   tc.idcliente   ,TC.APENOM   '+
' HAVING   (SUM(Tf.importe)-SUM(TM.PAGO)) > 0  '+
' ORDER BY TC.APENOM ASC';
listarClientesDeudores.FDQuery1.Close;
listarClientesDeudores.FDQuery1.SQL.Clear;
listarClientesDeudores.FDQuery1.SQL.Add(sql);
listarClientesDeudores.FDQuery1.Open;
 listarClientesDeudores.showmodal;
end;

procedure TForm1.ListadodeMovimientos1Click(Sender: TObject);
begin
   if FORM1.revisaPermisoTAG(ListadodeMovimientos1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;

FRMLISTADOSMOVIMIENTOS.SHOWMODAL;
end;

procedure TForm1.ListadodeVentasporVen1Click(Sender: TObject);
begin
   if FORM1.revisaPermisoTAG(ListadodeVentasporVen1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;

ventaporvendedor.Edit1.Clear;

ventaporvendedor.DateTimePicker1.DateTime:=NOW;
ventaporvendedor.DateTimePicker2.DateTime:=NOW;
ventaporvendedor.FDQuery1.Close;
ventaporvendedor.FDVENDEDOR.Close;
ventaporvendedor.FDVENDEDOR.SQL.Clear;
ventaporvendedor.FDVENDEDOR.SQL.Add('SELECT IDVENDEDOR, NOMBRE FROM TVENDEDORES ORDER BY NOMBRE ASC');
ventaporvendedor.fdvENDEDOR.OpeN;

  ventaporvendedor.showmodal;
end;

procedure TForm1.ListadosdeCompras1Click(Sender: TObject);
begin
   if FORM1.revisaPermisoTAG(ListadosdeCompras1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;

end;

procedure TForm1.ListarArtculosenReposicin1Click(Sender: TObject);
begin
   if FORM1.revisaPermisoTAG(ListarArtculosenReposicin1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;

listararticulosreposicion.showmodal;
end;

procedure TForm1.ListarArtculosVendidos1Click(Sender: TObject);
begin
   if FORM1.revisaPermisoTAG(ListarArtculosVendidos1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;

listarasrticulosvendod.FDQuery1.Close;
listarasrticulosvendod.showmodal;

end;

procedure TForm1.ListarRubromsVendido1Click(Sender: TObject);
var sql:string;
begin
   if FORM1.revisaPermisoTAG(ListarRubromsVendido1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;


  FRMFECHASDESDEYHASTAS.SHOWMODAL;
  if FRMFECHASDESDEYHASTAS.ModalResult=MROK then
  BEGIN
    sql:=' select   sum(TI.CANTIDAD) as vendido,r.descripcion AS RDESCRI '+
        ' FROM     TITEM_FACTURA TI  ,TMOVIMIENTOS tm  ,TARTICULOS A   '+
        '   left join trubros r on r.IDRUBRO=a.IDRUBRO   '+
        '    where   '+
            '     TM.IDMOVIMIENTO = TI.IDFACTURA    '+
             '    and A.IDARTICULO=TI.IDARTICULO   '+
             '    and TM.FECHA BETWEEN '+#39+trim(datetostr(FRMFECHASDESDEYHASTAS.DateTimePicker1.DateTime))+#39+' AND '+#39+trim(datetostr(FRMFECHASDESDEYHASTAS.DateTimePicker2.DateTime))+#39+
             '    group by  r.descripcion '+
             '    order by vendido desc';

      qrylistarrubro.Close;
      qrylistarrubro.SQL.Clear;
      qrylistarrubro.SQL.Add(sql);
      qrylistarrubro.Open;
      frrubromasvendido.QuickRep1.Prepare;
      frrubromasvendido.QuickRep1.Preview;

  END;

end;

procedure TForm1.ListarVentasporfecha1Click(Sender: TObject);
BEGIN
   if FORM1.revisaPermisoTAG(ListarVentasporfecha1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;
verventas.Edit1.Clear;
verventas.FDQuery1.Close;
verventas.DateTimePicker1.DateTime:=NOW;
verventas.DateTimePicker2.DateTime:=NOW;
  verventas.showmodal;
end;

procedure TForm1.Marcas1Click(Sender: TObject);
begin
   if FORM1.revisaPermisoTAG(Marcas1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;
end;

procedure TForm1.PorProveedor1Click(Sender: TObject);
begin
if FORM1.revisaPermisoTAG(PorProveedor1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;

frmActualizaPrecioporProveedor.RxMemoryData1.Close;
frmActualizaPrecioporProveedor.RxMemoryData1.Open;
frmActualizaPrecioporProveedor.Edit1.Clear;
frmActualizaPrecioporProveedor.FDQuery1.Close;
frmActualizaPrecioporProveedor.showmodal;
end;

procedure TForm1.Promociones1Click(Sender: TObject);
begin
frmPromociones.FDQuery1.Close;
frmPromociones.FDQuery1.SQL.Clear;
frmPromociones.FDQuery1.SQL.Add('SELECT IDPROMOCION, CODIGO,FECHA,NOMBRE,ACTIVA,PRECIO, STOCK FROM TPROMOCIONES ORDER BY NOMBRE ASC');
frmPromociones.FDQuery1.Open;
frmPromociones.showmodal;
end;

procedure TForm1.Proveedores2Click(Sender: TObject);
begin
   if FORM1.revisaPermisoTAG(Proveedores2.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;
Form3.shOwmodal;
end;

procedure TForm1.SalidasdeCaja1Click(Sender: TObject);
begin
   if FORM1.revisaPermisoTAG(SalidasdeCaja1.Tag)=true then
  begin
    Application.MessageBox( 'USTED NO TIENE PERMISOS.',
    'Acceso denegado', MB_ICONSTOP );
    exit;
  end;

SELF.FDQuery2.Close;
SELF.FDQuery2.SQL.Clear;
SELF.FDQuery2.SQL.Add('SELECT * FROM TCAJA WHERE ESTADO=1 AND PC='+INTTOSTR(FORM1.PUESTO_PC));
SELF.FDQuery2.Open;
if  SELF.FDQuery2.IsEmpty=true then
BEGIN
     SHOWMESSAGE('YA HAY UNA CAJA ABIERTA.');
     EXIT;

END;
frmsalidacaja.showmodal;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var posi:longint;
begin


SOLOTICKET:=tconfi.GET_FSOLOTICKET;
if demo=true then
begin
SELF.FDQuery2.Close;
SELF.FDQuery2.SQL.Clear;
SELF.FDQuery2.SQL.Add('SELECT count(*) FROM tmovimientos ');
SELF.FDQuery2.Open;

 if SELF.FDQuery2.fields[0].AsInteger > 200 then
  begin
       showmessage('Prueba Demo finalizada');
  exit;
  end;


end;

SELF.FDQuery2.Close;
SELF.FDQuery2.SQL.Clear;
SELF.FDQuery2.SQL.Add('SELECT * FROM TCAJA WHERE ESTADO=1 AND PC='+INTTOSTR(FORM1.PUESTO_PC));
SELF.FDQuery2.Open;
if SELF.FDQuery2.IsEmpty=TRUE then
BEGIN
     SHOWMESSAGE('NO HAY UNA CAJA ABIERTA.');
     EXIT;

END;

if self.RxMemoryData1.RecordCount=0 then
    exit;

frmterminar.Edit4.Clear;
frmterminar.RxMemoryData1.Close;
frmterminar.RxMemoryData1.Open;

frmterminar.IDVENDEDOR:=SELF.DBLookupComboBox1.KeyValue;
frmterminar.Label4.CAPTION:=TRIM(LABEL2.Caption)  ;
frmterminar.Edit1.Text:='0.00';
frmterminar.Edit4.Text:=TRIM(LABEL2.Caption);
frmterminar.Edit5.Text:=TRIM(LABEL2.Caption);
frmterminar.Edit2.Clear;
frmterminar.ComboBox1.ItemIndex:=0;
frmterminar.Label7.CAPTION:=TRIM(EDIT2.Text);

if TRIM(SOLOTICKET)='S' then
BEGIN
  //frmterminar.ComboBox1.Enabled:=FALSE;
  frmterminar.ComboBox1.Clear;
   if esDevolucion=false then
    begin
       frmterminar.ComboBox1.Items.Add('0-TICKET');;
        frmterminar.ComboBox1.Items.Add('7-NC TICKET');
    end else begin
               frmterminar.ComboBox1.Items.Add('7-NC TICKET');
             end;
END ELSE BEGIN
    frmterminar.ComboBox1.Clear;
    if esDevolucion=false then
    begin
      frmterminar.ComboBox1.Items.Add('0-TICKET');
      frmterminar.ComboBox1.Items.Add('1-FACTURA A');
      frmterminar.ComboBox1.Items.Add('2-FACTURA B');
      frmterminar.ComboBox1.Items.Add('3-FACTURA C');
      frmterminar.ComboBox1.Items.Add('4-NOTA CREDITO A');
      frmterminar.ComboBox1.Items.Add('5-NOTA CREDITO B');
      frmterminar.ComboBox1.Items.Add('6-NOTA CREDITO C');
      frmterminar.ComboBox1.Items.Add('7-NC TICKET');
    end else
           begin
               frmterminar.ComboBox1.Items.Add('4-NOTA CREDITO A');
               frmterminar.ComboBox1.Items.Add('5-NOTA CREDITO B');
               frmterminar.ComboBox1.Items.Add('6-NOTA CREDITO C');
               frmterminar.ComboBox1.Items.Add('7-NC TICKET');

           end;

END;

   if TRIM(FORM1.tconfi.GET_FSOLOTICKET)='N' then
       BEGIN
           if frmterminar.tipoivacliente=0 then
              frmterminar.ComboBox1.ItemIndex:=1
               ELSE
                   frmterminar.ComboBox1.ItemIndex:=0;

       END else
         frmterminar.ComboBox1.ItemIndex:=0;


   if esDevolucion=true  then
   begin
     frmterminar.Edit4.Text:='0.00';
     frmterminar.Edit5.Text:='0.00';
     frmterminar.Edit1.Text:=trim(frmterminar.Label4.Caption);
     frmterminar.FDQuery7.Close;
     frmterminar.FDQuery7.SQL.Clear;
     frmterminar.FDQuery7.SQL.Add('select * from TFORMAPAGOS_FACTURAS  where idmovimiento='+inttostr(strtoint(edit3.Text)));
     frmterminar.FDQuery7.Open;
     frmterminar.RxMemoryData1.Close;
     frmterminar.RxMemoryData1.Open;
     while not frmterminar.FDQuery7.Eof do
     begin
         frmterminar.RxMemoryData1.Append;
         frmterminar.RxMemoryData1IDFORMA.Value:=frmterminar.FDQuery7.FieldByName('idforma').AsInteger;
         frmterminar.RxMemoryData1FORMA.Value:=trim(frmterminar.FDQuery7.FieldByName('descripcion').asstring);
         frmterminar.RxMemoryData1IMPORTES.Value:=trim(frmterminar.FDQuery7.FieldByName('importe').asstring);
         frmterminar.RxMemoryData1IMPORTEF.Value:=STRTOFLOAT(frmterminar.FDQuery7.FieldByName('importe').asstring);
         frmterminar.RxMemoryData1.Post;
        frmterminar.FDQuery7.Next;
     end;
   end;

frmterminar.showmodal;
 EDIT2.TEXT:='0 - CONSUMIDOR FINAL';
 frmterminar.tipoivacliente:=3;
  LABEL7.Caption:=INTTOSTR(RxMemoryData1.RecordCount);
SUMA:=0;
EDIT1.Clear;
EDIT1.SetFocus;
sumaCantidad:=0;

end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
frmBuscarARticulos.CheckBox1.Checked:=FALSe;
frmBuscarARticulos.Edit1.Clear;
frmBuscarARticulos.showmodal;
if frmBuscarARticulos.ModalResult=MROK then
BEGIN
  FORM1.Edit1.Text:=TRIM(frmBuscarARticulos.DBGRID1.Fields[0].ASSTRING);

 FORM1.Edit1.SetFocus;
  FORM1.PANEL9.Caption:='<<<< INGRESE CANTIDAD O ARTICULO';
END;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
WinExec('calc.exe',SW_SHOWNORMAL);
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
var busca,busca_precio,CODIGO_BARRA:string;     ES_ENVASADO:BOOLEAN; barra_hasta:longint;
td:tdecimales;    precioTotal,precioUnit:real;   idartibuaca:longint;

begin
form1.FDQuery2.Close;
form1.FDQuery2.SQL.Clear;
form1.FDQuery2.SQL.Add('SELECT * FROM TCAJA WHERE estado=1 AND PC='+INTTOSTR(FORM1.PUESTO_PC));
form1.FDQuery2.Open;
if form1.FDQuery2.RecordCount=0 then
begin
  showmessage('Debe abrir la caja del d�a');
  exit;
end;






td:=tdecimales.Create;
     busca:=copy(trim(edit1.Text),1,1);

  if (trim(busca)='*')then
  begin
    esPorPrecio:=true;
    precioIngresado:=copy(trim(edit1.Text),2,length(trim(edit1.Text))) ;
     edit1.Clear;
     edit1.SetFocus;
        PANEL9.Caption:='<<<< INGRESE ARTICULO';
  end else
  begin
      if (trim(busca)='+') OR (trim(busca)='-')then
      begin
         cantidad:=copy(trim(edit1.Text),2,length(trim(edit1.Text))) ;
          if BUSCA='-' then
            cantidad:='-'+cantidad;
         edit1.Clear;
         edit1.SetFocus;
         PANEL9.Caption:='<<<< INGRESE ARTICULO';
      end else begin
         busca:=trim(edit1.Text) ;

         ES_ENVASADO:=FALSE;
         if COPY(BUSCA,1,1)=TRIM(TCONFI.GET_FDIGITOCODIGOBARRA) then
         BEGIN
            CODIGO_BARRA:=BUSCA;
            ES_ENVASADO:=TRUE;
            BUSCA:=COPY(CODIGO_BARRA,2,STRTOINT(TRIM(TCONFI.GET_FCANTIDADIGITOCODIGOBARRA)));
           CODIGO_BARRA:=COPY(CODIGO_BARRA,LENGTH(BUSCA)+1,LENGTH(CODIGO_BARRA));
            if   TRIM(TCONFI.GET_FCANTIDADIGITOCODIGOBARRA)='0' then
                 barra_hasta:=length(CODIGO_BARRA)
                 else
                   if   TRIM(TCONFI.GET_FCANTIDADIGITOCODIGOBARRA)='1' then
                        barra_hasta:=length(CODIGO_BARRA)-1
                        else
                          barra_hasta:=length(CODIGO_BARRA)-1;

             busca_precio:=COPY(CODIGO_BARRA,1,barra_hasta);
            precioUnit:=strtofloat(busca_precio)/100;
         END;

         self.FDQuery1.Close;
         self.FDQuery1.SQL.Clear;
         self.FDQuery1.SQL.Add('select * from tarticulos where codigobarra='+#39+trim(busca)+#39);

         self.FDQuery1.Open;
         if self.FDQuery1.RecordCount = 0 then
         begin
              showmessage('ARTICULO INEXISTENTE');
              EDIT1.Clear;
              EDIT1.SetFocus;
         exit;
         end;

        { if Application.MessageBox(PCHAR(TRIM(FDQuery1.FieldByName('DESCRIPCION').AsSTRING)), 'AGREGAR ARTICULO',
                 MB_ICONQUESTION OR MB_YESNO ) = ID_NO then
                 EXIT;         }


         precioTotal:=0;

        if ES_ENVASADO=FALSE then
         BEGIN

            if TRIM(FDQuery1.FieldByName('PRECIOVARIABLE').AsString)='S' then
             BEGIN
                PRPRECIOVARIABLE.Edit1.Clear;
                PRPRECIOVARIABLE.SHOWMODAL;
                precioUnit:=STRTOFLOAT(PRPRECIOVARIABLE.Edit1.Text);
              END ELSE
                 precioUnit:=FDQuery1.FieldByName('PRECIOVENTA').AsFloat;
        END;


          if (trim(cantidad)='') or (trim(cantidad)='0') then
             cantidad:='1';

         if self.RxMemoryData1.Active=false then
           begin
            self.RxMemoryData1.Close;
            self.RxMemoryData1.Open;
           end;

           idartibuaca:=FDQuery1.FieldByName('IDARTICULO').ASINTEGER;

           if buscrVencimientos(idartibuaca)=false  then
           begin
           edit1.Clear;
           edit1.SetFocus;
             exit;
           end;

           if esPorPrecio=false then
               precioTotal:=precioUnit * strtofloat(cantidad)
               else
                begin

                cantidad:=floattostr((strtofloat(precioIngresado)*strtofloat(cantidad))/precioUnit);
                 precioTotal:=precioUnit * strtofloat(cantidad);
                end;

           SUMA:=SUMA + precioTotal;



         self.RxMemoryData1.Append;
         SELF.RxMemoryData1IVA.Value:=TRIM(FDQuery1.FieldByName('IVA').AsSTRING);
         self.RxMemoryData1idarticulo.Value:=FDQuery1.FieldByName('IDARTICULO').ASINTEGER;
         self.RxMemoryData1cantidad.Value:=trim(cantidad);
         self.RxMemoryData1descripcion.Value:=TRIM(FDQuery1.FieldByName('DESCRIPCION').AsSTRING);
         self.RxMemoryData1preciounit.Value:=td.arma_importe_para_mostrar(precioUnit);
         self.RxMemoryData1preciototal.Value:=td.arma_importe_para_mostrar(precioTotal);
         self.RxMemoryData1.Post;
         LABEL2.Caption:=TD.arma_importe_para_mostrar(SUMA);
         edit1.Clear;
         edit1.SetFocus;
         cantidad:='1';
          PANEL9.Caption:='<<<< INGRESE CANTIDAD O ARTICULO';
      end;
  end;
td.Free;

end;
{var busca:string;
td:tdecimales;    precioTotal,precioUnit:real;
begin



td:=tdecimales.Create;
     busca:=copy(trim(edit1.Text),1,1);

      if trim(busca)='+' then
      begin
         cantidad:=copy(trim(edit1.Text),2,length(trim(edit1.Text))) ;
         edit1.Clear;
         edit1.SetFocus;
      end else begin
         busca:=trim(edit1.Text) ;

         self.FDQuery1.Close;
         self.FDQuery1.SQL.Clear;
         self.FDQuery1.SQL.Add('select * from tarticulos where codigobarra='+#39+trim(busca)+#39);

         self.FDQuery1.Open;
         if self.FDQuery1.RecordCount = 0 then
         begin
              showmessage('ARTICULO INEXISTENTE');
              EDIT1.Clear;
              EDIT1.SetFocus;
         exit;
         end;

          if TRIM(FDQuery1.FieldByName('PRECIOVARIABLE').AsString)='S' then
          BEGIN
             PRPRECIOVARIABLE.Edit1.Clear;
             PRPRECIOVARIABLE.SHOWMODAL;
             precioUnit:=STRTOFLOAT(PRPRECIOVARIABLE.Edit1.Text);
           END ELSE
           precioUnit:=FDQuery1.FieldByName('PRECIOVENTA').AsFloat;

         precioTotal:=0;



          if (trim(cantidad)='') or (trim(cantidad)='0') then
             cantidad:='1';

         if self.RxMemoryData1.Active=false then
           begin
            self.RxMemoryData1.Close;
            self.RxMemoryData1.Open;
           end;

           precioTotal:=precioUnit * strtofloat(cantidad);
           SUMA:=SUMA + precioTotal;
         self.RxMemoryData1.Append;
         SELF.RxMemoryData1IVA.Value:=TRIM(FDQuery1.FieldByName('IVA').AsSTRING);
         self.RxMemoryData1idarticulo.Value:=FDQuery1.FieldByName('IDARTICULO').ASINTEGER;
         self.RxMemoryData1cantidad.Value:=trim(cantidad);
         self.RxMemoryData1descripcion.Value:=TRIM(FDQuery1.FieldByName('DESCRIPCION').AsSTRING);
         self.RxMemoryData1preciounit.Value:=td.arma_importe_para_mostrar(precioUnit);
         self.RxMemoryData1preciototal.Value:=td.arma_importe_para_mostrar(precioTotal);
         self.RxMemoryData1.Post;
         LABEL2.Caption:=TD.arma_importe_para_mostrar(SUMA);
         edit1.Clear;
         edit1.SetFocus;
         cantidad:='1';
      end;
td.Free;


end;  }

procedure TForm1.Stock1Click(Sender: TObject);
begin
{if FORM1.ESADMINISTRADOR=2 then
BEGIN
SHOWMESSAGE('NO ERES ADMINISTRADOR');
EXIT;
END;  }


 verStock.Edit1.Clear;
 verStock.FDQuery1.Close;

 verStock.showmodal;
end;

procedure TForm1.terminar1Click(Sender: TObject);
begin
SpeedButton1Click(Sender);
end;

procedure TForm1.Usuarios1Click(Sender: TObject);
begin
if FORM1.ESADMINISTRADOR=2 then
BEGIN
SHOWMESSAGE('NO ERES ADMINISTRADOR');
EXIT;
END;
frmusuarios.showmodal;
end;

end.
