unit UnifrmActualizaPrecioporProveedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,unit1,CLASS_DECIMALES, RxMemDS,
  Vcl.Menus;

type
  TfrmActualizaPrecioporProveedor = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    BitBtn2: TBitBtn;
    DataSource1: TDataSource;
    FDQuery1: TFDQuery;
    DataSource2: TDataSource;
    FDQuery2: TFDQuery;
    Edit1: TEdit;
    Label2: TLabel;
    ComboBox1: TComboBox;
    BitBtn3: TBitBtn;
    FDQuery3: TFDQuery;
    RxMemoryData1: TRxMemoryData;
    RxMemoryData1idarticulo: TIntegerField;
    RxMemoryData1descripcion: TStringField;
    RxMemoryData1precio: TStringField;
    RxMemoryData1porc: TStringField;
    RxMemoryData1precionuevo: TStringField;
    PopupMenu1: TPopupMenu;
    BorrarNuevoPrecio1: TMenuItem;
    RxMemoryData1actualiza: TIntegerField;
    BitBtn4: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BorrarNuevoPrecio1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    function cargar:boolean;
  public
    { Public declarations }
  end;

var
  frmActualizaPrecioporProveedor: TfrmActualizaPrecioporProveedor;

implementation

{$R *.dfm}

uses UnitfrmActualizaindivualARticulo;

procedure TfrmActualizaPrecioporProveedor.BitBtn1Click(Sender: TObject);
begin
CLOSE;
end;

procedure TfrmActualizaPrecioporProveedor.BitBtn2Click(Sender: TObject);

begin
  cargar;
end;

function TfrmActualizaPrecioporProveedor.cargar:boolean;
var sql:string;
begin
SELF.RxMemoryData1.Close;
SELF.RxMemoryData1.Open;
sql:='select descripcion, precioventa,stock,idarticulo from tarticulos where idproveedor='+inttostr(self.DBLookupComboBox1.KeyValue)+' ORDER BY descripcion ASC';
self.FDQuery1.Close;
self.FDQuery1.SQL.Clear;
self.FDQuery1.SQL.Add(sql);
self.FDQuery1.open;
while NOT SELF.FDQuery1.Eof DO
BEGIN
  SELF.RxMemoryData1.Append;
  SELF.RxMemoryData1idarticulo.Value:=SELF.FDQuery1.FieldByName('IDARTICULO').AsInteger;
  SELF.RxMemoryData1descripcion.Value:=TRIM(SELF.FDQuery1.FieldByName('descripcion').AsString);
  SELF.RxMemoryData1precio.Value:=TRIM(SELF.FDQuery1.FieldByName('precioventa').AsString);
  self.RxMemoryData1actualiza.Value:=0;

  SELF.RxMemoryData1.Post;


SELF.FDQuery1.Next;
END;
 RxMemoryData1.First;

end;

procedure TfrmActualizaPrecioporProveedor.BitBtn3Click(Sender: TObject);
VAR POR:REAL; PRECIO,PRECIOFINAL:REAL; SPRECIOFINAL,sql:sTRING;
TD:TDECIMALES;
begin
  if SELF.FDQuery1.RecordCount=0 then
  begin
   Showmessage('NO HAY ARTICULOS SELECCIONADO PARA ACTUALIZAR');
  exit;
end;
if trim(edit1.Text)='' then
begin
   Showmessage('DEBE INGRESAR EL PORCENT. DE ACTUALIZACION');
  exit;
