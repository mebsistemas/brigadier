unit UnifrmActualizaPrecioporProveedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,unit1,CLASS_DECIMALES;

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
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmActualizaPrecioporProveedor: TfrmActualizaPrecioporProveedor;

implementation

{$R *.dfm}

procedure TfrmActualizaPrecioporProveedor.BitBtn1Click(Sender: TObject);
begin
CLOSE;
end;

procedure TfrmActualizaPrecioporProveedor.BitBtn2Click(Sender: TObject);
var sql:string;
begin
sql:='select descripcion, precioventa,stock,idarticulo from tarticulos where idproveedor='+inttostr(self.DBLookupComboBox1.KeyValue)+' ORDER BY descripcion ASC';
self.FDQuery1.Close;
self.FDQuery1.SQL.Clear;
self.FDQuery1.SQL.Add(sql);
self.FDQuery1.open;

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
     Form1.FDConnection1.StartTransaction;
     TRY
       TD:=TDECIMALES.Create;
       POR:=STRTOFLOAT(EDIT1.Text);
       DataSource1.DataSet.Open;
       SELF.DataSource1.DataSet.First;
       while NOT SELF.DataSource1.DataSet.Eof do
        BEGIN
           PRECIO:=SELF.DataSource1.DataSet.FieldByName('PRECIOVENTA').AsFloat;

           if COMBOBOX1.ItemIndex=0 then
             PRECIOFINAL:=PRECIO + ((PRECIO *POR)/100);

          if COMBOBOX1.ItemIndex=1 then
             PRECIOFINAL:=PRECIO - ((PRECIO *POR)/100);

            SPRECIOFINAL:=TD.arma_importe_para_mostrar(PRECIOFINAL);

            SELF.FDQuery3.Close;
            SELF.FDQuery3.SQL.Clear;
            SELF.FDQuery3.SQL.Add('UPDATE TARTICULOS SET PRECIOVENTA='+#39+TRIM(SPRECIOFINAL)+#39+' WHERE IDARTICULO='+INTTOSTR(SELF.DataSource1.DataSet.FieldByName('IDARTICULO').AsInteger));
            SELF.FDQuery3.ExecSQL;

        SELF.DataSource1.DataSet.Next;
       END;
     TD.Free;
       Form1.FDConnection1.Commit;
       SHOWMESSAGE('SE HAN ACTUALIZADO LOS PRECIOS CORRECTAMENTE');
    EXCEPT
       On E : Exception  do
      BEGIN
       Form1.FDConnection1.Rollback;
      ShowMessage(E.ClassName+' error generado, con mensaje : '+E.Message);

     END;
    END;
  END;

 sql:='select descripcion, precioventa,stock,idarticulo from tarticulos where idproveedor='+inttostr(self.DBLookupComboBox1.KeyValue)+' ORDER BY descripcion ASC';
self.FDQuery1.Close;
self.FDQuery1.SQL.Clear;
self.FDQuery1.SQL.Add(sql);
self.FDQuery1.open;
end;

procedure TfrmActualizaPrecioporProveedor.FormShow(Sender: TObject);
begin
self.FDQuery2.Close;
self.FDQuery2.SQL.Clear;
self.FDQuery2.SQL.Add('select idproveedor, razonsocial from tproveedores order by razonsocial asc');
self.FDQuery2.Open;
end;

end.
