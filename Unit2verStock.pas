unit Unit2verStock;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,unit1;

type
  TverStock = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  verStock: TverStock;

implementation

{$R *.dfm}

uses Unit2cargarStock, UnitIMPRIMIRSTOCKCARGA2;

procedure TverStock.BitBtn1Click(Sender: TObject);
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
self.FDQuery1.Close;
 self.FDQuery1.SQL.Clear;
  self.FDQuery1.SQL.Add('select idarticulo,descripcion, stockinicia,stockcompra,stockbaja,stockventa,stock from tarticulos where codigobarra='+#39+trim(busca)+#39);
   self.FDQuery1.Open;

end;

procedure TverStock.BitBtn2Click(Sender: TObject);
begin
close;
end;

procedure TverStock.BitBtn3Click(Sender: TObject);
begin
if FORM1.ESADMINISTRADOR=2 then
BEGIN
SHOWMESSAGE('NO ERES ADMINISTRADOR');
EXIT;
END ;

if SELF.FDQuery1.IsEmpty=TRUE then
  EXIT;

cargarStock.OP:='N';
cargarStock.Caption:='CARGAR STOCK';
DBGrid1DblClick(Sender);
end;

procedure TverStock.BitBtn4Click(Sender: TObject);
begin
if FORM1.ESADMINISTRADOR=2 then
BEGIN
SHOWMESSAGE('NO ERES ADMINISTRADOR');
EXIT;
END ;

if SELF.FDQuery1.IsEmpty=TRUE then
  EXIT;

cargarStock.Caption:='ELIMINAR STOCK';
cargarStock.OP:='E';
DBGrid1DblClick(Sender);
end;

procedure TverStock.BitBtn5Click(Sender: TObject);
begin
IMPRIMIRSTOCKCARGA.SHOWMODAL;
end;

procedure TverStock.DBGrid1DblClick(Sender: TObject);
begin
if SELF.FDQuery1.IsEmpty=TRUE then
  EXIT;

cargarStock.Edit1.Text:=trim(self.DataSource1.DataSet.FieldByName('descripcion').asstring);
cargarStock.idarticulo:=self.DataSource1.DataSet.FieldByName('idarticulo').asinteger;
cargarStock.Edit2.Clear;
cargarStock.showmodal;
BitBtn1Click(Sender);
end;

procedure TverStock.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
BitBtn1Click(Sender)
end;

end.
