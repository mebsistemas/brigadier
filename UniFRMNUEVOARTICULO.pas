unit UniFRMNUEVOARTICULO;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.DBCtrls, Vcl.OleServer, Excel2010, Vcl.Samples.Gauges;

type
  TFRMNUEVOARTICULO = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    FDQuery1: TFDQuery;
    Edit5: TEdit;
    SpeedButton1: TSpeedButton;
    CheckBox1: TCheckBox;
    Label5: TLabel;
    Edit6: TEdit;
    Label6: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    FDQuery2: TFDQuery;
    DataSource1: TDataSource;
    BitBtn3: TBitBtn;
    FDQuery3: TFDQuery;
    Label7: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label8: TLabel;
    Edit7: TEdit;
    FDQuery4: TFDQuery;
    DataSource2: TDataSource;
    Edit8: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    FDQuery5: TFDQuery;
    DataSource3: TDataSource;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label11: TLabel;
    Edit9: TEdit;
    ComboBox1: TComboBox;
    Label12: TLabel;
    Button1: TButton;
    Excel: TExcelApplication;
    Gauge1: TGauge;
    Label13: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
    procedure Edit9KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    opcion:string;
    FUNCTION CARGARRUBRO:BOOLEAN;
    FUNCTION CARGARPROVEEDOR:BOOLEAN;
    FUNCTION CARGARmarcas:BOOLEAN ;
  end;

var
  FRMNUEVOARTICULO: TFRMNUEVOARTICULO;

implementation

{$R *.dfm}

uses Unit1, Unit2NUEVORUBRO, Unitnuevoproveedor4, UnFRMNUEVAMARCAit4,
  UnitFRMAGREGARVENCIMIENTOS4;

procedure TFRMNUEVOARTICULO.BitBtn1Click(Sender: TObject);
var sqlvar,PRECIOvARIABLE:string; sale:boolean;  idar,IDRUBRO,IDPROVEEDOR,IDARTICULO:longint;
stockinicia, stockventa,stockcompra,stockbaja,stock,stockALERTA:real;
IDMARCA:LONGINT;

 i: Integer;
  si: String;
  Hoja: _WorkSheet;
begin
if TRIM(EDIT9.Text)='' then
  EDIT9.Text:='1';

 if TRIM(EDIT9.Text)='0' then
  EDIT9.Text:='0';


if trim(edit1.Text)='' then
begin
  showmessage('Debe ingresar el Código de Barra');
  exit;
end;

 if trim(edit2.Text)='' then
begin
  showmessage('Debe ingresar la Descripción');
  exit;
end;

  if trim(edit3.Text)='' then
begin
  showmessage('Debe ingresar el Precio de Venta');
  exit;
end;

  if trim(combobox1.Text)='' then
begin
  showmessage('Debe ingresar el IVA');
  exit;
end;

if trim(edit6.Text)='' then
begin
 edit6.Text:='0';
end;

if trim(edit7.Text)='' then
begin
 edit7.Text:='0';
end;

if trim(edit8.Text)='' then
begin
 edit8.Text:='0';
end;

if TRIM(SELF.DBLookupComboBox1.Text)='' then
begin
 DBLookupComboBox1.KeyValue:=0;
end;
IDRUBRO:=DBLookupComboBox1.KeyValue;


if TRIM(SELF.DBLookupComboBox2.Text)='' then
begin
 DBLookupComboBox2.KeyValue:=0;
end;
IDPROVEEDOR:=DBLookupComboBox2.KeyValue;


  if TRIM(SELF.DBLookupComboBox3.Text)='' then
begin
 DBLookupComboBox3.KeyValue:=0;
end;
IDMARCA:=DBLookupComboBox3.KeyValue;




 if SELF.CheckBox1.Checked=TRUE then
     PRECIOvARIABLE:='S'
     ELSE
     PRECIOvARIABLE:='N';