end;
if Application.MessageBox( '�Desea actualizar los precios ?', 'Actualizar Precios',
  MB_ICONQUESTION OR MB_YESNO ) = ID_YES then
  BEGIN
    { Form1.FDConnection1.StartTransaction;
     TRY }
       TD:=TDECIMALES.Create;
       POR:=STRTOFLOAT(EDIT1.Text);
       RxMemoryData1.Open;
       RxMemoryData1.First;
       while NOT RxMemoryData1.Eof do
        BEGIN
           PRECIO:=STRTOFLOAT(SELF.RxMemoryData1precio.Value);

           if COMBOBOX1.ItemIndex=0 then
             PRECIOFINAL:=PRECIO + ((PRECIO *POR)/100);

          if COMBOBOX1.ItemIndex=1 then
             PRECIOFINAL:=PRECIO - ((PRECIO *POR)/100);

            SPRECIOFINAL:=TD.arma_importe_para_mostrar(PRECIOFINAL);
            SELF.RxMemoryData1.Edit;
            SELF.RxMemoryData1porc.Value:=TD.arma_importe_para_mostrar(POR)+'%';
            SELF.RxMemoryData1precionuevo.Value:=TRIM(SPRECIOFINAL);
             self.RxMemoryData1actualiza.Value:=1;
            SELF.RxMemoryData1.Post;

           { SELF.FDQuery3.Close;
            SELF.FDQuery3.SQL.Clear;
            SELF.FDQuery3.SQL.Add('UPDATE TARTICULOS SET PRECIOVENTA='+#39+TRIM(SPRECIOFINAL)+#39+' WHERE IDARTICULO='+INTTOSTR(SELF.DataSource1.DataSet.FieldByName('IDARTICULO').AsInteger));
            SELF.FDQuery3.ExecSQL;  }

        RxMemoryData1.Next;
       END;
     TD.Free;
    {   Form1.FDConnection1.Commit;
       SHOWMESSAGE('SE HAN ACTUALIZADO LOS PRECIOS CORRECTAMENTE');
    EXCEPT
       On E : Exception  do
      BEGIN
       Form1.FDConnection1.Rollback;
      ShowMessage(E.ClassName+' error generado, con mensaje : '+E.Message);

     END;
    END;  }
  END;

 sql:='select descripcion, precioventa,stock,idarticulo from tarticulos where idproveedor='+inttostr(self.DBLookupComboBox1.KeyValue)+' ORDER BY descripcion ASC';
self.FDQuery1.Close;
self.FDQuery1.SQL.Clear;
self.FDQuery1.SQL.Add(sql);
self.FDQuery1.open;
end;

procedure TfrmActualizaPrecioporProveedor.BitBtn4Click(Sender: TObject);
begin
if SELF.RxMemoryData1.RecordCount=0 THEN
BEGIN
   SHOWMESSAGE('NO HAY ARTICULOS PARA ACTUALIZAR');
  EXIT;
END;
if Application.MessageBox( '�Desea CONFIRMAR la actualizzaci�n de los precios ?', 'Actualizar Precios',
  MB_ICONQUESTION OR MB_YESNO ) = ID_YES then
  BEGIN
    Form1.FDConnection1.StartTransaction;
    TRY
      SELF.RxMemoryData1.Open;
      SELF.RxMemoryData1.First;
       while NOT SELF.RxMemoryData1.Eof do
        BEGIN
            if SELF.RxMemoryData1actualiza.Value=1 then
            BEGIN
               SELF.FDQuery3.Close;
               SELF.FDQuery3.SQL.Clear;
               SELF.FDQuery3.SQL.Add('UPDATE TARTICULOS SET PRECIOVENTA='+#39+TRIM(SELF.RxMemoryData1precionuevo.Value)+#39+' WHERE IDARTICULO='+INTTOSTR(SELF.RxMemoryData1idarticulo.Value));
               SELF.FDQuery3.ExecSQL;


            END;

         SELF.RxMemoryData1.Next;
        END;
      Form1.FDConnection1.Commit;
       SHOWMESSAGE('SE HAN ACTUALIZADO LOS PRECIOS CORRECTAMENTE');
       cargar;
    EXCEPT
       On E : Exception  do
      BEGIN
       Form1.FDConnection1.Rollback;
      ShowMessage(E.ClassName+' error generado, con mensaje : '+E.Message);

     END;

    END;

  END;
end;

procedure TfrmActualizaPrecioporProveedor.BorrarNuevoPrecio1Click(
  Sender: TObject);
begin
self.RxMemoryData1.Edit;
 self.RxMemoryData1actualiza.Value:=0;
 self.RxMemoryData1porc.Value:='';
 self.RxMemoryData1precionuevo.Value:='';
 self.RxMemoryData1.Post;

end;

procedure TfrmActualizaPrecioporProveedor.DBGrid1DblClick(Sender: TObject);
VAR TD:TDECIMALES;   POR,PRECIO,PRECIOFINAL:REAL;  SPRECIOFINAL:sTRING;
begin
frmActualizaindivualARticulo.Edit1.Clear;
frmActualizaindivualARticulo.Label3.Caption:='';
frmActualizaindivualARticulo.Label1.Caption:='ARTICULO: '+TRIM(SELF.RxMemoryData1descripcion.Value);
frmActualizaindivualARticulo.showmodal;
if frmActualizaindivualARticulo.ModalResult=MROK then
BEGIN
      TD:=TDECIMALES.Create;
      POR:=STRTOFLOAT(frmActualizaindivualARticulo.EDIT1.Text);
      PRECIO:=STRTOFLOAT(SELF.RxMemoryData1precio.Value);

      if frmActualizaindivualARticulo.COMBOBOX1.ItemIndex=0 then
             PRECIOFINAL:=PRECIO + ((PRECIO *POR)/100);

      if frmActualizaindivualARticulo.COMBOBOX1.ItemIndex=1 then
             PRECIOFINAL:=PRECIO - ((PRECIO *POR)/100);

            SPRECIOFINAL:=TD.arma_importe_para_mostrar(PRECIOFINAL);
            SELF.RxMemoryData1.Edit;
            SELF.RxMemoryData1porc.Value:=TD.arma_importe_para_mostrar(POR)+'%';
            SELF.RxMemoryData1precionuevo.Value:=TRIM(SPRECIOFINAL);
             self.RxMemoryData1actualiza.Value:=1;
            SELF.RxMemoryData1.Post;

END;

end;

procedure TfrmActualizaPrecioporProveedor.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
if key in ['0','1','2','3','4','5','6','7','8','9','.',#13,#8] then
edit1.ReadOnly:=false
else
edit1.ReadOnly:=true;

end;

procedure TfrmActualizaPrecioporProveedor.FormShow(Sender: TObject);
begin
self.FDQuery2.Close;
self.FDQuery2.SQL.Clear;
self.FDQuery2.SQL.Add('select idproveedor, razonsocial from tproveedores order by razonsocial asc');
self.FDQuery2.Open;
end;

end.
