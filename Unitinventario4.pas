unit Unitinventario4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,UNIT1, RxMemDS;

type
  Tinventario = class(TForm)
    Panel1: TPanel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    DataSource2: TDataSource;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1idarticulo: TIntegerField;
    RxMemoryData1articulo: TStringField;
    RxMemoryData1stock: TStringField;
    RxMemoryData1inventario: TStringField;
    RxMemoryData1diferencia: TStringField;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn4: TBitBtn;
    RxMemoryData1BARRA: TStringField;
    BitBtn5: TBitBtn;
    FDQuery3: TFDQuery;
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      FUNCTION CARGARRUBRO:BOOLEAN;
      FUNCTION CARGARPROVEEDOR:BOOLEAN;
  end;

var
  inventario: Tinventario;

implementation

{$R *.dfm}

uses Unit4FRMINGRESARINVENTARIO, Unit4frmProgreso;

procedure Tinventario.BitBtn1Click(Sender: TObject);
begin
{if FORM1.demo=TRUE then
 BEGIN
showmessage('VERSION DEMO');
EXIT;
 END; }

 self.RxMemoryData1.Close;
 self.RxMemoryData1.Open;
 fdquery2.Close;
 fdquery2.SQL.Clear;
 fdquery2.SQL.Add('select idarticulo, descripcion , stock,CODIGOBARRA from  tarticulos where idrubro='+inttostr(self.DBLookupComboBox2.KeyValue));
 fdquery2.Open;
 while not fdquery2.Eof do
 begin
      self.RxMemoryData1.Append;
      self.RxMemoryData1idarticulo.Value:=fdquery2.FieldByName('idarticulo').AsInteger;
      self.RxMemoryData1articulo.Value:=trim(fdquery2.FieldByName('descripcion').Asstring);
      self.RxMemoryData1stock.Value:=trim(fdquery2.FieldByName('stock').Asstring);
      self.RxMemoryData1inventario.Value:='';
      self.RxMemoryData1diferencia.Value:='';
      SELF.RxMemoryData1BARRA.Value:=trim(fdquery2.FieldByName('CODIGOBARRA').Asstring);
      self.RxMemoryData1.Post;


   fdquery2.Next;
 end;
 RxMemoryData1.First;

end;

procedure Tinventario.BitBtn2Click(Sender: TObject);
var i:longint;
begin
{if FORM1.demo=TRUE then
 BEGIN
showmessage('VERSION DEMO');
EXIT;
 END;  }
 if Application.MessageBox( '¿Desea continuar con el proceso del inventario?', 'CREANDO INVENTARIO',
  MB_ICONQUESTION OR MB_YESNO ) = ID_YES then
  BEGIN

  form1.FDConnection1.StartTransaction;
  try
    self.RxMemoryData1.open;
    self.RxMemoryData1.First;
    frmProgreso.Gauge1.MinValue:=0;
    frmProgreso.Gauge1.MaxValue:=RxMemoryData1.RecordCount;
    i:=0;
    frmProgreso.Show;
    application.ProcessMessages;
    while not self.RxMemoryData1.Eof do
    begin
    if trim(self.RxMemoryData1inventario.Value)<>'' then
      begin
        self.FDQuery3.Close;
        self.FDQuery3.SQL.Clear;
        self.FDQuery3.SQL.Add('update tarticulos set stockinicia='+floattostr(strtofloat(self.RxMemoryData1inventario.Value))+
           ',  stockventa=0, stockcompra=0, stockbaja=0, stock='+floattostr(strtofloat(self.RxMemoryData1inventario.Value))+
           ' where idarticulo='+inttostr(self.RxMemoryData1idarticulo.Value) );
        self.FDQuery3.ExecSQL;
     end;
     inc(i);
        frmProgreso.Gauge1.Progress:=i;
       self.RxMemoryData1.Next;
    end;
     frmProgreso.Close;
    form1.FDConnection1.Commit;

    showmessage('PROCESO CORRECTO');
  except

       on E : Exception do
       BEGIN
         form1.FDConnection1.Rollback;
         ShowMessage(E.ClassName+' error raised, with message : '+E.Message);
       END;
  end;

  END;
  RxMemoryData1.First;
end;

procedure Tinventario.BitBtn3Click(Sender: TObject);
begin
CLOSE;
end;