if trim(edit1.Text)='AUTOMATICO' then
begin


 self.FDQuery1.Close;
 self.FDQuery1.Connection:=form1.FDConnection1;
 self.FDQuery1.SQL.Clear;
 self.FDQuery1.SQL.Add('SELECT MAX(IDARTICULO) AS MAXIMO FROM TARTICULOS');
 self.FDQuery1.OPEN;
 EDIT1.Text:=INTTOSTR(SELF.FDQuery1.FieldByName('MAXIMO').AsInteger + 1);
END;
  stockinicia:=strtofloat(edit6.Text);
  stockventa:=0;
  stockcompra:=0;
  stockbaja:=0;
  stock:=stockinicia;
   stockALERTA:=strtofloat(edit7.Text);



form1.FDConnection1.StartTransaction;
 try
  if trim(opcion)='N' then
   begin
   FDQuery1.Close;
    self.FDQuery1.Connection:=form1.FDConnection1;
   FDQuery1.SQL.Clear;
   FDQuery1.SQL.Add('SELECT * FROM TARTICULOS WHERE codigobarra='+#39+trim(edit1.Text)+#39);
   FDQuery1.OpeN;
   if FDQuery1.IsEmpty=FALSE then
   BEGIN
     SHOWMESSAGE('YA EXISTE UN ARTICULO CON EL CODIGO DE BARRA INGRESADO');
     EXIT;
   END;

      sqlvar:='insert into tarticulos (descripcion,precioventa,iva,codigobarra,preciovariable,stockinicia, stockventa,stockcompra,stockbaja,stock,IDRUBRO,STOCKALERTA,IDPROVEEDOR,COSTO,IDMARCA,DESCUENTAPOR)  '+
              ' values ('+#39+trim(edit2.Text)+#39+','+#39+trim(edit3.Text)+#39+
              ','+#39+trim(combobox1.Text)+#39+','+#39+trim(edit1.Text)+#39+
              ','+#39+trim(PRECIOvARIABLE)+#39+','+floattostr(stockinicia)+
              ','+floattostr(stockventa)+','+floattostr(stockcompra)+','+floattostr(stockbaja)+','+floattostr(stock)+','+INTTOSTR(IDRUBRO)+','+FLOATTOSTR(stockALERTA)+
              ','+INTTOSTR(IDPROVEEDOR)+','+FLOATTOSTR(STRTOFLOAT(EDIT8.Text))+
              ','+INTTOSTR(IDMARCA)+','+FLOATTOSTR(STRTOFLOAT(EDIT9.Text))+')';
  end;

   if trim(opcion)='M' then
   begin


      idar:=strtoint(edit5.text);
       FDQuery1.Close;
        self.FDQuery1.Connection:=form1.FDConnection1;
       FDQuery1.SQL.Clear;
       FDQuery1.SQL.Add('SELECT * FROM TARTICULOS WHERE codigobarra='+#39+trim(edit1.Text)+#39+' AND IDARTICULO<>'+INTTOSTR(IDAR));
       FDQuery1.OpeN;
       if FDQuery1.IsEmpty=FALSE then
       BEGIN
         SHOWMESSAGE('YA EXISTE UN ARTICULO CON EL CODIGO DE BARRA INGRESADO');
         EXIT;
       END;


      IDARTICULO:=IDAR;
      sqlvar:='update tarticulos set descripcion='+#39+trim(edit2.Text)+#39+
                                   ',  precioventa='+#39+trim(edit3.Text)+#39+
                                   ',  iva='+#39+trim(combobox1.Text)+#39+
                                   ', codigobarra='+#39+trim(edit1.Text)+#39+
                                   ', preciovariable='+#39+PRECIOvARIABLE+#39+
                                     ', IDRUBRO='+INTTOSTR(IDRUBRO)+
                                    ', STOCKALERTA='+FLOATTOSTR(STRTOFLOAT(EDIT7.Text))+
                                    ', IDPROVEEDOR='+INTTOSTR(IDPROVEEDOR)+
                                    ', COSTO='+FLOATTOSTR(STRTOFLOAT(EDIT8.Text))+
                                    ', IDMARCA='+INTTOSTR(IDMARCA)+
                                    ', DESCUENTAPOR='+FLOATTOSTR(STRTOFLOAT(EDIT9.Text))+
                                   ' where idarticulo='+inttostr(idar);





  end;


 self.FDQuery1.Close;
 self.FDQuery1.Connection:=form1.FDConnection1;
 self.FDQuery1.SQL.Clear;
 self.FDQuery1.SQL.Add(sqlvar);
 self.FDQuery1.ExecSQL;

   if trim(opcion)='N' then
   BEGIN
  self.FDQuery1.Close;
 self.FDQuery1.Connection:=form1.FDConnection1;
 self.FDQuery1.SQL.Clear;
 self.FDQuery1.SQL.Add('SELECT MAX(IDARTICULO) AS MAXIMO FROM TARTICULOS');
 self.FDQuery1.OPEN;
 IDARTICULO:=FDQuery1.FieldByName('MAXIMO').AsInteger;
 END;

  self.FDQuery1.Close;
    self.FDQuery1.Connection:=form1.FDConnection1;
    self.FDQuery1.SQL.Clear;
    self.FDQuery1.SQL.Add('insert into thistorial_costo (idarticulo,idproveedor,costo,fecha)'+
    ' values ('+inttostr(IDARTICULO)+','+inttostr(IDPROVEEDOR)+','+FLOATTOSTR(STRTOFLOAT(EDIT8.Text))+','+#39+trim(datetostr(date))+#39+')');
    self.FDQuery1.ExecSQL;

 form1.FDConnection1.Commit;



 showmessage('Se ha guardo correctamente el artciulo');
Edit1.Clear;
Edit2.Clear;
Edit3.Clear;

Edit6.Clear;
CheckBox1.Checked:=false;
sale:=true;
except
   on E: Exception do
    begin
       form1.FDConnection1.Rollback;
       sale:=false;
       showmessage('Se produjo un error al procesar el articulo. '+ E.Message);
    end;
 end;

 if sale=true then
 close;
end;

procedure TFRMNUEVOARTICULO.BitBtn2Click(Sender: TObject);
begin
CLOSE;
end;

procedure TFRMNUEVOARTICULO.BitBtn3Click(Sender: TObject);
begin
NUEVORUBRO.Edit1.Clear;
NUEVORUBRO.SHOWMODAL;
SELF.CARGARRUBRO;
end;

procedure TFRMNUEVOARTICULO.BitBtn4Click(Sender: TObject);
begin
FRMNUEVAMARCA.SHOWMODAL;
SELF.CARGARmarcas;
end;

procedure TFRMNUEVOARTICULO.BitBtn5Click(Sender: TObject);
begin
nuevoproveedor.EDIT1.Clear;
nuevoproveedor.EDIT2.Clear;
nuevoproveedor.EDIT3.Clear;
nuevoproveedor.EDIT4.Clear;
nuevoproveedor.N:='N';
nuevoproveedor.showmodal;
CARGARPROVEEDOR;
end;

procedure TFRMNUEVOARTICULO.Button1Click(Sender: TObject);
var sqlvar,PRECIOvARIABLE:string; sale:boolean;  idar,IDRUBRO,IDPROVEEDOR,IDARTICULO:longint;
stockinicia, stockventa,stockcompra,stockbaja,stock,stockALERTA:real;
IDMARCA,CANT:LONGINT;    codigo,DES,precioventa:sTRING;

 i: Integer;
  si: String;
  Hoja: _WorkSheet;
begin
if TRIM(EDIT9.Text)='' then
  EDIT9.Text:='1';

 if TRIM(EDIT9.Text)='0' then
  EDIT9.Text:='0';


if trim(edit1.Text)='' then
begin
  showmessage('Debe ingresar el Código de Barra');
  exit;
end;

 if trim(edit2.Text)='' then
begin
  showmessage('Debe ingresar la Descripción');
  exit;
end;

  if trim(edit3.Text)='' then
begin
  showmessage('Debe ingresar el Precio de Venta');
  exit;
end;

  if trim(combobox1.Text)='' then
begin
  showmessage('Debe ingresar el IVA');
  exit;
end;

if trim(edit6.Text)='' then
begin
 edit6.Text:='0';
end;

if trim(edit7.Text)='' then
begin
 edit7.Text:='0';
end;

if trim(edit8.Text)='' then
begin
 edit8.Text:='0';
end;

if TRIM(SELF.DBLookupComboBox1.Text)='' then
begin
 DBLookupComboBox1.KeyValue:=0;
end;
IDRUBRO:=DBLookupComboBox1.KeyValue;


if TRIM(SELF.DBLookupComboBox2.Text)='' then
begin
 DBLookupComboBox2.KeyValue:=0;
end;
IDPROVEEDOR:=DBLookupComboBox2.KeyValue;


  if TRIM(SELF.DBLookupComboBox3.Text)='' then
begin
 DBLookupComboBox3.KeyValue:=0;
end;
IDMARCA:=DBLookupComboBox3.KeyValue;




 if SELF.CheckBox1.Checked=TRUE then
     PRECIOvARIABLE:='S'
     ELSE
     PRECIOvARIABLE:='N';

 CANT:=0;
 SELF.Gauge1.MinValue:=0;
 Gauge1.MaxValue:=53;
Excel.Workbooks.Open( 'C:\DESARROLLOS\lista.xlsx',
  EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
  EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam,
  EmptyParam, EmptyParam, EmptyParam, EmptyParam, 0 );
Hoja := Excel.Worksheets.Item[1] as _WorkSheet;
i := 2;
si := IntToStr( i );
repeat

   codigo:=Hoja.Range['A'+si,'A'+si].Value2 ; // Código
   des:=copy(Hoja.Range['B'+si,'B'+si].Value2 ,1,50);

   des  := StringReplace(des, '''', '',
                          [rfReplaceAll, rfIgnoreCase]);

   precioventa:=Hoja.Range['C'+si,'C'+si].Value2 ;
   precioventa  := StringReplace(precioventa, '$', '',
                          [rfReplaceAll, rfIgnoreCase]);

   if trim(precioventa)='-' then
     precioventa:='0';

     precioventa  := StringReplace(precioventa, ',', '.',
                          [rfReplaceAll, rfIgnoreCase]) ;

   IDRUBRO:=0 ;


    stockinicia:=strtofloat(edit6.Text);
  stockventa:=0;
  stockcompra:=0;
  stockbaja:=0;
  stock:=stockinicia;
   stockALERTA:=strtofloat(edit7.Text);



form1.FDConnection1.StartTransaction;
 try

      sqlvar:='insert into tarticulos (descripcion,precioventa,iva,codigobarra,preciovariable,stockinicia, stockventa,stockcompra,stockbaja,stock,IDRUBRO,STOCKALERTA,IDPROVEEDOR,COSTO,IDMARCA,DESCUENTAPOR)  '+
              ' values ('+#39+trim(des)+#39+','+#39+trim(precioventa)+#39+
              ','+#39+trim(combobox1.Text)+#39+','+#39+trim(codigo)+#39+
              ','+#39+trim(PRECIOvARIABLE)+#39+','+floattostr(stockinicia)+
              ','+floattostr(stockventa)+','+floattostr(stockcompra)+','+floattostr(stockbaja)+','+floattostr(stock)+','+INTTOSTR(IDRUBRO)+','+FLOATTOSTR(stockALERTA)+
              ','+INTTOSTR(IDPROVEEDOR)+','+FLOATTOSTR(STRTOFLOAT(EDIT8.Text))+
              ','+INTTOSTR(IDMARCA)+','+FLOATTOSTR(STRTOFLOAT(EDIT9.Text))+')';




 self.FDQuery1.Close;
 self.FDQuery1.Connection:=form1.FDConnection1;
 self.FDQuery1.SQL.Clear;
 self.FDQuery1.SQL.Add(sqlvar);
 self.FDQuery1.ExecSQL;




 form1.FDConnection1.Commit;
 EXCEPT
   form1.FDConnection1.Rollback;
   SHOWMESSAGE(INTTOSTR(CANT)+'   '+DES);
 end;

  INC(CANT);
  Gauge1.Progress:=CANT;
  LABEL13.Caption:=INTTOSTR(CANT);
  APPLICATION.ProcessMessages;
  Inc( i );
  si := IntToStr( i );
until ( VarType( Excel.Range['A'+si,'A'+si].Value2 ) = VarEmpty );

SHOWMESSAGE('FIN '+INTTOSTR(CANT));
end;

procedure TFRMNUEVOARTICULO.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13  then
edit2.SetFocus;
end;

procedure TFRMNUEVOARTICULO.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13  then
edit3.SetFocus;
end;

procedure TFRMNUEVOARTICULO.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0','1','2','3','4','5','6','7','8','9','+','-','.',#8,#13] then
    edit3.readonly:=false
    else
     edit3.readonly:=true;

if key=#13  then
combobox1.SetFocus;
end;

procedure TFRMNUEVOARTICULO.Edit4KeyPress(Sender: TObject; var Key: Char);
begin


if key=#13  then
self.edit6.SetFocus;
end;

procedure TFRMNUEVOARTICULO.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0','1','2','3','4','5','6','7','8','9','+','-','.',#8,#13] then
    edit6.readonly:=false
    else
     edit6.readonly:=true;

if key=#13  then
self.BitBtn1.SetFocus;
end;

procedure TFRMNUEVOARTICULO.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0','1','2','3','4','5','6','7','8','9','+','-','.',#8,#13] then
    edit7.readonly:=false
    else
     edit7.readonly:=true;
end;

procedure TFRMNUEVOARTICULO.Edit9KeyPress(Sender: TObject; var Key: Char);
begin
if key in ['0','1','2','3','4','5','6','7','8','9','.',#8,#13] then
    edit9.readonly:=false
    else
     edit9.readonly:=true;
end;

FUNCTION TFRMNUEVOARTICULO.CARGARRUBRO:BOOLEAN;
BEGIN
SELF.FDQuery3.Close;
SELF.FDQuery3.SQL.Clear;
SELF.FDQuery3.SQL.Add('SELECT * FROM TRUBROS ORDER BY DESCRIPCION ASC');
SELF.FDQuery3.Open;

END;

FUNCTION TFRMNUEVOARTICULO.CARGARPROVEEDOR:BOOLEAN;
BEGIN
SELF.FDQuery4.Close;
SELF.FDQuery4.SQL.Clear;
SELF.FDQuery4.SQL.Add('SELECT IDPROVEEDOR,RAZONSOCIAL FROM TPROVEEDORES ORDER BY RAZONSOCIAL ASC');
SELF.FDQuery4.Open;

END;



FUNCTION TFRMNUEVOARTICULO.CARGARmarcas:BOOLEAN;
BEGIN
SELF.FDQuery5.Close;
SELF.FDQuery5.SQL.Clear;
SELF.FDQuery5.SQL.Add('SELECT IDMARCA,DESCRIPCION FROM TMARCAS ORDER BY DESCRIPCION ASC');
SELF.FDQuery5.Open;

END;


procedure TFRMNUEVOARTICULO.SpeedButton1Click(Sender: TObject);
begin
edit1.Text:='AUTOMATICO';

end;

end.