procedure Tinventario.BitBtn4Click(Sender: TObject);
var BUSCA,CODIGO_BARRA:string;  barra_hasta:longint;
begin
BUSCA:=TRIM(EDIT1.Text);
  if COPY(BUSCA,1,1)=TRIM(form1.TCONFI.GET_FDIGITOCODIGOBARRA) then
         BEGIN
            CODIGO_BARRA:=BUSCA;

            BUSCA:=COPY(CODIGO_BARRA,2,STRTOINT(TRIM(form1.TCONFI.GET_FCANTIDADIGITOCODIGOBARRA)));
           CODIGO_BARRA:=COPY(CODIGO_BARRA,LENGTH(BUSCA)+1,LENGTH(CODIGO_BARRA));
            if   TRIM(form1.TCONFI.GET_FCANTIDADIGITOCODIGOBARRA)='0' then
                 barra_hasta:=length(CODIGO_BARRA)
                 else
                   if   TRIM(form1.TCONFI.GET_FCANTIDADIGITOCODIGOBARRA)='1' then
                        barra_hasta:=length(CODIGO_BARRA)-1
                        else
                          barra_hasta:=length(CODIGO_BARRA)-1;


         END ;

if FORM1.demo=TRUE then
 BEGIN
showmessage('VERSION DEMO');
EXIT;
 END;

 self.RxMemoryData1.Close;
 self.RxMemoryData1.Open;
 fdquery2.Close;
 fdquery2.SQL.Clear;
 fdquery2.SQL.Add('select idarticulo, descripcion , stock,CODIGOBARRA from  tarticulos where CODIGOBARRA='+#39+TRIM(BUSCA)+#39);
 fdquery2.Open;
 while not fdquery2.Eof do
 begin
      self.RxMemoryData1.Append;
      self.RxMemoryData1idarticulo.Value:=fdquery2.FieldByName('idarticulo').AsInteger;
      self.RxMemoryData1articulo.Value:=trim(fdquery2.FieldByName('descripcion').Asstring);
      self.RxMemoryData1stock.Value:=trim(fdquery2.FieldByName('stock').Asstring);
      self.RxMemoryData1inventario.Value:='';
      self.RxMemoryData1diferencia.Value:='';
         SELF.RxMemoryData1BARRA.Value:=trim(fdquery2.FieldByName('CODIGOBARRA').Asstring);
      self.RxMemoryData1.Post;


   fdquery2.Next;
 end;
 RxMemoryData1.First;
end;

procedure Tinventario.BitBtn5Click(Sender: TObject);
begin
FRMINGRESARINVENTARIO.Edit1.Text:=TRIM(SELF.RxMemoryData1articulo.Value);
FRMINGRESARINVENTARIO.Edit2.Clear;
FRMINGRESARINVENTARIO.SHOWMODAL;
if FRMINGRESARINVENTARIO.ModalResult=MROK then
BEGIN
  SELF.RxMemoryData1.Edit;
  SELF.RxMemoryData1inventario.Value:=TRIM(FRMINGRESARINVENTARIO.Edit2.Text);
  SELF.RxMemoryData1diferencia.Value:=FLOATTOSTR(STRTOFLOAT(RxMemoryData1inventario.Value) - STRTOFLOAT(SELF.RxMemoryData1stock.Value));
  SELF.RxMemoryData1.Post;

END;
end;

FUNCTION Tinventario.CARGARRUBRO:BOOLEAN;
BEGIN
SELF.FDQuery1.Close;
SELF.FDQuery1.SQL.Clear;
SELF.FDQuery1.SQL.Add('SELECT * FROM TRUBROS ORDER BY DESCRIPCION ASC');
SELF.FDQuery1.Open;

END;

procedure Tinventario.DBGrid1DblClick(Sender: TObject);
begin
BitBtn5Click(Sender);
end;

procedure Tinventario.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if KEY=#13 then
   BitBtn4Click(SendeR);
end;

FUNCTION Tinventario.CARGARPROVEEDOR:BOOLEAN;
BEGIN
{SELF.FDQuery2.Close;
SELF.FDQuery2.SQL.Clear;
SELF.FDQuery2.SQL.Add('SELECT IDPROVEEDOR,RAZONSOCIAL FROM TPROVEEDORES ORDER BY RAZONSOCIAL ASC');
SELF.FDQuery2.Open;
                        }
END;

procedure Tinventario.FormShow(Sender: TObject);
begin
CARGARPROVEEDOR;
CARGARRUBRO;
EDIT1.Clear;
end;

end.
